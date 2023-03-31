program desodemCR
    use nrtype
    use nr, ONLY: ran1
    use ran_state, ONLY: ran_seed
    implicit none
    INTEGER, parameter :: N = 15000, semente = 230199, rmax = 50
    REAL, parameter :: zeta = 16., real_N = real(N)
    REAL :: r1, r2, m1, m2, y(N), x(N)
    CHARACTER(len=120) :: file1, file2
    INTEGER :: i, j

    WRITE (file1,'("024_desordemCR1_N=",I5,"_Z=",F2.1,".dat")') N, zeta
    WRITE (file2,'("024_desordemCR2_N=",I5,"_Z=",F2.1,".dat")') N, zeta

    OPEN( unit = 5, file = file1)
    OPEN( unit = 6, file = file2)

    CALL ran_seed( semente )

    DO i = 1, N
        CALL ran1(y(i))
        y(i) = y(i) - 0.5
    END DO

    m1 = 0.
    m2 = m1
    
    DO i = 1, N
        x(i) = 0.
        DO j = 1, N
            r1 = abs(real(i-j))
            r1 = r1 / zeta
            r1 = exp(-r1)
            x(i) = x(i) + y(j)*r1
        END DO
        
        m1 = m1 + x(i)
        m2 = m2 + x(i)*x(i)
    END DO 

    m1 = m1/real_N
    m2 = m2/real_N

    DO i = 1, N
        x(i) = (x(i) - m1 )/sqrt(m2-m1*m1)
        write(5, *) i, x(i)
    END DO
    
    DO i = 1, rmax
        r1 = 0.
        r2 = 0.
        DO j = 1, (N-i+1)
            r1 = r1 + x(j)*x(j+i-1)
        END DO

        DO j = 1, N
            r2 = r2 + x(j)
        END DO

        r1 = r1 / real(N - i)
        r2 = r2 / real(N)
        write(6, *) real(i), (r1 - r2*r2)
    END DO

    CLOSE(5)
    CLOSE(6)

end program desodemCR