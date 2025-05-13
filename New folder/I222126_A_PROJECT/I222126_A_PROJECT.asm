INCLUDE irvine32.inc
includelib winmm.lib

PlaySound PROTO,
        pszSound:PTR BYTE, 
        hmod:DWORD, 
        fdwSound:DWORD



BUFFER_SIZE = 501


.data

    titleStr BYTE "PAC-MAN",0

    titleScreen1 BYTE ".______      ___       ______        .___  ___.      ___      .__   __.", 0 
    titleScreen2 BYTE "|   _  \    /   \     /      |       |   \/   |     /   \     |  \ |  |", 0 
    titleScreen3 BYTE "|  |_)  |  /  ^  \   |  ,----' ______|  \  /  |    /  ^  \    |   \|  |", 0 
    titleScreen4 BYTE "|   ___/  /  /_\  \  |  |     |______|  |\/|  |   /  /_\  \   |  . `  |", 0
    titleScreen5 BYTE "|  |     /  _____  \ |  `----.       |  |  |  |  /  _____  \  |  |\   |", 0
    titleScreen6 BYTE "| _|    /__/     \__\ \______|       |__|  |__| /__/     \__\ |__| \__|", 0
    titleScreen7 BYTE "Press Any Key To Continue...", 0

    menuTitle1 BYTE " __  __ ___ _  _ _   _ ", 0
    menuTitle2 BYTE "|  \/  | __| \| | | | |", 0
    menuTitle3 BYTE "| |\/| | _|| .` | |_| |", 0
    menuTitle4 BYTE "|_|  |_|___|_|\_|\___/ ", 0
    menuTitle5 BYTE "1 - Start Game", 0
    menuTitle6 BYTE "2 - LeaderBoard", 0
    menuTitle7 BYTE "3 - Instructions", 0
    menuTitle8 BYTE "4 - Exit", 0

    pauseTitle1 BYTE " ___  _  _   _ ___ ___ ", 0
    pauseTitle2 BYTE "| _ \/_\| | | / __| __|", 0
    pauseTitle3 BYTE "|  _/ _ \ |_| \__ \ _| ", 0
    pauseTitle4 BYTE "|_|/_/ \_\___/|___/___|", 0
    pauseTitle5 BYTE "1 - Resume Game", 0
    pauseTitle6 BYTE "2 - Exit Game", 0

    instructionsTitle1 BYTE " ___ _  _ ___ _____ ___ _   _  ___ _____ ___ ___  _  _ ___ ", 0
    instructionsTitle2 BYTE "|_ _| \| / __|_   _| _ \ | | |/ __|_   _|_ _/ _ \| \| / __| ", 0
    instructionsTitle3 BYTE " | || .` \__ \ | | |   / |_| | (__  | |  | | (_) | .` \__ \ ", 0
    instructionsTitle4 BYTE "|___|_|\_|___/ |_| |_|_\\___/ \___| |_| |___\___/|_|\_|___/", 0
    
    instructionsTitle5 BYTE "1 - Exit", 0
    instructionsTitle6 BYTE "Use W,A,S,D Keys To Move", 0
    instructionsTitle7 BYTE "Collect All The Coins To Win", 0
    instructionsTitle8 BYTE "Avoid The Ghosts", 0
    instructionsTitle9 BYTE "Press 'P' To Pause", 0


    scoreTitle1 BYTE " ___  ___ ___  ___ ___ ", 0
    scoreTitle2 BYTE "/ __|/ __/ _ \| _ \ __|", 0
    scoreTitle3 BYTE "\__ \ (_| (_) |   / _| ", 0
    scoreTitle4 BYTE "|___/\___\___/|_|_\___|", 0

    gameOverTitle1 BYTE "  ___   _   __  __ ___    _____   _____ ___   _ ", 0
    gameOverTitle2 BYTE " / __| /_\ |  \/  | __|  / _ \ \ / / __| _ \ | |", 0
    gameOverTitle3 BYTE "| (_ |/ _ \| |\/| | _|  | (_) \ V /| _||   / |_|", 0
    gameOverTitle4 BYTE " \___/_/ \_\_|  |_|___|  \___/ \_/ |___|_|_\ (_)", 0
    gameOverTitle5 BYTE "Press '0' Key To Continue...", 0
    gameOverPrompt BYTE "Please Enter Your Name : ", 0
    gameOverTitle6 BYTE "\ Your Name And Score /", 0

    level1Title1 BYTE " _    _____   _____ _      _ ", 0
    level1Title2 BYTE "| |  | __\ \ / / __| |    / |", 0
    level1Title3 BYTE "| |__| _| \ V /| _|| |__  | |", 0
    level1Title4 BYTE "|____|___| \_/ |___|____| |_|", 0

    level2Title1 BYTE " _    _____   _____ _      ___ ", 0
    level2Title2 BYTE "| |  | __\ \ / / __| |    |_  )", 0
    level2Title3 BYTE "| |__| _| \ V /| _|| |__   / /", 0
    level2Title4 BYTE "|____|___| \_/ |___|____| /___|", 0

    level3Title1 BYTE " _    _____   _____ _      ____ ", 0
    level3Title2 BYTE "| |  | __\ \ / / __| |    |__ / ", 0
    level3Title3 BYTE "| |__| _| \ V /| _|| |__   |_ \ ", 0
    level3Title4 BYTE "|____|___| \_/ |___|____| |___/ ", 0

    levelPrompt BYTE "Press '0' Key To Start...", 0

    ground BYTE "------------------------------------------------------------------------------------------------------------------------",0
    ground1 BYTE "|",0ah,0
    ground2 BYTE "|",0

    WallsX BYTE 1000 dup(?)
    WallsY BYTE 1000 dup(?)
    WallsT BYTE 1000 dup(?)
    WallsNum WORD 0
    WallCollide BYTE 0

    temp byte ?

    strScore BYTE "  Game Score: ",0
    strLives BYTE "           Lives: ",0
    score DWORD 0

    xPos BYTE 3
    yPos BYTE 3
    Lives BYTE 3
    isGameOver BYTE 0
    isLevelComplete BYTE 0
    currentLevel BYTE 1
    PlayerName BYTE 20 dup(?)

    xCoinPos BYTE 100 dup(?)
    yCoinPos BYTE 100 dup(?)
    CoinsNum WORD 0
    CoinsLeft WORD 0
    CoinCollide BYTE 0

    inputChar BYTE ?


    BlinkyGhostX BYTE 114
    BlinkyGhostY BYTE 5
    BlinkyTime WORD 6

    PinkyGhostX BYTE -114
    PinkyGhostY BYTE -25
    PinkyTime WORD 5

    InkyGhostX BYTE -114
    InkyGhostY BYTE -5
    InkyAtck WORD 200
    InkyTime WORD 4

    ClydeGhostX BYTE -114
    ClydeGhostY BYTE -5
    ClydeAtck WORD 200
    ClydeTime WORD 4

    FruitX BYTE -100
    FruitY BYTE -100
    FruitT WORD 300

    CherryX BYTE -200
    CherryY BYTE -200
    CherryT WORD 300
    PlayerHasCherry BYTE 0
    PlayerCherryTime WORD 0

    PortalX BYTE 4, 4, 4, 4, 4, 116, 116, 116, 116, 116
    PortalY BYTE 13, 14, 15, 16, 17, 13, 14, 15, 16, 17

    ;///////////////////////////////////
    buffer BYTE BUFFER_SIZE DUP(?)  
    filename     BYTE "Scores.txt",0
    fileHandle   HANDLE ?
    stringLength DWORD ?
    bytesWritten DWORD ?
    str1 BYTE "Cannot create file",0dh,0ah,0
    str2 BYTE "Bytes written to file [output.txt]:",0
    str3 BYTE "Enter up to 500 numbers and press"
    BYTE "[Enter]: ",0dh,0ah,0


    ;//////////////////////////////////////////////
    startSound BYTE "start.wav",0
    wakaSound BYTE "waka.wav",0
    deathSound BYTE "DEATH.wav",0
    fruitEatSound BYTE "sounds_cherry.wav",0
    ghostEatSound BYTE "sounds_bigdot.wav",0

