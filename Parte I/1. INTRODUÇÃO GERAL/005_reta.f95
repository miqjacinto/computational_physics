program reta
    implicit none
    INTEGER :: x,y

    open(3, file="005.dat")

    DO x = 0,20,1
         y = x + 1
         write(3,*) x,",",y
    END DO

end program reta