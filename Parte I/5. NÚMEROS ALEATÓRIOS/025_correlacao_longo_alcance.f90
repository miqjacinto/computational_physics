program correlacao_longo_alcance
    use nrtype
    use nr, ONLY: ran1
    use ran_state, ONLY: ran_seed
    implicit none
    INTEGER, parameter :: N = 10000, semente = 230199
    REAL, parameter :: real_N = real(N), alpha = 3.
    REAL :: epsilon(N), phi(N), real_i, real_j, r1, r2, m1 = 0., m2 = 0.
    INTEGER :: i, j

    OPEN( unit = 5, file = "025_correlacao_longo_alcance.dat")

    CALL ran_seed( semente )

    DO i = 1, N
        CALL ran1(phi(i))
        phi(i) = 2.*PI*phi(i)
    END DO

    DO i = 1, N
        real_i = real(i)
        epsilon(i) = 0.
        DO j = 1, (N/2)
             real_j = real(j)
             r1 = real_j**(alpha*0.5)
             r1 = 1./r1
             r2 = cos(2.*PI*real_i*real_j/real_N + phi(j))
             epsilon(i) = epsilon(i) + r1*r2
        END DO
        m1 = m1 + epsilon(i)
        m2 = m2 + epsilon(i)**2.
    END DO
    m1 = m1/real_N
    m2 = m2/real_N

    DO i = 1, N 
        epsilon(i) = ( epsilon(i) - m1 ) / sqrt( m2 - m1*m1 )
        write(5,*) i, epsilon(i)
    END DO

    CLOSE(5)

end program correlacao_longo_alcance