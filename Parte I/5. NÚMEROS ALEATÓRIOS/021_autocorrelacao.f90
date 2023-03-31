program autocorrelacao
    use nrtype
    use nr, ONLY: ran1
    use ran_state, ONLY: ran_seed
    implicit none
    INTEGER, parameter :: semente = 105, NUM = 200000, n = 200
    INTEGER :: i, j
    REAL :: x(NUM), r1, r2, meanx, meanxx

    OPEN( unit = 6, file = "021_autocorrelacao.dat")

    CALL ran_seed( semente )

    meanx = 0.0
    DO i = 1, NUM
        CALL ran1(r1)
        CALL ran1(r2)
        r1 = sqrt(-2.*log(r1))
        r2 = cos(2.*PI*r2)
        x(i) = r1*r2
        meanx = x(i) + meanx
    END DO
    meanx = meanx / real(NUM)
    meanx = meanx*meanx

    DO i = 1, NUM
        meanxx = 0.0
        DO j = 1, (NUM-i+1)
            meanxx = meanxx + x(j)*x(j+i-1)
        END DO
        meanxx = meanxx / real(NUM - i + 1)
        write(6,*) i, (meanxx - meanx)
    END DO

    CLOSE(6)

end program autocorrelacao