      SUBROUTINE DTBODY (S, T, U, SS, PM, P)
      DIMENSION S(6),SS(6),PM(6),P(6,6)
      DIMENSION C(6),A0(3),AT(3)                                         0000006
      DIMENSION E(4,4),ZT(4),V(4),H(8),Q(8)                              0000007
       DOUBLE PRECISION DSQRT, C, A0, AT, E, ZT, V, H, Q
       DOUBLE PRECISION R02, D, V2, R0, OR0, R, D2, A, PS, PS2, EP, DE,
     1 C0, S1, S2, S3, FM1, F, G, PSP, PSQ, R3, RO3, FD, GDM1, GD, Z,
     2 FM1QR0, GDM1QR, FDS1, FDS2,OR
