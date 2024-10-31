# include <stdio.h>


int is_one ( long n , int b ) {
    // Desplaza n 'b ' veces hacia la derecha
    return ( n >> b ) & 1;
}

void printbin ( unsigned long n ) {
    // Recorre cada bit y lo muestra
    for ( int i = 31; i >= 0; i--){
        // Muestra un espacio cada 8 bits
        printf (( i %8 == 0) ? " % d " : " % d " , is_one (n , i ));
    }
}


int main () {
    int nums [6] = { -16 , 13 , -1 , -10 , 16 , -31 };
    for ( int i = 0; i < 6; i ++) {
        printbin ( nums [ i ]);
        printf ( "%8d \n " , nums [ i ]);
    }
    return 0;
}
