      SUBROUTINE CROSS(USE1,USE2,C)
      DOUBLE PRECISION A,B,C,USE1,USE2
      DIMENSION A(3),B(3),C(3),USE1(1),USE2(1)
      DO 1 I=1,3
      A(I)=USE1(I)
    1 B(I)=USE2(I)
      C(1)=A(2)*B(3)-A(3)*B(2)
      C(2)=A(3)*B(1)-A(1)*B(3)
      C(3)=A(1)*B(2)-A(2)*B(1)
      RETURN
      END
