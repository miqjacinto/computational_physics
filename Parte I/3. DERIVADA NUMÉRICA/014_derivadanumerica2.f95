program derivadanumerica
    implicit none
    DOUBLE PRECISION :: f0, f1, f2, df_num1, df_num2, df, x, h
    x = 2.0d0
    h = 0.005d0
    f2 = dlog(x+2.0d0*h)
    f1 = dlog(x+h)
    f0 = dlog(x)

    df_num1 = 0.5d0 * (-3.0d0*f0 + 4.0d0 * f1 - f2) / h

    f2 = dlog(x - 2.0*h)
    f1 = dlog(x-h)
    f0 = dlog(x)
    df_num2 = 0.5d0 * (3.0d0*f0 - 4.0d0 * f1 + f2) / h

    df = 1.0d0 / x
    
    write(*,*) "A derivada numérica avançada de segunda ordem é: ",df_num1,"e o erro&
    & em relação a derivada exata é de: ",abs((df_num1-df)/df),"%."
    write(*,*) "A derivada numérica para trás de segunda ordem é: ",df_num2,"e o erro&
    & em relação a derivada exata é de: ",abs((df_num2-df)/df),"%."
end program derivadanumerica