.code
main PROC

    INVOKE PlaySound, OFFSET startSound, NULL,0
    INVOKE SetConsoleTitle, ADDR titleStr
    call Create_File
    call StartScreen


    newGame::
    call Level1
   

    gameLoop:
        ; getting points:
        ;Checking Level For Features
        cmp currentLevel, 1
        jg notLevel1
        call BlinkyGhost
        call PlayerBlinkyCollision        
        ; call CreateRandomFruit

        jmp checkingComplete

        notLevel1:
        cmp currentLevel, 2
        jg notLevel2
        call BlinkyGhost
        call PinkyGhost
        call PlayerBlinkyCollision
        call PlayerPinkyCollision
        call CreateRandomFruit

        jmp checkingComplete

        notLevel2:
        cmp currentLevel, 3
        jg notLevel3
        call BlinkyGhost
        call PinkyGhost
        call InkyGhost
        call ClydeGhost
        call PlayerBlinkyCollision
        call PlayerPinkyCollision
        call PlayerInkyCollision
        call PlayerClydeCollision
        call PlayerPortalCollision
        call CreateRandomFruit
        call CreateRandomCherry
        call PlayerCherryCollision       
        call CheckPlayerCherryTime  

        

        jmp checkingComplete

        notLevel3:
        mov currentLevel, 1
        call gameOverScreen

    

        checkingComplete:
        call PlayerCoinCollision
        call PlayerFruitCollision 
        call CheckGameOver
        
        mov eax,white + (black * 16)
        call SetTextColor

        ; draw score:
        call DrawScore
        call Delay
        call Delay
       

        ; get user key input:
        call InputKeybord

        call CheckLevelComplete
        cmp isLevelComplete, 1
        jne levelNotComplete
            inc currentLevel
            cmp currentLevel, 2
            jne Lvl3
            mov isLevelComplete, 0
            call Level2
            jmp gameLoop
            Lvl3:
            cmp currentLevel, 3
            jne gameComplete
            mov isLevelComplete, 0
            call Level3
            gameComplete:
            jmp gameLoop
        levelNotComplete:
    jmp gameLoop

    exitGame:
    exit
main ENDP

Create_File PROC

    mov edx, OFFSET filename
    call CreateOutputFile
    mov fileHandle,eax

    cmp eax, INVALID_HANDLE_VALUE 
    jne file_ok
   
    mov edx,OFFSET str1
    
    call WriteString
    jmp quit
    file_ok:
    quit:
        ret
    ;exit
Create_File ENDP

StartScreen PROC
    call Clrscr
    call DrawBorder

    mov eax, yellow
    call setTextColor
    mov dl, 25
    mov dh, 11
    call Gotoxy
    mov edx,OFFSET titleScreen1
    call WriteString
    mov dl, 25
    mov dh, 12
    call Gotoxy
    mov edx,OFFSET titleScreen2
    call WriteString
    mov dl, 25
    mov dh, 13
    call Gotoxy
    mov edx,OFFSET titleScreen3
    call WriteString
    mov dl, 25
    mov dh, 14
    call Gotoxy
    mov edx,OFFSET titleScreen4
    call WriteString
    mov dl, 25
    mov dh, 15
    call Gotoxy
    mov edx,OFFSET titleScreen5
    call WriteString
    mov dl, 25
    mov dh, 16
    call Gotoxy
    mov edx,OFFSET titleScreen6
    call WriteString

    mov eax, lightRed
    call setTextColor
    mov dl, 45
    mov dh, 18
    call Gotoxy
    mov edx,OFFSET titleScreen7
    call WriteString

    call ReadChar
    call MenuScreen
    ret
StartScreen ENDP

MenuScreen PROC
    call Clrscr
    call DrawBorder

    mov eax, yellow
    call setTextColor
    mov dl, 47
    mov dh, 6
    call Gotoxy
    mov edx,OFFSET menuTitle1
    call WriteString
    mov dl, 47
    mov dh, 7
    call Gotoxy
    mov edx,OFFSET menuTitle2
    call WriteString
    mov dl, 47
    mov dh, 8
    call Gotoxy
    mov edx,OFFSET menuTitle3
    call WriteString
    mov dl, 47
    mov dh, 9
    call Gotoxy
    mov edx,OFFSET menuTitle4
    call WriteString
    mov dl, 47

    mov eax, lightRed
    call setTextColor
    mov dl, 51
    mov dh, 18
    call Gotoxy
    mov edx,OFFSET menuTitle5
    call WriteString
    mov dl, 51
    mov dh, 19
    call Gotoxy
    mov edx,OFFSET menuTitle6
    call WriteString
    mov dl, 51
    mov dh, 20
    call Gotoxy
    mov edx,OFFSET menuTitle7
    call WriteString
    mov dl, 51
    mov dh, 21
    call Gotoxy
    mov edx,OFFSET menuTitle8
    call WriteString

    doInput:
    call ReadChar
    cmp al, "1"
    je startGame
    cmp al, "2"
    je leaderBoard
    cmp al, "3"
    je instruction
    cmp al, "4"
    je exitGame
    jmp doInput

    startGame:
    call Clrscr
    call ResetData
    mov currentLevel, 1
    call Clrscr
    call DrawBorder
    mov eax, lightRed
    call setTextColor
    mov dl, 44
    mov dh, 15
    call Gotoxy
    mov edx,OFFSET gameOverPrompt
    call WriteString
    call Gotoxy
    mov edx,OFFSET PlayerName
    mov ecx, 20
    call ReadString
    jmp newGame
    leaderBoard:
    call Clrscr
    call DrawBorder
    call ReadChar
    call MenuScreen
    instruction:
    call InstructionScreen

    exitGame:
    exit
    ret
MenuScreen ENDP

