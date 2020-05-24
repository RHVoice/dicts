setlocal EnableDelayedExpansion
@echo off
chcp
chcp 65001
chcp 65001 > nul
@echo #
@echo # 

@echo # C:\Users\####\AppData\Roaming\RHVoice\dicts\Ukrainian
@echo # mkdir %AppData%\RHVoice\dicts\Russian
@echo # mkdir %AppData%\RHVoice\dicts\Ukrainian
set FolderTEMP=temp
@echo # mkdir !FolderTEMP!
mkdir !FolderTEMP!
mkdir %AppData%\RHVoice\dicts\Russian
mkdir %AppData%\RHVoice\dicts\Ukrainian
@echo #
@echo # curl -o "!FolderTEMP!\unzip.exe"        -LJO http://stahlworks.com/dev/unzip.exe
@echo # curl -o "!FolderTEMP!\dicts-master.zip" -LJO https://github.com/RHVoice/dicts/archive/master.zip
curl -o "!FolderTEMP!\unzip.exe" -LJO http://stahlworks.com/dev/unzip.exe
curl -o "!FolderTEMP!\dicts-master.zip" -LJO https://github.com/RHVoice/dicts/archive/master.zip
@echo #
REM mkdir !FolderTEMP!\git
@echo #
@echo # !FolderTEMP!\unzip.exe "!FolderTEMP!\dicts-master.zip" "!FolderTEMP!"
!FolderTEMP!\unzip.exe -l "!FolderTEMP!\dicts-master.zip" "!FolderTEMP!"
@echo #
@echo # 
@echo #
@echo # 
@echo #
@echo # 








cmd -k
