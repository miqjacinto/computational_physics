program caminhadaclassica
    use nrtype
    use nr, ONLY: ran1
    use ran_state, ONLY: ran_seed
    implicit none
    INTEGER, parameter :: n1 = 300, n2 = 40000
    REAL, parameter :: pp = 0.5, xi = -200, xf= 200., dx = 4., real_n2 = real(n2)
    REAL :: r, A(n1,n2), x1, x2, x3, x, acc
    INTEGER :: i, j, k, N
    


    OPEN( unit = 5, file = "022_caminhadaclassica1.dat")
    OPEN( unit = 6, file = "022_caminhadaclassica2.dat")

    DO i = 1, n2
        A(1,i) = 0.
        DO j = 2, n1
            CALL ran1(r)
            IF (r.gt.pp) r = 1
            IF (r.lt.pp) r = -1.
            A(j,i)=A(j-1,i) + r
        END DO
    END DO

    DO i = 2, n1
        x1 = 0.
        x2 = 0.
        x3 = 0.
        DO j = 1, n2
            x1 = x1 + A(i,j)
            x2 = x2 + A(i, j)**2
            x3 = x3 + 1.
        END DO
        x1 = x1/x3
        x2 = x2/x3
        write(5,*) i, sqrt(x2-x1*x1)
    END DO

    N = INT( (xf - xi)/dx + 1. )
    acc = 0.5*dx
    j = n1
    x = xi

    DO i = 1, N
        x2 = 0.
        DO k = 1, n2
            IF(abs(A(j,k)-x).lt.acc) THEN
                x2 = x2 + 1.
            END IF
        END DO
        IF( x2 .gt. 0. ) write(6,*) x, x2/real_n2
        x = x + dx
    END DO
    
    CLOSE(5)
    CLOSE(6)

end program caminhadaclassica