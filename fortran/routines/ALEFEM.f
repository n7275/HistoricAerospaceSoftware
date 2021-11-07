      SUBROUTINE ALEFEM (KEPOCH,TT,IWANT,RS,RB,PNL,IERROR)              JPLE00
C                                                                       JPLE0030
C  THIS SUBROUTINE IS DESIGNED TO PROVIDE EPHEMERIS DATA FOR THE SUN,   JELE0040
C  MOON AND EARTH AND A MATRIX OF PRECESSION - NUTATION - LIBRATION     JPLE0050
C  FOR SELENOGRAPHIC COORDINATE TRANSFORMATIONS. THE COORDINATE SYSTEM  JEPE0060
C  FOR ALL DATA IS DEFINED BY THE MEAN EQUATOR AND THE ECLIPTIC AT THE  JELE0070
C  NEAREST BEGINNING OF A BESSELIAN YEAR, THE X AXIS TO THE VERNAL      JPLE0080
C  EQUINOX, THE Z AXIS ALONG THE MEAN POLE, AND THE Y AXIS DESIGNED TO  JPLE0090
C  COMPLETE A RIGHT HAND COORDINATE SYSTEM                              JPLE0100
C                                                                       JPLE0110
C    INPUT...    (NON-INTEGER ARGUMENTS ARE DOUBLE PRECISION)           JPLE0120
C                                                                       JPLE0130
C       KEPOCH - ON INITAL ENTRY THIS ARGUMENT SHOULD CONTAIN THE       JPLE0140
C                DESIRED BESSLIAN YEAR FOR REFERENCE EPOCH. IT SHOULD   JPLE0150
C                BE AN INTEGER IN THE COLSED INTERVAL FROM 1951 THROUGH JPLE0160
C                1999.  THE BASE TIME(DESCRIBED BY THE FIRST 5 ARGUMENTSJPLE0170
C                OF LABELED COMMON INPUT) MUST FALL IN THE 6 CALENDAR   JPLE0180
C                MONTHS PRIOR TO OR AFTER THIS BEDDELIAN YEARS START.   JPLE0190
C             ** ON SYBSEQUENT ENTRIES, IF REFERENCE EPOCH AND BASE TIMEJPLE0200
C                REMAIN CONSTANT, INPUT IEPOCH = 0 TO BY-LASS REDUNDANT JPLE0210
C                INITIALIZATION.                                        JPLE0220
C                                                                       JPLE0230
C       IT     - TIME (HOURS) RELATIVE TO BASE TIME DESCRIBED IN COMMON,JPLE0240
C       IWANT  - INTEGER CONTROL SWITCH, DETERMINES OUTPUT FORMAT       JPLE0250
C                                                                       JPLE0260
C    OUTPUT... IF IWANT                                                 JPLE0270
C                   =1         =2         =3         =4         =5      JPLE0280
C                                                                       JPLE0290
C       RS   -   POS. ONLY  POS. ONLY   NOT        NOT        NOT       JPLE0300
C                SUN WRT    SUN WRT      USED       USED       USED     JPLE0310
C                EARTH      MOON                                        JPLE0320
C               (12 CELLS) (12 CELLS)                                   JPLE0330
C                                                                       JPLE0340
C       RB   -   POS + VEL  POS + VEL  POS + VEL   POS + VEL  NOT       JPLE0350
C                MOON WRT   EARTH WRT  MOON WRT    MOON WRT    USED     JPLE0360
C                EARTH      MOON       EARTH       EARTH                JPLE0370
C                (24 CELLS) (24 CELLS) (24 CELLS)  (24 CELLS)           JPLE0380
C                                                                       JPLE0390
C       PNL  -   NOT        LIBRATION  LIBRATION    NOT      LIBRATION  JPLE0400
C                 USED      MATRIX     MATRIX        USED    MATRIX     JPLE0410
C                          (18 CELLS) (18 CELLS)            (18 CELLS)  JPLE0420
C                                                                       JPLE0430
C       IERROR - INTEGER VALIDITY INDICATOR. IERR=0 IF ALL OK. NON-ZERO JPLE0440
C              VALUE REFERENCE ERROR CONDITIONS.   SEE COMMENTS IN CODE.JPLE0450
C                                                                       JPLE0460
C    DATA  TAOE (COPY OF NO.   ) MUST BE HUNG ON FORTRAN IV UNIT 11     JPLE0470
C                                            (7040/7094 LOGICAL NO.  15)JPLE0480
C                                                                       JPLE0490
      COMMON /KDATE/ IYEAR,DAY,HOUR
      DOUBLE PRECISION TDP,BASET,EDT,TTAPE,TNORM,TT,RS,RB,PNL,BUFF      JPLE0500
     1  TREC,T,DY,TAB,DSUN,DLUN,ASUN,ALUN,DSQRT                         JPLE0510
      DIMENSION BUFF(276),TAB(1248),DSUN(11,3),DLUN(81,15),ASUN(3,6)    JPLE0520
     1 DY(5),ALUN(17,15),RS(1),RB(1),PNL(1),LB(5),JB(5),JN(5),T(5),     JPLE0530
     2 IBUF(552)                                                        JPLE0540
      EQUIVALENCE            (TAB (   1),DSUN ) , ( TA (  34),DLUN )    JPLE0550
     1, (BUFF    4),ASUN ) , (BUFF(  22),ALUN ) , (BUFF(   1),IBUF )    JPLE0560
      LOGICAL SETUP                                                     JPLE0570
      DATA (KB(I),I=1.5)/4*33,519/(JB(I),I=1,5)/4*4,10/,(JN(I),I=1,5)   JPLE0580
     1 /9,18,18,9,18/,/JEPOCH,NORG,EDT.1951,0,9.8888888888888889D-3/    JPLE0590
      IERR = 0                                                          JPLE0600
      IEPOCH = KEPOCH                                                   JPLE0610
      IF (IEPOCH) 5,65,5                                                JPLE0620
    5 IF (IEPOCH.GT.1950 .AND. IEPOCH.LT.2000)  GO TO 15                JPLE0630
      IERR = 1                                                          JPLE0640
