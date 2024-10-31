.section .data
list: .long 10, 20, 30, 40, 50, 60, 70, 80, 90, 100  # Definimos una lista de enteros
length: .long 10                                    # Definimos el tamaño de la lista como .long para que sea coherente

.section .text
.globl main

main:
    xor %eax, %eax          # %eax se usará para la suma, lo inicializamos a 0
    movl length, %ecx      # Cargamos la longitud de la lista en %ecx (debe ser .long)
    lea list, %rdi         # Cargamos la dirección de la lista en %rdi

suma_loop:
    addl (%rdi), %eax      # Sumar el valor actual de la lista a %eax
    addq $4, %rdi          # Mover al siguiente elemento de la lista (4 bytes por entero)
    loop suma_loop         # Decrementa %ecx y repite si %ecx no es cero

    # La suma total ahora está en %eax, así que finalizamos el programa
    movl %eax, %edi        # Mover la suma a %edi para usarla como código de salida
    movl $60, %eax         # Código de syscall para exit
    syscall                 # Llamar al sistema para salir
