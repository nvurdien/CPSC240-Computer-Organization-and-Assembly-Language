TITLE homework6
;Navie Vurdien
;Due - 11/17/16
;Compiler Used - Visual Studios 2015
;Program Description
;How many times each letter of the alphabet occurs from characters a-z, A-Z, and 0-9
INCLUDE Irvine32.inc
.data
	buffer BYTE 1064 DUP(?)		;sentence buffer
	sentence dword ?			;sentence input
	prompt1 BYTE "Enter the sentence you would like to count: ", 0
	intEnd dword 57				;end of int values
	intIndex dword 48			;index of int values
	upcharIndex dword 65		;index of uppercase letter
	upcharEnd dword 90			;end of uppercase letter
	lowCharIndex dword 97		;index of lowercase letter
	lowcharEnd dword 122		;end of lowercase letter
	dash BYTE " - ",0			;a dash
	nextline BYTE 13,10,0		;next line
	count SDWORD 0				;counts number of each char
.code
	main PROC
		mov edx, OFFSET prompt1		;move prompt to edx
		call WriteString			;writes string to command prompt
		mov edx, OFFSET buffer		;offset based on the number of chars allowed in string into edx
		mov ecx, SIZEOF buffer		;stores the size of the buffer in ecx
		call ReadString				;reads the string inputted by user
		mov sentence, eax			;stores the input into eax
		jmp checkint				;jumps to the first function
		next1:
			jmp checkupper			;jumps to the 2nd function
		next2:
			jmp checklower			;jumps to the 3rd function
		checkint:					;counts the number each int occurs
			mov ebx, OFFSET buffer	;offsets ebx register based on the size of buffer
			mov ecx, sentence		;moves sentence into ecx
			mov eax, intIndex		;moves the int the user is on into eax
			cmp eax, intEnd			;compares the value to the last int
			ja next1				;if it is the last int then jumps to next function
			xor edx,edx				;clears edx register
			mov edx, count			;moves the count into the edx register
			L1:
				cmp byte ptr [ebx],0 ;compares the value at the index ebx to 0
				je none				 ;jumps to none to move to next int
				cmp al, [ebx]		 ;compares the integer at the index to the index at ebx
				jne no_inc			 ;if it is not equal then does not increment
				incre:				 ;else increments
					inc dl			 ;increment dl
				no_inc:				 ;no increment
					add ebx, 1		 ;goes to next value

			loop L1					 ;continues loop
				none:				 ;outputs count of the char 
					cmp edx,0		 ;if count is 0
					je skip			 ;does not output char
					mov intIndex, eax	;move char into eax to write char
					call WriteChar		;write  the char to the command prompt
					mov count, edx		;move the value in edx to count
					mov edx, OFFSET dash	;output a dash
					call WriteString		;write dash to command prompt
					mov eax, count			;move the count into eax
					call WriteDec			;write the count to the command prompt
					mov edx, OFFSET nextline	;goes to the next line in the command prompt
					call WriteString			;writes the next line to the command prompt
					skip:						;skips to updating values if count is 0
					mov eax,intIndex			;moves the index into eax to increment the value
					inc eax						;increments
					mov intIndex, eax			;moves the increment into intIndex
					xor eax,eax					;clears eax register
					mov count, eax				;moves the value in eax into count
					jmp checkint				;jumps to the beginning of the function
		checkupper:					;counts the number each uppercase char occurs
			mov ebx, OFFSET buffer
			mov ecx, sentence
			mov eax, upcharIndex
			cmp eax, upcharEnd
			ja next2
			xor edx,edx
			mov edx, count
			L2:
				cmp byte ptr [ebx],0
				je none2
				cmp al, [ebx]
				jne no_inc1
				incre1:
					inc edx
				no_inc1:
					add ebx, 1

			loop L2
				none2:
					cmp edx,0
					je skip2
					mov upcharIndex, eax
					call WriteChar
					mov count, edx
					mov edx, OFFSET dash
					call WriteString
					mov eax, count
					call WriteDec
					mov edx, OFFSET nextline
					call WriteString
					skip2:
					mov eax,upcharIndex
					inc eax
					mov upcharIndex, eax
					xor eax,eax
					mov count, eax
					jmp checkupper
		checklower:	;counts the number each lowercase char occurs
			mov ebx, OFFSET buffer
			mov ecx, sentence
			mov eax, lowCharIndex
			cmp eax, lowcharEnd
			ja done
			xor edx,edx
			mov edx, count
			L3:
				cmp byte ptr [ebx],0
				je none3
				cmp al, [ebx]
				jne no_inc2
				incre2:
					inc edx
				no_inc2:
					add ebx, 1

			loop L3
				none3:
					cmp edx,0
					je skip3
					mov lowCharIndex, eax
					call WriteChar
					mov count, edx
					mov edx, OFFSET dash
					call WriteString
					mov eax, count
					call WriteDec
					mov edx, OFFSET nextline
					call WriteString
					skip3:
					mov eax,lowCharIndex
					inc eax
					mov lowCharIndex, eax
					xor eax,eax
					mov count, eax
					jmp checklower
		done:	;finishes code
			RET
	exit
	main ENDP
	END main