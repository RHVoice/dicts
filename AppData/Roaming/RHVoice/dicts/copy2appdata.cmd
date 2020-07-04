@echo off
setlocal EnableDelayedExpansion
chcp
chcp 65001
REM chcp 65001 > nul
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
@echo #
@echo # копіюємо словникм із тимчасової папки в системну
@echo # copy /y "LANG\*.*" "%AppData%\RHVoice\dicts\LANG"
@echo #
copy /y "Russian\*.*" "%AppData%\RHVoice\dicts\Russian"
copy /y "Ukrainian\*.*" "%AppData%\RHVoice\dicts\Ukrainian"
@echo #


@echo #
@echo #
@echo # ######################################################
@echo # ##                                                  ##
@echo # ## СЛОВНИКИ ОНОВЛЕНО ДО ОСТАННЬОЇ АКТУАЛЬНОЇ ВЕРСIЇ ##
@echo # ## (якщо не оновилось не все, запусти повторно)     ##
@echo # ##                                                  ##
@echo # ## ------------------------------------------------ ##
@echo # ## версiя скрипта вiд : 20200701-0001               ##
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
REM cmd -k
exit

