@echo off
setlocal EnableDelayedExpansion
chcp
chcp 65001
REM chcp 65001 > nul
@echo #################################################
@echo #
@echo # This dictionary updater for RHVoice Speech Synthesizer
@echo # https://github.com/RHVoice
@echo #
@echo # This updater is distributed under LGPL v2.1 or later.
@echo # Copyright (C) 2020-2021 DictionaryTeam (https://github.com/RHVoice/dicts)
@echo # DictionaryTeam:
@echo # ANT Berezhnyi # velmyshanovnyi@gmail.com # www.t.me/velmyshanovnyi #
@echo #
@echo # ----- WINDOWS -----
@echo # 1) У вас має бути вже заiнстальований релiз RHVoice. Брати тут:
@echo # https://github.com/RHVoice/RHVoice/releases
@echo #
@echo # 2) щоб повторно оновлювати словники запускай
@echo # "update_dict.cmd"
@echo #
@echo #################################################
@echo #
REM @echo # задаємо змінну для тимчасової папки.
@echo #
set "FolderTEMP=temp"
@echo #
REM @echo #  # друга фаза оновлення версії самого скрипта
REM @echo # if exist "%FolderTEMP%\update_script.cmd" ( goto :updateScriptC )
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

@echo #
@echo # "для профілактики" створюємо системні папки мов (на випадок їх відсутності) для словників (в разі якщо їх теж ще нема).
@echo # C:\Users\#####\AppData\Roaming\RHVoice\dicts\LANG
@echo # mkdir %AppData%\RHVoice\dicts\LANG
@echo #
mkdir "%AppData%\RHVoice\dicts\Brazilian-Portuguese"
mkdir "%AppData%\RHVoice\dicts\English"
mkdir "%AppData%\RHVoice\dicts\Esperanto"
mkdir "%AppData%\RHVoice\dicts\Georgian"
mkdir "%AppData%\RHVoice\dicts\Kyrgyz"
mkdir "%AppData%\RHVoice\dicts\Russian"
mkdir "%AppData%\RHVoice\dicts\Tatar"
mkdir "%AppData%\RHVoice\dicts\Ukrainian"
@echo #

@echo #
@echo # завантажуємо утиліту для консольної розпаковки
@echo # curl -o "%FolderTEMP%\unzip.exe" -LJO http://stahlworks.com/dev/unzip.exe
@echo # завантажуємо архів останної версії скрипта
@echo # curl -o "%FolderTEMP%\dicts-master.zip" -LJO https://github.com/RHVoice/dicts/archive/master.zip
@echo #
curl -o "%FolderTEMP%\unzip.exe" -LJO http://stahlworks.com/dev/unzip.exe
curl -o "%FolderTEMP%\dicts-master.zip" -LJO https://github.com/RHVoice/dicts/archive/master.zip
@echo #

@echo #
@echo # створюємо папки мов в тимчасоввій папці "%FolderTEMP%"
mkdir %FolderTEMP%\RHVoice\Brazilian-Portuguese
mkdir %FolderTEMP%\RHVoice\English
mkdir %FolderTEMP%\RHVoice\Esperanto
mkdir %FolderTEMP%\RHVoice\Georgian
mkdir %FolderTEMP%\RHVoice\Kyrgyz
mkdir %FolderTEMP%\RHVoice\Russian
mkdir %FolderTEMP%\RHVoice\Tatar
mkdir %FolderTEMP%\RHVoice\Ukrainian
@echo #

@echo #
@echo # завантажуємо системні/дефолтові словники для мов із https://github.com/RHVoice
@echo # сторінки наявних словників:
@echo # https://github.com/RHVoice/Brazilian-Portuguese/blob/main/userdict/src/dict.txt
@echo # https://github.com/RHVoice/Ukrainian/blob/main/userdict/src/dictionary.txt
@echo # що фізично знаходяться тут:
@echo # https://raw.githubusercontent.com/RHVoice/Brazilian-Portuguese/main/userdict/src/dict.txt
@echo # https://raw.githubusercontent.com/RHVoice/Ukrainian/main/userdict/src/dictionary.txt
@echo # 
curl -o "%FolderTEMP%\RHVoice\Brazilian-Portuguese\dict_pt.txt" -LJO https://raw.githubusercontent.com/RHVoice/Brazilian-Portuguese/main/userdict/src/dict.txt
curl -o "%FolderTEMP%\RHVoice\English\dict_en.txt"   -LJO https://raw.githubusercontent.com/RHVoice/English/main/userdict/src/dict.txt
curl -o "%FolderTEMP%\RHVoice\Esperanto\dict_eo.txt" -LJO https://raw.githubusercontent.com/RHVoice/Esperanto/main/userdict/src/dict.txt
curl -o "%FolderTEMP%\RHVoice\Georgian\dict_ge.txt"  -LJO https://raw.githubusercontent.com/RHVoice/Georgian/main/userdict/src/dict.txt
curl -o "%FolderTEMP%\RHVoice\Kyrgyz\dict_ky.txt"    -LJO https://raw.githubusercontent.com/RHVoice/Kyrgyz/main/userdict/src/dict.txt
curl -o "%FolderTEMP%\RHVoice\Russian\dict_ru.txt"   -LJO https://raw.githubusercontent.com/RHVoice/Russian/main/userdict/src/dict.txt
curl -o "%FolderTEMP%\RHVoice\Tatar\dict_tt.txt"     -LJO https://raw.githubusercontent.com/RHVoice/Tatar/main/userdict/src/dict.txt
curl -o "%FolderTEMP%\RHVoice\Ukrainian\dict_uk.txt" -LJO https://raw.githubusercontent.com/RHVoice/Ukrainian/main/userdict/src/dictionary.txt
@echo #

