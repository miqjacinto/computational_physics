program mediacurva
    implicit none
    REAL :: r1, r2, r3, u, du, ui, uf
    REAL :: x(0:100000), y(0:100000)
    INTEGER :: i, j, cont, Nu
    CHARACTER(len = 100) :: file, fileout

    file = "010_mediacurva.dat"
    fileout = "010_mediacurvaout.dat"
    open(5, file=file)
    open(6, file=fileout)

    cont = 0
    i = 0

    DO WHILE (i .ne. -1)
        cont = cont + 1
        read(5,*,iostat=i) x(cont),y(cont)
    END DO

    ui = - 5
    uf = 5
    du = 0.01
    Nu = Int((uf-ui)/du + 1)
    u = ui
    
    DO j = 1, Nu

        r1 = 0.
        r2 = 0.
        r3 = 0.

        DO i = 1, cont
            IF ( abs(u - x(i)) .lt. du ) THEN
                r1 = r1 + 1.
                r2 = r2 + y(i)
                r3 = r3 + log(y(i))
            END IF
        END DO

        IF ( r1 .gt. 0.0 ) THEN
                write(6,*) u, r2/r1, exp(r3/r1)
        END IF

        u = u + du
    END DO 


    close(5)
    close(6)

end program mediacurva