C              EPOCH NOT WITHIN LIMITS                                  JPLE0650
      GO TO 255                                                         JPLE0660
   15 BASE T = 24.0D0*DAY + HOUR + EDT                                  JPLE0670
      TDP = 8760.0D0                                                    JPLE0680
      IF (MOD(IYEAR-1,4) .EQ. 0) TDP = 8784.0D0                         JPLE0690
      IF (IYEAR - IEPOCH) 25,20,25                                      JPLE0700
   20 TREC = BASE T + TDP                                               JPLE0710
      GO TO 35                                                          JPLE0720
   25 TREC = BASE T                                                     JPLE0730
      IF ( IYEAR+1-IEPOCH) 30,35,30                                     JPLE0740
   30 IERR = 2                                                          JPLE0750
C               EPOCH AND BASE YEAR INCONSISTENT                        JPLE0760
      GO TO 255                                                         JPLE0770
   35 ISKIP = IEPOCH - JEPOCH                                           JPLE0780
      IF (ISKIP) 50,45,50                                               JPLE0790
   45 IF (NORG) 65,55,65                                                JPLE0800
C              SKIP TO DESIRED FILE                                     JPLE0810
   50 CALL FSBSFL (11,ISKIP,L)                                          
      IF (L) 52,55,52                                                   JPLE0830
   52 IERR = 3                                                          JPLE0840
C              READ REDUNDANCY WHILE SKIPPING FILES                     JPLE0850
   53 NORG = 0                                                          JPLE0860
      JEPOCH = 1951                                                     JPLE0870
      REWIND 11                                                         JPLE0880
      GO TO 255                                                         JPLE0890
   55 READ (11) L,JEPOCH,BTIME,L                                        JPLE0900
      SETUP = .FALSE.                                                   JPLE0910
      NORG = -4                                                         JPLE0920
      IF (IEPOCH - JEPOCH) 60,65,60                                     JPLE0930
   60 IERR = 4                                                          JPLE0940
