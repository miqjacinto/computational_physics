program mapalogistico
    implicit none
    DOUBLE PRECISION :: x2, x1, x0, r, dr, ri, rf, xi, xf, dx
    INTEGER :: n, num_r, num_x, j, i, n_max
    CHARACTER(len = 100) :: filename

    filename = "008_mapalogistico.dat"
    open(7, file=filename)

    ri = 2.5
    rf = 3.99
    dr = 0.001
    num_r = INT((rf - ri)/dr + 1)

    xi = 0.01
    xf = 0.99
    dx = 0.02
    num_x = INT((xf - xi)/dx + 1)  

    n_max = 100000
    r = ri
    DO i = 1, num_r
        x0 = xi
        DO j = 1, num_x 
            x1 = x0
            DO n = 1, n_max
                x2 = r * x1 * ( 1. - x1 )
                x1 = x2
            END DO
            write(unit = 7, fmt = *) r, x1
            x0 = x0 + dx
        END DO
        r = r + dr
    END DO

    close(7)

end program mapalogistico