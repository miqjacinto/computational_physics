program sol_eqgrau2
    implicit none
    REAL :: x, y, a, b, c, delta, xm, xma, r1, r2, dx
    INTEGER :: i, N
    CHARACTER(len = 100) :: filename

    filename = "009_sol_eqgrau2.dat"
    open(7, file=filename)

    dx = 0.01

    ! write(*,*) "Insira a, b e c reais para a equação ax² + bx + c = 0."
    ! read(*,*) a, b, c
    a = 1.
    b = -3.
    c = 2.

    delta = b**2. - 4.*a*c
    write(*,*) "O discriminante é: ",delta
    
    IF (delta .lt. 0.0) THEN
        write(*,*) "A equação não possui solução real."
    ELSE 
        delta = sqrt(delta)
        r1 = (-b + delta)/2.*a
        r2 = (-b - delta)/2.*a

        write(*,*) "As raízes são: ", r1,"e ", r2,"."

        IF ( r1 .lt. r2 ) THEN
            xm = r1 - 1.
            xma = r2 + 1.
        ELSE
            xm = r2 - 1.
            xma = r1 + 1.
        END IF

        N = INT((xma - xm)/dx + 1)
        x = xm

        DO i = 1,N
            y = a*(x**2) + b*x + c
            write(unit = 7, fmt = *) x, y
            x = x + dx
        END DO
    END IF

    close(7)

end program sol_eqgrau2