;TITLE Program Template     (template.asm)
; Author: Ryan Chesla
; Description: Counting Game to 21
INCLUDE Irvine32.inc
;INCLUDE macros.inc

.data
asciiart1			BYTE		"_________                           __   .__         /\     __                ________   ____  ._.", 0		
asciiart2			BYTE		"\_   ___ \   ____   __ __   ____  _/  |_ |__|  ____  )/   _/  |_   ____       \_____  \ /_   | | |", 0
asciiart3			BYTE		"/    \  \/  /  _ \ |  |  \ /    \ \   __\|  | /    \      \   __\ /  _ \       /  ____/  |   | | |", 0
asciiart4			BYTE		"\     \____(  <_> )|  |  /|   |  \ |  |  |  ||   |  \      |  |  (  <_> )     /       \  |   |  \|", 0
asciiart5			BYTE		" \______  / \____/ |____/ |___|  / |__|  |__||___|  /      |__|   \____/      \_______ \ |___|  __", 0
asciiart6			BYTE		"        \/                     \/                 \/                                  \/        \/", 0
menu1				BYTE		"*************************************************************************************************", 0
menu2				BYTE		"*                                                                                               *", 0
menu3				BYTE		"*                                          1. Beginner                                          *", 0
menu4				BYTE		"*                                                                                               *", 0
menu5				BYTE		"*                                          2. Normal                                            *", 0
menu6				BYTE		"*                                                                                               *", 0
menu7				BYTE		"*                                          3. Expert                                            *", 0
menu8				BYTE		"*                                                                                               *", 0
menu9				BYTE		"*                                          4. High Score                                        *", 0
menu10				BYTE		"*                                                                                               *", 0
menu11				BYTE		"*                                          5. About the Game                                    *", 0
menu12				
"*                                                                                               *", 0
menu13				BYTE		"*                                          6. Exit                                              *", 0
menu14				BYTE		"*                                                                                               *", 0
menu15				BYTE		"*************************************************************************************************", 0
about1				BYTE		"*************************************************************************************************", 0
about2				BYTE		"*                                                                                               *", 0
about3				BYTE		"*                                Programmed in MASM Assembly Language                           *", 0
about4				BYTE		"*                                       Completed March 2019                                    *", 0
about5				BYTE		"*                                                                                               *", 0
about6				BYTE		"*                                         By: Ryan Chesla                                       *", 0
about7				BYTE		"*                                                                                               *", 0
about8				BYTE		"*************************************************************************************************", 0
instructions1		BYTE		"In this game, the goal is to enter the number 21. You and your opponent will take turns entering ",0
instructions2		BYTE		"either 1 or 2 which will add to a cummulative total up to 21. You will have 10 seconds to make your ", 0
instructions3		BYTE		"choice or else your choice will automatically be 1. Speed is key to setting high scores. Each turn, ", 0
instructions4		BYTE		"you will score points based off of how fast you enter your response. There are 3 levels of difficulty.", 0
instructionerror	BYTE		"Invalid Input: Please enter 1, 2, 3, 4, 5, or 6.", 0
beginnerchoice		BYTE		"You have chosen Beginner difficulty. Good Luck!", 0
intermediatechoice	BYTE		"You have chosen Intermediate difficulty. Good Luck!", 0
expertchoice		BYTE		"You have chosen Expert difficulty. Good Luck!", 0
YouGoFirst			BYTE		"I guess I'll let you go first. You need all the help you can get! ", 0
IGoFirst			BYTE		"I think I'll go first this game. Let's get started!", 0
CPUPhrase1			BYTE		"I'll start with....... ", 0
CPUPhrase2			BYTE		"Pick 1 or 2: ", 0
CPUPhrase3			BYTE		"Hmmmmmmm I think I'll choose........ ", 0
CPUPhrase4			BYTE		"What are you gonna pick?             ", 0
totalphrase			BYTE		"The running total is:                ", 0
errormessage		BYTE		"Hey! You can't pick that number!", 0
playerwinmessage	BYTE		"WOW! You won! You must have got lucky! I'm sure I can beat you next game.", 0
cpuwinmessage		BYTE		"I won! I knew you couldn't beat me!", 0
timemessage			BYTE		"That took ", 0
timemessage1		BYTE		" Milliseconds.", 0
toolong				BYTE		"You took too long! I guess that means you just want to pick 1."
scoreboard			BYTE		"Your current score is:  ", 0
HiScore1			BYTE		"The High Score is:  ", 0