C              FAILED TO GET THE RIGHT FILE                             JPLE0950
      GO TO 53                                                          JPLE0960
   65 NREC = (TT+TREC-BTIME)/192.0D0 + 1.0D0                            JPLE0970
      IF (NREC.GT.1 .AND. NREC.LT.55) GO TO 75                          JPLE0980
      IERR = 5                                                          JPLE0990
C              TIME OF YEAR BEHIND LIMITS FOR THIS EPOCH                JPLE1000
      GO TO 255                                                         JPLE1010
   75 IF (SETUP .AND. WREC.GT.NORG .AND. NREC.LT.NORG+4) TO GO 155      JPLE1020
C              NEED TO GET A NEW TABLE INTO CORE                        JPLE1030
      SETUP = .TRUE.                                                    JPLE1040
      I = NREC - 2                                                      JPLE1050
      IF (I) 85,85,90                                                   JPLE1060
   85 I = 1                                                             JPLE1070 
      GO TO 100                                                         JPLE1080
   90 IF (I.GT.52) I = 51                                               JPLE1090
  100 ISKIP = I - NORG - 5                                              JPLE1100
      IF (ISKIP) 115,125,105                                            JPLE1110
  105 DO 110 J=1,ISKIP                                                  JPLE1120
C              SPACE UP TO THE RIGHT SET OF RECORDS                     JPLE1130
  110 READ (11)                                                         JPLE1140
      GO TO 125                                                         JPLE1150
  115 ISKIP = -ISKIP                                                    JPLE1160
      DO 120 J=1,ISKIP                                                  JPLE1170
C              BACK UP TO THE RIGHT SET OF RECORDS                      JPLE1180
  120 BACKSPACE 11                                                      JPLE1190
  125 DO 150 I=1,5                                                      JPLE1200
C              NOW BUILD THE TABLE                                      JPLE1210
      READ (11) BUFF                                                    JPLE1220
      IF (II-1) 135,127,129                                             JPLE1230
  127 NORG = IBUF(2)                                                    JPLE1240
      TTAPE = BUFF(3)                                                   JPLE1250
      IF (NORG-1) 129,130,129                                           JPLE1260
  129 IERR = 6                                                          JPLE1270
C              FAILED TO GET THE DESIRED RECORD                         JPLE1280
      GO TO 53                                                          JPLE1290
  130 JJ = 0                                                            JPLE1300
      KK = 0                                                            JPLE1310
      IF (IBUF(4) .EQ. IYEAR+1) TTAPE = TTAPE + TUP                     JPLE1320
  135 DO 140 J = 1,3                                                    JPLE1340
      L = J + JJ                                                        JPLE1350
      DO 140 K=1,3                                                      JPLE1380
  140 DSUN(L,K) = ASUN(J,K)                                             JPLE1370
      JJ = JJ + 2                                                       JPLE1380
      DO 145 J = JJ + 2                                                 JPLE1390
      L = J + KK                                                        JPLE1400
      DO 145 K = 1,15                                                   JPLE1410
  145 DLUN(L,K) = ALUN(J,K)                                             JPLE1420
  150 KK = KK + 16                                                      JPLE1430
C              NORMALIZE TIME TO STARTING TINE OF CORE TABLE            JPLE1440
  155 TNORM = BASE T + TT- TTAPE                                        JPLE1450
      IF (TNORM .LT. 0.0D0)  TNORM = TNORM + TDP                        JPLE1460
      KK = IWANT                                                        JPLE1470
      IF (KK - 3) 160,165,165                                           JPLE1480
C              SETUP TO INTERPOLATE FOR SOLAR POSITION                
  160 T(1) = TNORM/96.0D0                                               JPLE1510
      KBASE = 0                                                         JPLE1520
      JBASE = 3                                                         JPLE1530
      KSTEP = 11                                                        JPLE1540
      ASSIGN 165 TO ISW                                                 JPLE1550
      GO TO 250                                                         JPLE1560
