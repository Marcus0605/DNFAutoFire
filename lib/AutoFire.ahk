﻿Esc(){
	_autofire("Esc")
}
F1(){
	_autofire("F1")
}
F2(){
	_autofire("F2")
}
F3(){
	_autofire("F3")
}
F4(){
	_autofire("F4")
}
F5(){
	_autofire("F5")
}
F6(){
	_autofire("F6")
}
F7(){
	_autofire("F7")
}
F8(){
	_autofire("F8")
}
F9(){
	_autofire("F9")
}
F10(){
	_autofire("F10")
}
F11(){
	_autofire("F11")
}
F12(){
	_autofire("F12")
}
Tilde(){
	_autofire("``")
}
1(){
	_autofire("1")
}
2(){
	_autofire("2")
}
3(){
	_autofire("3")
}
4(){
	_autofire("4")
}
5(){
	_autofire("5")
}
6(){
	_autofire("6")
}
7(){
	_autofire("7")
}
8(){
	_autofire("8")
}
9(){
	_autofire("9")
}
0(){
	_autofire("0")
}
Sub(){
	_autofire("-")
}
Add(){
	_autofire("+")
}
Backspace(){
	_autofire("BackSpace")
}
Tab(){
	_autofire("Tab")
}
Q(){
	_autofire("Q")
}
W(){
	_autofire("W")
}
E(){
	_autofire("E")
}
R(){
	_autofire("R")
}
T(){
	_autofire("T")
}
Y(){
	_autofire("Y")
}
U(){
	_autofire("U")
}
I(){
	_autofire("I")
}
O(){
	_autofire("O")
}
P(){
	_autofire("P")
}
LeftBracket(){
	_autofire("[")
}
RightBracket(){
	_autofire("]")
}
Backslash(){
	_autofire("\")
}
Caps(){
	_autofire("CapsLock")
}
A(){
	_autofire("A")
}
S(){
	_autofire("S")
}
D(){
	_autofire("D")
}
F(){
	_autofire("F")
}
G(){
	_autofire("G")
}
H(){
	_autofire("H")
}
J(){
	_autofire("J")
}
K(){
	_autofire("K")
}
L(){
	_autofire("L")
}
Semicolon(){
	_autofire(";")
}
QuotationMark(){
	_autofire("'")
}
Enter(){
	_autofire("Enter")
}
LShift(){
	_autofire("LShift")
}
Z(){
	_autofire("Z")
}
C(){
	_autofire("C")
}
V(){
	_autofire("V")
}
B(){
	_autofire("B")
}
N(){
	_autofire("N")
}
M(){
	_autofire("M")
}
Comma(){
	_autofire(",")
}
Period(){
	_autofire(".")
}
Slash(){
	_autofire("/")
}
RShift(){
	_autofire("RShift")
}
LCtrl(){
	_autofire("LCtrl")
}
LAlt(){
	_autofire("LAlt")
}
Space(){
	_autofire("Space")
}
RAlt(){
	_autofire("RAlt")
}
RCtrl(){
	_autofire("RCtrl")
}
PrtSc(){
	_autofire("PrintScreen")
}
ScrLk(){
	_autofire("ScrollLock")
}
Pause(){
	_autofire("Pause")
}
Ins(){
	_autofire("Insert")
}
Home(){
	_autofire("Home")
}
PgUp(){
	_autofire("PgUp")
}
Del(){
	_autofire("Delete")
}
End(){
	_autofire("End")
}
PgDn(){
	_autofire("PgDn")
}
Up(){
	_autofire("Up")
}
Down(){
	_autofire("Down")
}
Left(){
	_autofire("Left")
}
Right(){
	_autofire("Right")
}
Num1(){
	_autofire("Numpad1")
}
Num2(){
	_autofire("Numpad2")
}
Num3(){
	_autofire("Numpad3")
}
Num4(){
	_autofire("Numpad4")
}
Num5(){
	_autofire("Numpad5")
}
Num6(){
	_autofire("Numpad6")
}
Num7(){
	_autofire("Numpad7")
}
Num8(){
	_autofire("Numpad8")
}
Num9(){
	_autofire("Numpad9")
}
Num0(){
	_autofire("Numpad0")
}
NumPeriod(){
	_autofire("NumpadDot")
}
NumLk(){
	_autofire("NumLock")
}
NumEnter(){
	_autofire("NumpadEnter")
}
umAdd(){
	_autofire("NumpadAdd")
}
NumSub(){
	_autofire("NumpadSub")
}
NumStar(){
	_autofire("NumpadMult")
}
NumSlash(){
	_autofire("NumpadDiv")
}

_autofire(key){
	base := "vkFFsc"
	sc := GetKeySC(key)
	keycode := Format("{1}{2:02X}", base, sc)
	loop {
		if(WinActive("ahk_class 地下城与勇士") or WinActive("ahk_exe DNF.exe")){
		if (GetKeyState(key,"P")) {
			Send,{Blind}{%keycode% down}{%keycode% up}
			Sleep,1
		}
	}
}
}