total				DWORD		?			;Holds the gamescore as the game moves along.
tempval				DWORD		?			;Holds the user's entered number while calculating time.
temptime			DWORD		?			;Holds time the user took while calculating score.
startTime			DWORD		?			;Holds the time that the user started their turn.
score				DWORD		?			;Holds the current score of the game that the user is in.
HighScore			DWORD		?			;Holds the high score that the user has achieved since program started running.



.code
main PROC

	call	Introduction					;Sends program to the procedure that prints the ascii art
	call	Menu							;Sends program to the procedure that allows the user to choose what to do.

main ENDP
   
Introduction PROC							;This procedure prints all of the ascii art for the intro picture.
AsciiArtIntro:
	call	CrLf
	call	CrLf
	call	CrLf
	mov		edx, OFFSET asciiart1
	call	WriteString
	call	CrLf
	mov		edx, OFFSET asciiart2
	call	WriteString
	call	CrLf
	mov		edx, OFFSET asciiart3
	call	WriteString
	call	CrLf
	mov		edx, OFFSET asciiart4
	call	WriteString
	call	CrLf
	mov		edx, OFFSET asciiart5
	call	WriteString
	call	CrLf
	mov		edx, OFFSET asciiart6
	Call	WriteString
	call	CrLf
	call	CrLf
	call	CrLf
	call	CrLf
	call	CrLf
	Invoke	SLEEP, 1500						;Let the art show for 1.5 seconds before displaying instructions
Instructions:
	mov		edx, OFFSET instructions1		;printing all of the lines.
	call	Writestring
	call	CrLf
	call	CrLf
	mov		edx, OFFSET instructions2
	call	Writestring
	call	CrLf
	call	CrLf
	mov		edx, OFFSET instructions3
	call	Writestring
	call	CrLf
	call	CrLf
	mov		edx, OFFSET instructions4
	call	Writestring
	call	CrLf
	call	CrLf
	ret
Introduction ENDP

Menu PROC									;This procedure allows the user to choose what they would like to do.
	mov		score, 0						;set current score to 0 so when it is called for a second time, it won't have old scores left in it.
	call	crlf
	call	crlf
	mov		edx, OFFSET menu1				;printing all of the lines.
	call	WriteString
	call	crlf
	mov		edx, OFFSET menu2
	call	WriteString
	call	crlf
	mov		edx, OFFSET menu3
	call	WriteString
	call	crlf
	mov		edx, OFFSET menu4
	call	WriteString
	call	crlf
	mov		edx, OFFSET menu5
	call	WriteString
	call	crlf
	mov		edx, OFFSET menu6
	call	WriteString
	call	crlf
	mov		edx, OFFSET menu7
	call	WriteString
	call	crlf
	mov		edx, OFFSET menu8
	call	WriteString
	call	crlf
	mov		edx, OFFSET menu9
	call	WriteString
	call	crlf
	mov		edx, OFFSET menu10
	call	WriteString
	call	crlf
	mov		edx, OFFSET menu11
	call	WriteString
	call	crlf
	mov		edx, OFFSET menu12
	call	WriteString
	call	crlf
	mov		edx, OFFSET menu13
	call	WriteString
	call	crlf
	mov		edx, OFFSET menu14
	call	WriteString
	call	crlf
	mov		edx, OFFSET menu15
	call	WriteString
	call	crlf	
	call	Gameplay						;Send the program to the Gameplay procedure.

Menu ENDP

Gameplay PROC								;This procedure is where the user's input decides where to go.

