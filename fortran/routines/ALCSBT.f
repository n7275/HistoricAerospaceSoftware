      SUBROUTINE ALCSBT(XBETA,OVERA,F)
C              THIS ROUTINE TAKES BETA AND THE RECIPROCAL OF THE SEMI-
C              MAJOR AXIS AND COMPUTES THE G SERIES (POWERS OF BETA
C              TIMES THE H SERIES OF HERRICKS PARAMETER).
      DIMENSION F(4)
      DOUBLE PRECISION THETA2, F, C, TH2, TWOPI2, ONE, THETA, DSQRT, TH,FCOM0040
     1 TWOPI
      DOUBLE PRECISION XBETA,OVERA,BETA2,BETA
      COMMON/BTACON/C(100)
      EQUIVALENCE ( TH2, L)
      DATA  ONE, LA, LB / 1.0D0, 0000100000000, 01771/                  FCOM0080
      DATA TWOPI,TWOPI2 / 6.2831853071795865D0, 39.478417604357434D01 / FCOM0090
      ASSIGN 200 TO LITTLE                                              FCOM0650
      BETA = XBETA
      BETA2 = BETA * BETA
      THETA2 = BETA2 * OVERA
      TH2 = THETA2                                                      FCOM0660
      IF ( TH2 ) 5, 10, 10                                              FCOM0670
    5 IF ( TWOPI2 + TH2 ) 6, 10, 10                                     FCOM0680
    6 ASSIGN 100 TO LITTLE                                              FCOM0690
      THETA = DSQRT ( - THETA2 )                                        FCOM0700
      TH = DMOD ( THETA, TWOPI )                                        FCOM0710
      IF ( TH .EQ. 0.0D0 ) TH = TWOPI                                   FCOM0720
      TH2 = - TH * TH                                                   FCOM0730
   10 MGO = IABS(L) / LA - LB                                           FCOM0740
      IF ( MGO .LT. 1 ) MGO = 1                                         FCOM0750
      IF ( MGO .GT. 18 ) MGO = 18                                       FCOM0760
      DO 30 M = 1, 2                                                    FCOM0770
      F(2) = 0.                                                         FCOM0780
      GO TO (29,28,27,26,25,24,23,22,21,20,19,18,17,16,15,14,13,12),MGO FCOM0790
   12 F(2) =((((F(2)+ONE)*TH2*C(M)+ONE)*TH2*C(M+2)+ONE)*TH2*C(M+4)+ONE)*FCOM0800
     1 TH2*C(M+6)                                                       FCOM0810
   13 F(2) = ((((((((F(2)+ONE)*TH2*C(M+8)+ONE)*TH2*C(M+10)+ONE)*TH2*    FCOM0820
     1 C(M+12)+ONE)*TH2*C(M+14)+ONE)*TH2*C(M+16)+ONE)*TH2*C(M+18)+ONE)* FCOM0830
     2 TH2 * C(M+20) + ONE ) * TH2 * C(M+22)                            FCOM0840
   14 F(2) = ((((((((F(2)+ONE)*TH2*C(M+24)+ONE)*TH2*C(M+26)+ONE)*TH2*   FCOM0850
     1 C(M+28)+ONE)*TH2*C(M+30)+ONE)*TH2*C(M+32)+ONE)*TH2*C(M+34)+ONE)* FCOM0860
     2 TH2 * C(M+36) + ONE ) * TH2 * C(M+38)                            FCOM0870
   15 F(2) =(((((F(2)+ONE)*TH2*C(M+40)+ONE)*TH2*C(M+42)+ONE)*TH2*C(M+44)FCOM0880
     1 + ONE ) * TH2 * C(M+46) + ONE ) * TH2 * C(M+48 )                 FCOM0890
   16 F(2) = ((((F(2)+ONE)*TH2*C(M+50)+ONE)*TH2*C(M+52)+ONE)*TH2*C(M+54)FCOM0900
     1 + ONE ) * TH2 * C(M+56)                                          FCOM0910
   17 F(2) = (((F(2)+ONE)*TH2*C(M+58)+ONE)*TH2*C(M+60)+ONE)*TH2*C(M+62) FCOM0920
   18 F(2) = (((F(2)+ONE)*TH2*C(M+64)+ONE)*TH2*C(M+66)+ONE)*TH2*C(M+68) FCOM0930
   19 F(2) =(( F(2) + ONE ) * TH2 * C(M+70) + ONE) * TH2 * C(M+72)      FCOM0940
   20 F(2) =(( F(2) + ONE ) * TH2 * C(M+74) + ONE) * TH2 * C(M+76)      FCOM0950
   21 F(2) = ( F(2) + ONE ) * TH2 * C(M+78)                             FCOM0960
   22 F(2) = ( F(2) + ONE ) * TH2 * C(M+80)                             FCOM0970
   23 F(2) = ( F(2) + ONE ) * TH2 * C(M+82)                             FCOM0980
   24 F(2) = ( F(2) + ONE ) * TH2 * C(M+84)                             FCOM0990
   25 CONTINUE                                                          FCOM1000
   26 F(2) = ( F(2) + ONE ) * TH2 * C(M+86)                             FCOM1010
   27 CONTINUE                                                          FCOM1020
   28 F(2) = ( F(2) + ONE ) * TH2 * C(M+88)                             FCOM1030
   29 F(M) = (((((F(2)+ONE)*TH2*C(M+90)+ONE)*TH2*C(M+92)+ONE)*TH2*      FCOM1040
     1 C(M+94)+ONE)*TH2*C(M+96)+ONE)*C(M+98)                            FCOM1050
   30 F(M+2) = F(M) * TH2 + ONE                                         FCOM1060
      GO TO LITTLE, (100,200)
  100 F(1) = (F(1)*TH*TH2 + TH - THETA)/THETA/THETA2                    FCOM1080
      F(2) = F(2)*TH2 / THETA2                                          FCOM1090
      F(3) = F(3)*TH / THETA
  200 F(1) = F(1) * BETA2 * BETA
      F(2) = F(2) * BETA2
      F(3) = F(3) * BETA
      RETURN                                                            FCOM1110
      END                                                               FCOM1120
