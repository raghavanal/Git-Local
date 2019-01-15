CREATE TABLE t_nse_nfo_futures
(
	tradeID 	INT AUTO_INCREMENT,
    Symbol  	VARCHAR(150) ,
    Underlying	VARCHAR(100),
    Expiry		VARCHAR(25),
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
