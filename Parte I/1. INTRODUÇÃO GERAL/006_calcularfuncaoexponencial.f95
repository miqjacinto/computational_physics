program funcaoexponencial
    implicit none
    DOUBLE PRECISION :: y, t, dt, C, a
    INTEGER :: N, i
    CHARACTER(len = 100) :: filename

    filename = "006_funcaoexp.dat"
    open(3, file=filename)

    C = 1
    a = 0.5
    ! b = 0.2
    t = 0.0
    dt = 0.1
    N = INT( (20-0)/dt + 1 )
    
    DO i = 1,N
        y = C * ( 1.0 - dexp(-a*t) )
        ! y = a*(t**2) + b*t + c
        WRITE(unit = 3, fmt = *) t, y
        t = t + dt
    END DO

    close(3)

end program funcaoexponencial