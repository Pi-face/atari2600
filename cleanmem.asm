    proccesor 6502

    seg code
    org $F000     ;define the code origin at $F000.

Start:
    sei           ;Disable interrupts.
    cld           ;Disable the BCD - Binary Coded Decimal math mode.
    ldx #$FF      ;Loads the X register with #$FF.
    txs           ;tranfer the x pointer to the (S)tack pointer.
