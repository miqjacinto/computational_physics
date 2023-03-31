program funcaoexpapprox
    implicit none
    DOUBLE PRECISION :: y, x, dx, real_k, factorial
    INTEGER :: N, i, j, k
    CHARACTER(len = 100) :: filename1, filename2

    filename1 = "007_funcaoexp.dat"
    filename2 = "007_funcaoexpapprox.dat"
    open(7, file=filename1)
    open(8, file=filename2)

    x = 0.0
    dx = 0.05
    j = 5
    N = INT( (2-0)/dx + 1 )
    
    DO i = 1,N

        y = 1.0
        factorial = 1.0
        DO k = 1,j
            real_k = DBLE(k)
            factorial = factorial * real_k
            y = y + (x**real_k)/factorial
        END DO

        WRITE(unit = 7, fmt = *) x, dexp(x)
        WRITE(unit = 8, fmt = *) x, y

        x = x + dx
    END DO

    close(7)
    close(8)

end program funcaoexpapprox