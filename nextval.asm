;---------------------------------------------------------------------
; Program:   nextval subroutine
;
; Function:  Find next mouse move in an array 15 by 30.
;            We can move into a position if its contents is blank ( 20h ).
;
; Input:     Calling sequence is:
;            x    pointer   si
;            y    pointer   di
;            dir  pointer   bx
;            maze pointer   bp
;
; Output:    x,y,dir modified in caller's data segment
;
; Owner:     Spencer Grattan & 
;            Madeleine Jenks
; Date:      Update Reason
; 10/23/23
; --------------------------
; 11/06/2016 Original version
;
;
;---------------------------------------
         .model    small               ;64k code and 64k data
         .8086                         ;only allow 8086 instructions
         public    nextval             ;allow extrnal programs to call
;---------------------------------------


;---------------------------------------
         .data                         ;start the data segment
                                       ;
    oset        db      0                ;
    rowLen      db      30               ;
;---------------------------------------


;---------------------------------------
         .code                         ;start the code segment
;---------------------------------------
; Save any modified registers
;---------------------------------------
nextval:                               ;
    push    bp                         ;
    push    ax                         ;
    push    cx
    push    dx

                                       ;
;---------------------------------------
; Code to make 1 move in the maze
;---------------------------------------
    mov ch, byte ptr ds:[di]           ; [TEST CODE] 
    mov cl, byte ptr ds:[si]           ; Updates the cx and dx registers to show what 
    mov dh, byte ptr ds:[bp]           ; the input pointers are pointing to
    mov dl, byte ptr ds:[bx]           ;
                                       ;
    mov al, byte ptr ds:[di]           ;
    sub al, 1                          ;
    mul rowLen                         ;
    add al, byte ptr ds:[si]           ;
    sub al, 1                          ;
    add [bp], al                       ; Advance the maze pointer 
    mov dh, byte ptr ds:[bp]           ; [TEST CODE] update dh to show what the maze pointer is pointing to
                                       ;
    cmp byte ptr [bx], 1               ;
    je  test_n                         ;
                                       ;
    cmp byte ptr [bx], 2               ;
    je  test_e                         ;
                                       ;
    cmp byte ptr [bx], 3               ;
    je test_s                          ;
                                       ;
                                       ;
test_w:                                ;
    cmp byte ptr ds:[bp - 1], ' '      ;
    jne test_n                         ;
    dec byte ptr [si]                  ;   
    mov bx, 3                          ;
    jmp exit                           ;
                                       ;
test_n:                                ;
    cmp byte ptr ds:[bp - 30], ' '     ;
    jne test_e                         ;
    dec byte ptr [di]
    mov bx, 4                          ;
    jmp exit                           ;
                                       ;    
test_e:                                ;
    cmp byte ptr ds:[bp + 1], ' '      ;
    jne test_s                         ;
    inc byte ptr [si]                     ;
    mov bx, 1                          ;
    jmp exit                           ;
                                       ;
test_s:                                ;
    cmp byte ptr ds:[bp + 30], ' '     ;
    jne test_w                         ;
    dec byte ptr [di]                       ;
    mov bx, 2                          ;
                                       ;
                                       ;
;---------------------------------------
; Restore registers and return
;---------------------------------------
exit:                                  ;
                                       ;
         pop    dx
         pop    cx
         pop    ax                     ;
         pop    bp                     ;
         ret                           ;return
;---------------------------------------
         end
