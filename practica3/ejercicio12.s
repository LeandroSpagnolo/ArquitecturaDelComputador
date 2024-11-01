.section .data
list: .long 10, 20, 30, 40, 50, 60, 70, 80, 90, 100  # Lista a sumar
length: .long 10                                     # Tamaño de la lista

.section .text
.globl main

main:
    xor %eax, %eax          # %eax lo inicializamos en 0, para hacer la suma
    movl length, %ecx      # Cargamos el largo de la lista
    lea list, %rdi         # Cargamos la dirección de la lista en %rdi
    call suma_loop
    ret

suma_loop:
    addl (%rdi), %eax      # Sumar el valor actual a la lista
    addq $4, %rdi          # Se mueve al siguiente elemento de la lista (4 bytes por entero)
    loop suma_loop         # Decrementa %ecx y repite si %ecx no es cero

    # La suma total ahora está en %eax 
    movl %eax, %edi        # Mover la suma a %edi para usarla como código de salida
    ret
