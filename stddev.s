			.text
		    	.global _start

_start:
			LDR R4, =RESULT 	// R4 points to the memory locaton of result
			LDR R2, [R4, #8]	// Using offset addressing mode, r2 holds size
			ADD R3, R4, #12		// R3 will point to the first element
			LDR R0, [R3] 		// R0 now holds the first element 

LOOP:			SUBS R2, R2, #1		// Decrement the loop counter, i.e reduce size
			BEQ DONE		// end loop if counter has reached, i.e N = 0
			ADD R3, R3, #4		// R3 now points to the next number
			LDR R1, [R3]		// R1 holds the next number
			CMP R0, R1		// Check with the first element
			BGE LOOP		// If no, branch back
			MOV R0, R1		// If yes, replace value in R0	
			B LOOP

DONE:			STR R0, [R4]		//store the result to the memory location

			LDR R6, =RESULT_2	//store address of first memory elemen
			LDR R7,	[R6, #4]	//holds size of the list
			ADD R9,	R6, #8		//R8 points to next memory element
			LDR R4, [R6, #8]	//holds first element

MIN_LOOP:
			SUBS R7, R7, #1		//decrement counter on each pass
			BEQ DONE_2		//if zero, exit
			ADD R9, R9, #4		//point to next element
			LDR R10, [R9]		//load contents into R10
			CMP R4, R10		//check with r4
			BLE MIN_LOOP		//go back
			MOV R4, R10		//replace contents	
			B MIN_LOOP		//go back

DONE_2:			MOV R11, R4		//move smallest value in R11
			SUB R11, R0, R11	//subtract value of MAX and MIN
			LSR R11, R11, #2	//divde by 4
END:			B END			//infinite loop!


RESULT:			.word	0		//memory assigned for result location
RESULT_2:		.word	0		//added memory for min calculation
N:			.word	7		//number of entries in the list
NUMBERS: 		.word 	0, 5, 3, 6  	//the list data
			.word	1, 10, 2

