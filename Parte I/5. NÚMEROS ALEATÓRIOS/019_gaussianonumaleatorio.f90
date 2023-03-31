program gaussianonumaleatorio
    use nrtype
    use nr, ONLY: ran1
    use ran_state, ONLY: ran_seed
    implicit none
    INTEGER, parameter :: semente = 230199, N = 200000
    INTEGER :: i
    REAL :: r, r2, r1

    OPEN( unit = 6, file = "019_gaussianonumaleatorio.dat")

    CALL ran_seed( semente )

    DO i = 1, N
        CALL ran1(r1)
        CALL ran1(r2)
        r1 = sqrt(-2.* log(r1) )
        r2 = cos(2.*PI*r2)
        r = r1*r2
        write(6,*) i, r
    END DO

end program gaussianonumaleatorio