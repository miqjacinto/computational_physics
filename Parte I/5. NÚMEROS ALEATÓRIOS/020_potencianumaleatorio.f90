program potencianumaleatorio
    use nrtype
    use nr, ONLY: ran1
    use ran_state, ONLY: ran_seed
    implicit none
    REAL, parameter :: x0 = 0.5, x1 = 1.5
    INTEGER, parameter :: semente = 230199, NUM = 200000, n = -3
    INTEGER :: i
    REAL :: x, np1

    np1 = real(n) + 1.0

    OPEN( unit = 6, file = "020_potencianumaleatorio.dat")

    CALL ran_seed( semente )

    DO i = 1, NUM
        CALL ran1(x)
        x = (x1**np1-x0**np1)*x + x0**np1
        x = x**(1/np1)
        write(6,*) i, x
    END DO

end program potencianumaleatorio