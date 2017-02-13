TITLE homework3
;Navie Vurdien
;Due - 10/13/16
;Compiler Used - Visual Studios 2015
;Program Description
;Write a program that uses indirect addressing to switch the 1st and 2nd elements of the dword array.
;Then switch the 3rd and 4th elements, and so on. Then output the final contents of the array dwarray.

INCLUDE Irvine32.inc

.data
	dwarray dword 0,2,5,9,10,12

.code
main PROC
	mov ebx, OFFSET dwarray ;load the array
	mov ecx, [LENGTHOF dwarray]/2 ;divide the number of loops to account for pairs
	L1:
		mov eax, [ebx] ;move the value from the array at the index ebx into register eax
		mov edx, [ebx+4] ;the next element is 4 bytes away so move the next element into register edx
		mov [ebx+4], eax ;at the next element move the value from register eax into that index
		mov [ebx], edx ;at the current element move the value from register edx into that index
		add ebx, 8 ;increment the register ebx by 8 bytes to get to the next pair of elements
	loop L1

; The four instructions below are fixed, the only variable is the name of the array

	mov esi, OFFSET dwarray
	mov ecx, LENGTHOF dwarray
	mov ebx, TYPE dwarray
	call DumpMem
	call WaitMsg
	exit
main ENDP
END main