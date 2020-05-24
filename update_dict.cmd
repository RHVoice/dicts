setlocal EnableDelayedExpansion
@echo off
chcp
chcp 65001
chcp 65001 > nul

@echo # 
@echo #################################################
@echo # ; 
@echo # ; This dictionary for Ukrainian voices which are part of RHVoice Speech Synthesizer (https://github.com/Olga-Yakovleva/RHVoice) OR (https://github.com/RHVoice) contains the rules for the correct pronunciation of Ukrainian words and abbreviations.
@echo # ; This dictionary is distributed under LGPL v2.1 or later.
@echo # ; Copyright (C) 2020 DictionaryTeam (https://github.com/RHVoice)
@echo # ; DictionaryTeam:
@echo # ; ANT Berezhnyi # velmyshanovnyi@gmail.com # www.t.me/velmyshanovnyi #
@echo # ; 
@echo # ; ----- WINDOWS -----
@echo # ; 1) У вас вже має бути заінстальований реліз RHVoice. Брати тут: 
@echo # ; https://github.com/Olga-Yakovleva/RHVoice/releases
@echo # ; 
@echo # ; 2) щоб оновити словники запустіть 
@echo # ; "update_dict.cmd"
@echo # ; 
@echo #################################################


@echo # 
@echo # задаємо змінну для тимчасової папки.
@echo # 
set FolderTEMP=temp
@echo # 
@echo # "для профілактики" видаляємо тимчасову папку (щоб не трапились збої).
@echo # rmdir /s/q !FolderTEMP!
@echo # 
rmdir /s/q !FolderTEMP!
@echo # 
@echo # створюємо тимчасову папку
@echo # mkdir !FolderTEMP!
@echo # 
mkdir !FolderTEMP!
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
@echo # curl -o "!FolderTEMP!\unzip.exe"        -LJO http://stahlworks.com/dev/unzip.exe
@echo # curl -o "!FolderTEMP!\dicts-master.zip" -LJO https://github.com/RHVoice/dicts/archive/master.zip
curl -o "!FolderTEMP!\unzip.exe" -LJO http://stahlworks.com/dev/unzip.exe
curl -o "!FolderTEMP!\dicts-master.zip" -LJO https://github.com/RHVoice/dicts/archive/master.zip
@echo #
@echo # розархівовуємо словники в тимчасову папку: !FolderTEMP! 
@echo # !FolderTEMP!\unzip.exe "!FolderTEMP!\dicts-master.zip" -d "!FolderTEMP!"
@echo #
!FolderTEMP!\unzip.exe "!FolderTEMP!\dicts-master.zip" -d "!FolderTEMP!"
@echo # 
@echo #
@echo # переміщуємо словникм із тимчасової папки в системну
@echo # move /y "!FolderTEMP!\dicts-master\AppData\Roaming\RHVoice\dicts\LANG\*.*" "%AppData%\RHVoice\dicts\LANG"
@echo # 
move /y "!FolderTEMP!\dicts-master\AppData\Roaming\RHVoice\dicts\Russian\*.*" "%AppData%\RHVoice\dicts\Russian"
move /y "!FolderTEMP!\dicts-master\AppData\Roaming\RHVoice\dicts\Ukrainian\*.*" "%AppData%\RHVoice\dicts\Ukrainian"
@echo #
@echo #
@echo # Перевірка конфігураційних файлів, якщо нема - створити, якщо є - залишити такими як є.
@echo #
@echo # RHVoice.conf
@echo # RHVoice.ini

if not exist "%AppData%\RHVoice\RHVoice.conf" ( move /y "!FolderTEMP!\dicts-master\AppData\Roaming\RHVoice\RHVoice.conf" "%AppData%\RHVoice" )
if not exist "%AppData%\RHVoice\RHVoice.ini"  ( move /y "!FolderTEMP!\dicts-master\AppData\Roaming\RHVoice\RHVoice.ini"  "%AppData%\RHVoice" )
@echo # 


@echo # 
@echo # оновлення версії самого скрипта
if not exist "%FolderTEMP%\update_script.cmd" ( goto :updateScript )




:updateScriptEnd
@echo # 
@echo # по закінченню роботи скрипта, видаляємо тимчасову папку.
@echo # rmdir /s/q !FolderTEMP!
@echo # 
REM if exist "%FolderTEMP%\update_script.cmd" ( #rmdir /s/q !FolderTEMP! )
@echo # 


@echo # 
@echo ########################################################
@echo ########################################################
@echo ###                                                  ###
@echo ### СЛОВНИКИ ОНОВЛЕНО ДО ОСТАННЬОЇ АКТУАЛЬНОЇ ВЕРСІЇ ###
@echo ###                                                  ###
@echo ### ------------------------------------------------ ###
@echo ### версія скрипта від : 20200524                    ###
@echo ### версія словників   : по даті оновлення на GitHub ###
@echo ### https://github.com/RHVoice/dicts                 ###
@echo ### ------------------------------------------------ ###
@echo ### якщо є потреба виправити ще якісь слова, то:     ###
@echo ###                                                  ###
@echo ### напиши їх в телеграм групу:                      ###
@echo ### https://t.me/RHVoice                             ###
@echo ###                                                  ###
@echo ### зроби коміт на гітхабі:                          ###
@echo ### https://github.com/RHVoice/dicts                 ###
@echo ###                                                  ###
@echo ### оформи запит на гітхабі:                         ###
@echo ### https://github.com/RHVoice/dicts/issues          ###
@echo ###                                                  ###
@echo ########################################################
@echo ########################################################
@echo #
@echo # 


cmd -k


:updateScript
@echo off&echo->"%FolderTEMP%\update_script.cmd"
@echo. if exist "update_script.cmd" ( goto :gotoStart )                                    >>"%FolderTEMP%\update_script.cmd"
@echo. :gotoEnd                                                                            >>"%FolderTEMP%\update_script.cmd"
@echo.                                                                                     >>"%FolderTEMP%\update_script.cmd"
@echo.  .\update_dict.cmd"                                                                 >>"%FolderTEMP%\update_script.cmd"
@echo.                                                                                     >>"%FolderTEMP%\update_script.cmd"
@echo. :gotoStart                                                                          >>"%FolderTEMP%\update_script.cmd"
@echo. copy /y "dicts-master\update_dict.cmd" ".\update_dict-01.cmd"                       >>"%FolderTEMP%\update_script.cmd"
@echo. goto :gotoEnd                                                                       >>"%FolderTEMP%\update_script.cmd"


goto :updateScriptEnd