Choice:
	call	ReadInt							;Take user's input for deciding what to do in the Menu.
	cmp		eax, 1				
	je		Beginner						;if 1, go to beginner
	cmp		eax, 2
	je		Normal							;if 2, go to normal
	cmp		eax, 3
	je		Expert							;if 3, go to expert
	cmp		eax, 4	
	je		HiScore							;if 4, go to the high score board
	cmp		eax, 5
	je		About							;if 5, go to the about section
	cmp		eax, 6
	je		EndGame							;if 6, exit program
	mov		edx, OFFSET instructionerror
	call	WriteString						;else, print an error message
	call	CrLf
	Loop	Choice							;and loop back to the top

Beginner:
	call	BeginnerPlay					;Send user to the beginner mode procedure	

Normal:
	call	NormalPlay						;Send user to the normal mode procedure

Expert:
	call	ExpertPlay						;Send user to the expert mode procedure

HiScore:
	mov		eax, HighScore					;Put the current high score in the eax register.
	mov		edx, OFFSET Hiscore1			
	call	WriteString						;Print high score message
	call	WriteDec						;Print the high score
	call	crlf
	invoke	SLEEP, 1000						;Delay the program for 1 second for the user to see it
	call	Menu							;Send user back to the menu
	
About:										;Print all of the about section lines			
	call	crlf
	mov		edx, OFFSET about1
	call	WriteString
	call	crlf
	mov		edx, OFFSET about2
	call	WriteString
	call	crlf
	mov		edx, OFFSET about3
	call	WriteString
	call	crlf
	mov		edx, OFFSET about4
	call	WriteString
	call	crlf
	mov		edx, OFFSET about5
	call	WriteString
	call	crlf
	mov		edx, OFFSET about6
	call	WriteString
	call	crlf
	mov		edx, OFFSET about7
	call	WriteString
	call	crlf
	mov		edx, OFFSET about8
	call	WriteString
	call	crlf
	call	Menu

EndGame:
	exit									;exit the program

Gameplay ENDP
 
BeginnerPlay PROC							;This is the procedure for the beginner difficulty of the game
	mov		total, 0						;set the game number to 0
	call	CrLf
	mov		edx, OFFSET beginnerchoice
	call	WriteString						;print beginner message
	call	crlf
	call	Randomize						;call a random seed so the game will be different each time
	call	crlf
 
PlayerTurn:
	mov		edx, OFFSET CPUPhrase4			;Let the player know that it is their turn
	call	WriteString
  	INVOKE	GetTickCount					;determine and save the current time
	mov		startTime, eax
	call	ReadDec							;take the user's number input
	mov		tempval, eax					;save the input in a temp variable
	INVOKE	GetTickCount					;determine new current time					
	sub		eax, startTime					;find the different in these times to determine how much time has passed
	mov		temptime, eax					;save this amount of time in a temp variable
	call	crlf	
	mov		edx, OFFSET timemessage
	call	WriteString						;display time message
	call	WriteDec						
	mov		edx, OFFSET timemessage1		;print the amount of time that it took
	call	WriteString
	call	crlf
	mov		eax, tempval					;move the user number back into eax
	jmp		MoveCheck						;go to label that checks the users move

PlayerTurn2:								;extension of user's turn
	add		total, eax						;add the user's number to the running total					
	call	crlf
	mov		eax, total						;move the total to the eax to be printed
	mov		edx, OFFSET totalphrase			;print total phrase
	call	Writestring	
	call	WriteDec						;print current total
	call	crlf
	mov		eax, 10000						;calculating move score by taking 10000
	sub		eax, temptime					;and subtracting the amount of miliseconds that it took for the user to do.
	add		score, eax						;add the eax register to the score variable
	mov		eax, score						;move this to eax
	call	crlf
	mov		edx, OFFSET scoreboard			;print the scoreboard message
	call	WriteString						
	call	WriteDec						;print score
	call	crlf
	cmp		total, 21						;check if user is at 21
	je		PlayerWin						;if so, send to win label

CPUTurn:									;computer's turn
	call	crlf		
	mov		edx, OFFSET CPUPhrase3
	call	WriteString						;print the computer move message
	mov		eax, total						;move total to eax register
	cmp		eax, 20							;see if score is 20
	je		TwentyCPU						;if so, send to 20 score logic
	mov		eax, 2							;set upper limit for random number (+1)
	call	RandomRange						;find random number between 0 and 1
	add		eax, 1							;add one to make it a playable number

