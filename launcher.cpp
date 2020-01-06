#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <conio.h>
#include <time.h>
#include <windows.h>

#include "../terminal-graphics/lib_eng/draw.h"

int main(int argc, char *argv[]){
	draw_rect(2,2,40,6,0);
	go_to(18,4);
	change_color(YELLOW);
	printf("ARCADIA");
	change_color(WHITE);
	draw_rect(2,7,40,11,1);
	go_to(5, 8);
	printf("Continua");
	go_to(5, 9);
	printf("Canella dati");
	go_to(5, 10);
	printf("Esci");
	char key = 0;
	int y = 8;
	while (key != K_ENTER){
		go_to(3,y);
		printf("->");
		key = wait_key();
		go_to(3,y);
		printf("  ");
		if (key == K_UP && y>=9){
			y--;
		} else if (key == K_DOWN && y<=9){
			y++;
		}
	
		
	}
}

