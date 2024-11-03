.data
a: .word -1
b: .byte 0xaa, 99
c: .float 1.5
str: .asciz "Hola mundo\n"
.text
.global main
main:
leaq a, %rdx
movw $0xffff, %ax                  # ax = 0xffff
movb $0x63, %al                    # al = 0x63
movl $0x486f6c61, %esi             # esi = "aloH"
movl $0x3fc00000, %edi             # edi = 0x3fc00000
movl %esi, (%rdx)
retq

# a)
# Etiqueta  DirMem      ValAlm
# a         0x404004     -1
# b         0x404006     0xaa, 0x63
# c         0x404008     1,5
# str       0x40400c    "Hola mundo\n"


# c)
# Etiqueta  DirMem      ValAlm
# a         0x404004     0x486f6c61 
# b         0x404006     0xaa, 0x63
# c         0x404008     1,5
# str       0x40400c    "Hola mundo\n"

