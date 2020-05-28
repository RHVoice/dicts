setlocal EnableDelayedExpansion
@echo off
chcp
chcp 65001
chcp 65001 > nul

@echo # 
@echo #################################################
@echo # 
@echo # This dictionary updater for RHVoice Speech Synthesizer
@echo # (https://github.com/Olga-Yakovleva/RHVoice) 
@echo # OR (https://github.com/RHVoice) 
@echo #  
@echo # This updater is distributed under LGPL v2.1 or later.
@echo # Copyright (C) 2020 DictionaryTeam (https://github.com/RHVoice)
@echo # DictionaryTeam:
@echo # ANT Berezhnyi # velmyshanovnyi@gmail.com # www.t.me/velmyshanovnyi #
@echo #  
@echo # ----- WINDOWS -----
@echo # 1) У вас вже має бути заінстальований реліз RHVoice. Брати тут: 
@echo # https://github.com/Olga-Yakovleva/RHVoice/releases
@echo # 
@echo # 2) щоб оновити словники запустіть 
@echo # "update_dict.cmd"
@echo # 
@echo #################################################


@echo # 
REM @echo # задаємо змінну для тимчасової папки.
@echo # 
set FolderTEMP=temp
@echo # 
REM @echo #  # друга фаза оновлення версії самого скрипта
REM @echo # if exist "%FolderTEMP%\update_script.cmd" ( goto :updateScriptC )
@echo # 
if exist "%FolderTEMP%\update_script.cmd" ( goto :updateScriptC ) 




@echo # "для профілактики" видаляємо тимчасову папку (щоб не трапились збої).
@echo # rmdir /s/q %FolderTEMP%
@echo # 
rmdir /s/q %FolderTEMP%
@echo # 
@echo # створюємо тимчасову папку
@echo # mkdir %FolderTEMP%
@echo # 
mkdir %FolderTEMP%
@echo # 
@echo # "для профілактики" створюємо системні папки із словниками (в разі якщо їх нема).
@echo # C:\Users\####\AppData\Roaming\RHVoice\dicts\Russian
@echo # C:\Users\####\AppData\Roaming\RHVoice\dicts\Ukrainian
@echo # mkdir %AppData%\RHVoice\dicts\Russian
@echo # mkdir %AppData%\RHVoice\dicts\Ukrainian
@echo # 
mkdir %AppData%\RHVoice\dicts\Russian
mkdir %AppData%\RHVoice\dicts\Ukrainian
@echo #
@echo # curl -o "%FolderTEMP%\unzip.exe"        -LJO http://stahlworks.com/dev/unzip.exe
@echo # curl -o "%FolderTEMP%\dicts-master.zip" -LJO https://github.com/RHVoice/dicts/archive/master.zip
curl -o "%FolderTEMP%\unzip.exe" -LJO http://stahlworks.com/dev/unzip.exe
curl -o "%FolderTEMP%\dicts-master.zip" -LJO https://github.com/RHVoice/dicts/archive/master.zip
@echo # 
@echo # розархівовуємо словники в тимчасову папку: %FolderTEMP% 
@echo # %FolderTEMP%\unzip.exe "%FolderTEMP%\dicts-master.zip" -d "%FolderTEMP%"
@echo # 
%FolderTEMP%\unzip.exe "%FolderTEMP%\dicts-master.zip" -d "%FolderTEMP%"
@echo # 
@echo # 


@echo # переміщуємо словникм із тимчасової папки в системну
@echo # move /y "%FolderTEMP%\dicts-master\AppData\Roaming\RHVoice\dicts\LANG\*.*" "%AppData%\RHVoice\dicts\LANG"
@echo # 
move /y "%FolderTEMP%\dicts-master\AppData\Roaming\RHVoice\dicts\Russian\*.*" "%AppData%\RHVoice\dicts\Russian"
move /y "%FolderTEMP%\dicts-master\AppData\Roaming\RHVoice\dicts\Ukrainian\*.*" "%AppData%\RHVoice\dicts\Ukrainian"
@echo # 
@echo # Перевірка конфігураційних файлів, якщо нема - створити, якщо є - залишити такими як є.
@echo # 
@echo # RHVoice.conf
@echo # RHVoice.ini
if not exist "%AppData%\RHVoice\RHVoice.conf" ( move /y "%FolderTEMP%\dicts-master\AppData\Roaming\RHVoice\RHVoice.conf" "%AppData%\RHVoice" )
if not exist "%AppData%\RHVoice\RHVoice.ini"  ( move /y "%FolderTEMP%\dicts-master\AppData\Roaming\RHVoice\RHVoice.ini"  "%AppData%\RHVoice" )
@echo # 