PauseScreen PROC
    
    call Clrscr
    call DrawBorder


    mov eax, yellow
    call setTextColor
    mov dl, 47
    mov dh, 6
    call Gotoxy
    mov edx,OFFSET pauseTitle1
    call WriteString
    mov dl, 47
    mov dh, 7
    call Gotoxy
    mov edx,OFFSET pauseTitle2
    call WriteString
    mov dl, 47
    mov dh, 8
    call Gotoxy
    mov edx,OFFSET pauseTitle3
    call WriteString
    mov dl, 47
    mov dh, 9
    call Gotoxy
    mov edx,OFFSET pauseTitle4
    call WriteString
  
    mov eax, lightRed
    call setTextColor
    mov dl, 51
    mov dh, 18
    call Gotoxy
    mov edx,OFFSET pauseTitle5
    call WriteString
    mov dl, 51
    mov dh, 19
    call Gotoxy
    mov edx,OFFSET pauseTitle6
    call WriteString

    doInput:
    call ReadChar
    cmp al, "1"
    je nopause
    cmp al, "2"
    jne doInput
    call MenuScreen

    ;je exitGame
    nopause:
    call Clrscr
    call DrawBorder
    call DrawWalls
    call drawCoin
    call drawPlayer
    ret 
PauseScreen ENDP

InstructionScreen PROC
    call Clrscr
    call DrawBorder

    mov eax, yellow
    call setTextColor
    mov dl, 32
    mov dh, 7
    call Gotoxy
    mov edx,OFFSET instructionsTitle1
    call WriteString
    mov dl, 32
    mov dh, 8
    call Gotoxy
    mov edx,OFFSET instructionsTitle2
    call WriteString
    mov dl, 32
    mov dh, 9
    call Gotoxy
    mov edx,OFFSET instructionsTitle3
    call WriteString
    mov dl, 32
    mov dh, 10
    call Gotoxy
    mov edx,OFFSET instructionsTitle4
    call WriteString

    mov eax, white
    call setTextColor
    mov dl, 47
    mov dh, 16
    call Gotoxy
    mov edx,OFFSET instructionsTitle6
    call WriteString
    mov dl, 45
    mov dh, 17
    call Gotoxy
    mov edx,OFFSET instructionsTitle7
    call WriteString
    mov dl, 51
    mov dh, 18
    call Gotoxy
    mov edx,OFFSET instructionsTitle8
    call WriteString
    mov dl, 50
    mov dh, 19
    call Gotoxy
    mov edx,OFFSET instructionsTitle9
    call WriteString

    mov eax, lightRed
    call setTextColor
    mov dl, 55
    mov dh, 24
    call Gotoxy
    mov edx,OFFSET instructionsTitle5
    call WriteString
    
    doInput:
    call ReadChar
    cmp al, "1"
    jne doInput
    call MenuScreen
    ret
InstructionScreen ENDP

GameOverScreen PROC

    call Clrscr
    call DrawBorder

    mov eax, yellow
    call setTextColor
    mov dl, 35
    mov dh, 11
    call Gotoxy
    mov edx,OFFSET gameOverTitle1
    call WriteString
    mov dl, 35
    mov dh, 12
    call Gotoxy
    mov edx,OFFSET gameOverTitle2
    call WriteString
    mov dl, 35
    mov dh, 13
    call Gotoxy
    mov edx,OFFSET gameOverTitle3
    call WriteString
    mov dl, 35
    mov dh, 14
    call Gotoxy
    mov edx,OFFSET gameOverTitle4
    call WriteString
   

    mov eax, red
    call setTextColor
    mov dl, 45
    mov dh, 18
    call Gotoxy
    mov edx,OFFSET gameOverTitle5
    call WriteString

    doInput:
    call ReadChar
    cmp al, "0"
    jne doInput

    call Clrscr
    call DrawBorder
    mov eax, yellow
    call setTextColor
    mov dl, 50
    mov dh, 10
    call Gotoxy
    mov edx,OFFSET gameOverTitle6
    call WriteString
    mov dl, 52
    mov dh, 16
    call Gotoxy
    mov edx,OFFSET PlayerName
    call WriteString
    mov dl, 64
    mov dh, 16
    call Gotoxy
    cmp currentLevel, 4
    jl gameNotCompleted
    dec currentLevel
    gameNotCompleted:
    movzx eax, currentLevel
    call WriteInt
    mov dl, 68
    mov dh, 16
    call Gotoxy
    mov eax, score
    call WriteInt
    

    call WriteToFile
    call ReadChar



    call MenuScreen
    
    ret
GameOverScreen ENDP



Level1 PROC
    call Clrscr
    call ResetData

    call DrawBorder
    mov eax, yellow
    call setTextColor
    mov dl, 47
    mov dh, 11
    call Gotoxy
    mov edx,OFFSET level1Title1
    call WriteString
    mov dl, 47
    mov dh, 12
    call Gotoxy
    mov edx,OFFSET level1Title2
    call WriteString
    mov dl, 47
    mov dh, 13
    call Gotoxy
    mov edx,OFFSET level1Title3
    call WriteString
    mov dl, 47
    mov dh, 14
    call Gotoxy
    mov edx,OFFSET level1Title4
    call WriteString

    mov eax, lightRed
    call setTextColor
    mov dl, 49
    mov dh, 18
    call Gotoxy
    mov edx,OFFSET levelPrompt
    call WriteString

    doInput:
    call ReadChar
    cmp al, "0"
    jne doInput
    
    call Clrscr
    call DrawBorder
    call DrawPlayer

    call Randomize

    mov ecx, 7
    Walls:
        call DrawWallY
        call DrawWallX
    Loop Walls
    call GenerateCoins
    call DrawCoin
    ret
Level1 ENDP

Level2 PROC
    call Clrscr
    mov eax, Score
    call ResetData
    mov Score, eax

    call DrawBorder
    mov eax, yellow
    call setTextColor
    mov dl, 47
    mov dh, 11
    call Gotoxy
    mov edx,OFFSET level2Title1
    call WriteString
    mov dl, 47
    mov dh, 12
    call Gotoxy
    mov edx,OFFSET level2Title2
    call WriteString
    mov dl, 47
    mov dh, 13
    call Gotoxy
    mov edx,OFFSET level2Title3
    call WriteString
    mov dl, 47
    mov dh, 14
    call Gotoxy
    mov edx,OFFSET level2Title4
    call WriteString

    mov eax, lightRed
    call setTextColor
    mov dl, 49
    mov dh, 18
    call Gotoxy
    mov edx,OFFSET levelPrompt
    call WriteString

    doInput:
    call ReadChar
    cmp al, "0"
    jne doInput

    call Clrscr
    call DrawBorder
    call DrawPlayer

    call Randomize

    mov ecx, 11
    Walls:
        call DrawWallY
        call DrawWallX
    Loop Walls
    call GenerateCoins
    call DrawCoin
    ret
Level2 ENDP

Level3 PROC
    call Clrscr
    mov eax, Score
    call ResetData
    mov Score, eax

    call DrawBorder
    mov eax, yellow
    call setTextColor
    mov dl, 47
    mov dh, 11
    call Gotoxy
    mov edx,OFFSET level3Title1
    call WriteString
    mov dl, 47
    mov dh, 12
    call Gotoxy
    mov edx,OFFSET level3Title2
    call WriteString
    mov dl, 47
    mov dh, 13
    call Gotoxy
    mov edx,OFFSET level3Title3
    call WriteString
    mov dl, 47
    mov dh, 14
    call Gotoxy
    mov edx,OFFSET level3Title4
    call WriteString

    mov eax, lightRed
    call setTextColor
    mov dl, 49
    mov dh, 18
    call Gotoxy
    mov edx,OFFSET levelPrompt
    call WriteString

    doInput:
    call ReadChar
    cmp al, "0"
    jne doInput

    call Clrscr
    call DrawBorder
    call DrawPlayer
    call Randomize

    mov ecx, 17
    Walls:
        call DrawWallY
        call DrawWallX
    Loop Walls
    call DrawWallBorder
    call CreatePortal
    call DrawPortal
    call GenerateCoins
    call DrawCoin
    call Delay
    call Delay
    call Delay
    ret
