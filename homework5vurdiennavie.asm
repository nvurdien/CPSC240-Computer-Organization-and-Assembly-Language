TITLE homework5
;Navie Vurdien
;Due - 11/17/16
;Compiler Used - Visual Studios 2015
;Program Description
;Performs calculations like calculate the actual mpg, max distance, and gallons required for a trip

INCLUDE Irvine32.inc

.data
	;menu screen
	menu BYTE 0dh, 0ah,13,10,"Choose the following options:", 0dh,0ah, 
			  "M - Calculate the actual miles per gallon or MPG", 13, 10,
			  "D - Calculate the max distance you can travel", 13, 10,
			  "G - Calculate the gals required for a trip", 13, 10,
			  "Q - Quit the program", 0dh,0ah,0
	;gallons input
	gals dword ? 
	;miles input
	miles dword ?
	;mpg input 
	mpg dword ?
	;output actual mpg
	MilesPerGallon dword ? 
	;output max distance
	MaxDistanceCanTravel dword ?
	;output required gallons 
	GallonsRequired dword ? 
	;enter gallons prompt
	prompt1 BYTE "Enter the gallons: ", 0
	;enter miles prompt 
	prompt2 BYTE "Enter the miles: ", 0
	;enter mpg prompt 
	prompt3 BYTE "Enter the mpg: ", 0 
	;output prompt actual mpg
	promptfun1 BYTE "The actual MPG is ",0 
	;output prompt max distance
	promptfun2 BYTE "The max distance is ",0 
	;output prompt gallons required
	promptfun3 BYTE "The gallons required are ",0 

.code
main PROC
	;shows the menu
	ShowMenu:
		;shows the menu prompt
		mov edx, OFFSET menu
		call WriteString    
		;reads the char the user inputs
		call ReadChar
		;if user inputs M jumps to actual_MPG function
		cmp     al, 'M'
		je      actual_MPG
		;if user inputs D jumps to Distance function
		cmp     al, 'D'
		je      Distance
		;if user inputs G jumps to Gallons function
		cmp     al, 'G'
		je      Gallons
		;if user inputs Q quits program
		cmp     al, 'Q'
		je      Quit
		;if user inputs another letter jumps to top of ShowMenu function
		jmp ShowMenu
	;calculates the actual mpg
	;user inputs gallons and miles
	actual_MPG:       
		mov edx, OFFSET prompt1
		call WriteString
		call ReadInt
		mov gals, eax
		mov ebx, eax
		mov edx, OFFSET prompt2
		call WriteString
		call ReadInt
		mov miles, eax
		xor edx, edx
		div ebx
		mov edx, OFFSET promptfun1
		call WriteString
		mov MilesPerGallon, eax
		call WriteDec
		jmp     ShowMenu
    ;calculates maximum distance you can travel
	;user inputs gallons and mpg
	Distance:
		mov edx, OFFSET prompt1
		call WriteString
		call ReadInt
		mov gals, eax
		mov ebx, eax
		mov edx, OFFSET prompt3
		call WriteString
		call ReadInt
		mov mpg, eax
		xor edx, edx
		mul ebx
		mov edx, OFFSET promptfun2
		call WriteString
		mov MaxDistanceCanTravel, eax
		call WriteDec
		jmp     ShowMenu  
	;calculates gallons required for a trip
	;user inputs mpg and miles
	Gallons:
		mov edx, OFFSET prompt3
		call WriteString
		call ReadInt
		mov mpg, eax
		mov ebx, eax
		mov edx, OFFSET prompt2
		call WriteString
		call ReadInt
		mov miles, eax
		xor edx, edx
		div ebx
		mov edx, OFFSET promptfun3
		call WriteString
		mov GallonsRequired, eax
		call WriteDec
		jmp ShowMenu
	;quits program
	Quit:
		exit
main ENDP
END main