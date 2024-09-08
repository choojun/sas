data transactions;
   length customer $ 10;
   format date date.
          withdrawals dollar10.2
          deposits dollar12.2;
   informat date date.
            withdrawals dollar10.2
            deposits dollar12.2;
   input customer $ date withdrawals deposits;
datalines; 
Bill     05NOV07:07:04:15     $507.58     $2,537.91
Bill     05NOV07:14:09:58     $943.25         $0.00
Bill     05NOV07:21:35:47     $779.89         $0.00
Bill     06NOV07:04:36:48     $665.61     $1,792.09
Bill     06NOV07:11:12:03     $790.10         $0.00
Bill     06NOV07:12:06:54     $544.90         $0.00
Bill     06NOV07:14:21:48     $614.06     $2,576.96
Bill     06NOV07:21:12:53     $465.57         $0.00
Bill     07NOV07:01:56:07     $442.66         $0.00
Bill     07NOV07:02:32:42     $551.37         $0.00
Bill     07NOV07:07:52:31     $141.95         $0.00
Bill     07NOV07:10:31:57     $754.38     $1,471.90
Bill     07NOV07:16:02:17     $786.24         $0.00
Bill     07NOV07:23:55:43     $384.94         $0.00
Bill     08NOV07:02:29:35     $121.28    $72,095.00
Bill     08NOV07:05:37:11     $669.58         $0.00
Bill     08NOV07:09:29:22      $52.95         $0.00
Bill     08NOV07:12:46:02     $526.15         $0.00
Bill     08NOV07:17:13:08     $708.16         $0.00
Bill     08NOV07:20:05:09     $316.82         $0.00
Bill     08NOV07:23:07:37     $750.12    $97,596.41
Bill     08NOV07:23:19:31     $403.66         $0.00
Bill     09NOV07:02:44:38     $373.53         $0.00
Bill     09NOV07:04:10:36     $418.89         $0.00
Bill     09NOV07:10:55:25     $393.07         $0.00
Bill     09NOV07:14:50:11     $880.15         $0.00
Bill     09NOV07:18:23:40     $842.71         $0.00
Bill     10NOV07:00:31:26     $575.30         $0.00
Bill     10NOV07:08:05:02     $832.47         $0.00
Bill     10NOV07:12:12:07     $397.42         $0.00
Bill     10NOV07:15:23:59      $42.78         $0.00
Bill     10NOV07:23:18:07     $433.93         $0.00
Bill     11NOV07:06:06:41     $758.93    $79,411.32
Bill     11NOV07:11:01:47     $876.59         $0.00
Bill     11NOV07:14:41:25     $251.95         $0.00
Bill     11NOV07:18:20:23     $922.40         $0.00
Bill     11NOV07:20:10:24     $698.13         $0.00
Bill     11NOV07:21:40:31     $226.35         $0.00
Bill     11NOV07:21:51:21     $427.99    $93,601.13
Bill     12NOV07:03:44:39      $42.10         $0.00
Bill     12NOV07:09:01:10     $716.90    $40,922.81
Bill     12NOV07:11:51:51     $147.29         $0.00
Bill     12NOV07:12:58:14     $384.90         $0.00
Bill     12NOV07:15:23:38     $795.05         $0.00
Bill     12NOV07:22:42:29     $124.88         $0.00
Bill     13NOV07:06:36:11     $647.15         $0.00
Bill     13NOV07:10:35:58     $605.27         $0.00
Bill     13NOV07:13:30:53      $54.37         $0.00
Bill     13NOV07:17:01:04     $980.88         $0.00
Bill     14NOV07:00:28:44     $770.81    $79,845.61
Bill     14NOV07:01:31:59     $493.69         $0.00
Bill     14NOV07:08:28:54     $608.82    $48,001.39
Bill     14NOV07:09:40:51     $646.24         $0.00
Bill     14NOV07:15:02:29     $323.00         $0.00
Bill     14NOV07:18:55:35     $389.86         $0.00
Bill     15NOV07:00:44:01     $468.39    $83,480.46
Bill     15NOV07:04:34:08     $801.98         $0.00
Bill     15NOV07:11:19:14     $535.56   $112,210.93
Bill     15NOV07:18:48:31     $130.73         $0.00
Bill     15NOV07:19:19:49     $700.25         $0.00
Bill     16NOV07:00:09:30     $293.15         $0.00
Bill     16NOV07:05:13:40     $141.28         $0.00
Bill     16NOV07:10:12:03     $630.05         $0.00
Bill     16NOV07:14:13:06     $795.48         $0.00
Bill     16NOV07:18:34:04      $38.13         $0.00
Bill     16NOV07:19:41:05     $825.70         $0.00
Bill     16NOV07:19:43:33     $434.91         $0.00
Bill     16NOV07:21:54:03     $214.74         $0.00
Bill     16NOV07:22:07:24     $481.10         $0.00
Bill     17NOV07:03:32:42     $747.64    $42,951.14
Bill     17NOV07:03:39:25     $664.56         $0.00
Bill     17NOV07:06:57:50     $224.67         $0.00
Bill     17NOV07:09:46:53      $98.71         $0.00
Bill     17NOV07:13:47:13     $976.11         $0.00
Bill     17NOV07:16:05:12     $856.23         $0.00
Bill     17NOV07:22:24:17     $830.43         $0.00
Bill     17NOV07:22:41:10     $345.89         $0.00
Bill     17NOV07:23:25:25     $458.04         $0.00
Bill     18NOV07:06:02:15     $572.03         $0.00
Bill     18NOV07:12:23:36     $397.51    $27,664.44
Bill     18NOV07:15:25:43     $479.80         $0.00
Bill     18NOV07:22:32:45     $151.13         $0.00
Bill     19NOV07:05:56:59     $293.55         $0.00
Bill     19NOV07:08:47:45     $461.68         $0.00
Bill     19NOV07:11:53:07     $787.63         $0.00
Bill     19NOV07:16:00:48     $204.00         $0.00
Bill     19NOV07:19:19:40     $890.44         $0.00
Bill     20NOV07:02:44:38     $758.27         $0.00
Bill     20NOV07:08:45:48     $765.89         $0.00
Bill     20NOV07:12:33:36     $968.74         $0.00
Bill     20NOV07:18:13:14     $530.67    $32,960.10
Bill     20NOV07:22:21:16     $658.82         $0.00
Bill     21NOV07:03:43:36     $810.04         $0.00
Bill     21NOV07:05:55:52     $377.49     $9,547.37
Bill     21NOV07:11:15:06     $273.38         $0.00
Bill     21NOV07:17:15:21     $637.92         $0.00
Bill     21NOV07:18:57:10     $527.73         $0.00
Bill     22NOV07:01:54:30       $2.05         $0.00
Bill     22NOV07:05:54:37     $666.49         $0.00
Bill     22NOV07:09:18:09     $715.92         $0.00
Carlos   05NOV07:00:53:50     $938.88     $4,694.41
Carlos   05NOV07:02:28:54     $823.85         $0.00
Carlos   05NOV07:03:08:29     $588.99         $0.00
Carlos   05NOV07:05:59:59      $79.23         $0.00
Carlos   05NOV07:08:21:00     $533.07         $0.00
Carlos   05NOV07:11:17:39     $284.50         $0.00
Carlos   05NOV07:16:08:39     $346.30         $0.00
Carlos   05NOV07:23:42:38      $44.00         $0.00
Carlos   06NOV07:04:54:01     $109.51         $0.00
Carlos   06NOV07:10:26:55     $675.75         $0.00
Carlos   06NOV07:14:02:24     $812.59     $2,711.29
Carlos   06NOV07:15:08:24     $700.63   $110,143.74
Carlos   06NOV07:19:11:26     $452.42         $0.00
Carlos   06NOV07:21:37:00     $881.66         $0.00
Carlos   07NOV07:03:49:40     $397.31         $0.00
Carlos   07NOV07:03:56:47     $560.84         $0.00
Carlos   07NOV07:11:23:20     $608.48   $103,467.96
Carlos   07NOV07:15:10:11     $538.54         $0.00
Carlos   07NOV07:22:53:45      $54.30         $0.00
Carlos   08NOV07:05:01:16     $266.51         $0.00
Carlos   08NOV07:09:33:45     $298.32   $123,615.00
Carlos   08NOV07:11:13:29     $418.21         $0.00
Carlos   08NOV07:17:05:09     $182.45         $0.00
Carlos   09NOV07:00:15:13     $746.71         $0.00
Carlos   09NOV07:08:06:06     $290.63         $0.00
Carlos   09NOV07:12:58:37     $504.95         $0.00
Carlos   09NOV07:19:16:56      $18.39         $0.00
Carlos   09NOV07:20:19:56      $46.08         $0.00
Carlos   09NOV07:21:13:07     $204.55         $0.00
Carlos   09NOV07:21:41:45     $843.36         $0.00
Carlos   10NOV07:05:21:47     $167.54    $62,766.47
Carlos   10NOV07:13:12:59     $422.01         $0.00
Carlos   10NOV07:19:50:26     $811.06         $0.00
Carlos   11NOV07:03:09:56     $798.86         $0.00
Carlos   11NOV07:06:00:55     $551.67         $0.00
Carlos   11NOV07:11:53:52     $801.87         $0.00
Carlos   11NOV07:15:55:55     $808.05         $0.00
Carlos   11NOV07:16:48:05      $71.90         $0.00
Carlos   11NOV07:19:43:20     $656.74         $0.00
Carlos   12NOV07:02:21:57     $393.03         $0.00
Carlos   12NOV07:08:55:55     $339.30         $0.00
Carlos   12NOV07:11:15:18     $300.15         $0.00
Carlos   12NOV07:17:01:01     $644.97         $0.00
Carlos   12NOV07:21:17:36     $565.15         $0.00
Carlos   12NOV07:21:20:47     $516.82    $75,073.20
Carlos   13NOV07:01:29:06     $469.23         $0.00
Carlos   13NOV07:09:13:53     $854.36         $0.00
Carlos   13NOV07:16:02:15     $623.45         $0.00
Carlos   13NOV07:16:13:51     $639.32   $144,668.59
Carlos   13NOV07:17:32:40     $908.31         $0.00
Carlos   13NOV07:21:53:30     $159.86         $0.00
Carlos   14NOV07:02:52:24     $754.67         $0.00
Carlos   14NOV07:05:36:59     $600.83         $0.00
Carlos   14NOV07:11:56:44     $980.83    $85,707.47
Carlos   14NOV07:12:31:03     $674.66         $0.00
Carlos   14NOV07:14:02:39     $375.91         $0.00
Carlos   14NOV07:19:55:22     $141.78         $0.00
Carlos   14NOV07:22:34:35     $134.62         $0.00
Carlos   14NOV07:23:54:00     $147.72         $0.00
Carlos   15NOV07:04:16:36     $271.57    $50,770.10
Carlos   15NOV07:05:15:55     $487.95   $147,647.66
Carlos   15NOV07:06:33:28     $285.59         $0.00
Carlos   15NOV07:10:48:10     $922.05         $0.00
Carlos   15NOV07:15:46:22     $919.87         $0.00
Carlos   15NOV07:17:04:15     $112.89         $0.00
Carlos   16NOV07:00:08:33     $239.34         $0.00
Carlos   16NOV07:02:30:04     $290.36    $24,136.27
Carlos   16NOV07:09:33:37      $37.29         $0.00
Carlos   16NOV07:13:52:57     $939.98    $79,679.91
Carlos   16NOV07:18:18:50     $580.28         $0.00
Carlos   17NOV07:00:11:37     $301.64         $0.00
Carlos   17NOV07:02:27:43     $116.50         $0.00
Carlos   17NOV07:09:17:07     $792.44         $0.00
Carlos   17NOV07:16:34:57     $450.26         $0.00
Carlos   17NOV07:18:30:15     $916.13         $0.00
Carlos   17NOV07:23:33:35     $443.20    $55,627.70
Carlos   18NOV07:00:36:06     $593.20         $0.00
Carlos   18NOV07:01:10:51     $219.31         $0.00
Carlos   18NOV07:02:10:48     $434.18         $0.00
Carlos   18NOV07:03:20:49     $348.65         $0.00
Carlos   18NOV07:09:46:08     $268.14         $0.00
Carlos   18NOV07:11:08:55     $103.92         $0.00
Carlos   18NOV07:18:37:58      $83.46         $0.00
Carlos   19NOV07:00:48:02     $537.42         $0.00
Carlos   19NOV07:04:20:17     $953.62    $26,575.08
Carlos   19NOV07:05:41:53     $967.00         $0.00
Carlos   19NOV07:06:32:52     $393.02         $0.00
Carlos   19NOV07:06:34:42     $978.91         $0.00
Carlos   19NOV07:08:00:25     $427.83         $0.00
Carlos   19NOV07:08:47:51     $563.05         $0.00
Carlos   19NOV07:11:19:50     $179.88         $0.00
Carlos   19NOV07:16:25:02     $721.09         $0.00
Carlos   19NOV07:23:29:43     $992.90         $0.00
Carlos   20NOV07:06:04:42     $399.42         $0.00
Carlos   20NOV07:13:48:58     $713.17         $0.00
Carlos   20NOV07:18:49:08     $840.39         $0.00
Carlos   20NOV07:20:44:41     $319.49         $0.00
Carlos   21NOV07:03:32:51     $801.40         $0.00
Carlos   21NOV07:04:15:19     $262.07         $0.00
Carlos   21NOV07:05:39:18     $889.23         $0.00
Warren   05NOV07:03:12:14     $739.88     $3,699.39
Warren   05NOV07:07:54:42     $572.98         $0.00
Warren   05NOV07:14:28:07     $610.39         $0.00
Warren   05NOV07:16:58:29     $436.34         $0.00
Warren   05NOV07:23:10:52     $534.70         $0.00
Warren   05NOV07:23:50:25     $575.19         $0.00
Warren   06NOV07:07:47:57     $531.89     $1,509.92
Warren   06NOV07:09:36:38     $490.10         $0.00
Warren   06NOV07:12:50:07     $708.39    $88,560.77
Warren   06NOV07:13:24:26     $147.19         $0.00
Warren   06NOV07:18:16:46     $374.45         $0.00
Warren   06NOV07:18:50:12     $706.56         $0.00
Warren   06NOV07:21:38:05     $415.00         $0.00
Warren   07NOV07:04:08:29     $328.50    $75,731.09
Warren   07NOV07:09:33:43     $494.90         $0.00
Warren   07NOV07:14:28:30     $274.04         $0.00
Warren   07NOV07:16:29:59     $734.64         $0.00
Warren   07NOV07:23:57:25     $993.83         $0.00
Warren   08NOV07:02:13:35     $729.63         $0.00
Warren   08NOV07:06:08:40     $229.31         $0.00
Warren   08NOV07:09:41:02     $278.17         $0.00
Warren   08NOV07:16:06:09     $656.32         $0.00
Warren   08NOV07:17:18:44     $628.11         $0.00
Warren   08NOV07:19:56:25     $812.05         $0.00
Warren   08NOV07:19:59:10     $790.46         $0.00
Warren   08NOV07:23:24:43     $974.47         $0.00
Warren   09NOV07:00:25:31     $785.18         $0.00
Warren   09NOV07:05:43:46      $24.57         $0.00
Warren   09NOV07:10:06:31     $549.90         $0.00
Warren   09NOV07:12:01:10     $210.24         $0.00
Warren   09NOV07:18:02:51     $497.48         $0.00
Warren   09NOV07:23:41:15     $670.52         $0.00
Warren   10NOV07:02:05:58       $2.99         $0.00
Warren   10NOV07:03:22:48     $959.66         $0.00
Warren   10NOV07:10:34:10     $933.48         $0.00
Warren   10NOV07:13:33:01     $838.54         $0.00
Warren   10NOV07:21:12:41     $301.90         $0.00
Warren   11NOV07:03:28:41     $723.33    $40,569.47
Warren   11NOV07:05:28:45     $103.05         $0.00
Warren   11NOV07:07:00:20     $321.99         $0.00
Warren   11NOV07:13:25:18     $478.01         $0.00
Warren   11NOV07:16:45:14     $263.43         $0.00
Warren   11NOV07:19:25:38     $429.89         $0.00
Warren   11NOV07:21:56:54     $596.39         $0.00
Warren   12NOV07:04:26:35     $453.72         $0.00
Warren   12NOV07:08:08:09      $74.94         $0.00
Warren   12NOV07:15:36:24     $701.98         $0.00
Warren   12NOV07:22:21:18     $547.13         $0.00
Warren   13NOV07:03:59:49      $83.30         $0.00
Warren   13NOV07:04:06:33     $982.09         $0.00
Warren   13NOV07:10:01:56     $197.31    $45,488.58
Warren   13NOV07:17:22:22     $223.34         $0.00
Warren   13NOV07:17:37:30     $968.05         $0.00
Warren   13NOV07:17:58:58     $504.20         $0.00
Warren   13NOV07:19:23:20     $331.95         $0.00
Warren   13NOV07:22:46:25     $300.49         $0.00
Warren   13NOV07:23:02:19     $813.03         $0.00
Warren   14NOV07:02:54:54     $971.21         $0.00
Warren   14NOV07:05:26:05       $7.97         $0.00
Warren   14NOV07:11:25:21     $702.26         $0.00
Warren   14NOV07:17:29:24     $371.04         $0.00
Warren   14NOV07:23:24:55     $167.90         $0.00
Warren   15NOV07:01:40:01     $132.28         $0.00
Warren   15NOV07:04:41:37     $111.94         $0.00
Warren   15NOV07:05:30:38     $937.90         $0.00
Warren   15NOV07:06:21:47     $800.09         $0.00
Warren   15NOV07:13:50:24      $24.87         $0.00
Warren   15NOV07:20:46:32     $525.21         $0.00
Warren   16NOV07:02:24:43     $980.29    $80,895.47
Warren   16NOV07:10:17:09      $62.78         $0.00
Warren   16NOV07:14:07:58     $408.70         $0.00
Warren   16NOV07:17:30:58     $951.48         $0.00
Warren   16NOV07:19:23:58     $714.73         $0.00
Warren   17NOV07:00:22:54     $353.66         $0.00
Warren   17NOV07:03:45:36     $433.01         $0.00
Warren   17NOV07:08:45:52     $241.09         $0.00
Warren   17NOV07:10:35:13     $191.69         $0.00
Warren   17NOV07:11:09:35     $485.49         $0.00
Warren   17NOV07:13:15:31     $470.13         $0.00
Warren   17NOV07:21:10:17     $329.25         $0.00
Warren   18NOV07:03:07:46     $824.13         $0.00
Warren   18NOV07:03:53:34     $596.25         $0.00
Warren   18NOV07:06:53:56      $84.06         $0.00
Warren   18NOV07:11:04:03       $9.64    $97,557.92
Warren   18NOV07:13:33:23     $516.57         $0.00
Warren   18NOV07:19:28:22     $695.77         $0.00
Warren   18NOV07:19:35:45     $275.61         $0.00
Warren   18NOV07:21:38:52     $961.75         $0.00
Warren   19NOV07:01:38:56     $466.90         $0.00
Warren   19NOV07:07:59:55     $467.90         $0.00
Warren   19NOV07:10:36:31     $947.22         $0.00
Warren   19NOV07:16:23:57     $302.24         $0.00
Warren   19NOV07:18:10:25     $649.73         $0.00
Warren   19NOV07:20:18:08     $406.44         $0.00
Warren   20NOV07:02:00:03     $339.56         $0.00
Warren   20NOV07:08:36:06     $535.27         $0.00
Warren   20NOV07:10:45:29     $754.76         $0.00
Warren   20NOV07:15:10:13     $579.23         $0.00
Warren   20NOV07:20:58:03      $79.05         $0.00
Warren   20NOV07:22:26:15      $52.92         $0.00
;

proc timeseries data=transactions
                out=timeseries;
   by customer;
   id date interval=day accumulate=total;
   var withdrawals deposits;
run;

proc arima data=timeseries;
   identify var=withdrawals(1,7) noprint;
   estimate q=(1)(7) outest=estimates noprint;
   forecast id=date interval=day out=forecasts;
quit;

proc timeseries data=transactions out=out
                outseason=season outtrend=trend;
   by customer;
   id date interval=day accumulate=total;
   var withdrawals deposits;
run;

proc timeseries data=transactions
                out=out
                outdecomp=decompose;
   by customer;
   id date interval=day accumulate=total;
   var withdrawals deposits;
run;

proc timeseries data=transactions
                out=out
                outcorr=timedomain;
   by customer;
   id date interval=day accumulate=total;
   var withdrawals deposits;
run;

proc timeseries data=transactions
                outssa=ssa
                outspectra=spectra;
   by customer;
   id date interval=day accumulate=total;
   var withdrawals deposits;
run;