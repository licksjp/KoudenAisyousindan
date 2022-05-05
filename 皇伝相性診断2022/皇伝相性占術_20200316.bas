100 '相性占い試作　作成開始　2020.02.27
110 'Ver0.0.1:更新日:2020.03.16
120 'Ver0.0.2:更新日:2020.03.17
130 'main プログラム
140 'Version バージョン番号
150 'アップデート履歴 2022.05.06
160 Version$="Ver:0.0.3.2022.05.06"
170 '1.変数定義
180 dim buf_eto$(12):i=0:data$="data/"
190 'ファイル読み込み　Etodata.dat
200 open data$+ "Etodata.dat" for input as #1
210 while eof(1) = 0
220 line input #1,buf_eto$(i)
230 i = i + 1
240 wend
250 close #1
260 '読み込み完了次の処理へ
270 TopScreen:
280 '1.トップ画面
290 cls 3:SCREEN 1,1,1,1:font 16*3
300 'グラフィック領域　ここから
310 '1.Title行
320 line (0,0)-(1000,60),rgb(0,0,255),bf
330 pen 2:line (2,2)-(998,58),rgb(127,255,212),b
340 '2.メニュー選択行
350 line (0,60)-(1000,650),rgb(127,255,212),bf
360 pen 5:line (0,63)-(997,653),rgb(0,0,255),b
370 '3.選択肢入力
380 line (0,550)-(1000,650),rgb(0,255,0),bf
390 pen 5:line (0,547)-(997,647),rgb(0,0,255),b
400 'グラフィック領域　ここまで
410 cls
420 talk"ひとりようか、ふたりようか、番号を選んでエンターキーを押してください"
430 color rgb(255,255,255)
440 print "●皇伝相性占い" + chr$(13)
450 color rgb(255,0,255)
460 print "番号を選んでエンターキーを押してください"+chr$(13)
470 print "1.ひとりよう(一人用)" + chr$(13)
480 print "2.ふたりよう(二人用)" + chr$(13)
490 print "3.設     定" + chr$(13)
500 print "4.終     了" + chr$(13)
510 color rgb(0,0,0)
520 Input "番号:",key
530 if key = 1 then goto Aisyou1:
540 if key = 2 then goto Aisyou2:
550 if key = 3 then goto Setting:
560 if key = 4 then cls 3:color rgb(255,255,255):end
570 if key > 4 or key = 0  then goto TopScreen:
580 '2.データー入力　男性
590 '2-1-1 ひとりよう
600 '2-1-1-1 西暦４桁入力
610 '描画領域　ここから
620 Aisyou1:
630 cls 3
640 '1.Title行
650 line (0,0)-(1000,60),rgb(0,0,250),bf
660 line (0,0)-(997,57),rgb(127,255,212),b
670 '2.説明行
680 line (0,60)-(1000,150),rgb(127,255,212),bf
690 line (0,57)-(997,147),rgb(0,0,255),b
700 '3.入力部分
710 line (0,150)-(1000,260),rgb(0,255,0),bf
720 line (0,147)-(997,257),rgb(0,0,255),b
730 '描画領域 ここまで
740 cls:talk"一人用です、生まれた年を西暦４桁で入れてください"
750 ui_msg"生まれた年(西暦4桁)を入れてください"
760 color rgb(255,255,255)
770 print"1.ひとりよう(一人用)"+chr$(13)
780 color rgb(255,0,255)
790 print"生まれた年(西暦4桁)を入れてください"+chr$(13)
800 color rgb(0,0,0)
810 Input"生まれた年(西暦4桁):",year
820 if (year > 9999 or 1000 > year or year=0 ) then
830 ui_msg"入力値が範囲外です。入れ直してください。":goto 740
840 else
850 ui_msg"生まれた月を入れてください":GOTO 890
860 endif
870 '2-1-1-2 生まれた月を入力
880 Bornmonth:
890 cls:talk"生まれた月を入れてください"
900 color rgb(255,255,255)
910 print"1.ひとりよう(一人用)"+chr$(13)
920 color rgb(255,0,255)
930 print"生まれた月を入れてください"+chr$(13)
940 color rgb(0,0,0)
950 Input"生まれた月(1〜12):",month
960 if month > 12 then
970 goto Bornmonth:
980 else
990 goto BornDay:
1000 endif
1010 BornDay:
1020 '2-1-1-3 生まれた日を入力
1030 cls:talk"生まれた日を入れてください":ui_msg"生まれた日を入れてください"
1040 color rgb(255,255,255)
1050 print"1.ひとりよう(一人用)"+chr$(13)
1060 color rgb(255,0,255)
1070 print"生まれた日を入れてください"+chr$(13)
1080 color rgb(0,0,0)
1090 Input"生まれた日(1〜31):",day
1100 IF day > 31 then
1110 ui_msg"入力値が範囲外です。もう一度入れ直してください":goto 1030
1120 else
1130 goto EtoComp:
1140 endif
1150 '1-3-1 計算領域
1160 EtoComp:
1170 '1.年の干支
1180 buf_eto_year = year_eto(year,month,day)
1190 '2.月の干支
1200 buf_eto_month = month_eto(month)
1210 '3.日の干支
1220 buf_eto_day = buf_day_eto(year,month,day)
1230 '1-4-1 結果表示
1240 '描画領域　ここから
1250 Result_Eto:
1260 cls 3
1270 line (0,0)-(1200,60),rgb(0,0,255),bf
1280 pen 6:line (0,0)-(1197,57),rgb(0,255,0),b
1290 line (0,60)-(1200,260),rgb(127,255,212),bf
1300 line (0,57)-(1197,257),rgb(0,0,255),b
1310 LINE (0,260)-(1200,660),rgb(0,255,0),bf
1320 line (0,266)-(1206,666),rgb(0,0,255),b
1330 line (0,660)-(1200,780),rgb(0,255,0),bf
1340 line (0,666)-(1206,786),rgb(0,0,255),b
1350 '描画領域 ここまで
1360 cls:talk str$(year)+"年"+str$(month)+"月"+str$(day)+"日の干支です"
1370 color rgb(255,255,255)
1380 print "●あなたの干支"+chr$(13)
1390 color rgb(255,0,255)
1400 print "誕生日:";year;"年";month;"月";day;"日"+chr$(13)
1410 print"干支:";buf_eto$(buf_eto_year);"年 ";buf_eto$(buf_eto_month);"月 ";buf_eto$(buf_eto_day);"日 "+chr$(13)
1420 'talk "あなたの干支は、"+buf_eto$(buf_eto_year)+"年"+buf_eto$(buf_eto_month)+"月"+buf_eto$(buf_eto_day)+"日です":
1430 color rgb(0,0,0)
1440 PRINT"番号を入れてエンターキーを押してください"+chr$(13)
1450 print"1:もういちどやる"+chr$(13)
1460 print"2:トップ画面に行く"+chr$(13)
1470 print"3:音声で干支を説明"+chr$(13)
1480 input"番 号:",key
1490 if key=1 then goto 630
1500 if key=2 then goto TopScreen:
1510 if key=3 then goto Result_Eto:
1520 'goto 1360
1530 'goto 410
1540 'talk "あなたの干支は、"+buf_eto$(buf_eto_year)+"年"+buf_eto$(buf_eto_month)+"月"+buf_eto$(buf_eto_day)+"日です":
1550 '3.設定メニュー
1560 '設定メニュー Top Version と 参考文献の選択画面
1570 '描画領域　ここから
1580 Setting:
1590 cls 3:
1600 line (0,0)-(1000,60),rgb(0,0,255),bf
1610 line (0,3)-(1003,63),rgb(127,255,212),b
1620 line (0,60)-(1000,350),rgb(127,255,212),bf
1630 line (0,63)-(1003,353),rgb(0,0,255),b
1640 line (0,350)-(1000,580),rgb(0,255,0),bf
1650 line (0,353)-(1003,583),rgb(0,0,255),b
1660 '描画領域　ここまで
1670 '文字領域 ここから
1680 color rgb(255,255,255)
1690 print "● 設  定"+chr$(13)
1700 color rgb(255,0,255)
1710 print "1.Version" + chr$(13)
1720 print "2.参考文献" + chr$(13)
1730 print "3.トップ画面に行く" + chr$(13)
1740 color rgb(0,0,0)
1750 print "番号を選んでエンターキーを押してください"+chr$(13)
1760 Input "番号:",key
1770 if key=1 then goto Version:
1780 if key=2 then goto ReferenceBook:
1790 if key=3 then goto TopScreen:
1800 '文字領域 ここまで
1810 Version:
1820 '1.Version 描画領域　ここから
1830 cls 3:
1840 line (0,0)-(1200,60),rgb(0,0,255),bf
1850 pen 3:line (0,3)-(1203,63),rgb(127,255,212),b
1860 line (0,60)-(1200,260),rgb(127,255,212),bf
1870 pen 3:line (0,63)-(1203,263),rgb(0,0,255),b
1880 line (0,260)-(1200,350),rgb(0,255,0),bf
1890 pen 3:line (0,263)-(1203,353),rgb(0,0,255),b
1900 '描画領域 ここまで
1910 '3-1 バージョン
1920 cls
1930 color rgb(255,255,255)
1940 print "皇伝相性占術　バージョン"+chr$(13)
1950 color rgb(255,0,255)
1960 print "Title:皇伝相性占術"+chr$(13)
1970 print Version$ + chr$(13)
1980 '
1990 color rgb(0,0,0)
2000 print "エンターキーを押してください"
2010 key1:
2020 key$ = input$(1)
2030 if key$ = chr$(13) then
2040 goto TopScreen:
2050 else
2060 goto key1:
2070 endif
2080 '設定　参考文献
2090 '参考文献
2100 '描画領域　ここから
2110 ReferenceBook:
2120 cls 3
2130 line (0,0)-(1200,60),rgb(0,0,255),bf
2140 line (0,3)-(1203,63),rgb(127,255,212),b
2150 line (0,60)-(1200,560),rgb(127,255,212),bf
2160 line (0,63)-(1203,563),rgb(0,0,255),b
2170 line (0,560)-(1200,650),rgb(0,255,0),bf
2180 line (0,563)-(1203,653),rgb(0,0,255),b
2190 '2人用 Top
2200 '2-1 男女の名前を入力
2210 '描画領域 ここまで
2220 '3-2-2.参考文献
2230 color rgb(255,255,255)
2240 print "● 参 考 文 献" + chr$(13)
2250 color rgb(255,0,255)
2260 print"TITLE:皇伝相性占い" + chr$(13)
2270 print"出版社:太玄社(ナチュラルスピリット)" + chr$(13)
2280 print"著者:林　巨征"+chr$(13)
2290 print"ISBN:978-4-906724-38-3"+chr$(13)
2300 print"定価:1980円　+税"+chr$(13)
2310 color rgb(0,0,0)
2320 print "エンターキーを押してください"
2330 key3:
2340 key$ = input$(1)
2350 if key$ = chr$(13) then
2360 goto TopScreen:
2370 else
2380 goto key3:
2390 endif
2400 '描画領域 ここから
2410 cls 3
2420 line (0,0)-(1000,60),rgb(0,0,255),bf
2430 line (0,3)-(1003,63),rgb(127,255,212),b
2440 line (0,60)-(1000,140),rgb(127,255,212),b
2450 line (0,63)-(1003,143),rgb(0,0,255),b
2460 line (0,140)-(1000,210),rgb(0,255,0),bf
2470 '描画領域 ここまで
2480 line (0,143)-(1003,212),rgb(0,0,255),b
2490 '文字表示部分 ここから
2500 color rgb(255,255,255)
2510 print"● 参 考 文 献" + chr$(13)
2520 '文字表示部分　ここまで
2530 Aisyou2:
2540 cls:talk "ふたりようです。男性の方の名前を入れてください"
2550 color rgb(255,255,255)
2560 print"2.ふたりよう "+ chr$(13)
2570 color rgb(255,0,255)
2580 print"男性の名前を入れてください" + chr$(13)
2590 color rgb(0,0,0)
2600 Input "男性の名前:",buf_male_name$
2610 '2-2男性の生まれた年（西暦4桁)
2620 cls:talk buf_male_name$+"さんの生まれた年を入れてください"
2630 print buf_male_name$;"さんの生まれた年(西暦4桁)を入れてください" + chr$(13)
2640 Input "生まれた年(西暦4桁):",buf_male_born_year
2650 '2-2 男性の生まれた月
2660 cls:talk buf_male_name$ + "さんの生まれた月を入れてください"
2670 print buf_male_name$;"さんの生まれた月を入れてください" + chr$(13)
2680 Input "生まれた月:",buf_male_born_month
2690 '2-3 男性の生まれた日
2700 cls:talk buf_male_name$+"さんの生まれた日を入れてください"
2710 print buf_male_name$;"さんの生まれた日を入れてください" + chr$(13)
2720 Input "生まれた日:",buf_male_born_day
2730 '3.データー入力　女性
2740 '3-1 女性の名前を入力
2750 cls:talk"女性の名前を入れてください"
2760 print"女性の名前を入れてください" + chr$(13)
2770 Input "女性の名前:",buf_female_name$
2780 '3-1 女性の生まれた年（西暦4桁)
2790 cls:talk buf_female_name$ + "さんの生まれた年を西暦4桁で入れてください"
2800 print buf_female_name$;"さんの生まれた年(西暦4桁)を入れてください" + chr$(13)
2810 Input "生まれた年(西暦4桁):",buf_female_born_year
2820 '3-2 女性の生まれた月
2830 cls:talk buf_female_name$+"さんの生まれた月を入れてください"
2840 print buf_female_name$;"さんの生まれた月を入れてください" + chr$(13)
2850 Input "生まれた月:",buf_female_born_month
2860 '3-3 女性の生まれた日
2870 cls:talk buf_female_name$+"さんの生まれた日をいれてください"
2880 print buf_female_name$;"さんの生まれた日を入れてください" + chr$(13)
2890 Input "生まれた日:",buf_female_born_day
2900 '4.計算部分
2910 '4-1 年の十二支
2920 func year_eto(bufyear,bufmonth,bufday)
2930 if  (bufmonth = 1 And bufday >= 1 and bufday <= 31)  or  (bufmonth = 2  and  bufday >=1 and  bufday  <=3 )  then
2940 bufyear = bufyear - 1
2950 u = fix(bufyear + 9) mod 12
2960 else
2970 u = fix(bufyear + 9) mod 12
2980 endif
2990 endfunc u
3000 '4-1-1 年の十二支 男性
3010 t1 = fix((buf_male_born_year + 9) m0d 12)
3020 '4-1-2 年の十二支 女性
3030 t2 = fix((buf_female_born_year + 9) mod 12)
3040 '4-2 月の十二支
3050 func month_eto(month)
3060 u2 = fix(month + 1) mod 12
3070 endfunc u2
3080 '4-2-1 月の十二支 男性
3090 u1 = fix((buf_male_born_month + 1) mod 12)
3100 '4-2-2 月の十二支 女性
3110 u2 = fix((buf_female_born_month + 1) mod 12)
3120 '4-3 日の十二支
3130 func buf_day_eto(year,month,day)
3140 c_1=fix(year/100)
3150 n_1=fix(year-(c_1)*100)
3160 u3=fix(8*(c_1)+fix((c_1)/4)+5*(n_1)+fix((n_1)/4)+6*month+fix((3*month+3)/5)+day+1) mod 12
3170 endfunc u3
3180 '4-3-1-1 c1=西暦の上２桁を求める　男性
3190 c1=fix(buf_male_born_year / 100)
3200 '4-3-2-1 c1=西暦の上２桁を求める　女性
3210 c2=fix(buf_female_born_year / 100)
3220 '4-3-1-2 n1=西暦の下２桁を求める　男性
3230 n1=fix(buf_male_born_year - c1 * 100)
3240 '4-3-2-2 n2=西暦の下２桁を求める　女性
3250 n2=(fix(buf_female_born_year - c2 * 100))
3260 '4-3-3-1 日の十二支　男性
3270 q1=fix(8 * c1 + fix(c1 / 4) + 5 * n1 + fix(n1 / 4) + 6 * buf_male_born_month + fix((3 * buf_male_born_month + 3) / 5) + buf_male_born_day + 1) mod 12
3280 '4-3-3-2 日の十二支  女性
3290 q2=fix(8 * c2 + fix(c2 / 4) + 5 * n2 + fix(n2 / 4) + 6 * buf_female_born_month + fix((3 * buf_female_born_month + 3) / 5) + buf_female_born_day + 1) mod 12
3300 '1.年の干支 男性
3310 buffer_year_male = year_eto(buf_male_born_year,buf_male_born_month,buf_male_born_day)
3320 '1.月の干支　男性
3330 buffer_month_male = month_eto(buf_male_born_month)
3340 ' 1.日の干支　男性
3350 buffer_day_male = buf_day_eto(buf_male_born_year,buf_male_born_month,buf_male_born_day)
3360 '2.年の干支　女性
3370 buffer_year_female=year_eto(buf_female_born_year,buf_female_born_month,buf_female_born_day)
3380 '2.　月の干支　女性
3390 buffer_month_female=month_eto(buf_female_born_month)
3400 '3.日の干支　女性
3410 buffer_day_female=buf_day_eto(buf_female_born_year,buf_female_born_month,buf_female_born_day)
3420 '5.結果表示
3430 cls:talk"二人の干支です"
3440 print "男性：";buf_male_name$;chr$(13)
3450 print"男性の誕生日1:";buf_male_born_year;"年 ";buf_male_born_month;"月 ";buf_male_born_day;"日 " + chr$(13)
3460 print"男性の誕生日2:";buf_eto$(buffer_year_male);"年 ";buf_eto$(buffer_month_male);"月 ";buf_eto$(buffer_day_male);"日 ";chr$(13)
3470 print "女性：";buf_female_name$;chr$(13)
3480 print"女性の誕生日1:";buf_female_born_year;"年 ";buf_female_born_month;"月 ";buf_female_born_day;"日 " + chr$(13)
3490 print"女性の誕生日2:";buf_eto$(buffer_year_female);"年 ";buf_eto$(buffer_month_female);"月 ";buf_eto$(buffer_day_female);"日 " + chr$(13)
3500 'Enterでトップ画面
3510 print "エンターキーを押してください"
3520 key_input3:
3530 key$ = input$(1)
3540 if key$ = chr$(13) then
3550 goto TopScreen:
3560 else
3570 goto  key_input3:
3580 endif
