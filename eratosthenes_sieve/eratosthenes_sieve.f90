PROGRAM CRIVO_DE_ERATOSTENES
! Dado um numero limite, o programa irah imprimir os numeros primos de
!  2 ateh ele utilizando o Crivo de Eratostenes.

   IMPLICIT none
   LOGICAL, allocatable :: eh_primo(:)
   INTEGER :: numero_limite, numero, situacao_da_alocacao, indice


! Leia o numero limite.
   PRINT *, "Bem vindo ao CRIVO DE ERATOSTENES."
   PRINT *, "Digite um numero limite."
   READ *, numero_limite

! Verifique o numero limite eh valido. Nao faz sentido aplicar o crivo
!                                             a numeros menores que 2.

   IF( numero_limite < 2) THEN
! Se for invalido, imprima um aviso e termine o programa.
      PRINT *, "O numero limite nao eh valido. Ele deve ser maior&
                                                   & ou igual a dois."

! Se for valido, aloque espaco suficiente para a lista de numeros
!                                               de 2 ao numero limite.
   ELSE
! Aloque espaco para um array logico cujo tamanho eh numero_limite - 1
!  Cada posicao do array representarah um numero da lista de 2 ao
!                                                       numero_limite.
      ALLOCATE ( eh_primo(2:numero_limite), &
                                          stat = situacao_da_alocacao)

! Verifique se o espaco foi alocado.
      IF ( situacao_da_alocacao == 0) THEN

! 0 eh afirmativo, entao eh possivel aplicar o crivo a lista.
! Primeiro, preencha a lista com o valor logico .true. (1) para
!  todos os numeros da lista. O valor .false. significarah que
!  o numero nao eh primo enquanto o .true. significarah que ele eh.
         eh_primo = .TRUE.

! Para descobrir quais numeros sao primos, percorra a lista a partir
! do primeiro item da lista. Como precisamos eliminar apenas os
! numeros que sao multiplos de outros, percorra ateh o maior numero
! cujo quadrado mais se aproxima do numero_limite.

         DO numero = 2, int(sqrt(real(numero_limite)))

! Se o valor do array associado ao numero for .true., o numero eh
!  primo. Atribua o valor .false. aos seus multiplos, comecando do
!  seu quadrado, jah que o crivo irah eliminar seus multiplos
!  menores (com excecao do 2).
            IF ( eh_primo(numero) ) THEN
               DO indice = numero**2, numero_limite, numero
                  eh_primo(indice) = .FALSE.
               END DO
            END IF
         END DO

! Imprima os numeros primos.
         DO numero = 2, numero_limite
            IF ( eh_primo(numero) )  PRINT *, numero
         END DO

! O espaco nao foi alocado, entao avise ao usuario.
      ELSE
         PRINT *, "Nao foi possivel alocar o espaco na memoria."
      END IF
   END IF

END PROGRAM CRIVO_DE_ERATOSTENES
