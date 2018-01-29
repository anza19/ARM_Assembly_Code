			.text
			.global	_start

_start:
			LDR R0, =START		//R0 has the starting address of memory
			LDR R1,	[R0, #4]	//R1 has the size of R1
			ADD R2,	R0, #8		//R2 is the pointer the first element in the list
			MOV R3, #0		//R3 is our sum variable

SUM:		
			LDR R4, [R2]		//load list element into R4
			ADD R3, R3, R4		//add element into sum
			SUBS R1, R1, #1		//decrement pointer
			BEQ END			//when 0, exit
			ADD R2, R2, #4		//update pointer to next address
			B SUM			//go back

END:			B END			//exit condition

START:	.word 0
SIZE:	.word 8
LIST:	.word 0, 1, 2, 3, 4, 5, 6, 7