@echo #
@echo # розархівовуємо словники в тимчасову папку: %FolderTEMP%
@echo # %FolderTEMP%\unzip.exe "%FolderTEMP%\dicts-master.zip" -d "%FolderTEMP%"
@echo #
%FolderTEMP%\unzip.exe "%FolderTEMP%\dicts-master.zip" -d "%FolderTEMP%"
@echo #

@echo #
@echo # копіюємо завантажені словники із тимчасової папки в системну:
@echo # copy /y "%FolderTEMP%\dicts-master\AppData\Roaming\RHVoice\dicts\LANG\*.txt" "%AppData%\RHVoice\dicts\LANG"
@echo #
copy /y "%FolderTEMP%\dicts-master\AppData\Roaming\RHVoice\dicts\Brazilian-Portuguese\*.txt" "%AppData%\RHVoice\dicts\Brazilian-Portuguese"
copy /y "%FolderTEMP%\dicts-master\AppData\Roaming\RHVoice\dicts\English\*.txt" "%AppData%\RHVoice\dicts\English"
copy /y "%FolderTEMP%\dicts-master\AppData\Roaming\RHVoice\dicts\Esperanto\*.txt" "%AppData%\RHVoice\dicts\Esperanto"
copy /y "%FolderTEMP%\dicts-master\AppData\Roaming\RHVoice\dicts\Georgian\*.txt" "%AppData%\RHVoice\dicts\Georgian"
copy /y "%FolderTEMP%\dicts-master\AppData\Roaming\RHVoice\dicts\Kyrgyz\*.txt" "%AppData%\RHVoice\dicts\Kyrgyz"
copy /y "%FolderTEMP%\dicts-master\AppData\Roaming\RHVoice\dicts\Russian\*.txt" "%AppData%\RHVoice\dicts\Russian"
copy /y "%FolderTEMP%\dicts-master\AppData\Roaming\RHVoice\dicts\Tatar\*.txt" "%AppData%\RHVoice\dicts\Tatar"
copy /y "%FolderTEMP%\dicts-master\AppData\Roaming\RHVoice\dicts\Ukrainian\*.txt" "%AppData%\RHVoice\dicts\Ukrainian"
@echo # 

@echo #
@echo # УВАГА! ================================================================================ УВАГА! 
@echo # УВАГА! РОЗКОМЕНТУВАТИ в коді цього файла потрібний рядок мови ДЛЯ ЛОКАЛЬНОІ ВІДЛАДКИ!
@echo # УВАГА! при фазі оновення скрипта, розкоментований рядок буде заменено на ЗАКОМЕНТОВАНИЙ
@echo # УВАГА! це зроблено для безпеки!
@echo # УВАГА! ================================================================================ УВАГА!  
@echo # копіюємо словникм із локальної папки в системну (для тих випадків, коли словник наповнюється та правиться локально частіше ніж на Гіті)
@echo # copy /y "LANG\*.txt" "%AppData%\RHVoice\dicts\LANG"
@echo #
REM copy /y "Brazilian-Portuguese\*.txt" "%AppData%\RHVoice\dicts\Brazilian-Portuguese"
REM copy /y "English\*.txt"              "%AppData%\RHVoice\dicts\English"
REM copy /y "Esperanto\*.txt"            "%AppData%\RHVoice\dicts\Esperanto"
REM copy /y "Georgian\*.txt"             "%AppData%\RHVoice\dicts\Georgian"
REM copy /y "Kyrgyz\*.txt"               "%AppData%\RHVoice\dicts\Kyrgyz"
REM copy /y "Russian\*.txt"              "%AppData%\RHVoice\dicts\Russian"
REM copy /y "Tatar\*.txt"                "%AppData%\RHVoice\dicts\Tatar"
REM copy /y "Ukrainian\*.txt"            "%AppData%\RHVoice\dicts\Ukrainian"
@echo #


@echo #
@echo # Перевірка конфігураційних файлів, якщо нема - створити (скопіювати дефолтові), якщо є - залишити такими як є.
@echo #
@echo # RHVoice.conf
@echo # RHVoice.ini
if not exist "%AppData%\RHVoice\RHVoice.conf" ( copy /y "%FolderTEMP%\dicts-master\AppData\Roaming\RHVoice\RHVoice.conf" "%AppData%\RHVoice" )
if not exist "%AppData%\RHVoice\RHVoice.ini"  ( copy /y "%FolderTEMP%\dicts-master\AppData\Roaming\RHVoice\RHVoice.ini"  "%AppData%\RHVoice" )
@echo #


@echo #
@echo # оновлення версії самого скрипта
@echo # if not exist "%FolderTEMP%\update_script.cmd" ( goto :updateScriptA )
if not exist "%FolderTEMP%\update_script.cmd" ( goto :updateScriptA )
:updateScriptC
@echo #
@echo #
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
@echo # ## версiя скрипта вiд : 20210118-0002               ##
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
echo if exist "%FolderTEMP%\dicts-master\update_dict.cmd" ( del /q "update_dict.cmd" )>>"%FolderTEMP%\update_script.cmd"
echo for /f "delims=" %%%%x in (%FolderTEMP%\dicts-master\update_dict.cmd) do echo %%%%x %%skobkaR%%%%skobkaR%%"update_dict.cmd">>"%FolderTEMP%\update_script.cmd"
echo goto :gotoUpdateEnd>>"%FolderTEMP%\update_script.cmd"
goto :updateScriptB
:updateScriptB
@echo # END 1 EXIT 1 END 1 EXIT 1 END
start "update_script" "%FolderTEMP%\update_script.cmd"
REM END блок автооновлення скрипта
exit