CPUMove2:									;cpu move continued
	call	WriteDec						;print cpu numbe
	call	crlf
	call	crlf
	add		total, eax						;add to total
	mov		eax, total						;move total to eax to be printed
	mov		edx, OFFSET totalphrase			
	call	WriteString						;print total message
	call	writedec						;print total
	call	crlf
	call	crlf
	cmp		total, 21						;see if the computer has won
	je		CPUWIn							;if so, go to cpu win label
	jmp		PlayerTurn						;if not, jump back to user turn

TwentyCPU:									;condition if cpu gets to 20
	mov		eax, 1							;pick 1 so it won't go over 21
	jmp		CPUMove2						;send this move back to cpu move continued
	
MoveCheck:									;check to see if total is at 20
	mov		eax, total
	cmp		eax, 20
	je		Twenty

TimeCheck:									;check if move took 10 seconds 
	mov		eax, temptime					;move time it took to eax
	cmp		eax, 10000						;compare to 10000
	jl		GoodTime						;if less, move is good
	mov		eax, 1							;if not, the user's move will be changed to 1
	call	crlf	
	mov		edx, OFFSET toolong
	call	WriteString						;tell user they took too long
	call	crlf
	jmp		PlayerTurn2						;send 1 to continued player turn

GoodTime:
	mov		eax, tempval					;if time is good
	cmp		eax, 1								
	jl		BadMove							;send to bad move if below 1
	cmp		eax, 2							
	jg		BadMove							;send to bad move if above 2
	jmp		PlayerTurn2						;if neither, send to player move continued

Twenty:
	mov		eax, tempval					;make sure user doesn't enter 2 when at 20
	cmp		eax, 2
	jne		TimeCheck						;if not, send to time check

BadMove:									;if user move is bad
	call	crlf	
	mov		edx, OFFSET errormessage
	call	WriteString						;let user know that was bad move
	call	crlf
	jmp		PlayerTurn						;send to first player turn for them to try again

PlayerWin:									;if player enters 21
	call	crlf
	mov		edx, OFFSET playerwinmessage
	call	WriteString						;print win message
	mov		eax, score						
	cmp		eax, highscore					;see if new high score
	jl		Skip							;if not, skip
	mov		highscore, eax					;if so, change high score
Skip:
	invoke	SLEEP, 1500						;let the end display for 1.5 seconds
	call	clrscr							;clear the screen
	call	Menu							;send user back to menu
CPUWin:
	call	crlf
	mov		edx, OFFSET cpuwinmessage
	call	WriteString						;print cpu win message
	call	crlf
	call	crlf
	mov		edx, OFFSET scoreboard			;print ending scoreboard
	call	WriteString
	mov		eax, 0
	call	WriteDec						;print ending score
	invoke	SLEEP, 1500						;let the end display for 1.5 seconds
	call	clrscr							;clear the screen
	call	Menu							;send user back to menu
BeginnerPlay ENDP
 
NormalPlay PROC								;This is the procedure for the normal difficulty of the game
	mov		total, 0						;set the game number to 0
	call	CrLf
	mov		edx, OFFSET intermediatechoice
	call	WriteString						;print normal game mode message
	call	CrLf
	call	Randomize						;set random seed so random numbers will be different
	call	crlf
 
PlayerTurn:
	mov		edx, OFFSET CPUPhrase4
	call	WriteString						;let player know it is their turn
  	INVOKE	GetTickCount					;check current time at start of move
	mov		startTime, eax					;save this time
	call	ReadDec							;take user input
	mov		tempval, eax					;save user move
	INVOKE	GetTickCount					;take time at end of move			
	sub		eax, startTime					;find the time it took for move
	mov		temptime, eax					;save this in a variable
	call	crlf
	mov		edx, OFFSET timemessage
	call	WriteString						;display time message
	call	WriteDec						;print the time it took
	mov		edx, OFFSET timemessage1
	call	WriteString						
	call	crlf
	mov		eax, tempval					;move the users number back to eax
	jmp		MoveCheck						;go to label that checks users move

