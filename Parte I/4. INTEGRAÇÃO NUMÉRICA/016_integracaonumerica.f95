program integracaonumerica
    implicit none
    INTEGER :: i, N
    DOUBLE PRECISION :: x, I1, I2, I3, I4, r1, r2, r3
    DOUBLE PRECISION, parameter :: xi = 0.0d0, xf = 1.0d0, dx = 5.0d-2

    I1 = 0.0d0
    I2 = 0.0d0
    I3 = 0.0d0

    N = INT( (xf - xi)/dx + 1 )

    DO i = 1,N
        ! formula do retangulo
        r1 = dx*(exp((x+x+dx)*0.5))
        I1 = I1 + r1

        ! metodo do trapezio
        r2 = 0.5d0*(exp(x) + exp(x+dx))*dx
        I2 = I2 + r2

        ! regra de simpson
        r3 = dx*(exp(x) + 4.0d0*exp((x+x+dx)*0.5) + exp(x+dx))/6
        I3 = I3 + r3

        x = x + dx
    END DO

    I4 = exp(1.0d0) - 1.0d0

    write(*,*) abs(I1-I4)," ",abs(I2-I4)," ",abs(I3-I4)

end program integracaonumerica