Level3 ENDP

ResetData PROC
    mov xPos, 60
    mov yPos, 15
    mov Lives, 3
    mov isGameOver, 0
    mov CoinsNum, 0
    mov CoinsLeft, 0
    mov score, 0
    mov BlinkyTime, 10
    mov PinkyTime, 8
    mov InkyTime, 7
    mov ClydeTime, 7
    mov WallsNum, 0
    mov WallCollide, 0
    mov BlinkyGhostX, 114
    mov BlinkyGhostY, 5
    mov PinkyGhostX, 114
    mov PinkyGhostY, 25
    mov InkyGhostX, 5
    mov InkyGhostY, 5
    mov ClydeGhostX, 5
    mov ClydeGhostY, 25
    mov FruitX, -100
    mov FruitY, -100
    mov FruitT, 300
    mov CherryX, -200
    mov CherryY, -200
    mov CherryT, 300
    mov PlayerHasCherry, 0
    mov PlayerCherryTime, 0

    ret
ResetData ENDP


DrawScore PROC
    mov eax, cyan + (black * 16)
    call SetTextColor
    mov dl,0
    mov dh,0
    call Gotoxy
    mov edx, OFFSET strScore
    call WriteString
    mov eax, score
    call WriteInt
    mov dl, 0
    mov dh, 50
    call Gotoxy
    mov edx, OFFSET strLives
    call WriteString
    mov al, Lives
    call WriteInt

    ret
DrawScore ENDP

DrawBorder PROC
    mov eax, blue
    call SetTextColor
    mov dl,0
    mov dh,29
    call Gotoxy
    mov edx,OFFSET ground
    call WriteString
    mov dl,0
    mov dh,1
    call Gotoxy
    mov edx,OFFSET ground
    call WriteString

    mov ecx,27
    mov dh,2
    l1:
    mov dl,0
    call Gotoxy
    mov edx,OFFSET ground1
    call WriteString
    loop l1
    mov ecx,27
    mov dh,2
    mov temp,dh
    l2:
    mov dh,temp
    mov dl,119
    call Gotoxy
    mov edx,OFFSET ground2
    call WriteString
    inc temp
    loop l2
    ret
DrawBorder ENDP

DrawPlayer PROC uses eax edx
    mov eax,yellow 
    call SetTextColor
    mov dl,xPos
    mov dh,yPos
    call Gotoxy
    mov al,"X"
    call WriteChar
    ret
DrawPlayer ENDP

DrawCoin PROC uses eax edx
    mov eax, yellow 
    call SetTextColor
    movzx ecx, CoinsNum

    L1:
        mov dl,xCoinPos[ecx - 1]
        mov dh,yCoinPos[ecx - 1]
        cmp dl, -100
        je noDraw
        call Gotoxy
        mov al,"o"
        call WriteChar
        noDraw:
    Loop L1
    ret
DrawCoin ENDP

DrawWallY PROC uses eax ecx edx esi edi ebx
    mov eax,lightBlue 
    call SetTextColor
    mov eax,117
    call RandomRange
    inc eax
    inc eax
    mov dl,al
    mov eax,12
    call RandomRange
    inc eax
    inc eax
    mov dh,al

    cmp dl, 5
    jg NoChangedl
    inc dl
    NoChangedl:
    cmp dh, 5
    jg NoChangedh
    inc dh
    NoChangedh:

    mov eax,15
    call RandomRange
    mov ecx, eax
    inc ecx

    mov al,"|"
    mov esi, offset byte ptr WallsX
    mov edi, offset byte ptr WallsY
    L1:
        call Gotoxy
        movzx ebx, WallsNum
        mov [esi + ebx], dl
        mov [edi + ebx], dh
        mov [edi + ebx + 1000], al
        inc WallsNum
        call WriteChar
        inc dh
    Loop L1

    ret
DrawWallY ENDP

DrawWallX PROC uses eax ecx edx
    mov eax,lightBlue 
    call SetTextColor
    mov eax,98
    call RandomRange
    inc eax
    mov dl,al
    mov eax,27
    call RandomRange
    inc eax
    inc eax
    mov dh,al

    cmp dh, 5
    jg NoChangedh
    inc dh
    NoChangedh:

    mov eax,20
    call RandomRange
    mov ecx, eax
    inc ecx

    mov al,"-"
    mov esi, offset byte ptr WallsX
    mov edi, offset byte ptr WallsY
    L1:
        call Gotoxy
        movzx ebx, WallsNum
        mov [esi + ebx], dl
        mov [edi + ebx], dh
        mov [edi + ebx + 1000], al
        inc WallsNum
        call WriteChar
        inc dl
    Loop L1

    ret
DrawWallX ENDP

DrawWallBorder PROC uses ecx ebx eax edx
    mov eax,Blue
    call SetTextColor
    
    movzx ebx, WallsNum
    mov ecx, 120
    mov dl, 0
    mov dh, 1
    mov al, "-"
    L1:
        call Gotoxy
        mov [WallsX + ebx], dl
        mov [WallsY + ebx], dh
        mov [WallsT + ebx], al
        inc WallsNum
        call WriteChar
        inc dl
        inc ebx
    Loop L1

    mov ecx, 120
    mov dl, 0
    mov dh, 29
    mov al, "-"
    L2:
        call Gotoxy
        mov [WallsX + ebx], dl
        mov [WallsY + ebx], dh
        mov [WallsT + ebx], al
        inc WallsNum
        call WriteChar
        inc ebx
        inc dl
    Loop L2

    mov ecx, 27
    mov dl, 0
    mov dh, 2
    mov al, "|"
    L3:
        call Gotoxy
        mov [WallsX + ebx], dl
        mov [WallsY + ebx], dh
        mov [WallsT + ebx], al
        inc WallsNum
        call WriteChar
        inc ebx
        inc dh
    Loop L3

    mov ecx, 27
    mov dl, 119
    mov dh, 2
    mov al, "|"
    L4:
        call Gotoxy
        mov [WallsX + ebx], dl
        mov [WallsY + ebx], dh
        mov [WallsT + ebx], al
        inc WallsNum
        call WriteChar
        inc ebx
        inc dh
    Loop L4

    ret
DrawWallBorder ENDP

DrawWalls PROC uses ecx ebx eax edx
    mov ecx, lengthof WallsX
    mov ebx, 0

    loop1:
        mov eax, lightBlue
        call settextcolor
        mov dl, WallsX[ebx]
        mov dh, WallsY[ebx]
        mov al, WallsT[ebx]
        call gotoxy
        call writeChar
        inc ebx       
        loop loop1

    ret
DrawWalls ENDP