PlayerTurn2:
	add		total, eax						;add the confirmed number to the total 
	call	crlf
	mov		eax, total						;move total to eax to be printed later
	mov		edx, OFFSET totalphrase	
	call	Writestring						;print total message
	call	WriteDec						;print total
	call	crlf
	mov		eax, 10000						;move 10000 to eax to be used to calculate score
	sub		eax, temptime					;subtract the time it took in miliseconds for move score
	mov		ebx, 2						
	mul		ebx								;multiply score by 2 for difficulty
	add		score, eax						;add this to their total score
	mov		eax, score
	call	crlf
	mov		edx, OFFSET scoreboard			
	call	WriteString						;scoreboard message
	call	WriteDec						;print score
	call	crlf
	cmp		total, 21						;check if the user is at winning score
	je		PlayerWin						;if so go to win label

CPUTurn:									;if not, move on to cpu turn
	call	crlf
	mov		edx, OFFSET CPUPhrase3
	call	WriteString						;print cpu move phrase
	mov		eax, total						;move current total into eax
	cmp		eax, 10							;if total at 10, go to the TenCPU label
	je		TenCPU
	cmp		eax, 11							;same logic as above
	je		ElevenCPU
	cmp		eax, 13							;same logic as above
	je		ThirteenCPU	
	cmp		eax, 14							;same logic as above
	je		FourteenCPU
	cmp		eax, 16							;same logic as above
	je		SixteenCPU
	cmp		eax, 17							;same logic as above
	je		SeventeenCPU
	cmp		eax, 19							;same logic as above
	je		NineteenCPU
	cmp		eax, 20							;same logic as above
	je		TwentyCPU
	mov		eax, 2							;if not at an above condition,
	call	RandomRange						;randomly pick a number between
	add		eax, 1							;1 and 2 for the move

CPUMove2:									;confirmed number enters
	call	WriteDec						;print number
	call	crlf
	call	crlf
	add		total, eax						;add to total
	mov		eax, total
	mov		edx, OFFSET totalphrase
	call	WriteString						;print total message
	call	writedec
	call	crlf
	call	crlf
	cmp		total, 21						;see if cpu won
	je		CPUWIn							;if so go to win label
	jmp		PlayerTurn						;if not, go back to player turn

TenCPU:
	mov		eax, 2							;if at 10, add 2
	jmp		CPUMove2
	
ElevenCPU:	
	mov		eax, 1							;if at 11, add 1
	jmp		CPUMove2

ThirteenCPU:
	mov		eax, 2							;if at 13, add 2
	jmp		CPUMove2

FourteenCPU:
	mov		eax, 1							;if at 14, add 1
	jmp		CPUMove2

SixteenCPU:
	mov		eax, 2							;if at 16, add 2
	jmp		CPUMove2

SevenTeenCPU:
	mov		eax, 1							;if at 17, add 1
	jmp		CPUMove2

NineTeenCPU:
	mov		eax, 2							;if at 19, add 2
	jmp		CPUMove2

TwentyCPU:
	mov		eax, 1							;if at 20, add 1
	jmp		CPUMove2

MoveCheck:
	mov		eax, total							
	cmp		eax, 20							;check if cpu is at 20
	je		Twenty							;if so, go to the twenty logic

TimeCheck:									;check to see if the move was done in time
	mov		eax, temptime					;move the time it took into eax
	cmp		eax, 10000						;compare it to 10000 (10 seconds)
	jl		GoodTime						;if less, go to goodtime label
	mov		eax, 1							;if not, the users choice becomes 1
	call	crlf		
	mov		edx, OFFSET toolong			
	call	WriteString						;print toolong message
	call	crlf
	jmp		PlayerTurn2						;go back to the turn to finish move

GoodTime:									;if the time was good, check if move was good
	mov		eax, tempval	
	cmp		eax, 1							;check if number was less than 1
	jl		BadMove							;if so, bad move
	cmp		eax, 2							;check if number was more than 2
	jg		BadMove							;if so, bad move
	jmp		PlayerTurn2						;if not, go back to finsh move

Twenty:										;if at 20
	mov		eax, tempval
	cmp		eax, 2							;make sure move won't put the score over 21
	jne		TimeCheck					

