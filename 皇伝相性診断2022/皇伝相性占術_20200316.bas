100 '相性占い試作　作成開始　2020.02.27
110 'Ver0.0.1:更新日:2020.03.16
120 'Ver0.0.2:更新日:2020.03.17
130 'Ver0.0.5:更新日:2022.05.07
140 'main プログラム
150 'Version バージョン番号
160 'アップデート履歴 2022.05.06
170 Version$ = "Ver:0.0.5.2022.05.07"
180 '1.変数定義
190 dim buf_eto$(12):i=0:data$ = "data/":img$ = "img/"
200 'ファイル読み込み　Etodata.dat
210 open data$ + "Etodata.dat" for input as #1
220 while eof(1) = 0
230 line input #1,buf_eto$(i)
240 i = i + 1
250 wend
260 close #1
270 '読み込み完了次の処理へ
280 TopScreen:
290 '1.トップ画面
300 cls 3:font 16*3
310 'グラフィック領域　ここから
320 '1.Title行
330 line (0,0)-(1000,60),rgb(0,0,255),bf
340 pen 2:line (2,2)-(998,58),rgb(127,255,212),b
350 '2.メニュー選択行
360 line (0,60)-(1000,650),rgb(127,255,212),bf
370 pen 5:line (0,63)-(997,653),rgb(0,0,255),b
380 '3.選択肢入力
390 line (0,550)-(1000,650),rgb(0,255,0),bf
400 pen 5:line (0,547)-(997,647),rgb(0,0,255),b
410 'グラフィック領域　ここまで
420 'ファイル読み込み ここから
430 screen 1,1,1,1:n=0
440 gload img$ + "Selection.png",1,20,200
450 gload img$ + "Selection.png",1,20,300
460 gload img$ + "Selection.png",1,20,400
470 gload img$ + "Selection.png",1,20,500
480 'ファイル読み込み　ここまで
490 cls:talk""
500 talk"ひとりようか、ふたりようか、番号を選んでエンターキーを押してください"
510 color rgb(255,255,255)
520 print "●皇伝相性占い" + chr$(13)
530 color rgb(255,0,255)
540 print "番号を選んでエンターキーを押してください" + chr$(13)
550 print " :1.ひとりよう(一人用)" + chr$(13)
560 print " :2.ふたりよう(二人用)" + chr$(13)
570 print " :3.設     定" + chr$(13)
580 print " :4.終     了" + chr$(13)
590 color rgb(0,0,0)
600 'input "番号:",key
610 sp_def 0,(20,200),32,32
620 sp_def 1,(20,300),32,32
630 sp_def 2,(20,400),32,32
640 sp_def 3,(20,500),32,32
650 sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:locate 2,12:print "                                      ":locate 2,12:print"1.ひとり用を選択"
660 sp_put 0,(20,200),0,0
670 input_key1:
680 key$ = input$(1)
690 'chr$(31):カーソル下
700 if key$ = chr$(31) then
710 select case (n Mod 4)
720 case 0:
730        n=1:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(20,300),0,0:locate 2,12:print "                                      ":locate 2,12:print"2.ふたりようを選択":goto input_key1:
740 case 1:
750        n=2:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(20,400),0,0:locate 2,12:print "                                      ":locate 2,12:print"3.設定を選択":goto input_key1:
760 case 2:
770        n=3:sp_on 0,0:sp_on 2,0:sp_on 3,1:sp_put 3,(20,500),0,0:locate 2,12:print "                                       ":locate 2,12:print "4.終了を選択":goto input_key1:
780 case 3:
790        n=0:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(20,200),0,0:locate 2,12:print"                                       ":locate 2,12:print "1.ひとり用を選択":goto input_key1:
800 end select
810 else
820 if key$=chr$(13) then
830 select case (n Mod 4)
840 case 0:
850        cls 4:goto Aisyou1:
860 case 1:
870        cls 4:goto Aisyou2:
880 case 2:
890        goto Setting:
900 case 3:
910        cls 3:cls 4:color rgb(255,255,255):talk"":talk "プログラムを終了します":interval 6.27*1000:ui_msg "プログラムを終了します":end
920 end select
930 else
940 'chr$(30):カーソル 上
950 if key$ = chr$(30) then
960 select case (n Mod 4)
970 case 0:
980        n=3:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(20,500),0,0:locate 2,12:print "                      ":locate 2,12:print "4.終了を選択":goto input_key1:
990 case 1:
1000        n=0:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_put 0,(20,200),0,0:locate 2,12:print "                                  ":locate 2,12:print "1.ひとりようを選択":goto input_key1:
1010 case 2:
1020        n=1:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_on 3,0:sp_put 1,(20,300),0,0:locate 2,12:print "                                      ":locate 2,12:print "2.ふたりようを選択":goto input_key1:
1030 case 3:
1040        n=2:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_on 3,0:sp_put 2,(20,400),0,0:locate 2,12:print "                                      ":locate 2,12:print "3.設定を選択":goto input_key1:
1050 end select
1060 else
1070 goto 680
1080 endif
1090 endif
1100 endif
1110 'if key = 1 then goto Aisyou1:
1120 'if key = 2 then goto Aisyou2:
1130 'if key = 3 then goto Setting:
1140 'if key = 4 then cls 3:color rgb(255,255,255):talk"プログラムを終了します":ui_msg"プログラムを終了します":Interval 7.63*1000:end
1150 'if key > 4 or key = 0  then goto TopScreen:
1160 '2.データー入力　男性
1170 '2-1-1 ひとりよう
1180 '2-1-1-1 西暦４桁入力
1190 '描画領域　ここから
1200 Aisyou1:
1210 cls 3
1220 '1.Title行
1230 line (0,0)-(1000,60),rgb(0,0,250),bf
1240 line (0,0)-(997,57),rgb(127,255,212),b
1250 '2.説明行
1260 line (0,60)-(1000,150),rgb(127,255,212),bf
1270 line (0,57)-(997,147),rgb(0,0,255),b
1280 '3.入力部分
1290 line (0,150)-(1000,260),rgb(0,255,0),bf
1300 line (0,147)-(997,257),rgb(0,0,255),b
1310 '描画領域 ここまで
1320 BornYear:
1330 cls:talk "":talk "一人用です、生まれた年を西暦４桁で入れてください"
1340 ui_msg"生まれた年(西暦4桁)を入れてください"
1350 color rgb(255,255,255)
1360 print"1.ひとりよう(一人用)" + chr$(13)
1370 color rgb(255,0,255)
1380 print"生まれた年(西暦4桁)を入れてください" + chr$(13)
1390 color rgb(0,0,0)
1400 Input"生まれた年(西暦4桁):",year
1410 if (year > 9999 or 1000 > year or year = 0 ) then
1420 ui_msg"入力値が範囲外です。入れ直してください。":goto BornYear:
1430 else
1440 ui_msg"生まれた月を入れてください":GOTO Bornmonth:
1450 endif
1460 '2-1-1-2 生まれた月を入力
1470 Bornmonth:
1480 cls:talk "":talk "生まれた月を入れてください"
1490 color rgb(255,255,255)
1500 print "1.ひとりよう(一人用)" + chr$(13)
1510 color rgb(255,0,255)
1520 print "生まれた月を入れてください" + chr$(13)
1530 color rgb(0,0,0)
1540 Input "生まれた月(1〜12):" , month
1550 if month > 12 then
1560 goto Bornmonth:
1570 else
1580 goto BornDay:
1590 endif
1600 BornDay:
1610 '2-1-1-3 生まれた日を入力
1620 cls:talk "":talk"生まれた日を入れてください":ui_msg "生まれた日を入れてください"
1630 color rgb(255,255,255)
1640 print"1.ひとりよう(一人用)" + chr$(13)
1650 color rgb(255,0,255)
1660 print"生まれた日を入れてください" + chr$(13)
1670 color rgb(0,0,0)
1680 Input"生まれた日(1〜31):",day
1690 IF day > 31 then
1700 ui_msg"入力値が範囲外です。もう一度入れ直してください":goto BornDay:
1710 else
1720 goto EtoComp:
1730 endif
1740 '1-3-1 計算領域
1750 EtoComp:
1760 '1.年の干支
1770 buf_eto_year = year_eto(year,month,day)
1780 '2.月の干支
1790 buf_eto_month = month_eto(month)
1800 '3.日の干支
1810 buf_eto_day = buf_day_eto(year,month,day)
1820 '1-4-1 結果表示
1830 '描画領域　ここから
1840 Result_Eto:
1850 cls 3
1860 line (0,0)-(1200,60),rgb(0,0,255),bf
1870 pen 6:line (0,0)-(1197,57),rgb(0,255,0),b
1880 line (0,60)-(1200,260),rgb(127,255,212),bf
1890 line (0,57)-(1197,257),rgb(0,0,255),b
1900 LINE (0,260)-(1200,650),rgb(0,255,0),bf
1910 line (0,256)-(1206,645),rgb(0,0,255),b
1920 line (0,650)-(1200,780),rgb(0,255,0),bf
1930 line (0,645)-(1206,776),rgb(0,0,255),b
1940 '描画領域 ここまで
1950 cls:talk str$(year)+"年"+str$(month)+"月"+str$(day)+"日の干支です"
1960 color rgb(255,255,255)
1970 print "●あなたの干支" + chr$(13)
1980 color rgb(255,0,255)
1990 print "誕生日:";year;"年";month;"月";day;"日"+chr$(13)
2000 print"干支:";buf_eto$(buf_eto_year);"年 ";buf_eto$(buf_eto_month);"月 ";buf_eto$(buf_eto_day);"日 " + chr$(13)
2010 'talk "あなたの干支は、"+buf_eto$(buf_eto_year)+"年"+buf_eto$(buf_eto_month)+"月"+buf_eto$(buf_eto_day)+"日です":
2020 color rgb(0,0,0)
2030 PRINT"番号を入れてエンターキーを押してください"+chr$(13)
2040 print"1:もういちどやる" + chr$(13)
2050 print"2:トップ画面に行く" + chr$(13)
2060 print"3:音声で干支を説明" + chr$(13)
2070 input"番 号:",key
2080 if key=1 then goto Aisyou1:
2090 if key=2 then goto TopScreen:
2100 if key=3 then goto Result_Eto:
2110 'goto 1950
2120 'goto 490
2130 'talk "あなたの干支は、"+buf_eto$(buf_eto_year)+"年"+buf_eto$(buf_eto_month)+"月"+buf_eto$(buf_eto_day)+"日です":
2140 '3.設定メニュー
2150 '設定メニュー Top Version と 参考文献の選択画面
2160 '描画領域　ここから
2170 Setting:
2180 cls 3:
2190 line (0,0)-(1000,60),rgb(0,0,255),bf
2200 line (0,3)-(1003,63),rgb(127,255,212),b
2210 line (0,60)-(1000,450),rgb(127,255,212),bf
2220 line (0,63)-(1003,453),rgb(0,0,255),b
2230 line (0,450)-(1000,680),rgb(0,255,0),bf
2240 line (0,453)-(1003,683),rgb(0,0,255),b
2250 '描画領域　ここまで
2260 '文字領域 ここから
2270 color rgb(255,255,255)
2280 print "● 設  定" + chr$(13)
2290 color rgb(255,0,255)
2300 print "番号を選んでエンターを押してください" + chr$(13)
2310 print " :1.Version" + chr$(13)
2320 print " :2.参考文献" + chr$(13)
2330 print " :3.トップ画面に行く" + chr$(13)
2340 color rgb(0,0,0)
2350 print "番号を選んでエンターキーを押してください"+chr$(13)
2360 sp_on 0,1:sp_put 0,(20,200),0,0
2370 sp_on 1,0:sp_on 2,0:sp_on 3,0
2380 input_key2:
2390 key$ = input$(1)
2400 'chr$(31) カーソル下
2410 if key$ = chr$(31) then
2420 select case (n Mod 3)
2430 case 0:
2440        n=1:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_put 1,(20,300),0,0:goto input_key2:
2450 case 1:
2460        n=2:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_put 2,(20,400),0,0:goto input_key2:
2470 case 2:
2480       n=0:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_put 0,(20,200),0,0:goto input_key2:
2490 end select
2500 else
2510 if key$ = chr$(13) then
2520 select case (n Mod 3)
2530 case 2:
2540        sp_on 0,0:sp_on 1,0:sp_on 2,0:goto Version:
2550 case 1:
2560        sp_on 0,0:sp_on 1,0:sp_on 2,0:goto ReferenceBook:
2570 case 0:
2580        goto TopScreen:
2590 end select
2600 else
2610 goto input_key2:
2620 endif
2630 endif
2640 'Input "番号:",key
2650 'if key=1 then goto Version:
2660 'if key=2 then goto ReferenceBook:
2670 'if key=3 then goto TopScreen:
2680 '文字領域 ここまで
2690 Version:
2700 '1.Version 描画領域　ここから
2710 cls 3:
2720 line (0,0)-(1200,60),rgb(0,0,255),bf
2730 pen 3:line (0,3)-(1203,63),rgb(127,255,212),b
2740 line (0,60)-(1200,260),rgb(127,255,212),bf
2750 pen 3:line (0,63)-(1203,263),rgb(0,0,255),b
2760 line (0,260)-(1200,350),rgb(0,255,0),bf
2770 pen 3:line (0,263)-(1203,353),rgb(0,0,255),b
2780 '描画領域 ここまで
2790 '3-1 バージョン
2800 cls
2810 color rgb(255,255,255)
2820 print "皇伝相性占術　バージョン" + chr$(13)
2830 color rgb(255,0,255)
2840 print "Title:皇伝相性占術" + chr$(13)
2850 print Version$ + chr$(13)
2860 '
2870 color rgb(0,0,0)
2880 print "エンターキーを押してください"
2890 key1:
2900 key$ = input$(1)
2910 if key$ = chr$(13) then
2920 goto TopScreen:
2930 else
2940 goto key1:
2950 endif
2960 '設定　参考文献
2970 '参考文献
2980 '描画領域　ここから
2990 ReferenceBook:
3000 cls 3
3010 line (0,0)-(1200,60),rgb(0,0,255),bf
3020 line (0,3)-(1203,63),rgb(127,255,212),b
3030 line (0,60)-(1200,560),rgb(127,255,212),bf
3040 line (0,63)-(1203,563),rgb(0,0,255),b
3050 line (0,560)-(1200,650),rgb(0,255,0),bf
3060 line (0,563)-(1203,653),rgb(0,0,255),b
3070 '2人用 Top
3080 '2-1 男女の名前を入力
3090 '描画領域 ここまで
3100 '3-2-2.参考文献
3110 color rgb(255,255,255)
3120 print "● 参 考 文 献" + chr$(13)
3130 color rgb(255,0,255)
3140 print"TITLE:皇伝相性占い" + chr$(13)
3150 print"出版社:太玄社(ナチュラルスピリット)" + chr$(13)
3160 print"著者:林　巨征" + chr$(13)
3170 print"ISBN:978-4-906724-38-3" + chr$(13)
3180 print"定価:1980円　+ 税" + chr$(13)
3190 color rgb(0,0,0)
3200 print "エンターキーを押してください"
3210 key3:
3220 key$ = input$(1)
3230 if key$ = chr$(13) then
3240 goto TopScreen:
3250 else
3260 goto key3:
3270 endif
3280 '描画領域 ここから
3290 cls 3
3300 line (0,0)-(1000,60),rgb(0,0,255),bf
3310 line (0,3)-(1003,63),rgb(127,255,212),b
3320 line (0,60)-(1000,140),rgb(127,255,212),b
3330 line (0,63)-(1003,143),rgb(0,0,255),b
3340 line (0,140)-(1000,210),rgb(0,255,0),bf
3350 '描画領域 ここまで
3360 line (0,143)-(1003,212),rgb(0,0,255),b
3370 '文字表示部分 ここから
3380 color rgb(255,255,255)
3390 print"● 参 考 文 献" + chr$(13)
3400 '文字表示部分　ここまで
3410 Aisyou2:
3420 cls:talk "":talk "ふたりようです。男性の方の名前を入れてください"
3430 color rgb(255,255,255)
3440 print"2.ふたりよう "+ chr$(13)
3450 color rgb(255,0,255)
3460 print"男性の名前を入れてください" + chr$(13)
3470 color rgb(0,0,0)
3480 Input "男性の名前:",buf_male_name$
3490 '2-2男性の生まれた年（西暦4桁)
3500 cls:talk buf_male_name$+"さんの生まれた年を入れてください"
3510 print buf_male_name$;"さんの生まれた年(西暦4桁)を入れてください" + chr$(13)
3520 Input "生まれた年(西暦4桁):",buf_male_born_year
3530 '2-2 男性の生まれた月
3540 cls:talk buf_male_name$ + "さんの生まれた月を入れてください"
3550 print buf_male_name$;"さんの生まれた月を入れてください" + chr$(13)
3560 Input "生まれた月:",buf_male_born_month
3570 '2-3 男性の生まれた日
3580 cls:talk buf_male_name$+"さんの生まれた日を入れてください"
3590 print buf_male_name$;"さんの生まれた日を入れてください" + chr$(13)
3600 Input "生まれた日:",buf_male_born_day
3610 '3.データー入力　女性
3620 '3-1 女性の名前を入力
3630 cls:talk"":talk"女性の名前を入れてください"
3640 print"女性の名前を入れてください" + chr$(13)
3650 Input "女性の名前:",buf_female_name$
3660 '3-1 女性の生まれた年（西暦4桁)
3670 cls:talk buf_female_name$ + "さんの生まれた年を西暦4桁で入れてください"
3680 print buf_female_name$;"さんの生まれた年(西暦4桁)を入れてください" + chr$(13)
3690 Input "生まれた年(西暦4桁):",buf_female_born_year
3700 '3-2 女性の生まれた月
3710 cls:talk buf_female_name$+"さんの生まれた月を入れてください"
3720 print buf_female_name$;"さんの生まれた月を入れてください" + chr$(13)
3730 Input "生まれた月:",buf_female_born_month
3740 '3-3 女性の生まれた日
3750 cls:talk"":talk buf_female_name$+"さんの生まれた日をいれてください"
3760 print buf_female_name$;"さんの生まれた日を入れてください" + chr$(13)
3770 Input "生まれた日:",buf_female_born_day
3780 '4.計算部分
3790 '4-1 年の十二支
3800 func year_eto(bufyear,bufmonth,bufday)
3810 if  (bufmonth = 1 And bufday >= 1 and bufday <= 31)  or  (bufmonth = 2  and  bufday >=1 and  bufday  <=3 )  then
3820 bufyear = bufyear - 1
3830 u = fix(bufyear + 9) mod 12
3840 else
3850 u = fix(bufyear + 9) mod 12
3860 endif
3870 endfunc u
3880 '4-1-1 年の十二支 男性
3890 t1 = fix((buf_male_born_year + 9) m0d 12)
3900 '4-1-2 年の十二支 女性
3910 t2 = fix((buf_female_born_year + 9) mod 12)
3920 '4-2 月の十二支
3930 func month_eto(month)
3940 u2 = fix(month + 1) mod 12
3950 endfunc u2
3960 '4-2-1 月の十二支 男性
3970 u1 = fix((buf_male_born_month + 1) mod 12)
3980 '4-2-2 月の十二支 女性
3990 u2 = fix((buf_female_born_month + 1) mod 12)
4000 '4-3 日の十二支
4010 func buf_day_eto(year,month,day)
4020 c_1=fix(year/100)
4030 n_1=fix(year-(c_1)*100)
4040 u3=fix(8*(c_1)+fix((c_1)/4)+5*(n_1)+fix((n_1)/4)+6*month+fix((3*month+3)/5)+day+1) mod 12
4050 endfunc u3
4060 '4-3-1-1 c1=西暦の上２桁を求める　男性
4070 c1=fix(buf_male_born_year / 100)
4080 '4-3-2-1 c1=西暦の上２桁を求める　女性
4090 c2=fix(buf_female_born_year / 100)
4100 '4-3-1-2 n1=西暦の下２桁を求める　男性
4110 n1=fix(buf_male_born_year - c1 * 100)
4120 '4-3-2-2 n2=西暦の下２桁を求める　女性
4130 n2=(fix(buf_female_born_year - c2 * 100))
4140 '4-3-3-1 日の十二支　男性
4150 q1=fix(8 * c1 + fix(c1 / 4) + 5 * n1 + fix(n1 / 4) + 6 * buf_male_born_month + fix((3 * buf_male_born_month + 3) / 5) + buf_male_born_day + 1) mod 12
4160 '4-3-3-2 日の十二支  女性
4170 q2=fix(8 * c2 + fix(c2 / 4) + 5 * n2 + fix(n2 / 4) + 6 * buf_female_born_month + fix((3 * buf_female_born_month + 3) / 5) + buf_female_born_day + 1) mod 12
4180 '1.年の干支 男性
4190 buffer_year_male = year_eto(buf_male_born_year,buf_male_born_month,buf_male_born_day)
4200 '1.月の干支　男性
4210 buffer_month_male = month_eto(buf_male_born_month)
4220 ' 1.日の干支　男性
4230 buffer_day_male = buf_day_eto(buf_male_born_year,buf_male_born_month,buf_male_born_day)
4240 '2.年の干支　女性
4250 buffer_year_female=year_eto(buf_female_born_year,buf_female_born_month,buf_female_born_day)
4260 '2.　月の干支　女性
4270 buffer_month_female=month_eto(buf_female_born_month)
4280 '3.日の干支　女性
4290 buffer_day_female=buf_day_eto(buf_female_born_year,buf_female_born_month,buf_female_born_day)
4300 '5.結果表示
4310 cls:talk"二人の干支です"
4320 print "男性：";buf_male_name$;chr$(13)
4330 print"男性の誕生日1:";buf_male_born_year;"年 ";buf_male_born_month;"月 ";buf_male_born_day;"日 " + chr$(13)
4340 print"男性の誕生日2:";buf_eto$(buffer_year_male);"年 ";buf_eto$(buffer_month_male);"月 ";buf_eto$(buffer_day_male);"日 ";chr$(13)
4350 print "女性：";buf_female_name$;chr$(13)
4360 print"女性の誕生日1:";buf_female_born_year;"年 ";buf_female_born_month;"月 ";buf_female_born_day;"日 " + chr$(13)
4370 print"女性の誕生日2:";buf_eto$(buffer_year_female);"年 ";buf_eto$(buffer_month_female);"月 ";buf_eto$(buffer_day_female);"日 " + chr$(13)
4380 'Enterでトップ画面
4390 print "エンターキーを押してください"
4400 key_input3:
4410 key$ = input$(1)
4420 if key$ = chr$(13) then
4430 goto TopScreen:
4440 else
4450 goto key_input3:
4460 endif
