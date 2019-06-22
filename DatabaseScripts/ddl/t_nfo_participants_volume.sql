DROP TABLE if exists t_nfo_participants_volume;
CREATE TABLE t_nfo_participants_volume (
        clientType			varchar(20),
        future_ix_long		int,
        future_ix_short 	int,
        future_stk_long 	int,
        future_stk_short	int,
        opt_ix_call_long	int,
        opt_ix_put_long		int,
        opt_ix_call_short	int,
        opt_ix_put_short	int,
        opt_stk_call_long	int,
        opt_stk_put_long	int,
        opt_stk_call_short	int,
        opt_stk_put_short	int,
        total_long_ctrct	int,
        total_short_ctrct	int,
        tradeDate			date
);

ALTER TABLE t_nfo_participants_volume ADD PRIMARY KEY(tradeDate,clientType);


