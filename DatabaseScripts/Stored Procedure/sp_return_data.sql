CREATE PROCEDURE `sp_return_data` (IN Symbol VARCHAR(100), IN fromDate VARCHAR(50), IN toDate VARCHAR(50), IN expiry VARCHAR(50), IN Underlying VARCHAR(50))
BEGIN
DECLARE v_symbol 		VARCHAR(100);
DECLARE v_fromDate 		DATETIME;
DECLARE v_toDate 		DATETIME;
DECLARE v_expiry 		VARCHAR(50);
DECLARE v_underlying	VARCHAR(50);

SET v_symbol = Symbol;
SET v_fromDate = COALESCE(str_to_date(fromDate,'%Y%m%d'),NULL);
SET v_toDate = COALESCE(str_to_date(toDate,'%Y%m%d'),NULL);
SET v_expiry = expiry;
SET v_underlying = Underlying;

IF v_symbol IS NULL && v_fromDate IS NOT NULL THEN
	SELECT 
			Symbol, tradeDate, openPrice, highPrice, lowPrice, closePrice 
	FROM 
			t_nse_nfo_futures 
	WHERE 
			tradeDate = v_fromDate;
END IF; 

IF v_symbol IS NOT NULL && v_fromDate IS NOT NULL && v_toDate IS NOT NULL THEN
	SELECT 
			Symbol, tradeDate, openPrice, highPrice, lowPrice, closePrice 
	FROM 
			t_nse_nfo_futures 
	WHERE 
			tradeDate BETWEEN v_fromDate AND v_toDate AND Symbol = v_symbol;
END IF; 


END
