PORTC	EQU	$1003	; sets up the datalocation of port c to be called by name
DDRC	EQU	$1007	; sets up the direction registar of port c to do the same


	ORG	$C000

START	LDAA	#%11110000	;loads and saves 0F to DDRC, causing the the 4 least segnificant bits to be inputs, the other 4 to be outputs. 
	STAA	DDRC		
LOOP	LDAA	PORTC		;Reads port C, than masks out bit 1
	ANDA	#%00000001

	BEQ	ISZERO		;Directs the program counter to which branch to take depending on the value of bit 4

	LDAA	#%00010000	
	ORAA	PORTC		;bit 1 was 1
	STAA	PORTC		;so force bit 4 to 1
	BRA	LOOP		; loop forever

ISZERO	LDAA	#%11101111	;bit 1 was 0, 
	ANDA	PORTC
	STAA	PORTC		;so force bit 4 to a 0 
	BRA	LOOP		;loop forever

	

	ORG	$FFFE
	FDB	START