DrawFruit PROC uses eax edx
    mov eax,lightRed
    call SetTextColor
    mov dl,FruitX
    mov dh,FruitY
    cmp dl, -100
    je noDraw
    call Gotoxy
    mov al,"F"
    call WriteChar
    noDraw:
    ret
DrawFruit ENDP

DrawCherry PROC uses eax edx
    mov eax,magenta
    call SetTextColor
    mov dl,CherryX
    mov dh,CherryY
    cmp dl, -100
    je noDraw
    call Gotoxy
    mov al,"H"
    call WriteChar
    noDraw:
    ret
DrawCherry ENDP

DrawPortal PROC uses eax edx ecx
    mov eax,lightRed
    call SetTextColor
    
    mov ecx, 10
    L1:
        mov dl, PortalX[ecx - 1]
        mov dh, PortalY[ecx - 1]
        call Gotoxy
        mov al, "|"
        call WriteChar
    Loop L1
    
    ret

DrawPortal ENDP

RemoveWalls PROC uses ecx ebx eax
    movzx ecx, WallsNum
    L1:
        mov eax, black
        call settextcolor
        cmp WallsX[ecx - 1], dl
        jne noChange
        cmp WallsY[ecx - 1], dh
        jne noChange
        mov WallsT[ecx - 1], " "
        mov WallsX[ecx - 1], -100
        mov WallsY[ecx - 1], -100
        noChange:
    Loop L1
    ret
RemoveWalls ENDP

CreatePortal PROC uses eax edx ecx ebx
    mov eax,lightRed    
    call SetTextColor
    mov dl, 5
    mov dh, 14
    mov bl, 114
    mov bh, dl
    mov ecx, 10
    L1:
        mov bh, dl
        call Gotoxy
        call RemoveWalls
        mov al," "
        call WriteChar
        add dl, 1
        call Gotoxy
        call RemoveWalls
        mov al," "
        call WriteChar
        sub dl, 2
        call Gotoxy
        call RemoveWalls
        mov al," "
        call WriteChar
        add dl, 1

        mov dl, bl
        call gotoxy
        call RemoveWalls
        mov al, " "
        call WriteChar
        add dl, 1
        call gotoxy
        call RemoveWalls
        mov al, " "
        call WriteChar
        sub dl, 2
        call gotoxy
        mov al, " "
        call WriteChar
        add dl, 1

        mov dl, bh
        inc dh
    Loop L1

    ret

CreatePortal ENDP

CreateRandomFruit PROC uses eax edx
    cmp FruitT, 0
    jne noFruit
    mov dl, FruitX
    mov dh, FruitY
    call gotoxy
    mov al, " "
    call WriteChar
    gettingXY:
    mov eax,116
    call RandomRange
    inc eax
    inc eax
    mov FruitX,al
    mov eax,26
    call RandomRange
    inc eax
    inc eax
    mov FruitY,al
    mov dl,FruitX
    mov dh,FruitY
    call CheckCollision
    cmp eax, 1
    je gettingXY
    movzx ecx, CoinsNum
    L1:
        mov bl, xCoinPos[ecx - 1]
        cmp bl, FruitX
        jne noCollision
        mov bl, yCoinPos[ecx - 1]
        cmp bl, FruitY
        jne noCollision
        jmp gettingXY
        noCollision:
    Loop L1
    mov FruitT, 300
    call DrawFruit
    noFruit:
    dec FruitT
    ret
CreateRandomFruit ENDP

CreateRandomCherry PROC uses eax edx
    cmp CherryT, 0
    jne noCherry
    mov dl, CherryX
    mov dh, CherryY
    call gotoxy
    mov al, " "
    call WriteChar
    gettingXY:
    mov eax,116
    call RandomRange
    inc eax
    inc eax
    mov CherryX,al
    mov eax,26
    call RandomRange
    inc eax
    inc eax
    mov CherryY,al
    mov dl,CherryX
    mov dh,CherryY
    call CheckCollision
    cmp eax, 1
    je gettingXY
    movzx ecx, CoinsNum
    L1:
        mov bl, xCoinPos[ecx - 1]
        cmp bl, CherryX
        jne noCollision
        mov bl, yCoinPos[ecx - 1]
        cmp bl, CherryY
        jne noCollision
        jmp gettingXY
        noCollision:
    Loop L1
    mov CherryT, 300
    call DrawCherry
    noCherry:
    dec CherryT
    ret
CreateRandomCherry ENDP

UpdatePlayer PROC uses eax edx
    mov dl,xPos
    mov dh,yPos
    call Gotoxy
    mov al," "
    call WriteChar
    ret
UpdatePlayer ENDP




PlayerHitWall PROC uses ecx ebx
    movzx ecx, WallsNum
    colli:
        mov bl, WallsX[ecx]
        cmp bl, xPos
        jne noCollision
        mov bl, WallsY[ecx]
        cmp bl, yPos
        jne noCollision
        mov WallCollide, 1

        noCollision:
    loop colli

    ret
PlayerHitWall ENDP

CheckCollision PROC uses ecx 
    movzx ecx, WallsNum
    mov eax, 0
    colli:
        mov bl, WallsX[ecx]
        cmp bl, dl
        jne noCollision
        mov bh, WallsY[ecx]
        cmp bh, dh
        jne noCollision
        mov eax, 1

        noCollision:
    loop colli

    ret
CheckCollision ENDP

GenerateCoins PROC uses ecx ebx edx eax
    mov dl, 5
    mov dh, 5
    gen:
       
        movzx ecx, CoinsNum
        call CheckCollision
        cmp eax, 1
        je neext
        mov yCoinPos[ecx], dh
        mov xCoinPos[ecx], dl
        inc CoinsNum
        inc CoinsLeft

        neext:
        add dl, 10
        cmp dl, 116
        jl nextLine

        mov dl, 5
        add dh, 5
        cmp dh, 26
        jge doone

        nextLine:

    jmp gen
    doone:
    ret
GenerateCoins ENDP

PlayerCoinCollision PROC uses ecx ebx edx eax
    movzx ecx, CoinsNum
    colli:
        mov bl, xCoinPos[ecx - 1]
        cmp bl, xPos
        jne noCollision
        mov bl, yCoinPos[ecx - 1]
        cmp bl, yPos
        jne noCollision
        inc score
        mov bh, -100
        mov xCoinPos[ecx - 1], bh
        mov yCoinPos[ecx - 1], bh
        dec CoinsLeft

        noCollision:
    loop colli

    ret
PlayerCoinCollision ENDP

PlayerFruitCollision PROC uses edx eax ebx
    mov dl, FruitX
    mov dh, FruitY
    cmp dl, xPos
    jne noCollision
    cmp dh, yPos
    jne noCollision
    mov al, 10
    mov bl, currentLevel
    mul bl
    add score, 10 
    add Lives, 1
    mov FruitX, -100
    mov FruitY, -100
    mov FruitT, 300
    INVOKE PlaySound, OFFSET fruitEatSound, NULL,0
 

    noCollision:
    ret
PlayerFruitCollision ENDP

