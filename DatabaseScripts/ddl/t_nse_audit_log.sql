DROP TABLE t_nse_audit_log;
CREATE TABLE t_nse_audit_log
(
	audit_id		INT PRIMARY KEY AUTO_INCREMENT,
    event_ts		DATETIME,
	event_name		VARCHAR(50),
    event_desc		VARCHAR(500),
	event_status	VARCHAR(15),
    file_load_nm	VARCHAR(30),
    file_load_dt	date,
	rcrd_crtd_ts	DATETIME
);