program derivadanumerica
    implicit none
    DOUBLE PRECISION :: f0, f1, df_num1, df_num2, df, x, h
    x = 2.0d0
    h = 1.0d-1
    f1 = dlog(x+h)
    f0 = dlog(x-h)

    df_num1 = 5.0d-1*(f1-f0)/h

    f0 = dlog(x)
    df_num2 = (f1 - f0)/h

    df = 1.0d0 / x
    
    write(*,*) "A derivada numérica de primeira ordem é: ",df_num2,"e o erro&
    & em relação a derivada exata é de: ",abs((df_num2-df)/df),"%."
    write(*,*) "A derivada numérica centrada de segunda ordem é: ",df_num1,"e o erro&
    & em relação a derivada exata é de: ",abs((df_num1-df)/df),"%."
end program derivadanumerica