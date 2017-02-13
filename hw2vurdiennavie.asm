TITLE homework2

INCLUDE Irvine32.inc

.data
.code
main PROC
mov ebx, 200h
xor eax, eax
mov edx, 5h
add eax, ebx
sub eax, edx
call DumpRegs
exit
main ENDP

END main