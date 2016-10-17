InitSprite()
If InitSound()
  sound= 1
EndIf 
InitKeyboard()
If InitJoystick()
  joystick = 1
EndIf 
;OnErrorResume()
 

 Procedure DrawTextXY(text.s, x.w, y.w)
  StartDrawing(ScreenOutput())
    DrawingMode(1)
    BackColor(0,0,0)
    FrontColor(255, 255, 255)
    Locate(x,y)
    DrawText(text)
  StopDrawing()
 EndProcedure


 
  DataSection     ; ********* a includebinary file bigger .exe but noone can steal stuff :)
   body: IncludeBinary "sprites\body.bmp"
   head1: IncludeBinary "sprites\head_1.bmp"
   head2: IncludeBinary "sprites\head_2.bmp"
   head3: IncludeBinary "sprites\head_3.bmp"
   head4: IncludeBinary "sprites\head_4.bmp"
   body2: IncludeBinary "sprites\body2.bmp"
   head21: IncludeBinary "sprites\head2_1.bmp"
   head22: IncludeBinary "sprites\head2_2.bmp"
   head23: IncludeBinary "sprites\head2_3.bmp"
   head24: IncludeBinary "sprites\head2_4.bmp"
   body3: IncludeBinary "sprites\body3.bmp"
   head31: IncludeBinary "sprites\head3_1.bmp"
   head32: IncludeBinary "sprites\head3_2.bmp"
   head33: IncludeBinary "sprites\head3_3.bmp"
   head34: IncludeBinary "sprites\head3_4.bmp"
   body4: IncludeBinary "sprites\body4.bmp"
   head41: IncludeBinary "sprites\head4_1.bmp"
   head42: IncludeBinary "sprites\head4_2.bmp"
   head43: IncludeBinary "sprites\head4_3.bmp"
   head44: IncludeBinary "sprites\head4_4.bmp"
   body5: IncludeBinary "sprites\body5.bmp"
   head51: IncludeBinary "sprites\head5_1.bmp"
   head52: IncludeBinary "sprites\head5_2.bmp"
   head53: IncludeBinary "sprites\head5_3.bmp"
   head54: IncludeBinary "sprites\head5_4.bmp"
   body6: IncludeBinary "sprites\body6.bmp"
   head61: IncludeBinary "sprites\head6_1.bmp"
   head62: IncludeBinary "sprites\head6_2.bmp"
   head63: IncludeBinary "sprites\head6_3.bmp"
   head64: IncludeBinary "sprites\head6_4.bmp"
   body7: IncludeBinary "sprites\body7.bmp"
   head71: IncludeBinary "sprites\head7_1.bmp"
   head72: IncludeBinary "sprites\head7_2.bmp"
   head73: IncludeBinary "sprites\head7_3.bmp"
   head74: IncludeBinary "sprites\head7_4.bmp"
   body8: IncludeBinary "sprites\body8.bmp"
   head81: IncludeBinary "sprites\head8_1.bmp"
   head82: IncludeBinary "sprites\head8_2.bmp"
   head83: IncludeBinary "sprites\head8_3.bmp"
   head84: IncludeBinary "sprites\head8_4.bmp"
   body9: IncludeBinary "sprites\body9.bmp"
   head91: IncludeBinary "sprites\head9_1.bmp"
   head92: IncludeBinary "sprites\head9_2.bmp"
   head93: IncludeBinary "sprites\head9_3.bmp"
   head94: IncludeBinary "sprites\head9_4.bmp"
   food1: IncludeBinary "sprites\food1.bmp"
   food2: IncludeBinary "sprites\food2.bmp"
   food3: IncludeBinary "sprites\food3.bmp"
   food4: IncludeBinary "sprites\food4.bmp"
   food5: IncludeBinary "sprites\food5.bmp"
   misc1: IncludeBinary "sprites\mystery.bmp"  
   sound0: IncludeBinary "sound\item1.wav"
   sound1: IncludeBinary "sound\item2.wav"
   sound2: IncludeBinary "sound\item3.wav"   
   sound50: IncludeBinary "sound\music_A.wav"
   sound51: IncludeBinary "sound\music_B.wav"
   sound52: IncludeBinary "sound\music_C.wav"
   sound53: IncludeBinary "sound\music_D.wav"

 EndDataSection  
 
 #SGreen = 0
 #SYellow = 5
 #SOrange = 10
 #SBlue = 15
 #STeal = 20
 #SRed = 25
 #SPurple = 30
 #SGhost = 35
 #Shippy = 40
 
 CatchSound(0, ?sound0)
 CatchSound(1, ?sound1)
 CatchSound(2, ?sound2)
 
 CatchSound(50, ?sound50)
 CatchSound(51, ?sound51)
 CatchSound(52, ?sound52)
 CatchSound(53, ?sound53)


