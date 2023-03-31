program numeroscomplexos
    implicit none
    double precision :: r1, r2, r3, r4
    double complex :: c1, c2, c3

    c1 = (-2,3)
    r1 = real(c1)
    r2 = aimag(c1)
    write(*,*) r1,"+",r2,"i"

    c1 = conjg(c1)
    r1 = real(c1)
    r2 = aimag(c1)
    write(*,*) r1,"+",r2,"i"

    c2 = (1, 2)
    c3 = c1*c2
    r1 = real(c3)
    r2 = aimag(c3)
    r3 = r1*r1 + r2*r2
    r4 = abs(c3)**2
    write(*,*) r3-r4," ",r4

    c3 = exp(c3)
    r1 = real(c3)
    r2 = aimag(c3)
    write(*,*) r1,"+",r2,"i"
        
end program numeroscomplexos