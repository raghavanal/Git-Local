DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_load_futures`()
BEGIN
DECLARE v_start_time DATETIME;
DECLARE	v_end_time   DATETIME;

SELECT load_strt_time INTO v_start_time FROM t_garuda_control_one WHERE load_name = 'LoadFutures';
SELECT load_end_time  INTO v_end_time   FROM t_garuda_control_one WHERE load_name = 'LoadFutures';

INSERT INTO t_nse_audit_log(event_ts,event_name,event_desc,event_status,rcrd_crtd_ts) VALUES(current_timestamp(),'LoadFutures',concat('Started the load for the dates ' , date_format(v_start_time,'%d-%m-%Y') , ' and ' , date_format(v_end_time,'%d-%m-%Y')),'STARTED',current_timestamp());

INSERT INTO t_nse_nfo_futures(Symbol,tradeDate,openPrice,closePrice,highPrice,lowPrice,volume,openInterest)
		SELECT Symbol,tradeDate,openPrice,closePrice,highPrice,lowPrice,volume,openInterest FROM t_nse_nfo_Staging WHERE Symbol NOT LIKE '%PE' AND Symbol NOT LIKE '%CE' AND tradeDate BETWEEN v_start_time AND v_end_time;

INSERT INTO t_nse_audit_log(event_ts,event_name,event_desc,event_status,rcrd_crtd_ts) VALUES(current_timestamp(),'LoadFutures',concat('Started the load for the dates ' , date_format(v_start_time,'%d-%m-%Y') , ' and ' , date_format(v_end_time,'%d-%m-%Y')),'COMPLETED',current_timestamp());
END$$
DELIMITER ;
