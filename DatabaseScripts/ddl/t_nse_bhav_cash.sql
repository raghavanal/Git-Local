DROP TABLE IF EXISTS t_nse_bhav_cash;	
CREATE TABLE t_nse_bhav_cash (
symbol 				VARCHAR(200),
series				VARCHAR(2),
openPrice			DOUBLE,
highPrice			DOUBLE,
lowPrice			DOUBLE,
closePrice			DOUBLE,
last_price			DOUBLE,
prev_close			DOUBLE,
tot_traded_qty		int,
tot_traded_val		DOUBLE,
tradeDate			date,
tot_trades			int,
isin				VARCHAR(200)
);

ALTER TABLE t_nse_bhav_cash ADD PRIMARY KEY(symbol,isin,tradeDate);