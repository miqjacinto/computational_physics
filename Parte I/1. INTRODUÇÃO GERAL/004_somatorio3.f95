program somatorio
    implicit none
    REAL :: a, b, c

    b = 4.
    c = 3.
    a = b*b + c*c
    a = SQRT(a)

    write(*,*) a
end program somatorio