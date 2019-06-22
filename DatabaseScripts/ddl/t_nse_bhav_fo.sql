DROP TABLE IF EXISTS t_nse_bhav_fo;
CREATE TABLE t_nse_bhav_fo (
instrument 			VARCHAR(20),
symbol 				VARCHAR(200),
expiry				date,
strike_pr			INT,
option_typ			VARCHAR(5),
openPrice			DOUBLE,
highPrice			DOUBLE,
lowPrice			DOUBLE,
closePrice			DOUBLE,
settl_price			DOUBLE,
contracts			int,
val_in_lakhs		DOUBLE,
open_interest		int,
change_oi			int,
tradeDate			date
);

ALTER TABLE t_nse_bhav_fo ADD PRIMARY KEY(symbol,tradeDate,expiry,option_typ);


