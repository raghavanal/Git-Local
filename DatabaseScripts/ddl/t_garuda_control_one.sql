CREATE TABLE t_garuda_control_one
(
	load_id				INT	PRIMARY KEY AUTO_INCREMENT,
	load_name			VARCHAR(50),
    load_strt_time		DATETIME,
    load_end_time		DATETIME,
	load_status			VARCHAR(10),
	rcrd_crtd_ts		DATETIME
);