program numerosaleatorios
    use nr, ONLY: ran1
    use ran_state, ONLY: ran_seed
    implicit none
    INTEGER, parameter :: semente = 230199
    INTEGER :: i
    REAL :: r0, r

    OPEN( unit = 6, file = "018_numerosaleatorios.dat")

    CALL ran_seed( semente )

    DO i = 1, 10000
        CALL ran1(r)
        r0 = r - 0.5
        write(6,*) i, r0
    END DO

end program numerosaleatorios