C              SETUP TO INTERPOLATE FOR MOON VECTORS AND/OR MATRIX      JPLE1570
  165   T(1) = TNORM/12.0D0
      KBASE = KB(KK)                                                    JPLE1590
      JBASE = KB(KK)                                                    JPLE1600
      JNSET = JN(KK)                                                    JPLE1610
      KSTEP = 81                                                        JPLE1620
      ASSIGN 170 TO ISW                                                 JPLE1630
      GO TO 250                                                         JPLE1640
C              STORE OUTPUT VECTORS                                     JPLE1650
  170 GO TO (175,195,185,185,205),KK                                    JPLE1660
  175 DO 180 I=1,3                                                      JPLE1670
  180 RS(I) = BUFF(I)                                                   JPLE1680
  185 DO 190 I=1,3                                                      JPLE1790
      RB(I) = BUFF(I+3)                                                 JPLE1700
  190 RB(I+6) = BUFF(I+6)                                               JPLE1710
      IF(KK - 3) 215,205,215                                            JPLE1720
  195 DO 200 I=1,3                                                      JPLE1730
      RS(I) = BUFF(I) - BUFF(I+3)                                       JPLE1740
      RB(I) = -BUFF(I+3)                                                JPLE1750
  200 RB(I+6) = -BUFF(I+6)                                              JPLE1760
  205 DO 210 I=1,9                                                      JPLE1770
  210 PNL(I) = BUFF(I+9)                                                JPLE1780
      IF(KK - 5) 215,225,225                                            JPLE1790
  205 RB(5) = RB(1)*RB(1) + RB(2)*RB(2) + RB(3)*RB(3)                   JPLE1800
      RB(4) = DSQRT(RB(5))                                              JPLE1810
      RB(6) = RB(4)*RB(5)                                               JPLE1820
      IF (KK .GE. 3) GO TO 255                                          JPLE1860
      RS(5) = RS(1)*RS(1) + RS(2)*RS(2) + RS(3)*RS(3)                   JPLE1870
      RS(4) = DSQRT(RS(5))                                              JPLE1880
      RS(6) = RS(4)*RS(5)                                               JPLE1890
  255 IERROR = IERR                                                     JPLE1900
      RETURN                                                            JPLE1910
C              INTERPOLATION SECTION (5TH ORDER NEWTON FWD. DIF.)       JPLE1920
  250 K = T(1) - 2.0D0                                                  
      T(1) = T(1) - FLOAT(K)
      K = K + KBASE
C              CALCUALTE T COEFFICIENTS                                 JPLE1950
      T(2) = (T(1) - 1.0D0)*T(1)/2.0D0
      T(3) = (T(1) - 2.0D0)*T(2)/2.0D0
      T(4) = (T(1) - 3.0D0)*T(3)/2.0D0
      T(5) = (T(1) - 4.0D0)*T(4)/2.0D0
C              DIFERENCE 3 POINTS ON EITHER SIDE OF IND. VARIABLE       JPLE2010
      DO 255 J=JBASE,JNSET                                              JPLE2020
      DY(1) = TAB(K+2)-TAB(K+1)                                         JPLE2030
      DY(2) = TAB(K+3)-TAB(K+2)-DY(1)                                   JPLE2040
      DY(3) = TAB(K+4)-TAB(K+3)-TAB(K+3)+TAB(k+2)-DY(2)                 JPLE2050
      DY(4) = TAB(K+5)-3.*(TAB(K+4)-TAB(K+3))-TAB(K+2)-DY(3)            JPLE2060
      DY(5) = TAB(K+6)-4.*(TAB(K+5)+TAB(K+3))+6.*TAB(K+4)+TAB(K+2)-DY(4)JPLE2070
C              AND INTERPOLATE IN EACH TABLE                            JPLE2080
      BUFF(J) = TAB(K+1) + T(1)*DY(1) + T(2)*DY(2) + T(3)*DY(3)         JPLE2090
     1                   + T(4)*DY(4) + T(5)*DY(5)                      JPLE2100
  255 K = K + KSTEP                                                     JPLE2110
C              BRANCH BACK                                              JPLE2120
      GO TO ISW,(165,170)                                               JPLE2030
      END                                                               JPLE2140