Gosub Menu


If FullScreen = #True
  If OpenScreen(screenX, screenY, 16, "Snakes")
  Else
    MessageRequester("Snakes","Unable To open DirectX 7.0 Or later!",#MB_ICONERROR)
  EndIf
  
Else 
  If OpenWindow(0,200,200,screenX,screenY,#PB_Window_SystemMenu | #PB_Window_MinimizeGadget| #PB_Window_MaximizeGadget | #PB_Window_TitleBar | #PB_Window_SizeGadget,"Snakes")
    OpenWindowedScreen(WindowID(0),0,0,screenX,screenY,1,10,10)
  Else
    MessageRequester("Snakes","Unable To open DirectX 7.0 Or later!",#MB_ICONERROR)
  EndIf 
EndIf 

 
 
Structure head ; not really neccessary since theres only one head.. but maybe for multiplayer mode
  x.w
  y.w
  direction.b  ; 1 up 2 right 3 down 4 left
  length.w
EndStructure

Structure body
  x.w
  y.w
  age.w
EndStructure
NewList body.body()
NewList body2.body()

Structure food
  image.b          ; this is soley for the purpose of expanding the food variety
  x.w
  y.w
  life.w
EndStructure
NewList food.food()

;- NewGame
NewGame:

 CatchSprite(0, ?body) 
 CatchSprite(1, ?head1)
 CatchSprite(2, ?head2)
 CatchSprite(3, ?head3)
 CatchSprite(4, ?head4) 
 CatchSprite(5, ?body2) 
 CatchSprite(6, ?head21)
 CatchSprite(7, ?head22)
 CatchSprite(8, ?head23)
 CatchSprite(9, ?head24) 
 CatchSprite(10, ?body3) 
 CatchSprite(11, ?head31)
 CatchSprite(12, ?head32)
 CatchSprite(13, ?head33)
 CatchSprite(14, ?head34) 
 CatchSprite(15, ?body4) 
 CatchSprite(16, ?head41)
 CatchSprite(17, ?head42)
 CatchSprite(18, ?head43)
 CatchSprite(19, ?head44)  
 CatchSprite(20, ?body5) 
 CatchSprite(21, ?head51)
 CatchSprite(22, ?head52)
 CatchSprite(23, ?head53)
 CatchSprite(24, ?head54) 
 CatchSprite(25, ?body6) 
 CatchSprite(26, ?head61)
 CatchSprite(27, ?head62)
 CatchSprite(28, ?head63)
 CatchSprite(29, ?head64) 
 CatchSprite(30, ?body7) 
 CatchSprite(31, ?head71)
 CatchSprite(32, ?head72)
 CatchSprite(33, ?head73)
 CatchSprite(34, ?head74) 
 CatchSprite(35, ?body8) 
 CatchSprite(36, ?head81)
 CatchSprite(37, ?head82)
 CatchSprite(38, ?head83)
 CatchSprite(39, ?head84) 
 CatchSprite(40, ?body9) 
 CatchSprite(41, ?head91)
 CatchSprite(42, ?head92)
 CatchSprite(43, ?head93)
 CatchSprite(44, ?head94)  
 CatchSprite(50, ?food1)  
 CatchSprite(51, ?food2)
 CatchSprite(52, ?food3)
 CatchSprite(53, ?food4)  
 CatchSprite(54, ?food5)

If lvlSound > 49
 PlaySound(lvlsoundnew)
EndIf 
moved = 0
head.head\length = 3
head.head\x = 32*2
head.head\y = 32*4
head.head\direction = 2
headimage = 2


moved2 = 0
head2.head\length = 3
head2.head\x = 32*15
head2.head\y = 32*7
head2.head\direction = 4
headimage2 = 4


GameSpeed.f = 35 - StartSpeed
GameSpeed2.f = 35 - StartSpeed

delay = GameSpeed
Delay2 = GameSpeed2

score.l = 0
score2.l = 0


For k = 32 To head.head\length*32 Step 32
  AddElement(body())
  body()\x = head\x-k
  body()\y = head\y
  body()\age = k/32
Next 

For k = 1 To MaxFood 
  AddElement(food())
  food()\image = 50 + Random(FoodItems)
  food()\x = Random(19)*32
  food()\y = Random(14)*32
Next

;- Main Loop

Repeat 
 
 If FullScreen = #false
   If WindowID(0)
     Event = WindowEvent() 
 
     If Event    
       Delay(10)
     EndIf 
   EndIf 
 EndIf 
    
    
  ClearScreen(0,0,0)
  
  Gosub ExamineKeyboard 
  
  Gosub Food
  
  Delay - 1
  If Delay < 1 
    Delay = GameSpeed 
    Gosub MoveSnake
  EndIf 
  
  Delay2 - 1
  If Delay2 < 1 
    Delay2 = GameSpeed2   
    If player = 2
      Gosub MoveSnake2
    EndIf 
  EndIf 

  Gosub Draw
  ExamineKeyboard()
  
  If KeyboardPushed(#PB_key_escape)
    End
  ElseIf FullScreen = #false And event = #PB_Event_CloseWindow 
    End
  EndIf 
ForEver





;- ExamineKeyboard
ExamineKeyboard:
  ExamineKeyboard()
  If moved = 0                ; 1 up 2 right 3 down 4 left
    If KeyboardPushed(#PB_Key_Up) And head\direction <> 3
      moved = 1
      head\direction = 1
      headimage = 1
    ElseIf KeyboardPushed(#PB_Key_Right) And head\direction <> 4
      moved = 1
      head\direction = 2
      headimage = 2
    ElseIf KeyboardPushed(#PB_Key_Down) And head\direction <> 1
      moved = 1
      head\direction = 3
      headimage = 3
    ElseIf KeyboardPushed(#PB_Key_Left) And head\direction <> 2
      moved = 1
      head\direction = 4
      headimage = 4
    ElseIf joystick = 1 And playerjoystick = 1
      ExamineJoystick()
      If JoystickAxisY()=-1 And head\direction <> 3
        moved = 1
        head\direction = 1
        headimage = 1
      ElseIf JoystickAxisX()=1 And head\direction <> 4
        moved = 1
        head\direction = 2
        headimage = 2
      ElseIf JoystickAxisY()=1 And head\direction <> 1
        moved = 1
        head\direction = 3
        headimage = 3
      ElseIf JoystickAxisX()=-1 And head\direction <> 2
        moved = 1
        head\direction = 4
        headimage = 4
      EndIf
    EndIf 
  EndIf 
    
If player = 2                               ; 1 up 2 right 3 down 4 left
  If   moved2 = 0
    If KeyboardPushed(#PB_Key_W) And head2\direction <> 3
      moved2 = 1
      head2\direction = 1
      headimage2 = 1
    ElseIf KeyboardPushed(#PB_Key_D) And head2\direction <> 4
      moved2 = 1
      head2\direction = 2
      headimage2 = 2
    ElseIf KeyboardPushed(#PB_Key_S) And head2\direction <> 1
      moved2 = 1
      head2\direction = 3
      headimage2 = 3
    ElseIf KeyboardPushed(#PB_Key_A) And head2\direction <> 2
      moved2 = 1
      head2\direction = 4
      headimage2 = 4
    ElseIf joystick = 1 And playerjoystick = 2
      ExamineJoystick()
      If JoystickAxisY()=-1 And head2\direction <> 3
        moved2 = 1
        head2\direction = 1
        headimage2 = 1
      ElseIf JoystickAxisX()=1 And head2\direction <> 4
        moved2 = 1
        head2\direction = 2
        headimage2 = 2
      ElseIf JoystickAxisY()=1 And head2\direction <> 1
        moved2 = 1
        head2\direction = 3
        headimage2 = 3
      ElseIf JoystickAxisX()=-1 And head2\direction <> 2
        moved2 = 1
        head2\direction = 4
        headimage2 = 4
      EndIf
    EndIf 
  EndIf 
EndIf 
    
    Repeat     ; may "little" pause procedure
    ExamineKeyboard()

    If KeyboardReleased(#PB_key_Space) ;pause
      If Paused = 0
        Gosub Draw
        DrawTextXY("PAUSE",ScreenX/2-50,ScreenY/2)
        FlipBuffers()
        Paused = 1
      Else 
        Paused = 0
      EndIf 
    EndIf 
      
  Until paused = 0
  
  If joystick = 1
    If JoystickButton(10)
      paused = 1
      pausecounter = 20
      Gosub Draw
      DrawTextXY("PAUSE",ScreenX/2-50,ScreenY/2)
      FlipBuffers()
    EndIf
    
    Repeat
      ExamineJoystick()
      If pausecounter < 0 
        If joystick = 1
          If JoystickButton(1) Or JoystickButton(2) Or JoystickButton(3) Or JoystickButton(4) Or JoystickButton(5) Or JoystickButton(6) Or JoystickButton(7) Or JoystickButton(8)
            paused = 0
            pausecounter = 20
          EndIf
       EndIf 
      Else
        pausecounter - 1
      EndIf 
     
    Until paused = 0

  EndIf   
    DisplayTransparentSprite(headimage,head\x,head\y)
Return 

;- Food
Food:

  If CountList(food()) < MaxFood
      AddElement(food())
      food()\image = 50 + Random(FoodItems) 
      food()\life = 500 + Random(100)
      If player =1
        food()\image = 50
      Else 
        k = Random(33)
        If k < 11
          food()\image = 50
        ElseIf k >= 11 And k < 17
          food()\image = 51
        ElseIf k >= 17 And k < 23
          food()\image = 52
        ElseIf k >= 23 And k < 27
          food()\image = 53
        ElseIf k >= 27
          food()\image = 54
        EndIf 
      EndIf 
      food()\x = Random((screenX-32)/32)*32
      food()\y = Random((screenY-32)/32)*32
  EndIf
  ResetList(food())
  While NextElement(food())
    If head\x = food()\x And head\y = food()\y
      If food()\image = 50
        head\length + 1
        Score + 10
        If player = 1
          GameSpeed -(1/4) 
          If gameSpeed < 3
            GameSpeed = 3
          EndIf
        EndIf 
        PlaySound(0, 0)
      ElseIf food()\image = 51
        head2\length - (Random(1)+1)
        Score + 10
        If head2\length < 1
          playerWin = 1
          Gosub GameOver
        EndIf 
        PlaySound(1, 0)
      ElseIf food()\image = 52
        If player = 1
          GameSpeed - 1
        Else 
          gameSpeed - 3
        EndIf 
        If GameSpeed < 3
          GameSpeed = 3
        EndIf 
        Score + 10
        PlaySound(2, 0)
      ElseIf food()\image = 53
        head\length - (Random(1)+1)
        Score - 10
        If head\length <1
          playerWin = 1
          Gosub GameOver
        EndIf 
        PlaySound(0, 0)
      ElseIf food()\image = 54
          GameSpeed + 3
        If GameSpeed > 40 
          GameSpeed = 40
        EndIf 
        Score + 10
        PlaySound(2, 0)
      EndIf  
      DeleteElement(food())
    EndIf 
  Wend
  
  If player = 2
    ResetList(food())
    While NextElement(food())
      If head2\x = food()\x And head2\y = food()\y
        If food()\image = 50
          head2\length + 1
          Score2 + 10 
          PlaySound(0, 0)         
        ElseIf food()\image = 51
          Score2 + 10
          head\length - (Random(1)+1)
          If head\length < 1
            playerWin = 2
            Gosub GameOver
          EndIf 
          PlaySound(1, 0)
        ElseIf food()\image = 52
          GameSpeed2 - 3
          If GameSpeed2 < 3
            GameSpeed2 = 3
          EndIf 
          Score2 + 10
          PlaySound(2, 0)
        ElseIf food()\image = 53
          head2\length - (Random(1)+1)
          Score2 - 10
          If head2\length <1
            playerWin = 2
            Gosub GameOver
          EndIf        
          PlaySound(0, 0)   
        ElseIf food()\image = 54
          GameSpeed2 + 3
          If GameSpeed2 > 40 
            GameSpeed2 = 40
          EndIf 
          Score2 + 10
          PlaySound(2, 0)
        EndIf 
        DeleteElement(food())
      EndIf
    Wend
  EndIf 
Return 

;- MoveSnake 1
MoveSnake:
  playerWin = 1 ; if it goes to gameover in this routine player 1 had to of won
  AddElement(body())
  body()\x = head\x
  body()\y = head\y
  body()\age = 1

If player = 2
  If head\x = head2\x And head\y = head2\y
    playerWin = 0
    Gosub GameOver
  EndIf 
EndIf

   
  If head\direction = 1
    head\y - 32
  ElseIf head\direction = 2
    head\x + 32
  ElseIf head\direction = 3
    head\y + 32
  ElseIf head\direction = 4
    head\x - 32
  EndIf 

  If head\x > ScreenX-32
    head\x = 0
  ElseIf head\x < 0
    head\x = ScreenX-32
  ElseIf head\y > ScreenY-32
    head\y = 0
  ElseIf head\y < 0
    head\y = ScreenY-32
  EndIf 
  
  moved = 0

  ResetList(body())
  While NextElement(body())
    If player = 2
      If body()\x = head2\x And body()\y = head2\y
        Gosub GameOver
      EndIf
      ResetList(body2())
      While NextElement(body2())
        If body()\x = body2()\x And body()\y = body2()\y
          Gosub GameOver 
        EndIf        
      Wend 
    EndIf 
    If body()\x = head\x And body()\y = head\y
      playerWin = 2
      Gosub GameOver
    EndIf
  Wend 

  ResetList(body())
  While NextElement(body())
    body()\age + 1
    If body()\age > head\length
      DeleteElement(body())
    EndIf
  Wend 
  
Return 



;- MoveSnake 2
MoveSnake2:
  playerWin = 2
  AddElement(body2())
  body2()\x = head2\x
  body2()\y = head2\y
  body2()\age = 1
   
  If head2\direction = 1
    head2\y - 32
  ElseIf head2\direction = 2
    head2\x + 32
  ElseIf head2\direction = 3
    head2\y + 32
  ElseIf head2\direction = 4
    head2\x - 32
  EndIf 

  If head2\x > ScreenX-32
    head2\x = 0
  ElseIf head2\x < 0
    head2\x = ScreenX-32
  ElseIf head2\y > ScreenY-32
    head2\y = 0
  ElseIf head2\y < 0
    head2\y = ScreenY-32
  EndIf 
  
  moved2 = 0

  ResetList(body2())
  While NextElement(body2())
      If body2()\x = head\x And body2()\y = head\y
        Gosub GameOver
      EndIf
      If body2()\x = head2\x And body2()\y = head2\y
        playerWin = 1
        Gosub GameOver
      EndIf
      ResetList(body())
      While NextElement(body())
        If body2()\x = body()\x And body2()\y = body()\y
          Gosub GameOver 
        EndIf        
      Wend 
  Wend 

  ResetList(body2())
  While NextElement(body2())
    body2()\age + 1
    If body2()\age > head2\length
      DeleteElement(body2())
    EndIf
  Wend 
  
Return 


;- Draw
Draw:
ClearScreen(0,0,0)
  
  ResetList(food())
  While NextElement(food())
    DisplayTransparentSprite(food()\image, food()\x, food()\y)
    food()\life - 1
    If food()\life = 0
      DeleteElement(food())
    EndIf 
  Wend
  
  ResetList(body())
  While NextElement(body())
    DisplayTransparentSprite(Color, body()\x, body()\y)
  Wend
  
  If player = 2
    ResetList(body2())
    While NextElement(body2())
      DisplayTransparentSprite(Color2, body2()\x, body2()\y)
    Wend
  EndIf 
  
  Select head\direction
    Case 1
      DisplayTransparentSprite(Color+1, head\x, head\y)
    Case 2 
      DisplayTransparentSprite(Color+2, head\x, head\y) 
    Case 3 
      DisplayTransparentSprite(Color+3, head\x, head\y)
    Case 4
      DisplayTransparentSprite(Color+4, head\x, head\y)
  EndSelect
  
  If player = 2
    Select head2\direction
      Case 1
        DisplayTransparentSprite(Color2+1, head2\x, head2\y)
      Case 2 
        DisplayTransparentSprite(Color2+2, head2\x, head2\y) 
      Case 3 
        DisplayTransparentSprite(Color2+3, head2\x, head2\y)
      Case 4
        DisplayTransparentSprite(Color2+4, head2\x, head2\y)
    EndSelect
    DrawTextXY("P2Score: "+Str(Score2),400,0)
  EndIf 
  
 
  If Score > HiScore
    HiScore = Score
  EndIf  
  DrawTextXY("P1Score: "+Str(Score),200,0)
  DrawTextXY("Hi Score: "+Str(HiScore),0,0)
FlipBuffers()
Return 

;- GameOver
GameOver:

If player = 2
  If Playerwin = 1
    DrawTextXY("Player 1 Wins!",ScreenX/2-50,ScreenY/2-15)
    DrawTextXY("Score: "+Str(Score),ScreenX/2-50,ScreenY/2)
  ElseIf PlayerWin = 2
    DrawTextXY("Player 2 Wins!",ScreenX/2-50,ScreenY/2-15)
    DrawTextXY("Score: "+Str(Score2),ScreenX/2-50,ScreenY/2)
  Else
    DrawTextXY("Draw!",ScreenX/2-50,ScreenY/2-15)
    DrawTextXY("Score: "+Str(Score),ScreenX/2-50,ScreenY/2)
  EndIf 
ElseIf player = 1
  DrawTextXY("You Lose!",ScreenX/2-50,ScreenY/2-15)
  DrawTextXY("Score: "+Str(Score),ScreenX/2-50,ScreenY/2)
EndIf

  FlipBuffers()
  Delay(2000)

If lvlsound > 49
  StopSound(lvlsound)
EndIf 

    If player = 1
      If Score > HiScore
        DrawTextXY("A New HighScore!",ScreenX/2-50,ScreenY/2+20)
        FlipBuffers()
        Delay(1400)
        HiScore = Score
      EndIf 
    EndIf 
    If player = 2
      NumberVersus + 1
    EndIf 
    If OpenFile(0, "HS.snake")
      WriteLong(HiScore-1234567890) ; a small encryption, nothing special tho
      WriteLong(NumberVersus - 1234567890)
      CloseFile(0)
    EndIf 
    
 
 


  ResetList(body())
  While NextElement(body())
    DeleteElement(body())
  Wend 
  If player = 2
    ResetList(body2())
    While NextElement(body2())
      DeleteElement(body2())
    Wend 
  EndIf 
  ResetList(food())
  While NextElement(food())
    DeleteElement(food())
  Wend 
  Goto NewGame
 
;- Menu 
Menu:
#MenuWindow               = 1
#GADGET_FullScreen        = 1
#GADGET_Players           = 2
#GADGET_Launch            = 4
#GADGET_Cancel            = 5
#GADGET_Controller        = 6 
#GADGET_MaxFood           = 7
#GADGET_ColorSelect       = 13
#GADGET_Sound             = 9
#GADGET_Image             = 60
#GADGET_Speed             = 12
#GADGET_Text1             = 20


  If OpenWindow(#MenuWindow, 0, 0, 292, 320, #PB_Window_ScreenCentered | #PB_Window_SystemMenu | #PB_Window_Invisible, "Snakes: by Kenny Cason")
     CatchImage(0, ?head3)  ; will be overwrote later
     CatchImage(1, ?head23)
     CatchImage(2, ?head33)
     CatchImage(3, ?head43)
     CatchImage(4, ?head53)
     CatchImage(5, ?head63)
     CatchImage(6, ?head73)
     CatchImage(7, ?head83)  
     CatchImage(8, ?head93)
     
     CatchImage(20,?misc1)
     
     
     If ReadFile(0, "HS.snake")
       HiScore =  ReadLong()+1234567890
       NumberVersus = ReadLong()+1234567890
       If NumberVersus < 0 
         NumberVersus = 0
       EndIf 
       If HiScore < 0 
         HiScore = 0
       EndIf 
       CloseFile(0)
     EndIf 
    
    If CreateGadgetList(WindowID())
      Top = 6
      ImageGadget(#GADGET_Image  ,0  ,10,40,40,UseImage(0),#PB_Image_Border)  
      ImageGadget(#GADGET_Image+1,32 ,10,40,40,UseImage(1),#PB_Image_Border)  
      ImageGadget(#GADGET_Image+2,64 ,10,40,40,UseImage(2),#PB_Image_Border)
      If HiScore > 300  
        ImageGadget(#GADGET_Image+3,96 ,10,40,40,UseImage(3),#PB_Image_Border)
      Else 
        ImageGadget(#GADGET_Image+3,96 ,10,40,40,UseImage(20),#PB_Image_Border)
      EndIf 
      If HiScore > 500
        ImageGadget(#GADGET_Image+4,128,10,40,40,UseImage(4),#PB_Image_Border) 
      Else 
        ImageGadget(#GADGET_Image+4,128 ,10,40,40,UseImage(20),#PB_Image_Border)
      EndIf 
      If HiScore > 700
        ImageGadget(#GADGET_Image+5,160,10,40,40,UseImage(5),#PB_Image_Border)
      Else 
        ImageGadget(#GADGET_Image+5,160 ,10,40,40,UseImage(20),#PB_Image_Border)
      EndIf 
      If HiScore > 800
        ImageGadget(#GADGET_Image+6,192,10,40,40,UseImage(6),#PB_Image_Border)
      Else
        ImageGadget(#GADGET_Image+6,192 ,10,40,40,UseImage(20),#PB_Image_Border)
      EndIf 
      If HiScore > 900
        ImageGadget(#GADGET_Image+7,224,10,40,40,UseImage(7),#PB_Image_Border)
      Else
        ImageGadget(#GADGET_Image+7,224 ,10,40,40,UseImage(20),#PB_Image_Border)
      EndIf 
      If HiScore > 1000
        ImageGadget(#GADGET_Image+8,256,10,40,40,UseImage(8),#PB_Image_Border)
      Else
      ImageGadget(#GADGET_Image+8,256 ,10,40,40,UseImage(20),#PB_Image_Border)
      EndIf
      Top+40
      
      TextGadget(#GADGET_Text1+10,120,Top+2,90,20,"Hi Score")
      TextGadget(#GADGET_Text1+11,120,Top+17,90,120,Str(HiScore))
      TextGadget(#GADGET_Text1+12,200,Top+2,90,20,"Versus Matches")
      TextGadget(#GADGET_Text1+13,200,Top+17,90,120,Str(NumberVersus))
            
      CheckBoxGadget(#GADGET_FullScreen, 20, Top, 75, 20, "Full Screen") :Top + 20

      CheckBoxGadget(#GADGET_Players, 20, Top, 75, 20, "2 Player") :Top + 20
      
      TextGadget(#GADGET_Text1+14,20,Top,180,20,"Mult. Player Settings") : Top + 15
      
      TextGadget(#GADGET_Text1,20,Top+2,90,20,"Player Speed")
      TextGadget(#GADGET_Text1+1,105,Top+0,10,10,"-")
      TextGadget(#GADGET_Text1+2,190,Top+0,10,10,"+")
      TrackBarGadget(#GADGET_Speed, 110, Top, 80, 20, 0, 35) : Top+30
      SetGadgetState(#GADGET_Speed, 10) 
      
      TextGadget(#GADGET_Text1+6,20,Top+2,90,20,"Max Food")
      TextGadget(#GADGET_Text1+7,105,Top+0,10,10,"-")
      TextGadget(#GADGET_Text1+8,190,Top+0,10,10,"+")   
      TrackBarGadget(#GADGET_MaxFood, 110, Top, 80, 20, 0, 50) : Top+35
      SetGadgetState(#GADGET_MaxFood, 7)
      

        TextGadget(#GADGET_Text1+3,10,Top,80,15,"Player 1")
      ComboBoxGadget(#GADGET_ColorSelect,10,Top+15,80,160) 
        AddGadgetItem(#GADGET_ColorSelect,-1,"Green") 
        AddGadgetItem(#GADGET_ColorSelect,-1,"Yellow") 
        AddGadgetItem(#GADGET_ColorSelect,-1,"Orange") 
        If HiScore > 300
          AddGadgetItem(#GADGET_ColorSelect,-1,"Blue") 
        EndIf 
        If HiScore > 500
          AddGadgetItem(#GADGET_ColorSelect,-1,"Teal") 
        EndIf 
        If HiScore > 700
          AddGadgetItem(#GADGET_ColorSelect,-1,"Red") 
        EndIf  
        If HiScore > 800
          AddGadgetItem(#GADGET_ColorSelect,-1,"Purple")
        EndIf 
        If HiScore > 900
          AddGadgetItem(#GADGET_ColorSelect,-1,"Chost") 
        EndIf
        If HiScore > 1000  
          AddGadgetItem(#GADGET_ColorSelect,-1,"Hippy") 
        EndIf 
        SetGadgetState(#GADGET_ColorSelect,0)  
  
        TextGadget(#GADGET_Text1+4,120,Top,80,15,"Player 2")
      ComboBoxGadget(#GADGET_ColorSelect+1,120,Top+15,80,160) :Top + 45
        AddGadgetItem(#GADGET_ColorSelect+1,-1,"Green") 
        AddGadgetItem(#GADGET_ColorSelect+1,-1,"Yellow") 
        AddGadgetItem(#GADGET_ColorSelect+1,-1,"Orange") 
        If HiScore > 300
          AddGadgetItem(#GADGET_ColorSelect+1,-1,"Blue") 
        EndIf 
        If HiScore > 500
          AddGadgetItem(#GADGET_ColorSelect+1,-1,"Teal") 
        EndIf 
        If HiScore > 700
          AddGadgetItem(#GADGET_ColorSelect+1,-1,"Red") 
        EndIf  
        If HiScore > 800
          AddGadgetItem(#GADGET_ColorSelect+1,-1,"Purple")
        EndIf 
        If HiScore > 900
          AddGadgetItem(#GADGET_ColorSelect+1,-1,"Ghost") 
        EndIf
        If HiScore > 1000  
          AddGadgetItem(#GADGET_ColorSelect+1,-1,"Hippy") 
        EndIf 
        SetGadgetState(#GADGET_ColorSelect+1,1)    ; set (beginning with 1) the 1st item as active one
        
        TextGadget(#GADGET_Text1+5,10,Top,80,15,"Controller") 
        ComboBoxGadget(#GADGET_Controller,70,Top,80,160) :Top+40
        AddGadgetItem(#GADGET_Controller,-1,"Disabled") 
        AddGadgetItem(#GADGET_Controller,-1,"Player 1") 
        AddGadgetItem(#GADGET_Controller,-1,"Player 2") 
        If joystick = 0
          SetGadgetState(#GADGET_Controller,0) 
        Else
          SetGadgetState(#GADGET_Controller,1)
        EndIf 
        
      TextGadget(#GADGET_Text1+9,10,Top-15,80,60,"Music")
      ComboBoxGadget(#GADGET_Sound,10,Top,100,120) :Top+30
        AddGadgetItem(#GADGET_Sound,-1,"None") 
        AddGadgetItem(#GADGET_Sound,-1,"Music A") 
        AddGadgetItem(#GADGET_Sound,-1,"Music B")
        AddGadgetItem(#GADGET_Sound,-1,"Music C") 
        AddGadgetItem(#GADGET_Sound,-1,"Music D")         
        SetGadgetState(#GADGET_Sound,0)  
        
      ButtonGadget(#GADGET_Launch,   6, Top, 95, 28, "Play", #PB_Button_Default)
      ButtonGadget(#GADGET_Cancel, 111, Top, 95, 28, "Exit")
      
      HideWindow(#MenuWindow,0)
      lvlsoundold = GetGadgetState(#GADGET_Sound) + 49
      lvlsoundnew = lvlsoundold
      If lvlsoundnew > 49
        PlaySound(lvlsoundnew,1)
      EndIf 
      Repeat
        Event = WaitWindowEvent()
        Select Event
        Case #PB_Event_Gadget
          Select EventGadgetID()
          Case #GADGET_Sound
            lvlsoundnew = GetGadgetState(#GADGET_Sound) + 49
            If lvlsoundnew > 49
              If lvlsoundnew <> lvlsoundold
                If lvlsoundold > 49
                  StopSound(lvlsoundold)
                EndIf 
                lvlsoundold = lvlsoundnew
                PlaySound(lvlsoundnew,1)
              EndIf
            Else
              If lvlsoundold > 49
                StopSound(lvlsoundold)
              EndIf 
            EndIf 
          Case #GADGET_Launch
            Quitr = 1
          Case #GADGET_Cancel
            Quitr = 2
          EndSelect
        Case #PB_Event_CloseWindow
          Quitr = 2
        EndSelect
      Until Quitr > 0
      
      FullScreen = GetGadgetState(#GADGET_FullScreen)
      StartSpeed = GetGadgetState(#GADGET_Speed)     
      Players = GetGadgetState(#GADGET_Players)
      color = GetGadgetState(#GADGET_ColorSelect) * 5
      color2 = GetGadgetState(#GADGET_ColorSelect+1) * 5
      playerjoystick = GetGadgetState(#GADGET_Controller) 
      MaxFood = GetGadgetState(#GADGET_MaxFood)

      If players = #false
        Player = 1
      Else
        Player = 2
      EndIf 
      
      CloseWindow(#MenuWindow)
    EndIf
  EndIf
  
  
screenx =  640;1280;  800;  640
screeny =  480;1024;  600;  480

If player = 1 
  StartSpeed = 5
  MaxFood = 5
EndIf 

 

If Quitr = 2
  End
Else
  Return
EndIf 


  

; ExecutableFormat=Windows
; UseIcon=C:\Documents and Settings\kenmister\Desktop\purebasic\Projects\snakes\sprites\head_3.ico
; Executable=C:\Documents and Settings\kenmister\Desktop\purebasic\Projects\snakes\Snakes.exe
; EOF