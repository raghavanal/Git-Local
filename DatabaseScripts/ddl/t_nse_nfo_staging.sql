CREATE TABLE t_nse_nfo_staging
(
	tradeID 	INT AUTO_INCREMENT,
    Symbol  	VARCHAR(150) ,
    tradeDate 	DATETIME NOT NULL,
    openPrice	DOUBLE,
    closePrice	DOUBLE,
    highPrice	DOUBLE,
	lowPrice	DOUBLE,
    volume		INTEGER,
    openInterest INTEGER,
    PRIMARY KEY `fieldId` (`tradeID`,`Symbol`,`tradeDate`)
)
	PARTITION BY HASH(MONTH(tradeDate)) PARTITIONS 15;
