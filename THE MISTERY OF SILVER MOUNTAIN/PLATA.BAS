10 CLEAR :EL=39:NO=88:NV=57:G=28
20 GOSUB 3380
30 GOSUB 4400
40 LL=0
60 P$(0)=X$( VAL ( LEFT$ (D$(R),1))):IF LEN (P$(0))>0 THEN P$(0)=P$(0)+" "
65 P$(0)=P$(0)+Y$( VAL ( MID$ (D$(R),2,1))):IF LEN (Y$( VAL ( MID$ (D$(R),2,1))))>0 THEN P$(0)=P$(0)+" "
70 J$(0)=RR$(0)+"."+"ESTAS "+P$(0)+ RIGHT$ (D$(R), LEN (D$(R))-2)+" ":GOSUB 4830
80RESTORE 4030:J$(0)=""
90 FOR I=1 TO G-1
100 READ O$(0)
110 P$(0)=Y$( VAL ( LEFT$ (O$(0),1))):GOSUB 3350
120 IF F(I)=0 AND C(I)=R THEN J$(0)=J$(0)+P$(0)+" "+O$(0)+","
130 NEXT I
140 IF R=29 AND F(48)=0 THEN J$(0)=J$(0)+" UNA FIESTA DE LOS GRARGS,"
150 IF R=29 AND F(48)=1 THEN J$(0)=J$(0)+" UN GRARG DORMIDO,"
160 IF R=12 OR R=22 THEN J$(0)=J$(0)+" UN PONY,"
170 IF R=64 THEN J$(0)=J$(0)+" UN HERMITANO,"
180 IF R=18 AND E$(18)="N" THEN J$(0)=J$(0)+" UNA PUERTA DE ROBLE,"
190 IF R=59 AND F(68)=1 THEN J$(0)=J$(0)+" OGBAN (MUERTO),"
195 IF RIGHT$ (J$(0),1)="," THEN J$(0)= MID$ (J$(0),1, LEN (J$(0))-1)
200 IF J$(0)<>"" THEN J$(0)=",PUEDES VER"+J$(0)
210 J$(0)=J$(0)+" Y PUEDES IR "
220 GOSUB 4830:PRINT " ";
230 FOR I=1 TO LEN (E$(R)):PRINT MID$ (E$(R),I,1);
235 IF LEN (E$(R))>I THEN PRINT ",";
240 NEXT I:PRINT
250 RR$(0)="PERDON?"
255 II$(0)= INKEY$
260 INPUT "QUE HARAS?";II$(0)
290 V$="":T$(0)="":VB=0:B=0
300 FOR I=1 TO LEN (II$(0))
310 IF MID$ (II$(0),I,1)=" " AND V$="" THEN V$= LEFT$ (II$(0),I-1)
320 IF MID$ (II$(0),I+1,1)<>" " AND V$<>"" THEN T$(0)= MID$ (II$(0),I+1, LEN (II$(0))-1):I= LEN (II$(0))
330 NEXT I:IF T$(0)="" THEN V$=II$(0)
340 IF LEN (V$)<3 THEN LET V$=V$+"O":GOTO 340
350 IF V$="PLAY" THEN LET V$="BLO"
360 U$= LEFT$ (V$,3)
370 FOR I=1 TO NV:IF MID$ (B$(0),I*3-2,3)=U$ THEN VB=I:I=NV
380 NEXT I:F(36)=0
390RESTORE 4030
400 FOR I=1 TO NO:READ O$(0):IF I<=G THEN GOSUB 3350
410 IF T$(0)=O$(0) THEN B=I:I=NO
420 NEXT I
430 IF B=0 AND F(36)=0 AND T$(0)>"" THEN T$(0)=T$(0)+"S":F(36)=1:GOTO 390
440 IF VB=0 THEN VB=NV+1
450 IF T$(0)="" THEN RR$(0)="NECESITO DOS PALABRAS"
460 IF VB>NV THEN RR$(0)="PRUEBA OTRA COSA"
470 IF VB>NV AND B=0 THEN RR$(0)="NO PUEDES "+II$(0)
472 IF II$(0)="SALVAR" THEN GOSUB 4630
474 IF II$(0)="SALIR" THEN CLS :END
476 IF II$(0)="CARGAR" THEN GOSUB 4600
480 IF B>G OR B=0 THEN GOTO 510
490 IF VB=8 OR VB=9 OR VB=14 OR VB=17 OR VB=44 OR VB>54 THEN GOTO 510
500 IF VB<NV AND C(B)<>0 THEN RR$(0)="NO TIENES "+T$(0):GOTO 30
510 IF R=56 AND F(35)=0 AND VB<>37 AND VB<>53 THEN RR$(0)=X1$(0)+" TE HA COGIDO!":GOTO 30
520 IF VB=44 OR VB=47 OR VB=19 OR VB=57 OR VB=49 THEN GOTO 540
530 IF R=48 AND F(63)=0 THEN RR$(0)=X9$(0):GOTO 30
540 H= VAL ( STR$ (R)+ STR$ (B) )
550 ON INT ((VB-1)/13)+1 GOTO 560,580,600,620,640
560 ON VB GOSUB 800,800,800,800,800,800,1220,1290,1290,1470,1470,1750,1890
570 GOTO 650
580 ON VB-13 GOSUB 1960,1980,2010,2050,2870,2120,2220,2310,2380,2420,2450,2470,2520
590 GOTO 650
600 ON VB-26 GOSUB 2550,2580,2610,2650,2670,2700,2720,2730,2830,2800,2870,2730,2920
610 GOTO 650
620 ON   VB-39 GOSUB 2950,2990,3010,3050,3070,2310,2990,3070,3130,2120,3190,1470,3100
630 GOTO 650
640 ON VB-52 GOSUB 2870,3150,1290,1290,3170,3200
650 IF F(62)=1 THEN GOTO 730
660 IF R=41 THEN F(67)=F(67)+1:IF F(67)=10 THEN F(56)=1:RR$(0)="ESTAS HUNDIDO!"
670 IF R=56 AND F(35)=0 AND C(10)<>0 THEN RR$(0)=X1$(0)+" TE COGE!":F(56)=1
680 IF F(56)=0 THEN GOTO 30
690 GOSUB 4400:PRINT RR$(0);
700 PRINT " HAS FALLADO!"
710 PRINT "OTRA OPORTUNIDAD"
720 GOSUB 3360:CLEAR :GOTO 10
730 GOSUB 4400
740 BEEP 1:PRINT "HUUUUUUUUUURRRRAAAAA!!!":WAIT 10
760 PRINT "HAS OBTENIDO EXITO EN TU MISION ";
770 PRINT "Y HAS TRAIDO LA PAZ A LA TIERRA"
780 WAIT 80
790 END
800 D=VB
810 IF D=5 THEN D=1
820 IF D=6 THEN D=3
830 IF NOT ((R=75 AND D=2) OR (R=76 AND D=4)) OR F(64)=1 THEN GOTO 850
840 RR$(0)="VO USPMM UF JNQJEF FM QBTP":GOSUB 4260:RETURN
850 IF F(64)=1 THEN F(64)=0
860 IF F(51)=1 OR F(29)=1 THEN GOTO 900
870 IF F(55)=1 THEN F(56)=1:RR$(0)="LOS GRARGS TE HAN CAPTURADO!":RETURN
880 IF R=29 AND F(48)=0 THEN RR$(0)="LOS GRARGS TE VERAN!":RETURN
890 IF R=73 OR R=42 OR R=9 OR R=10 THEN RR$(0)=X3$(0):F(55)=1:RETURN
900 IF C(8)=0 AND ((R=52 AND D=2) OR (R=31 AND D<>3)) THEN RR$(0)="EL BOTE ES DEMASIADO PESADO":RETURN
910 IF C(8)<>0 AND ((R=52 AND D=4) OR (R=31 AND D=3)) THEN RR$(0)="NO PUEDES NADAR":RETURN
920 IF R=52 AND C(8)=0 AND D=4 AND F(30)=0 THEN RR$(0)="NO TIENES FUERZA!":RETURN
930 IF R=41 AND D=3 AND F(31)=0 THEN RR$(0)="FM CPUF TF FTUB IVOEJFOEP!":GOSUB 4260:RETURN
940 IF R=33 AND D=1 AND F(32)=0 THEN RR$(0)="EL JABALI DE OGBAN'S BOAR BLOQUEA TU CAMINO":RETURN
950 IF ((R=3 AND D=2) OR (R=4 AND D=4)) AND F(45)=0 THEN RR$(0)=X5$(0):RETURN
960 IF R=35 AND C(13)<>R THEN RR$(0)="EL HIELO SE ESTA DESHACIENDO!":RETURN
970 IF R=5 AND (D=2 OR D=4) THEN GOSUB 4310
980 IF R=4 AND D=4 THEN RR$(0)="EL CAMINO ES MUY EMPINADO":RETURN
990 IF R=7 AND D=2 AND F(46)=0 THEN RR$(0)="UNA INMENSA BESTIA OBSTACULIZA TU CAMINO":RETURN
1000 IF (R=38 OR R=37) AND F(50)=0 THEN RR$(0)="FTUB EFNBTJBEP PTDVSP":GOSUB 4260:RETURN
1010 IF R=49 AND D=2 AND F(54)=0 THEN RR$(0)="MISTERIOSAS FUERZAS TE HACEN RETROCEDER":RETURN
1020 IF R=49 AND D=3 AND F(68)=0 THEN RR$(0)="ENCUENTRAS A OGBAN!":F(56)=1:RETURN
1030 IF R=38 AND F(65)=0 THEN RR$(0)="UNAS RATAS MORDISQUEAN TUS TOBILLOS":RETURN
1040 IF R=58 AND (D=1 OR D=4) AND F(66)=0 THEN RR$(0)="ERES ATRAPADO POR UNA TELA DE ARANA!":RETURN
1050 IF R=48 AND D=4 AND F(70)=0 THEN RR$(0)="LA PUERTA NO SE ABRE":RETURN
1060 IF R=40 AND F(47)=1 THEN F(68)=1
1070 IF R=37 AND D=4 AND E$(37)="EO" THEN R=67:RR$(0)="EL PASADIZO ESTABA INCLINADO!":RETURN
1080 IF R=29 AND D=3 THEN F(48)=1:F(20)=0
1090 IF R=8 AND D=2 THEN F(46)=0
1100 OM=R:FOR I=1 TO LEN (E$(R))
1110 K$= MID$ (E$(OM),I,1)
1120 IF (K$="N" OR K$="R") AND D=1 THEN R=R-10
1130 IF K$="E" AND D=2 THEN R=R+1
1140 IF (K$="S" OR K$="A") AND D=3 THEN R=R+10
1150 IF K$="O" AND D=4 THEN R=R-1
1160 NEXT I:RR$(0)="OK"
1170 IF R=OM THEN RR$(0)="NO PUEDES IR POR ESE CAMINO"
1180 IF ((OM=75 AND D=2) OR (OM=76 AND D=4)) THEN RR$(0)="OK. LO CRUZASTE"
1190 IF F(29)=1 THEN F(39)=F(39)+1
1200 IF F(39)>5 AND F(29)=1 THEN RR$(0)="MBT CPUBT FTUBO HBTUBEBT":GOSUB 4260:F(29)=0:C(3)=81
1210 RETURN
1220RESTORE 4030: RR$(0)="OK":F(49)=0
1230 CLS :PRINT "TIENES: ";
1240 FOR I=1 TO G:READ O$(0):GOSUB 3350:IF I=1 AND C(1)=0 AND F(44)=1 THEN LET O$(0)="MONEDA"
1250 IF I=G AND C(5)=0 THEN GOTO 1270
1260 IF C(I)=0 THEN PRINT O$(0);",";:F(49)=1
1270 NEXT I:IF F(49)=0 THEN PRINT "NADA"
1280 GOSUB 3360:RETURN
1290 IF H=6577 THEN RR$(0)="COMO?":RETURN
1300 IF H=4177 OR H=5177 THEN B=16:GOSUB 2380:RETURN
1310 IF B=38 THEN RR$(0)="DEMASIADO PESADO!":RETURN
1320 IF B=4 AND F(43)=0 THEN RR$(0)="ESTA CLAVADA A LA PUERTA DE MADERA":RETURN
1330 CO=0:FOR I=1 TO G-1:IF C(I)=0 THEN CO=CO+1
1340 NEXT I:IF CO>15 THEN RR$(0)="NO PUEDES LLEVAR NADA MAS":RETURN
1350 IF B>G THEN RR$(0)="NO PUEDES OBTENER "+T$(0):RETURN
1360 IF B=0 THEN RETURN
1370 IF C(B)<>R THEN RR$(0)="NO ESTA AQUI!"
1380 IF F(B)=1 THEN RR$(0)="QUE "+T$(0)+"?"
1390 IF C(B)=0 THEN RR$(0)="YA LO TIENES"
1400 IF C(B)=R AND F(B)=0 THEN C(B)=0:RR$(0)="TIENES "+T$(0)
1410 IF B=28 THEN C(5)=81
1420 IF B=5 THEN C(28)=0
1430 IF C(4)=0 AND C(12)=0 AND C(15)=0 THEN F(54)=1
1440 IF B=8 AND F(30)=1 THEN C(2)=0
1450 IF B=2 THEN F(30)=0
1460 RETURN
1470 RR$(0)="VES LO QUE PODRIAS ESPERAR!"
1480 IF B>0 THEN RR$(0)="NADA ESPECIAL"
1485 IF H=4870 AND C(21)=0 THEN RR$(0)="DEBERIAS EMPUJAR LA PUERTA"
1490 IF B=46 OR B=88 THEN GOSUB 2550
1500 IF H=8076 THEN RR$(0)="ESTA VACIO"
1510 IF H=8080 THEN RR$(0)="AHA!":F(1)=0
1520 IF H=7029 THEN RR$(0)="OK":F(2)=0
1530 IF B=20 THEN RR$(0)="IBZ VOBT DFSJMMBT FO FM CPMTJMMP":GOSUB 4260:C(26)=0
1540 IF H=1648 THEN RR$(0)="HAY ALGUNAS LETRAS '"+G$(2)+"'"
1550 IF H=7432 THEN RR$(0)="TPO NBOABOPT":GOSUB 4260:F(5)=0
1560 IF H=2134 OR H=2187 THEN RR$(0)="OK":F(16)=0
1570 IF B=35 THEN RR$(0)="ES SOSPECHOZO!":F(17)=0
1580 IF H=3438 THEN RR$(0)="OK":F(22)=0
1590 IF H=242 THEN RR$(0)="HAY UNA INSCRIPCION ILEGIBLE"
1600 IF (H=1443 OR H=1485) AND F(33)=0 THEN RR$(0)="VO EFTUFMMP EF MVA TBMF EF MBT QSPGVOEJEBEFT":GOSUB 4260
1610 IF (H=1443 OR H=1485) AND F(33)=1 THEN RR$(0)="HAY ALGO AQUI...":F(12)=0
1620 IF H=2479 OR H=2444 THEN RR$(0)="HAY UNA MANILLA"
1630 IF B=9 THEN RR$(0)="MB FUJRVFUB EJDF 'WFOFOP'":GOSUB 4260
1640 IF H=4055 THEN GOSUB 3290
1650 IF H=2969 AND F(48)=1 THEN RR$(0)="MUY FEO!"
1655 IF H=7257 THEN RR$(0)="PARECE QUE HAY ALGO EN EL FONDO"
1660 IF H=7158 OR H=7186 THEN RR$(0)="HAY LADRILLOS SUELTOS"
1665 IF H=7136 THEN RR$(0)= "NECSITAS GOLPEARLOS CON ALGO"
1670 IF R=49 THEN RR$(0)="MUY INTERESANTE!"
1680 IF B=52 OR B=82 OR B=81 THEN RR$(0)="INTERESANTE!"
1690 IF H=6978 THEN RR$(0)="HAY UNA PUERTA DE MADERA"
1700 IF H=6970 THEN RR$(0)="ENCONTRASTE ALGO":F(4)=0
1710 IF H=2066 THEN RR$(0)="HAY UN GRAN ARMARIO EN LA ESQUINA"
1720 IF H=6865 OR H=6853 THEN RR$(0)="HAY NUEVE PIEDRAS"
1730 IF H=248 THEN RR$(0)="MB QBMBCSB CPSSBEB FT 'KVODPT'":GOSUB 4260
1740 RETURN
1750 IF R=64 THEN RR$(0)="EL LO DEVUELVE!"
1760 IF H=6425 THEN GOSUB 3210
1770 IF R=75 OR R=76 THEN RR$(0)="EL NO LO QUIERE"
1780 IF B=62 AND F(44)=0 THEN RR$(0)="TIENES QUE SALIR CORRIENDO!"
1790 IF (H=7562 OR H=7662) AND F(44)>0 AND C(1)=0 THEN RR$(0)="EL LA TOMA":F(64)=1
1800 IF F(64)=1 THEN F(44)=F(44)-1:IF F(44)=0 THEN C(1)=81
1810 IF B=1 THEN RR$(0)="EL LAS TOMA TODAS!":C(1)=81:F(64)=1:F(44)=0
1820 IF H=2228 AND C(5)=81 THEN RR$(0)=XB$+" NORTE":C(28)=81:R=12
1830 IF (H=2228 AND C(5)=0) OR H=225 THEN RR$(0)=XB$+" NORTE":R=12
1840 IF (H=1228 AND C(5)=0) OR H=125 THEN RR$(0)=XB$+" SUR":R=22
1850 IF R=7 OR R=33 THEN RR$(0)="EL SE LO COME!":C(B)=81
1860 IF H=711 THEN F(46)=1:RR$(0)="LA BESTIA SE DISTRAE"
1870 IF H=385 OR H=3824 THEN RR$(0)="SE ALEJAN CORRIENDO":C(B)=81:F(65)=1
1880 RETURN
1890 RR$(0)="LO DIJISTE"
1900 IF B=84 THEN RR$(0)="DEBES DECIRSELO UNO A UNO!":RETURN
1910 IF R<>47 OR B<71 OR B>75 OR C(27)<>0 THEN RETURN
1920 IF B=71 AND F(60)=0 THEN RR$(0)=X7$(0):F(60)=1:RETURN
1930 IF B=72 AND F(60)=1 AND F(61)=0 THEN RR$(0)=X8$(0):F(61)=1:RETURN
1940 IF B=(F(52)+72) AND F(60)=1 AND F(61)=1 THEN F(62)=1:RETURN
1950 RR$(0)="ESAS NO SON LAS PALABRAS SAGRADAS!":F(56)=1:RETURN
1960 IF B=5 OR B=10 THEN GOSUB 1290
1970 RETURN
1980 IF B=3 THEN F(29)=1:RR$(0)="FSFT JOWJTJCMF":F(55)=0:GOSUB 4260
1990 IF B=20 THEN F(51)=1:RR$(0)="FTUBT EJTGSBABEP":F(55)=0:GOSUB 4260
2000 RETURN
2010 IF B=2 OR B=14 THEN RR$(0)="NADA PARA ATARLA!"
2020 IF H=7214 THEN RR$(0)="ESTA ATADA":C(14)=72:F(53)=1
2030 IF H=722 THEN RR$(0)="OK":F(40)=1:C(2)=72
2040 RETURN
2050 IF H=1547 AND F(38)=1 THEN RR$(0)="DE ACUERDO":R=16
2060 IF B=14 OR B=2 THEN RR$(0)="NO ESTA SUJETA A NADA!"
2070 IF H=5414 AND C(14)=54 THEN RR$(0)="ESTAS EN LO ALTO"
2080 IF H=7214 AND F(53)=1 THEN RR$(0)="BAJANDO":R=71
2090 IF H=722 AND F(40)=1 THEN R=71:RR$(0)="ESTA ROTA":C(2)=81:F(40)=0
2100 IF H=7114 AND F(53)=1 THEN C(14)=71:F(53)=0:RR$(0)="CAES DANDO BOTES!"
2110 RETURN
2120 IF H=522 THEN RR$(0)="OK":F(30)=1
2130 IF B=1 OR B=62 OR B=5 OR B=28 OR B=11 OR B=24 THEN GOSUB 1750
2140 IF H=416 THEN RR$(0)="UF NBOUJFOFT B GMPUF":F(31)=1:GOSUB 4260:RETURN
2150 IF H=4116 THEN RR$(0)="NO ES DEMASIADO GRANDE!":RETURN
2160 IF B=18 OR B=7 THEN GOSUB 2470
2170 IF B=13 THEN GOSUB 2730
2180 IF B=19 THEN GOSUB 3070
2190 IF B=10 THEN GOSUB 2870
2200 IF B=16 OR B=6 THEN GOSUB 2380
2210 RETURN
2220 IF B=76 OR B=38 THEN GOSUB 1470
2230 IF H=2030 THEN F(9)=0:RR$(0)="OK"
2240 IF H=6030 THEN RR$(0)="OK":F(3)=0
2250 IF H=2444 OR H=1870 THEN RR$(0)="NO ERES SUFICIENTEMENTE FUERTE"
2260 IF H=3756 THEN RR$(0)="UN PASADIZO!":E$(37)="EO"
2270 IF H=5960 THEN GOSUB 3260
2280 IF H=6970 THEN RR$(0)="SE DESPRENDE DE SUS BISAGRAS"
2290 IF H=4870 THEN RR$(0)="ESTA CERRADA"
2300 RETURN
2310 IF B>G THEN RR$(0)="NO ARDE"
2320 IF B=26 THEN RR$(0)="LA ENCIENDES"
2330 IF H=3826 THEN RR$(0)="NO ALUMBRA LO SUFICIENTE"
2340 IF (B=23 OR H=6970) AND C(26)<>0 THEN RR$(0)="OP UJFOFT DFSCJMBT":GOSUB 4260
2350 IF B=23 AND C(26)=0 THEN RR$(0)="DA UNA GRAN LUZ AL "+V$:F(50)=1
2360 IF H=6970 AND C(26)=0 THEN F(43)=1:RR$(0)="SE HA REDUCIDO HA CENIZAS"
2370 RETURN
2380 IF (B=16 OR B=6) AND (R=41 OR R=51) THEN RR$(0)="ZOZOBRAS!":F(56)=1
2390 IF H=6516 AND C(16)=0 THEN RR$(0)="ESTA AHORA LLENA":F(34)=1
2400 IF H=656 THEN RR$(0)="ESTA GOTEANDO!"
2410 RETURN
2420 IF B<>22 OR R<>15 THEN RR$(0)="NO CRECE!":RETURN
2430 RR$(0)="OK":F(37)=1
2440 RETURN
2450 IF B=22 AND F(37)=1 AND F(34)=1 THEN RR$(0)=X2$(0):F(38)=1:GOSUB 4260
2460 RETURN
2470 IF B=7 OR B=18 THEN RR$(0)="GOLPE!"
2480 IF H=5818 THEN RR$(0)="LIMPIAS LAS TELAS DE ARANA":F(66)=1
2490 IF H=187 THEN RR$(0)="LA PUERTA SE ROMPE!":E$(18)="NS":E$(28)="NS"
2500 IF H=717 THEN RR$(0)="TE ABRES CAMINO":E$(71)="N"
2510 RETURN
2520 IF B=16 THEN B=22:GOSUB 2450
2530 IF H=499 THEN RR$(0)="DONDE?"
2540 RETURN
2550 IF H=4337 THEN VB=2:GOSUB 800:RETURN
2560 IF R=36 THEN RR$(0)="TE ENCUENTRAS ALGO":F(13)=0
2570 RETURN
2580 IF R=76 THEN VB=4:GOSUB 800:RETURN
2590 IF R=75 THEN VB=2:GOSUB 800
2600 RETURN
2610 IF (B=3 AND F(29)=1) THEN RR$(0)="QUITADO":F(29)=0
2620 IF (B=20 AND F(51)=1) THEN RR$(0)="OK":F(51)=0
2630 IF B=36 OR B=50 THEN GOSUB 2950
2640 RETURN
2650 IF H=3859 OR H=3339 OR H=1241 OR H=2241 OR H=751 THEN RR$(0)="CON QUE?"
2660 RETURN
2670 IF H=2340 THEN RR$(0)="VA DANDO VUELTAS"
2680 IF H=2445 THEN RR$(0)="MBT DPNQVFSUBT TF BCSFO,FM FTUBORVF TF WBDJB":F(33)=1:GOSUB 4260
2690 RETURN
2700 IF R=14 OR R=51 THEN RR$(0)="TE HAS AHOGADO":F(56)=1
2710 RETURN
2720 RR$(0)="COMO?":RETURN
2730 IF B=0 OR B>G THEN RETURN
2740 C(B)=R:RR$(0)="HECHO"
2750 IF H=418 OR H=518 THEN RR$(0)="TE AHOGASTE!":F(56)=1
2760 IF B=8 AND F(30)=1 THEN C(2)=R
2770 IF B=16 AND F(34)=1 THEN RR$(0)="PERDISTE EL AGUA!":F(34)=0
2780 IF B=2 AND F(30)=1 THEN F(30)=0
2790 RETURN
2800 IF B=62 AND F(44)=0 THEN RR$(0)="NO TIENES MONEDA"
2810 IF H=5762 AND C(1)=0 AND F(44)>0 THEN GOSUB 3230
2820 RETURN
2830 IF B=0 OR B>G THEN RETURN
2840 RR$(0)="NO FUISTE LEJOS!":C(B)=R
2850 IF H=3317 THEN RR$(0)="DBABT BM KBCBMJ":F(32)=1:GOSUB 4260
2860 RETURN
2870 IF B=10 THEN RR$(0)="VOB CPOJUB DBODJPO":GOSUB 4260
2880 IF H=5233 THEN RR$(0)="CON QUE?"
2890 IF B=83 THEN RR$(0)="COMO, UN MUSICAL?"
2900 IF H=5610 THEN F(35)=1:RR$(0)=X1$(0)+" ESTA LIBRE!":E$(56)="NS"
2910 RETURN
2920 IF B=0 OR B>G THEN RETURN
2930 IF B=5 OR B=24 THEN RR$(0)="YUM YUM!":C(B)=81
2940 RETURN
2950 IF R=4 AND B=50 THEN F(45)=1:RR$(0)="ENCUENTRAS UN PASADIZO MUY PENDIENTE"
2960 IF R=3 AND B=50 THEN RR$(0)="NO PUEDES MOVER LA TIERRA DESDE AQUI"
2970 IF H=7136 THEN RR$(0)="ESTAN ENCAJADOS!"
2980 RETURN
2990 IF (B=67 OR B=68) AND C(9)=0 AND R=49 THEN RR$(0)="OK":F(47)=1
3000 RETURN
3010 IF R<>27 OR B<>63 THEN RETURN
3020 INPUT "CUANTAS VECES";MR:IF MR=0 THEN PRINT "UN NUMERO":GOTO 3020
3030 IF MR=F(42) THEN RR$(0)="UNA PUERTA DE PIEDRA SE ABRE":E$(27)="EO":RETURN
3040 RR$(0)="IBT FTUSPQFBEP MB DBNQBOB!":F(56)=1:GOSUB 4260:RETURN
3050 IF H=5861 THEN H=5818:GOSUB 2470
3060 RETURN
3070 IF (H=4864 OR H=4819) AND C(19)=0 THEN RR$(0)=X6$(0):F(63)=1:GOSUB 4260
3080 IF B=27 THEN GOSUB 1290
3090 RETURN
3100 IF H=7549 OR H=7649 THEN RR$(0)="CON QUE?"
3110 IF B=1 OR B=62 THEN GOSUB 1750
3120 RETURN
3130 IF H=4870 AND C(21)=0 THEN RR$(0)="LA LLAVE GIRA!":F(70)=1
3140 RETURN
3150 IF H=1870 THEN RR$(0)="COMO?"
3160 RETURN
3170 IF R=48 THEN RR$(0)="COMO?"
3180 RETURN
3190 RR$(0)="ESTAS SEDIENTO?"
3200 RETURN
3210 RR$(0)="EL LO TOMA Y DICE :"+ STR$ (F(42))+" VECES DEBES HACERLA SONAR":C(25)=81
3220 RETURN
3230 F(44)=F(44)-1:RR$(0)="APARECE EL NUMERO:"+ STR$ (F(41))
3240 IF F(44)=0 THEN C(1)=81
3250 RETURN
3260 CLS :RR$(0)="EJNF FM DPEJHP":GOSUB 4260:PRINT RR$(0);:INPUT "?"; CN
3270 RR$(0)="FALSO!":IF CN=F(41) THEN RR$(0)="SE ABRE":F(21)=0
3280 RETURN
3290 BEEP 1:T=R:R=F(F(52)+56)
3300 RR$(0)=X4$(0)+ RIGHT$ (D$(R), LEN (D$(R))-2):R=T:RETURN
3310 REM D$(R)
3320 RETURN
3330 RESTORE :FOR I=1 TO 80:READ D$(I):NEXT I
3340 RETURN
3350 O$(0)= RIGHT$ (O$(0), LEN (O$(0))-1):RETURN
3360 INPUT " ",Z$(0)
3370 RETURN
3380 DIM C(G),E$(80)*4,F(70),X$(6),Y$(6),G$(2)*8,B$(0)*144,D$(80)*45,RR$(0)*100,J$(0)*144,P$(0)*144,O$(0)*144,T$(0)*60
3385 DIM X1$(0)*40,X2$(0)*45,X3$(0)*45,X4$(0)*60,X5$(0)*45,X6$(0)*60,X7$(0)*20,X8$(0)*20,X9$(0)*30,Z$(0)*60,II$(0)*30
3390 GOSUB 3330
3400 FOR I=1 TO NO:READ T$(0):NEXT I
3410 FOR I=1 TO 6:READ X$(I),Y$(I):NEXT I
3420 B$(0)="NOOEOOSOOOOOROOAOOINVOBTTOMEXALEEDARDECRECPONATAESCIZAUSAABR"
3430 B$(0)=B$(0)+"ENCLLEPLAREGBLAVACENTATRQUIALIGIRSUMRESDEJARRINSSOPTIRCOMMOV"
3440 B$(0)=B$(0)+"DENREPCORSOSQUEENVMOSEMPCONBEBCONPAGHACROMROBREUREF"
3450 X6$(0)="SFGMFKBT MB QFOFUSBOUF NJSBEB EFM NBHP! FM NVFSF"
3460 X1$(0)="EL FANTASMA DEL DUENDE GUARDIAN"
3470 X2$(0)="VOB FOPSNF FOSFEBEFSB DSFDF FO TFHVOEPT!"
3480 X3$(0)="UNA PATRULLA DE GRARG SE APROXIMA"
3490 X4$(0)="LAS PALABRAS MAGICAS SE HALLAN EN EL CRUCE, LA FUENTE Y EN "
3500 X5$(0)="UN MONTON DE TIERRA TE BLOQUEA EL CAMINO"
3510 X7$(0)="LA MONTANA RETUMBA!"
3520 X8$(0)="LAS TORRES SE CAEN!"
3530 X9$(0)="EL MAGO TE MIRA FIJAMENTE"
3540 XB$="TE GUIA HACIA EL"
3550 CLS :GOSUB 6000:WAIT 120:PRINT :WAIT 0
3555 CLS :C=0 :PRINT "QUE QUIERES HACER:"
3560 PRINT "   1. EMPEZAR "
3570 PRINT "   2. CONTINUAR AVENTURA"
3580 INPUT "INTRODUCE UN 1 O UN 2?";C
3590 IF C<>1 AND C<>2 THEN GOTO 3555
3600 IF C=1 THEN GOSUB 4450
3610 IF C=2 THEN 4600
3620 RETURN
3630 DATA 11UNA TUMBA MEDIO ABIERTA,12EL CEMENTERIO DE LOS DUENDES.HAY UNAS LAPIDAS,11EL HUECO DE UNA TUMBA,23UNAS ESTALACTITAS
3650 DATA 11UN LABERINTO DE TUNELES,11UNA CUEVA ABOVEDADA,23LAS PUERTAS DE CRISTAL,12UNA HABITACION DE ENTRADA AL PALACIO
3670 DATA 31EL PUESTO DEL CENTINELA,12LA HABITACION DEL GUARDA,31LA ENSENADA PANTANOSA,23UNAS PUERTAS OXIDADAS
3690 DATA 12LA CASITA DEL GUARDIAN DEL JUEGO,31EL ESTANQUE CON NIEBLA,11UN JARDIN CON ALTOS MUROS,14UNA CUEVA CON INSCRIPCIONES
3710 DATA 34UNA FUENTE ADORNADA,11UN HUMEDO PASADIZO,12UNA LARGA GALERIA,12LAS COCINAS DE PALACIO
3730 DATA 34UN VIEJO HORNO,44UN CAMINO LLENO DE MALEZA,31UNA NORIA ESTROPEADA,33LAS COMPUERTAS DEL ESTANQUE
3750 DATA 11UN BOOUETE ENTRE ALGUNAS ROCAS,41UN CAMINO PELIGROSO,31LA CAMPANA DE PLATA EN LA ROCA,12LAS MAZNORRAS DE PALACIO
3770 DATA 11LA SALA DE BANOUETES,42LAS TORRES DE PALACIO,44LA COSTA DE LA ISLA,31UNA BARCA DE VELA ENCALLADA
3790 DATA 13UN CAMPO SECO,33UNOS SACOS EN EL PISO SUPERIOR,46ESTANQUE HELADO,21LA CABANA DE LA MONTANA
3810 DATA 31UNA HILERA DE BARRILES,11LA BODEGA DE VINO,12LA HABITACION DE LOS TAPICES,11UNA BIBLIOTECA POLVORIENTA
3830 DATA 13MEDIO DE UNAS AGUAS SALVAJES,11UN CAMPO ARADO,55EN EL EXTERIOR DE UN MOLINO DE VIENTO,42LA PLANTA BAJA DEL MOLINO
3850 DATA 44UN CAMIND HELADO,41UN CAMINO INCLINADO Y PEDREGOSO,12LA CAMARA DE PLATA,12LA CUEVA DEL MAGO
3870 DATA 11LA HABITACION DE LOS MOSAICOS FLORIDOS,12LA HABITACION DEL TRONO DE PLATA,12MEDIO DEL LAGO,42LA ORILLA DE UN LAGO HELADO 
3890 DATA 41UN CAMINO LLENO DE BACHES,41LO ALTO DEL PINACULO,55SOBRE UN GLACIAR,21UNOS ENORMES ROBLES CAIDOS 
3910 DATA 11UNA MABITACION CON UNA MAGUINA TRAGAPERRAS,11LA HABITACION CON TELAS DE ARANA,31UNA CAJA FUERTE EN LA CAMARA DE OGBAN,31UN ARMARIO EN UNA ESQUINA
3930 DATA 11UN PASADIZO ESTRECHO,16HUECO EN EL PASADIZO,11LA CABANA DEL LENADOR,42LA LADERA DEL VALLE CON ARBOLES
3950 DATA 21EL ARROYO EN EL FONDO DEL VALLE,11UN PROFUNDO Y OSCURO BOSOUE,11UN SOMBRIO AGUJERO,34UN CIRCULO DE ANTIQUISIMAS PIEDRAS
3970 DATA 16ESTABLO,14EL DORMITORIO DEL ATICO CON UNA CAMA,11EL HUMEDO FONDO DEL POZO,32UN PROFUNDO POZO
3990 DATA 31UNA HOGERA APAGADA,16HUERTO CON ARBOLES,62EL FINAL DEL PUENTE,62EL FINAL DEL PUENTE
4010 DATA 61UN CRUCE DE CAMINOS,41UN CAMINO SERPENTEANTE,11UN PUEBLO DE RUSTICAS CASAS,11UNA CASITA BLANCA QUE TIENE UNA OLLA
4030 DATA 3MONEDAS,1SABANA,3BOTAS,1HERRADURA,3MANZANAS,1CUBO,4HACHA,1BOTE,1FRASCO
4040 DATA 3JUNCOS,1HUESO,1ESCUDO,3TABLAS,1CUERDA,1ANILLO,1JARRA,1RED,1ESPADA
4050 DATA 1BANDEJA DE PLATA,1UNIFORME,1LLAVE,3SEMILLAS,1LAMPARA,3PAN,1BROCHE,3CERILLAS
4060 DATA 2PIEDRA DEL DESTINO,4MANZANA,CAMA,ARMARIO,PUENTE,ARBOLES,VELA,HORNO
4070 DATA BARCA DE VELA,LADRILLOS,MOLINO DE VIENTO,SACOS,JABALI DE OGBAN,RUEDA
4080 DATA PONY,LAPIDAS,ESTANQUES,COMPUERTAS,MANILLA,CABANA,ENREDADERA,INSCRIPCIONES,TROLL,TIERRA
4090 DATA BESTIA,FUENTE,CIRCULO,MOSAICOS,LIBROS,BARRILES,POZO,MUROS,RATAS,CAJA FUERTE
4100 DATA TELAS DE ARANA,MONEDA,CAMPANA,BANDEJA DE PLATA,PIEDRAS,COCINAS,COPA,VINO
4110 DATA GRARGS,PUERTA,VIGILA,GUIA,PROTEGE,DIRIGE,AYUDA,COFRE,AGUA
4120 DATA ESTABLOS,CONPUERTAS,OLLA,ESTATUA,PINACULO,MUSICA,PALABRAS MAGICAS
4130 DATA ESTANQUE CON NIEBLA,FONDO DEL POZO,VIEJO HORNO,CABANA DE LA MONTANA
4140 DATA EN, ,CERCA DE, ,AL LADO DE, ,EN, ,"","",EN, UN PEQUENO
4150 DATA E,ESO,OE,EO,EO,ESO,ESO,ES,EO,SO,S,N,ES,SO,S,NO,N,N,ES,NSO,NS,E,NSO,N,NES,EO,O,S,NS,N
4180 DATA NES,O,NS,A,NES,SO,E,NO,NS,S,NS,E,NSEO,OR,RA,NS,E,SO,NSE,NO,NE,EO,NSO,E,ON,S,E,NEO,NO,S
4210 DATA ES,SO,NES,EO,SO,NE,EO,ESO,SO,NA,".",E,NEO,EO,NEO,EO,EO,NEO,NEO,OR
4230 DATA 80,70,60,69,74,72,63,52,20,11,1,14,36,54,61,21,32,10,50
4240 DATA 29,59,34,13,80,30,81,47,74,1,2,3,4,5,9,12,13,16,17,20,21,22
4260 Z$(0)="":FOR I=1 TO LEN (RR$(0))
4270 CC$= MID$ (RR$(0),I,1):IF CC$<"A" THEN Z$(0)=Z$(0)+CC$:GOTO 4300
4280 C= ASC (CC$)-1:IF C=64 THEN C=90
4290 Z$(0)=Z$(0)+ CHR$ (C)
4300 NEXT I:RR$(0)=Z$(0):RETURN
4310 J$(0)="SSSSSSSS":NG=0
4320 MP=D/2:GOSUB 4400
4330 PRINT "ESTAS PERDIDO EN LOS TUNELES"
4340 INPUT "EN QUE DIRECCION IRAS N,S,E,O";W$
4350 IF NG>15 THEN PRINT "":  PRINT "(O  F- FINALIZAR!)";
4360 J$(0)= RIGHT$ (J$(0)+ RIGHT$ (W$,1),8)
4370 IF W$="F" THEN F(56)=1:RETURN
4380 IF J$(0)<>G$(MP) THEN NG=NG+1:GOTO 4320
4390 RETURN
4400 CLS
4440 RETURN
4450RESTORE 4150:  FOR I=1 TO 80:READ E$(I):NEXT I
4460 FOR I=1 TO G:READ C(I):NEXT I
4470 FOR I=1 TO 13:READ A:F(A)=1:NEXT I
4480 F(41)= INT ( RND 900)+100:F(42)= INT ( RND 3)+2
4490 F(44)=10:F(57)=68:F(58)=54:F(59)=15:F(52)= INT ( RND 3)
4500 R=77:RR$(0)="SUERTE!"
4510 G$(1)="":FOR I=1 TO 8
4520 F$= MID$ (B$(0),1+ INT ( RND 4)*3,1)
4530 G$(1)=G$(1)+F$
4540 IF F$="N" THEN L$="S"
4550 IF F$="S" THEN L$="N"
4560 IF F$="E" THEN L$="O"
4570 IF F$="O" THEN L$="E"
4580 G$(2)=L$+G$(2)
4590 NEXT I:RETURN
4600 GOSUB 4640: GOSUB 4670
4610 LET R = F(69): RR$(0) = "OK. CARGADO"
4620 RETURN
4630 LET F(69) = R: GOSUB 4640: GOSUB 4760: PRINT "LISTO...": RETURN
4640 CLS :PRINT "MISTERIO.DAT"
4650 RETURN
4660 REM
4670 REM
4680 PRINT "BUSCANDO MISTERIO.DAT"
4690 OPEN "E:MISTERIO.DAT" FOR INPUT AS #2:PRINT "OK. CARGANDO"
4700 FOR I = 1 TO 80: INPUT #2,E$(I): NEXT I
4710 FOR I = 1 TO G: INPUT #2,C(I): NEXT I
4720 FOR I = 1 TO 70: INPUT #2,F(I): NEXT I
4730 INPUT #2,G$(1): INPUT #2,G$(2)
4740 CLOSE #2: RETURN
4750 REM SALVA EL FICHERO DE DATOS 
4760 REM
4770 OPEN "E:MISTERIO.DAT" FOR OUTPUT AS #2: PRINT "OK, SALVANDO"
4780 FOR I = 1 TO 80: PRINT #2,E$(I): NEXT I
4790 FOR I = 1 TO G: PRINT #2,C(I): NEXT I
4800 FOR I = 1 TO 70: PRINT #2,F(I): NEXT I
4810 PRINT #2,G$(1):PRINT #2,G$(2)
4820 CLOSE #2:RR$(0)="OK":RETURN
4830 LS=1:LP=1
4840 FOR I=1 TO LEN (J$(0))
4850 IF MID$ (J$(0),I,1)=" " AND LL>EL THEN PRINT MID$ (J$(0),LP,LS-LP)+" ";:LL=I-LS:LP=LS+1
4860 IF MID$ (J$(0),I,1)=" " THEN LS=I
4870 LL=LL+1:NEXT I
4880 PRINT MID$ (J$(0),LP, LEN (J$(0))-LP);
4890 RETURN
6000 RESTORE 6020:FOR YY=2 TO 5 :FOR XX=0 TO 23
6010 READ II$(0):GCURSOR (XX*6,(YY*7)+YY):GPRINT II$(0):NEXT XX:NEXT YY
6020 DATA "000000000000","000000000000","000080FEFE2E","2222220200F0","FE7E00000000","00000000F8FE","1EFEE06018FE","FE1E00E0FEFE","0200989C3E22","E2EECE040002","02E2FEFE0202","020280FEFE2E"
6030 DATA "2222220200F0","FE7E62E2FE1E","0400F0FE7E00","E0FCFE0602E2","FE7C00000000","00F8FE1E0286","FEFE0800F0FE","7E2222220202","00000000F8FE","1E00000000C0","F8FE86FEFEFE","000000000000"
6040 DATA "000000000000","000000000000","000003030303","030303000003","030303030300","000000030303","000000000303","030000030300","000001030202","030101000000","000303000000","000003030303"
6050 DATA "030303000003","030000030303","000003030000","010303020301","010000000000","030303030301","010000000303","030303030000","000000030303","030303030303","030000030303","000000000000"
6060 DATA "000000000000","000000000080","F0F0F0000080","E0F0F00000C0","E0701010F0E0","000080F0F0F0","0080F0F00000","101090F0F010","101010C0F070","B0F0F0000080","F0F2F00382F2","F2000000E0F0"
6070 DATA "30F0F0000000","000000C0F0F0","1030F0F04000","C0F0F0101010","100000000000","F0F07010B0F0","F00000F0F010","0000000000E0","F030F0F00000","101010F0F010","10101080F0F0","30F0F0000000"
6080 DATA "000000000000","00000000001F","1F0003070310","1F1F0100040F","1F10181C0F07","00001F1F0001","1E1F1F010000","00101F1F0100","00101E1F0704","1F1F1F00001F","1F00011E1F1F","0100181F0F05"
6090 DATA "041F1F000000","0000181F1F18","180C0F070018","1F1F19191919","00000000001C","1F0F03030301","00001F1F1F18","181800181F0F","05041F1F0000","00001F1F0700","00001C1F0704","041F1F000000"
6100 RETURN
