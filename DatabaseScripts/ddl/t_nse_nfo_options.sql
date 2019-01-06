CREATE TABLE t_nse_nfo_options
(
	tradeId 		INT AUTO_INCREMENT,
    Symbol 			VARCHAR(150),
	tradeDate 		DATETIME NOT NULL,
    Underlying 		VARCHAR(50),
    OptionType		CHAR(2),
    Expiry			VARCHAR(50),
    StrikePrice		VARCHAR(50),
    openPrice		DOUBLE,
    closePrice		DOUBLE,
    highPrice		DOUBLE,
	lowPrice		DOUBLE,
    volume			INTEGER,
    openInterest 	INTEGER,
    PRIMARY KEY `tradeId` (`tradeID`,`Symbol`,`tradeDate`)
)
	PARTITION BY HASH(MONTH(tradeDate)) PARTITIONS 15;