PlayerCherryCollision PROC uses edx eax ebx
    mov dl, CherryX
    mov dh, CherryY
    cmp dl, xPos
    jne noCollision
    cmp dh, yPos
    jne noCollision
    mov al, 50
    mov bl, currentLevel
    mul bl
    ;add score, 50
    mov PlayerHasCherry, 1
    mov PlayerCherryTime, 100
    mov CherryX, -100
    mov CherryY, -100
    mov CherryT, 300

    noCollision:
    ret
PlayerCherryCollision ENDP

CheckPlayerCherryTime PROC
    cmp PlayerCherryTime, 0
    jne noCherry
    mov PlayerHasCherry, 0
    noCherry:
    dec PlayerCherryTime
    ret
CheckPlayerCherryTime ENDP

GhostCoinCollision PROC uses ecx ebx 
    movzx ecx, CoinsNum
    colli:
        mov bl, xCoinPos[ecx - 1]
        cmp bl, dl
        jne noCollision
        mov bl, yCoinPos[ecx - 1]
        cmp bl, dh
        jne noCollision
        mov al, "o"
        ret
        noCollision:
        mov al, " "
    loop colli
    ret
GhostCoinCollision ENDP

GhostWallCollision PROC uses ecx ebx 
    movzx ecx, WallsNum
    colli:
        mov bl, WallsX[ecx]
        cmp bl, dl
        jne noCollision
        mov bh, WallsY[ecx]
        cmp bh, dh
        jne noCollision
        mov eax, lightBlue
        call SetTextColor
        mov al, WallsT[ecx]
        ret
        noCollision:
        mov al, " "
    loop colli
    ret
GhostWallCollision ENDP

PlayerBlinkyCollision PROC uses ecx ebx edx eax
    
    mov bl, xPos
    cmp bl, BlinkyGhostX
    jne noCollision
        
    mov bh, yPos
    cmp bh, BlinkyGhostY
    jne noCollision
    cmp PlayerHasCherry, 1
    je PlayerEatsGhost
    dec Lives
    mov xPos, 5
    mov yPos, 5
    INVOKE PlaySound, OFFSET deathSound, NULL,0
    jmp noCollision
    PlayerEatsGhost:
    mov BlinkyGhostX, 114
    mov BlinkyGhostY, 5
    add score, 10
    noCollision:
   
    ret
PlayerBlinkyCollision ENDP

PlayerPinkyCollision PROC uses ecx ebx edx eax
    
    mov bl, xPos
    cmp bl, PinkyGhostX
    jne noCollision
        
    mov bh, yPos
    cmp bh, PinkyGhostY
    jne noCollision
    cmp PlayerHasCherry, 1
    je PlayerEatsGhost
    dec Lives
    mov xPos, 5
    mov yPos, 5
    INVOKE PlaySound, OFFSET deathSound, NULL,0
    jmp noCollision
    PlayerEatsGhost:
    mov PinkyGhostX, 114
    mov PinkyGhostY, 25
    add score, 10
    noCollision:
   
    ret
PlayerPinkyCollision ENDP

PlayerInkyCollision PROC uses ecx ebx edx eax
    
    mov bl, xPos
    cmp bl, InkyGhostX
    jne noCollision
        
    mov bh, yPos
    cmp bh, InkyGhostY
    jne noCollision
    cmp PlayerHasCherry, 1
    je PlayerEatsGhost
    dec Lives
    mov xPos, 5
    mov yPos, 5
    INVOKE PlaySound, OFFSET deathSound, NULL,0
    jmp noCollision
    PlayerEatsGhost:
    mov InkyGhostX, 5
    mov InkyGhostY, 5
    add score, 10
    noCollision:
   
    ret
PlayerInkyCollision ENDP

PlayerClydeCollision PROC uses ecx ebx edx eax
    
    mov bl, xPos
    cmp bl, ClydeGhostX
    jne noCollision
        
    mov bh, yPos
    cmp bh, ClydeGhostY
    jne noCollision
    cmp PlayerHasCherry, 1
    je PlayerEatsGhost
    dec Lives
    mov xPos, 5
    mov yPos, 5
    INVOKE PlaySound, OFFSET deathSound, NULL,0
    jmp noCollision
    PlayerEatsGhost:
    mov ClydeGhostX, 5
    mov ClydeGhostY, 25
    add score, 10
    noCollision:
   
    ret
PlayerClydeCollision ENDP

PlayerPortalCollision PROC uses ecx ebx edx eax
    mov ecx, 10
    colli:
        mov eax, lightRed
        call SetTextColor
        mov al, "|"
        mov dl, PortalX[ecx - 1]
        mov dh, PortalY[ecx - 1]
        call Gotoxy
        call WriteChar

        mov bl, PortalX[ecx - 1]
        cmp bl, xPos
        jne noCollision
        mov bl, PortalY[ecx - 1]
        cmp bl, yPos
        jne noCollision

        cmp PortalX[ecx - 1], 4
        jne portal1
        mov xPos, 116
        mov bl, PortalY[ecx - 1]
        mov yPos, bl
        

        jmp noCollision
        portal1: 
        mov xPos, 5
        mov bl, PortalY[ecx - 1]
        mov yPos, bl
        

        noCollision:
    loop colli
    ret
PlayerPortalCollision ENDP

CheckLevelComplete PROC
    mov ax, CoinsLeft
    cmp ax, 0
    je levelComplete
    ret
    levelComplete:
    mov al, 1
    mov isLevelComplete, al
    ret
CheckLevelComplete ENDP

CheckGameOver PROC uses eax edx
    mov al, Lives
    cmp al, 0
    je gameOver
    ret
    gameOver:
    mov al, 1
    mov isGameOver, al
    call GameOverScreen
    ret
CheckGameOver ENDP


InputKeybord PROC uses eax edx

    cmp PlayerHasCherry, 1
        jne noGhostEatSound
        INVOKE PlaySound, OFFSET ghostEatSound, NULL,11h
    noGhostEatSound:
    call ReadKey
    mov inputChar,al
    ;cmp inputChar,"x"
       ; je exitGame

    
    jz nomov
    cmp inputChar,"p"
    je pausey
    cmp inputChar,"w"
    je moveUp
    cmp inputChar,"s"
    je moveDown
    cmp inputChar,"a"
    je moveLeft
    cmp inputChar,"d"
    je moveRight

    moveUp:
        INVOKE PlaySound, OFFSET wakaSound, NULL,11h
        dec yPos
        call PlayerHitWall
        inc yPos
        mov al, WallCollide
        cmp al, 1
        mov WallCollide, 0
        je nomov
        dec yPos
        mov al, yPos
        inc yPos
        cmp al, 1
        je nomov
        call UpdatePlayer
        dec yPos
        call DrawPlayer
        ret
    moveDown:
        INVOKE PlaySound, OFFSET wakaSound, NULL,11h
        inc yPos
        call PlayerHitWall
        dec yPos
        mov al, WallCollide
        cmp al, 1
        mov WallCollide, 0
        je nomov
        inc yPos
        mov al, yPos
        dec yPos
        cmp al, 29
        je nomov
        call UpdatePlayer
        inc yPos
        call DrawPlayer
        ret
    moveLeft:
        INVOKE PlaySound, OFFSET wakaSound, NULL,11h
        dec xPos
        call PlayerHitWall
        inc xPos
        mov al, WallCollide
        cmp al, 1
        mov WallCollide, 0
        je nomov
        dec xPos
        mov al, xPos
        inc xPos
        cmp al, 0
        je nomov
        call UpdatePlayer
        dec xPos
        call DrawPlayer
        ret
    moveRight:
        INVOKE PlaySound, OFFSET wakaSound, NULL,11h
        inc xPos
        call PlayerHitWall
        dec xPos
        mov al, WallCollide
        cmp al, 1
        mov WallCollide, 0
        je nomov
        inc xPos
        mov al, xPos
        dec xPos
        cmp al, 119
        je nomov
        call UpdatePlayer
        inc xPos
        call DrawPlayer
        ret

    pausey:
        call PauseScreen
        ret
    nomov:
    ret