BadMove:									;what to do if move was bad
	call	crlf
	mov		edx, OFFSET errormessage
	call	WriteString						;print error message
	call	crlf
	jmp		PlayerTurn

PlayerWin:									;if player hits 21
	call	crlf
	mov		edx, OFFSET playerwinmessage
	call	WriteString						;print win message
	mov		eax, score
	cmp		eax, highscore					;check if score is new high score
	jl		Skip							;if less skip next step
	mov		highscore, eax					;make score new high score
Skip:
	invoke	SLEEP, 1500						;pause for 1.5 seconds
	call	clrscr							;clear screen
	call	Menu							;go to menu
CPUWin:										;if cpu hits 21
	call	crlf
	mov		edx, OFFSET cpuwinmessage
	call	WriteString						;print cpu win message
	call	crlf
	call	crlf
	mov		edx, OFFSET scoreboard
	call	WriteString						;print final scoreboard
	mov		eax, 0							;make score 0
	call	WriteDec						;print score
	invoke	SLEEP, 1500						;pause for 1.5 seconds
	call	clrscr							;clear screen
	call	Menu							;go to menu

NormalPlay ENDP

ExpertPlay PROC

	mov		total, 0						;set game total to 0
	call	CrLf
	mov		edx, OFFSET expertchoice
	call	WriteString						;print expert message
	call	CrLf
	call	Randomize						;set random seed for random numbers
	call	crlf
 
PlayerTurn:									;player turn
	mov		edx, OFFSET CPUPhrase4
	call	WriteString						;print cpu phrase
  	INVOKE	GetTickCount					;get time at start of turn
	mov		startTime, eax					;save time in variable
	call	ReadDec							;take move from user
	mov		tempval, eax					;save in variable
	INVOKE	GetTickCount					;take time at end of turn
	sub		eax, startTime					;subtract difference to find time it took			
	mov		temptime, eax					;save time in variable
	call	crlf
	mov		edx, OFFSET timemessage
	call	WriteString						;print time message
	call	WriteDec						;print time it took
	mov		edx, OFFSET timemessage1
	call	WriteString						
	call	crlf
	mov		eax, tempval					;move the user move back to eax
	jmp		MoveCheck						;check the move

PlayerTurn2:								
	add		total, eax						;add confirmed move to total
	mov		eax, total						;move total to eax
	call	crlf
	mov		edx, OFFSET totalphrase
	call	Writestring						;print total message
	call	WriteDec						;print total
	call	crlf
	mov		eax, 10000						;move 10000 to eax to calculate score
	sub		eax, temptime					;subtract time it took to do move
	mov		ebx, 3							;multiply by 3 for difficulty
	mul		ebx
	add		score, eax						;add this to total score
	mov		eax, score
	call	crlf
	mov		edx, OFFSET scoreboard
	call	WriteString						;print scoreboard message
	call	WriteDec						;print score
	call	crlf
	cmp		total, 21						;see if player is at 21
	je		PlayerWin						;if so, go to win label

CPUTurn:
	call	crlf
	mov		edx, OFFSET CPUPhrase3
	call	WriteString						;print CPU message
	mov		eax, total
	cmp		eax, 2							;if score is 2, go to twocpu label
	je		TwoCPU
	cmp		eax, 4							;same logic as above
	je		FourCPU
	cmp		eax, 5							;same logic as above
	je		FiveCPU
	cmp		eax, 7							;same logic as above
	je		SevenCPU		
	cmp		eax, 8							;same logic as above
	je		EightCPU
	cmp		eax, 10							;same logic as above
	je		TenCPU
	cmp		eax, 11							;same logic as above
	je		ElevenCPU
	cmp		eax, 13							;same logic as above
	je		ThirteenCPU
	cmp		eax, 14							;same logic as above
	je		FourteenCPU
	cmp		eax, 16							;same logic as above
	je		SixteenCPU
	cmp		eax, 17							;same logic as above
	je		SeventeenCPU
	cmp		eax, 19							;same logic as above
	je		NineteenCPU
	cmp		eax, 20							;same logic as above
	je		TwentyCPU
	mov		eax, 2							;if not any of the conditions above,
	call	RandomRange						;randomly choose a number between
	add		eax, 1							;1 and 2 for the move

