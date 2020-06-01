@echo off
setlocal EnableDelayedExpansion
@chcp
@chcp 65001
@echo #################################################
@echo #
@echo # Це iнсталятор скрипта для оновлення словникiв 
@echo # RHVoice Speech Synthesizer
@echo # https://github.com/Olga-Yakovleva/RHVoice
@echo # джерело iнсталятора: https://github.com/RHVoice
@echo #
@echo # This updater is distributed under LGPL v2.1 or later.
@echo # Copyright (C) 2020 DictionaryTeam (https://github.com/RHVoice)
@echo # DictionaryTeam:
@echo # ANT Berezhnyi # velmyshanovnyi@gmail.com # www.t.me/velmyshanovnyi #
@echo #
@echo # ----- WINDOWS -----
@echo # 1) У вас має бути вже заiнстальований релiз RHVoice. Брати тут:
@echo # https://github.com/Olga-Yakovleva/RHVoice/releases
@echo #
@echo # 2) щоб повторно оновлювати словники запускай
@echo # "update_dict.cmd"
@echo #
@echo #################################################
@echo #
pause
REM @echo # задаємо змінну для тимчасової папки.
@echo #
@set "FolderTEMP=temp"
@echo #
@echo #
if exist "update_dict.cmd" ( goto :updateScriptD )
@echo #
@echo #
if exist "%FolderTEMP%\update_script.cmd" ( goto :updateScriptC )
@echo #
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
@echo # curl -o "update_dict.cmd" -LJO https://raw.githubusercontent.com/RHVoice/dicts/master/update_dict.cmd
curl -o "%FolderTEMP%\update_dict.cmd" -LJO https://raw.githubusercontent.com/RHVoice/dicts/master/update_dict.cmd
@echo # if not exist "update_dict.cmd" ( goto :updateScriptA )
if not exist "update_dict.cmd" ( goto :updateScriptA )


REM if exist "%FolderTEMP%\update_script.cmd" ( rmdir /s/q %FolderTEMP% )
rmdir /s/q %FolderTEMP%
@echo #
@echo #
@echo # ######################################################
@echo # ##                                                  ##
@echo # ## СЛОВНИКИ ОНОВЛЕНО ДО ОСТАННЬОЇ АКТУАЛЬНОЇ ВЕРСIЇ ##
@echo # ## (якщо не оновилось не все, запусти повторно)     ##
@echo # ##                                                  ##
@echo # ## ------------------------------------------------ ##
@echo # ## версiя скрипта вiд : 20200601-0001               ##
@echo # ## версiя словникiв   : по датi оновлення на GitHub ##
@echo # ## https://github.com/RHVoice/dicts                 ##
@echo # ## ------------------------------------------------ ##
@echo # ## якщо є потреба виправити ще якiсь слова, то:     ##
@echo # ##                                                  ##
@echo # ## напиши їх в телеграм групу:                      ##
@echo # ## https://t.me/RHVoice                             ##
@echo # ##                                                  ##
@echo # ## зроби комiт на гiтхабi:                          ##
@echo # ## https://github.com/RHVoice/dicts                 ##
@echo # ##                                                  ##
@echo # ## оформи запит на гiтхабi:                         ##
@echo # ## https://github.com/RHVoice/dicts/issues          ##
@echo # ##                                                  ##
@echo # ######################################################
@echo #
@echo #
cmd -k
:updateScriptA
REM START блок автооновлення скрипта
REM https://raw.githubusercontent.com/RHVoice/dicts/master/update_dict.cmd
echo setlocal EnableDelayedExpansion>"%FolderTEMP%\update_script.cmd"
echo set "skobkaL=<" >>"%FolderTEMP%\update_script.cmd"
echo set "skobkaR=>" >>"%FolderTEMP%\update_script.cmd"
echo chcp>>"%FolderTEMP%\update_script.cmd"
echo chcp 65001>>"%FolderTEMP%\update_script.cmd"
echo if exist "%FolderTEMP%\update_script.cmd" ( goto :gotoUpdateStart )>>"%FolderTEMP%\update_script.cmd"
echo :gotoUpdateEnd>>"%FolderTEMP%\update_script.cmd"
echo start "update_dict" "update_dict.cmd">>"%FolderTEMP%\update_script.cmd"
echo @echo # END 2 EXIT 2 END 2 EXIT 2 END>>"%FolderTEMP%\update_script.cmd"
echo exit>>"%FolderTEMP%\update_script.cmd"
echo.>>"%FolderTEMP%\update_script.cmd"
echo :gotoUpdateStart>>"%FolderTEMP%\update_script.cmd"
echo if exist "%FolderTEMP%\update_dict.cmd" ( del /q "update_dict.cmd" )>>"%FolderTEMP%\update_script.cmd"
echo for /f "delims=" %%%%x in (%FolderTEMP%\update_dict.cmd) do echo %%%%x %%skobkaR%%%%skobkaR%%"update_dict.cmd">>"%FolderTEMP%\update_script.cmd"
echo goto :gotoUpdateEnd>>"%FolderTEMP%\update_script.cmd"
goto :updateScriptB
:updateScriptB
@echo # END 1 EXIT 1 END 1 EXIT 1 END
start "update_script" "%FolderTEMP%\update_script.cmd"
REM END блок автооновлення скрипта
exit

:updateScriptD
@echo #
@echo #
@echo #
@echo # ######################################################
@echo # ##                                                  ##
@echo # ## IНСТАЛЯЦIЮ ВЖЕ БУЛО ВИКОНАНО...                  ##
@echo # ##                                                  ##
@echo # ## якщо її потiбно виконати повторно, то спочатку   ##
@echo # ## треба видалити файл "update_dict.cmd"            ##
@echo # ## пiсля чого запустити файл "install.cmd" ще раз   ##
@echo # ##                                                  ##
@echo # ######################################################
@echo #
@echo #
pause
exit