InputKeybord ENDP

BlinkyGhost PROC uses eax edx ecx
    dec BlinkyTime
    movzx ecx, BlinkyTime
    cmp ecx, 0
    jne drawGhost
    mov BlinkyTime, 10
    mov dl,BlinkyGhostX
    mov dh,BlinkyGhostY
    call Gotoxy
    mov eax, yellow 
    call SetTextColor
    call GhostCoinCollision
    call WriteChar

    cmp PlayerHasCherry, 1
    je ghostRun

    mov eax, 0
    cmp dh, yPos
    je checkX
    jg moveDown
    inc BlinkyGhostY
    mov dh,BlinkyGhostY
    call CheckCollision
    cmp eax, 1
    jne checkX
    dec BlinkyGhostY
    jmp checkX
    moveDown:
    dec BlinkyGhostY  
    mov dh,BlinkyGhostY
    call CheckCollision
    cmp eax, 1
    jne checkX
    inc BlinkyGhostY

    checkX:
    mov eax, 0
    cmp dl, xPos
    je drawGhost
    jg moveRight
    inc BlinkyGhostX
    mov dl,BlinkyGhostX
    call CheckCollision
    cmp eax, 1
    jne drawGhost
    dec BlinkyGhostX
    jmp drawGhost
    moveRight:
    dec BlinkyGhostX
    mov dl,BlinkyGhostX
    call CheckCollision
    cmp eax, 1
    jne drawGhost
    inc BlinkyGhostX

    ghostRun:
    mov eax, 0
    cmp dh, yPos
    jge moveDown1
    dec BlinkyGhostY
    mov dh,BlinkyGhostY
    call CheckCollision
    cmp eax, 1
    jne checkX1
    inc BlinkyGhostY
    jmp checkX1
    moveDown1:
    inc BlinkyGhostY
    mov dh,BlinkyGhostY
    call CheckCollision
    cmp eax, 1
    jne checkX1
    dec BlinkyGhostY

    checkX1:
    mov eax, 0
    cmp dl, xPos
    jge moveRight1
    dec BlinkyGhostX
    mov dl,BlinkyGhostX
    call CheckCollision
    cmp eax, 1
    jne drawGhost
    inc BlinkyGhostX
    jmp drawGhost
    moveRight1:
    inc BlinkyGhostX
    mov dl,BlinkyGhostX
    call CheckCollision
    cmp eax, 1
    jne check1
    dec BlinkyGhostX
    check1:
    cmp BlinkyGhostX, 0
    jne check2
    inc BlinkyGhostX
    check2:
    cmp BlinkyGhostY, 2
    jne check3
    inc BlinkyGhostY
    check3:
    cmp BlinkyGhostX, 119
    jne check4
    dec BlinkyGhostX
    check4:
    cmp BlinkyGhostY, 28
    jne drawGhost
    dec BlinkyGhostY

    
    drawGhost:
    mov eax,red 
    call SetTextColor
    cmp PlayerHasCherry, 0
    je drawGhostNormal
    mov eax, red + (blue * 16)
    call SetTextColor
    drawGhostNormal:
    mov dl,BlinkyGhostX
    mov dh,BlinkyGhostY
    call Gotoxy
    mov al,"B"
    call WriteChar
    ret
BlinkyGhost ENDP

PinkyGhost PROC uses eax edx ecx
    dec PinkyTime
    movzx ecx, PinkyTime
    cmp ecx, 0
    jne drawGhost
    mov PinkyTime, 7
    mov dl,PinkyGhostX
    mov dh,PinkyGhostY
    call Gotoxy
    mov eax, yellow
    call SetTextColor
    call GhostCoinCollision
    call WriteChar

    cmp PlayerHasCherry, 1
    je ghostRun
    
    mov eax, 0
    cmp dh, yPos
    je checkX
    jg moveDown
    inc PinkyGhostY
    mov dh,PinkyGhostY
    call CheckCollision
    cmp eax, 1
    jne checkX
    dec PinkyGhostY
    jmp checkX
    moveDown:
    dec PinkyGhostY
    mov dh,PinkyGhostY
    call CheckCollision
    cmp eax, 1
    jne checkX
    inc PinkyGhostY

    checkX:
    mov eax, 0
    cmp dl, xPos
    je drawGhost
    jg moveRight
    inc PinkyGhostX
    mov dl,PinkyGhostX
    call CheckCollision
    cmp eax, 1
    jne drawGhost
    dec PinkyGhostX
    jmp drawGhost
    moveRight:
    dec PinkyGhostX
    mov dl,PinkyGhostX
    call CheckCollision
    cmp eax, 1
    jne drawGhost
    inc PinkyGhostX

    ghostRun:
    mov eax, 0
    cmp dh, yPos
    jge moveDown1
    dec PinkyGhostY
    mov dh,PinkyGhostY
    call CheckCollision
    cmp eax, 1
    jne checkX1
    
    inc PinkyGhostY
    jmp checkX1
    moveDown1:
    inc PinkyGhostY
    mov dh,PinkyGhostY
    call CheckCollision
    cmp eax, 1
    jne checkX1
    dec PinkyGhostY

    checkX1:
    mov eax, 0
    cmp dl, xPos
    jge moveRight1
    dec PinkyGhostX
    mov dl,PinkyGhostX
    call CheckCollision
    cmp eax, 1
    jne drawGhost
    inc PinkyGhostX
    jmp drawGhost
    moveRight1:
    inc PinkyGhostX
    mov dl,PinkyGhostX
    call CheckCollision
    cmp eax, 1
    jne check1
    dec PinkyGhostX
    check1:
    cmp PinkyGhostX, 1
    jne check2
    inc PinkyGhostX
    check2:
    cmp PinkyGhostY, 2
    jne check3
    inc PinkyGhostY
    check3:
    cmp PinkyGhostX, 118
    jne check4
    dec PinkyGhostX
    check4:
    cmp PinkyGhostY, 28
    jne drawGhost
    dec PinkyGhostY


    drawGhost:
    mov eax,magenta
    call SetTextColor
    cmp PlayerHasCherry, 0
    je drawGhostNormal
    mov eax, magenta + (blue * 16)
    call SetTextColor
    drawGhostNormal:
    mov dl,PinkyGhostX
    mov dh,PinkyGhostY
    call Gotoxy
    mov al,"P"
    call WriteChar

    ret
PinkyGhost ENDP

