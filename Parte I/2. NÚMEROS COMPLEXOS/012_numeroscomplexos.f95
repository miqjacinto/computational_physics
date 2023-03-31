program numeroscomplexos
    implicit none
    integer :: i
    integer, parameter :: N = 10
    double complex :: csum, cvetor(N)

    csum = (0., 0.)
    DO i = 1, N
        cvetor(i) = CMPLX(real(i), real(i))
        ! cvetor(i) = 2.0*CMPLX(real(i), real(i))
        csum = csum + cvetor(i)
        write(*,*) cvetor(i)
        ! write(*,*) Conjg(cvetor(i))
    END DO

    write(*,*) csum


end program numeroscomplexos