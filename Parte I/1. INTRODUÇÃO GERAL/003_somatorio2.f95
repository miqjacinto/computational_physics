program somatorio
    implicit none
    INTEGER :: i, S

    S = 0
    DO i = 1,4
        S = S + i
    END DO

    write(*,*) S

end program somatorio