;--------------------------------------------------------------------
;   Program:  nextval
;
;   Function: Takes in the information about where the mouse currently is in the maze 
;             and makes a decision about where to go next. 
;             
;             Input:
;             - si contains the address of the current value of the x position 
;             - di contains the address of the current value of the y position
;             - bx contains the address of the current value of the direction of travel of the mouse
;                   - E=1
;                   - S=2
;                   - W=3
;                   - N=4
;             - bp contains the address of the maze
;             
;             Output:
;             - X and Y values in the caller's data segment are set to the next location for the mouse
;             - Direction in caller's data segment is updated to the new direction
;             - All modified registers are saved and restored to their original values 
;
;   Owner:    Spencer Grattan and ____________
;
;   Date:     Changes
;   10/22/23  original version
;
;---------------------------------------
         .model     small              ;64k code and 64k data
         .8086                         ;only allow 8086 instructions
         public nextval                ;create the link to the main code
;---------------------------------------


;---------------------------------------
         .data                         ;start the data segment
;---------------------------------------

;---------------------------------------


;---------------------------------------
         .code                         ;start the code segment
;---------------------------------------
nextval:                               ;
;---------------------------------------

;---------------------------------------
; End the program
;---------------------------------------
exit:                                  ;
         end                           ;end subroutine
;---------------------------------------
