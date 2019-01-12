CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_load_options`()
BEGIN

DECLARE v_start_time DATETIME;
DECLARE	v_end_time   DATETIME;

SELECT load_strt_time INTO v_start_time FROM t_garuda_control_one WHERE load_name = 'LoadOptions';
SELECT load_end_time  INTO v_end_time   FROM t_garuda_control_one WHERE load_name = 'LoadOptions';

INSERT INTO t_nse_audit_log(event_ts,event_name,event_desc,event_status,rcrd_crtd_ts) VALUES(current_timestamp(),'LoadOptions',concat('Started the Options  PE load for the dates ' , date_format(v_start_time,'%d-%m-%Y') , ' and ' , date_format(v_end_time,'%d-%m-%Y')),'STARTED',current_timestamp());

INSERT INTO t_nse_nfo_options(Symbol,tradeDate,Underlying,OptionType,Expiry,StrikePrice,openPrice,closePrice,highPrice,lowPrice,volume,openInterest)
		SELECT 
					Symbol,tradeDate,REGEXP_SUBSTR(Symbol,'[A-z]*'),
                    SUBSTR(Symbol,-2,2),SUBSTR(REPLACE(REPLACE(Symbol,REGEXP_SUBSTR(Symbol,'[A-z]*'),''),
                    SUBSTR(Symbol,-2,2),''),1,5), SUBSTR(REPLACE(REPLACE(Symbol,REGEXP_SUBSTR(Symbol,'[A-z]*'),''),
                    SUBSTR(Symbol,-2,2),''),6,length(SYMBOL)),openPrice,closePrice,highPrice,lowPrice,volume,openInterest 
		FROM 
					t_nse_nfo_Staging 
		WHERE 
					Symbol LIKE '%PE' AND tradeDate BETWEEN v_start_time AND v_end_time;

INSERT INTO t_nse_audit_log(event_ts,event_name,event_desc,event_status,rcrd_crtd_ts) VALUES(current_timestamp(),'LoadOptions',concat('Completed the Options  PE load for the dates ' , date_format(v_start_time,'%d-%m-%Y') , ' and ' , date_format(v_end_time,'%d-%m-%Y')),'COMPLETED',current_timestamp());


INSERT INTO t_nse_audit_log(event_ts,event_name,event_desc,event_status,rcrd_crtd_ts) VALUES(current_timestamp(),'LoadOptions',concat('Started the Options  CE load for the dates ' , date_format(v_start_time,'%d-%m-%Y') , ' and ' , date_format(v_end_time,'%d-%m-%Y')),'STARTED',current_timestamp());

INSERT INTO t_nse_nfo_options(Symbol,tradeDate,Underlying,OptionType,Expiry,StrikePrice,openPrice,closePrice,highPrice,lowPrice,volume,openInterest)
		SELECT 
					Symbol,tradeDate,REGEXP_SUBSTR(Symbol,'[A-z]*'),
                    SUBSTR(Symbol,-2,2),SUBSTR(REPLACE(REPLACE(Symbol,REGEXP_SUBSTR(Symbol,'[A-z]*'),''),
                    SUBSTR(Symbol,-2,2),''),1,5), SUBSTR(REPLACE(REPLACE(Symbol,REGEXP_SUBSTR(Symbol,'[A-z]*'),''),
                    SUBSTR(Symbol,-2,2),''),6,length(SYMBOL)),openPrice,closePrice,highPrice,lowPrice,volume,openInterest 
		FROM 
					t_nse_nfo_Staging 
		WHERE 
					Symbol LIKE '%CE' AND tradeDate BETWEEN v_start_time AND v_end_time;

INSERT INTO t_nse_audit_log(event_ts,event_name,event_desc,event_status,rcrd_crtd_ts) VALUES(current_timestamp(),'LoadOptions',concat('Completed the Options  CE load for the dates ' , date_format(v_start_time,'%d-%m-%Y') , ' and ' , date_format(v_end_time,'%d-%m-%Y')),'COMPLETED',current_timestamp());


END