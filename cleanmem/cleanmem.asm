    proccesor 6502

    seg code
    org $F000     ;define the code origin at $F000.

Start:
    sei           ;Disable interrupts.
    cld           ;Disable the BCD - Binary Coded Decimal math mode.
    ldx #$FF      ;Loads the X register with #$FF.
    txs           ;tranfer the x pointer to the (S)tack pointer.


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Clear the page zero region of my memory ($00 to $FF).
; Meaning the entire RAM and also the enitre TIA registers.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    lda #0        ; A = 0
    ldx #$FF      ; X = $FF

MemLoop:
    sta $0,X      ; Store the value of A inside memory address $0 + X; 
    dex           ; X--
    bne MemLoop   ; Loop until X is equal to zero 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Fill the ROM size to exactly 4KB
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    
    org $FFFC
    .word Start   ; Reset vector at (Where the program starts)
    .word Start
