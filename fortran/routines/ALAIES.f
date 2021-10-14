      SUBROUTINE ALAIES (PSIB,J,X,THRS)
      DOUBLE PRECISION PSIB, THRS, PSI60, PSIDOT, TWOPI, PDOT, DAS,     DRTA0040
     1 TLHRS, DAYN, PSIBI,DTEMP
      INTEGER YEAR                                                      DRTA0060
      DATA PSI60, PSIDOT, TWOPI / 1.7221863D0, 2.6251617D-01,           DRTA0070
     1 6.2831853071795865D0 /
      TLHRS = THRS                                                      DRTA0090
      YEAR = J                                                          DRTA0100
      IF (YEAR)15,10,15
   15 JEP = YEAR
    5 DAYN = ( JEP - 1960 ) * 365 + ( JEP - 1957) / 4                   DRTA0120
      DAYS = X                                                          DRTA0130
      PDOT = 2.73790926D-03 * TWOPI                                     DRTR0140
      PSIDOT = 0.041780746219166667D0
      IF ( YEAR - JEP ) 7, 6, 7                                         DRTA0160
    6 DTEMP = 0.                                                        DRTA0170
      GO TO 20                                                          DRTA0180
    7 IF ( MOD(YEAR,4) ) 9,8,9                                          DRTA0190
    8 DTEMP = -366.D0                                                   DRTA0200
      GO TO 20                                                          DRTA0210
    9 DTEMP = -365.D0                                                   DRTA0220
   20 PSIBI = DMOD( PDOT*(DAYS+DTEMP) + PSIDOT*TLHRS + PSI60 + DAYN*    DRTA0230
     1 (PDOT -31.D0/473364.D+04*TWOPI +DANN*5.064083D-15), TWOPI)       DRTA0240
      RETURN                                                            DRTA0250
   10 YEAR TLHRS * 4.1666666666666667D-02                               DRTA0260
      DAYN = YEAR                                                       DRTA0270
      TLHRS = TLHRS - DAYN * 24.D0                                      DRTA0280
      PSIB = DMOT( PDOT * DAYN + PSIDOT * TLHRS + PSIBI ,  TWOPI  )     DRTA0290
      RETURN                                                            DRTA0300
      END                                                               DRTA0310