CPUMove2:									;takes determined number and enters it
	call	WriteDec						;prints number
	call	crlf
	call	crlf
	add		total, eax						;add number to total
	mov		eax, total
	mov		edx, OFFSET totalphrase
	call	WriteString						;print total messsage
	call	writedec						;print total
	call	crlf
	call	crlf
	cmp		total, 21						;see if cpu is at 21
	je		CPUWIn							;if so, send to win label
	jmp		PlayerTurn						;if not, go back to player turn

TwoCPU:
	mov		eax, 1							;if at 2, add 1
	jmp		CPUMove2

FourCPU:
	mov		eax, 2							;if at 4, add 2
	jmp		CPUMove2

FiveCPU:
	mov		eax, 1							;if at 5, add 1
	jmp		CPUMove2

SevenCPU:
	mov		eax, 2							;if at 7, add 2
	jmp		CPUMove2

EightCPU:
	mov		eax, 1							;if at 8, add 1
	jmp		CPUMove2

TenCPU:
	mov		eax, 2							;if at 10, add 2
	jmp		CPUMove2
	
ElevenCPU:
	mov		eax, 1							;if at 11, add 1
	jmp		CPUMove2

ThirteenCPU:
	mov		eax, 2							;if at 13, add 2
	jmp		CPUMove2

FourteenCPU:
	mov		eax, 1							;if at 14, add 1
	jmp		CPUMove2

SixteenCPU:
	mov		eax, 2							;if at 16, add 2
	jmp		CPUMove2						

SevenTeenCPU:
	mov		eax, 1							;if at 17, add 1
	jmp		CPUMove2						

NineTeenCPU:
	mov		eax, 2							;if at 19, add 2
	jmp		CPUMove2

TwentyCPU:
	mov		eax, 1							;if at 20, add 1
	jmp		CPUMove2

MoveCheck:	
	mov		eax, total
	cmp		eax, 20							;check if score is at 20
	je		Twenty							;if so, go to twenty label

TimeCheck:									;check to see if move was done in time
	mov		eax, temptime					
	cmp		eax, 10000						;compare time to 10000 (10 seconds)
	jl		GoodTime						;if less, time was good
	mov		eax, 1							;if not, make user move 1
	call	crlf
	mov		edx, OFFSET toolong
	call	WriteString						;tell the user their move took too long
	call	crlf
	jmp		PlayerTurn2						;finish move with new number

GoodTime:									;if the time was good, check if move was good
	mov		eax, tempval					
	cmp		eax, 1							;if less than 1, bad move
	jl		BadMove
	cmp		eax, 2							;if more than 2, bad move
	jg		BadMove
	jmp		PlayerTurn2						;if not, continue move

Twenty:										;if at 20, check move
	mov		eax, tempval
	cmp		eax, 2							;make sure move won't put score over 21
	jne		TimeCheck						;if move is good, go check time

BadMove:									;if move was bad
	call	crlf
	mov		edx, OFFSET errormessage
	call	WriteString						;print bad move message
	call	crlf
	jmp		PlayerTurn						;start turn again to get new number

PlayerWin:									;if player hits 21
	call	crlf
	mov		edx, OFFSET playerwinmessage
	call	WriteString						;print win message
	mov		eax, score	
	cmp		eax, highscore					;see if score is higher than old high score
	jl		Skip							;if not skip next step
	mov		highscore, eax					;make new score the high score
Skip:			
	invoke	SLEEP, 1500						;pause for 1.5 seconds
	call	clrscr							;clear screen
	call	Menu							;go to menu
CPUWin:										;if cpu hits 21
	call	crlf
	mov		edx, OFFSET cpuwinmessage
	call	WriteString						;print cpu win message
	call	crlf
	call	crlf
	mov		edx, OFFSET scoreboard
	call	WriteString						;print scoreboard message
	mov		eax, 0							;make score 0
	call	WriteDec						;print score
	invoke	SLEEP, 1500						;pause 1.5 seconds
	call	clrscr							;clear screen
	call	Menu							;go to menu

ExpertPlay ENDP 

END main
