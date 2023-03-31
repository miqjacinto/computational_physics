program derivadatabela
    implicit none
    integer, parameter :: N = 200
    REAL :: x(N), y(N), df(N-2), h
    INTEGER :: i
    CHARACTER(len = 100) :: filein, fileout

    filein = "015_tabeladados.dat"
    fileout = "015_derivadatabela.dat"
    open(5, file=filein)
    open(6, file=fileout)

    DO i = 1,N
        read(5,*) x(i), y(i)
    END DO

    h = x(2) - x(1)
    DO i = 2,(N-1)
        df = 0.5 * ( y(i+1) - y(i-1) ) / h
        write(6,*) x(i), df
    END DO

    close(5)
    close(6)
end program derivadatabela