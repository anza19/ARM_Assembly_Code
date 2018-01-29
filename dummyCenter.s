				.text
				.global	_start

_start:
				LDR R0,	=RESULT		//load first address in R0
				LDR R1, [R0, #4]	//size of list is in R1
				ADD R2, R0, #8		//R2 is a pointer to the first element in the list
				MOV R3, #0		//R3 is our sum variable

SUM:			
				LDR	R4, [R2]	//first element is loadecd into R4
				ADD R3, R3, R4		//add contents into sum variable
				SUBS R1, R1, #1		//reduce counter
				BEQ AVERAGE		//sum loop is done if R1 == 0
				ADD	R2, R2, #4	//pointer variable is incremented to pointer to next address
				BNE	SUM		//go back to sum

AVERAGE:		
				MOV R5, R3		//R3 has a copy of the sum
				LSR	R5, R5, #3	//divide the number of entries and store in R5 to get average
				LDR R6, =RESULT 	//R6 has the address of the size
				LDR R7, [R6, #8]	//R7 has the size
				ADD R8, R6, #8		//R8 acts as a pointer the fist element in the list

CENTER:			
				LDR R9, [R8]		//R10 has the contents of the first address
				SUB R9, R9, R5		//subtract value of average from entry
				STR R9,	[R8]		//store back into memory
				SUBS R7, R7, #1		//reduce size of our counter variable
				ADD R8, R8, #4		//increment pointer to next element
				BEQ DONE		//go to done if reached end
				B CENTER

DONE:			
				LDR R11, =RESULT	//R11 has the address of the first list
				LDR R12,[R11, #8]	//R12 has value of first centered value, if done correctly, it should be 1

END:				B END			

RESULT:				.word	0		//memory assigned for result location
N:				.word	8		//number of entries in the list
NUMBERS: 			.word 	4, 5, 3, 6  	//the list data
				.word	1, 8, 2, 0

