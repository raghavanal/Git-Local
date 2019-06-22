DROP TABLE IF EXISTS t_nse_stocks_returns;
CREATE TABLE t_nse_stocks_returns (
	tradeDate				DATE,
    Symbol					VARCHAR(50),
	closePrice				float,
    prevClose				DOUBLE,
    logreturns				DOUBLE,
    prevVolatility			DOUBLE,
    currVolatility			DOUBLE,
    annualizedvolatility	DOUBLE
);

ALTER TABLE t_nse_stocks_returns ADD PRIMARY KEY (tradeDate,Symbol);


