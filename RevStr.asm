; Reversing a String (RevStr.asm)
; This program reverses a string.

INCLUDE Z:\\opt\\msvc\\Irvine\\Irvine32.inc
INCLUDELIB Z:\\opt\\msvc\\Irvine\\Irvine32.lib
INCLUDELIB Z:\\opt\\msvc\\Irvine\\Kernel32.Lib
INCLUDELIB Z:\\opt\\msvc\\Irvine\\User32.Lib

.data
aName byte "Abraham Lincoln",0
nameSize = ($ - aName) - 1

.code
main proc

; Push the name on the stack.

	mov	 ecx,nameSize
	mov	 esi,0

	mov	edx, OFFSET aName
	call WriteString
	call Crlf

	L1:	movzx eax,aName[esi]	; get character
		push eax				; push on stack
		inc	 esi
		loop L1

	; Pop the name from the stack in reverse
	; and store it in the aName array.

	mov	 ecx,nameSize
	mov	 esi,0

	L2:	pop  eax				; get character
		mov	 aName[esi],al		; store in string
		inc	 esi
		loop L2

	mov	edx, OFFSET aName
	call WriteString
	call Crlf

	exit
main endp
end main