InkyGhost PROC uses eax edx ecx
    dec InkyAtck
    dec InkyTime
    movzx ecx, InkyTime
    cmp ecx, 0
    jne drawGhost
    mov InkyTime, 4
    mov dl,InkyGhostX
    mov dh,InkyGhostY
    call Gotoxy
    mov eax, yellow
    call SetTextColor
    call GhostCoinCollision
    call WriteChar

    cmp PlayerHasCherry, 1
    je ghostRun

    cmp InkyAtck, 3
    jg noAttack
    mov InkyAtck, 60
    mov dl, xPos
    mov dh, yPos
    add dl, InkyGhostX
    add dh, InkyGhostY
    shr dl, 1
    shr dh, 1
    dec dl
    dec dh
    checkCol:
    inc dh
    inc dl
    mov eax, 0
    call CheckCollision
    cmp eax, 1
    je checkCol
    mov InkyGhostX, dl
    mov InkyGhostY, dh
    jmp drawGhost
    
    noAttack:
    mov eax, 0
    cmp dh, yPos
    je checkX
    jg moveDown
    inc InkyGhostY
    mov dh,InkyGhostY
    call CheckCollision
    cmp eax, 1
    jne checkX
    dec InkyGhostY
    jmp checkX
    moveDown:
    dec InkyGhostY
    mov dh,InkyGhostY
    call CheckCollision
    cmp eax, 1
    jne checkX
    inc InkyGhostY

    checkX:
    mov eax, 0
    cmp dl, xPos
    je drawGhost
    jg moveRight
    inc InkyGhostX
    mov dl,InkyGhostX
    call CheckCollision
    cmp eax, 1
    jne drawGhost
    dec InkyGhostX
    jmp drawGhost
    moveRight:
    dec InkyGhostX
    mov dl,InkyGhostX
    call CheckCollision
    cmp eax, 1
    jne drawGhost
    inc InkyGhostX

    ghostRun:
    mov eax, 0
    cmp dh, yPos
    jge moveDown1
    dec InkyGhostY
    mov dh,InkyGhostY
    call CheckCollision
    cmp eax, 1
    jne checkX1
    inc InkyGhostY
    jmp checkX1
    moveDown1:
    inc InkyGhostY
    mov dh,InkyGhostY
    call CheckCollision
    cmp eax, 1
    jne checkX1
    dec InkyGhostY

    checkX1:
    mov eax, 0
    cmp dl, xPos
    jge moveRight1
    dec InkyGhostX
    mov dl,InkyGhostX
    call CheckCollision
    cmp eax, 1
    jne drawGhost
    inc InkyGhostX
    jmp drawGhost
    moveRight1:
    inc InkyGhostX
    mov dl,InkyGhostX
    call CheckCollision
    cmp eax, 1
    jne check1
    dec InkyGhostX
    check1:
    cmp InkyGhostX, 1
    jne check2
    inc InkyGhostX
    check2:
    cmp InkyGhostY, 2
    jne check3
    inc InkyGhostY
    check3:
    cmp InkyGhostX, 118
    jne check4 
    dec InkyGhostX
    check4:
    cmp InkyGhostY, 28
    jne drawGhost
    dec InkyGhostY


    drawGhost:
    mov eax,lightGreen
    call SetTextColor
    cmp PlayerHasCherry, 0
    je drawGhostNormal
    mov eax, lightGreen + (blue * 16)
    call SetTextColor
    drawGhostNormal:
    mov dl,InkyGhostX
    mov dh,InkyGhostY
    call Gotoxy
    mov al,"I"
    call WriteChar

    ret
InkyGhost ENDP

ClydeGhost PROC
    dec ClydeAtck
    dec ClydeTime
    movzx ecx, ClydeTime
    cmp ecx, 0
    jne drawGhost
    mov ClydeTime, 7
    mov dl,ClydeGhostX
    mov dh,ClydeGhostY
    call Gotoxy
    mov eax, yellow
    call SetTextColor
    call GhostCoinCollision
    call GhostWallCollision
    call WriteChar
    
    cmp PlayerHasCherry, 1
    je ghostRun

    mov eax, 0
    cmp dh, yPos
    je checkX
    jg moveDown
    inc ClydeGhostY
    mov dh,ClydeGhostY
    call CheckCollision
    cmp ClydeAtck, 30
    jg noAttack1
    mov ClydeAtck, 120
    mov eax, 0
    noAttack1:
    cmp eax, 1
    jne checkX
    dec ClydeGhostY
    jmp checkX
    moveDown:
    dec ClydeGhostY
    mov dh,ClydeGhostY
    call CheckCollision
    cmp ClydeAtck, 30
    jg noAttack2
    mov ClydeAtck, 60
    mov eax, 0
    noAttack2:
    cmp eax, 1
    jne checkX
    inc ClydeGhostY
    
    checkX:
    mov eax, 0
    cmp dl, xPos
    je drawGhost
    jg moveRight
    inc ClydeGhostX
    mov dl,ClydeGhostX
    call CheckCollision
    cmp ClydeAtck, 30
    jg noAttack3
    mov ClydeAtck, 60
    mov eax, 0
    noAttack3:
    cmp eax, 1
    jne drawGhost
    dec ClydeGhostX
    jmp drawGhost
    moveRight:
    dec ClydeGhostX
    mov dl,ClydeGhostX
    call CheckCollision
    cmp ClydeAtck, 30
    jg noAttack4
    mov ClydeAtck, 60
    mov eax, 0
    noAttack4:
    cmp eax, 1
    jne drawGhost
    inc ClydeGhostX

    ghostRun:
    mov eax, 0
    cmp dh, yPos
    jge moveDown1
    dec ClydeGhostY
    mov dh,ClydeGhostY
    call CheckCollision
    cmp eax, 1
    jne checkX1
    inc ClydeGhostY
    jmp checkX1
    moveDown1:
    inc ClydeGhostY
    mov dh,ClydeGhostY
    call CheckCollision
    cmp eax, 1
    jne checkX1
    dec ClydeGhostY

    checkX1:
    mov eax, 0
    cmp dl, xPos
    jge moveRight1
    dec ClydeGhostX
    mov dl,ClydeGhostX
    call CheckCollision
    cmp eax, 1
    jne drawGhost
    inc ClydeGhostX
    jmp drawGhost
    moveRight1:
    inc ClydeGhostX
    mov dl,ClydeGhostX
    call CheckCollision
    cmp eax, 1
    jne check1
    dec ClydeGhostX
    check1:
    cmp ClydeGhostX, 1
    jne check2
    inc ClydeGhostX
    check2:
    cmp ClydeGhostY, 2
    jne check3
    inc ClydeGhostY
    check3:
    cmp ClydeGhostX, 118
    jne check4
    dec ClydeGhostX
    check4:
    cmp ClydeGhostY, 28
    jne drawGhost
    dec ClydeGhostY

    drawGhost:
    mov eax,lightCyan
    call SetTextColor
    cmp PlayerHasCherry, 0
    je drawGhostNormal
    mov eax, lightCyan + (blue * 16)
    call SetTextColor
    drawGhostNormal:
    mov dl,ClydeGhostX
    mov dh,ClydeGhostY
    call Gotoxy
    mov al,"C"
    call WriteChar

    ret
ClydeGhost ENDP
END main