program histogramanormalizado
    use nr, ONLY: ran1
    use ran_state, ONLY: ran_seed
    implicit none
    INTEGER, parameter :: semente = 230199
    INTEGER :: i
    REAL :: r0, r1

    OPEN( unit = 6, file = "023_histogramanormalizado.dat")

    CALL ran_seed( semente )

    DO i = 1, 10000
        CALL ran1(r0)
        CALL ran1(r1)
        write(6,*) i, r0, r1*r0
    END DO

end program histogramanormalizado