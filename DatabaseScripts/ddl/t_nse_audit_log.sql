CREATE TABLE t_nse_audit_log
(
	audit_id		INT PRIMARY KEY AUTO_INCREMENT,
    event_ts		DATETIME,
	event_name		VARCHAR(50),
    event_desc		VARCHAR(500),
	event_status	VARCHAR(15),
	rcrd_crtd_ts	DATETIME
)