@echo # 
@echo # оновлення версії самого скрипта
@echo # if not exist "%FolderTEMP%\update_script.cmd" ( goto :updateScriptA )
if not exist "%FolderTEMP%\update_script.cmd" ( goto :updateScriptA )


:updateScriptC


@echo # 
REM @echo # по закінченню роботи скрипта, видаляємо тимчасову папку.
REM @echo # if exist "%FolderTEMP%\update_script.cmd" ( rmdir /s/q %FolderTEMP% )
@echo # 
REM if exist "%FolderTEMP%\update_script.cmd" ( rmdir /s/q %FolderTEMP% )
rmdir /s/q %FolderTEMP%
@echo # 

@echo # 
@echo ########################################################
@echo ########################################################
@echo ###                                                  ###
@echo ### СЛОВНИКИ ОНОВЛЕНО ДО ОСТАННЬОЇ АКТУАЛЬНОЇ ВЕРСIЇ ###
@echo ###                                                  ###
@echo ### ------------------------------------------------ ###
@echo ### версiя скрипта вiд : 20200528-0625               ###
@echo ### версiя словникiв   : по датi оновлення на GitHub ###
@echo ### https://github.com/RHVoice/dicts                 ###
@echo ### ------------------------------------------------ ###
@echo ### якщо є потреба виправити ще якiсь слова, то:     ###
@echo ###                                                  ###
@echo ### напиши їх в телеграм групу:                      ###
@echo ### https://t.me/RHVoice                             ###
@echo ###                                                  ###
@echo ### зроби комiт на гiтхабi:                          ###
@echo ### https://github.com/RHVoice/dicts                 ###
@echo ###                                                  ###
@echo ### оформи запит на гiтхабi:                         ###
@echo ### https://github.com/RHVoice/dicts/issues          ###
@echo ###                                                  ###
@echo ########################################################
@echo ########################################################
@echo #




cmd -k



:updateScriptA
set "skobkaL=<"
set "skobkaR=>"
echo setlocal EnableDelayedExpansion>"%FolderTEMP%\update_script.cmd"
echo chcp>>"%FolderTEMP%\update_script.cmd"
echo chcp 65001>>"%FolderTEMP%\update_script.cmd"
echo if exist "%FolderTEMP%\update_script.cmd" ( goto :gotoStartUpdate )>>"%FolderTEMP%\update_script.cmd"
echo :gotoEndUpdate>>"%FolderTEMP%\update_script.cmd"
REM технологічна ПАУЗА для того щоб тестити валідність відпрацьовки скрипта.
REM echo pause >>"%FolderTEMP%\update_script.cmd"

echo start "update_dict" "update_dict.cmd">>"%FolderTEMP%\update_script.cmd"
echo.>>"%FolderTEMP%\update_script.cmd"
echo @echo # END 2 EXIT 2 END 2 EXIT 2 END>>"%FolderTEMP%\update_script.cmd"
REM технологічна ПАУЗА для того щоб тестити валідність відпрацьовки скрипта.
REM echo pause >>"%FolderTEMP%\update_script.cmd"
echo exit>>"%FolderTEMP%\update_script.cmd"

REM технологічна ЗУПИНКА для того щоб тестити валідність відпрацьовки скрипта.
REM echo cmd -k>>"%FolderTEMP%\update_script.cmd"
echo.>>"%FolderTEMP%\update_script.cmd"

echo :gotoStartUpdate>>"%FolderTEMP%\update_script.cmd"
echo echo setlocal EnableDelayedExpansion!skobkaR!"%FolderTEMP%\update_dict_temp.cmd">"%FolderTEMP%\update_script.cmd"
REM echo echo off&echo-!skobkaR!"%FolderTEMP%\update_dict_temp.cmd">>"%FolderTEMP%\update_script.cmd"
echo type "%FolderTEMP%\dicts-master\update_dict.cmd"!skobkaR!!skobkaR!"%FolderTEMP%\update_dict_temp.cmd">>"%FolderTEMP%\update_script.cmd"
echo del /q "update_dict.cmd">>"%FolderTEMP%\update_script.cmd"
echo copy /y "%FolderTEMP%\update_dict_temp.cmd" "update_dict.cmd">>"%FolderTEMP%\update_script.cmd"
echo goto :gotoEndUpdate>>"%FolderTEMP%\update_script.cmd"
goto :updateScriptB


:updateScriptB


@echo # END 1 EXIT 1 END 1 EXIT 1 END 1 EXIT 1 END 1 EXIT
start "update_script" "%FolderTEMP%\update_script.cmd"
REM технологічна ПАУЗА для того щоб тестити валідність відпрацьовки скрипта.
REM pause
exit
