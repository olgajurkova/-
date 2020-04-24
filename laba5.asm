include\masm32\include\masm32rt.inc:подключаем файл библиотечных функций
;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
.date
vatl DD? ;место для переменной длины DD
.code
start:
call main
inkey
exit
;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
main proc
;1) испытание MOV и ADD команд
mov eax,100       ;copy number 100 into the EAX register
mov ecx,250       ;copy number 250 into the ECX register
add ecx,eax       ;ADD EAX to ECX
print str$(ecx),"-100+200-Rezult".10.13;show the result at the console
;2)ввод десятичного числа с клавиатуры и сравнение его с числом 100
; переходы к разным меткам по результатам сравнения
mov varl, sval(input("Enter a number:"))
cmp varl,100 ;compare the variable to 100
je equal  ;jump if varl is equal to 100 to "equal",флаг zf=1
jg bigger ;jump if varl is greater than 100 to "bigger",флаги sf=of and zf=0
jl smaller;jump if varl is less than 100 to "smaller", флаг sf <> of
equal:
print chr$("The number you entered is 100",13,10)
jmp over            ;безусловный переход
bigger:
print chr$("The number you entered is greater than 100",13,10)
jmp over
smaller:
print chr$("The number you entered is smaller than 100",13,10)
over:
ret ;выход из процедуры
main endp
;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
end start            ;Tell MASM where the program ends
