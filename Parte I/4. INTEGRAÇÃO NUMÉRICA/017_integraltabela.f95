program integraltabela
    implicit none
    INTEGER, parameter :: N = 200
    REAL, parameter :: a = 0.5
    REAL :: x(N), y(N), S, h
    INTEGER :: i
    CHARACTER(len = 100) :: file

    file = "017_tabeladados.dat"

    open(5, file=file)

    DO i = 1,N
        read(5,*) x(i), y(i)
    END DO

    S = 0
    h = x(2) - x(1)
    DO i = 1,(N-1)
        S = S + 0.5 * h * ( y(i+1) + y(i) ) 
    END DO

    write(*,*) abs(S - (20. + (1./a) * ( exp(-20.*a ) - 1. ) ))
 
    close(5)

end program integraltabela