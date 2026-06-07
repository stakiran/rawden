@echo off
setlocal

set path_7z="C:\Program Files\7-Zip\7z.exe"
set outdir=docs
set thisdir=%~dp0

set DIST_FOLDER_FULLPATH=%thisdir%%outdir%

mkdir %DIST_FOLDER_FULLPATH%

pandoc -f markdown -t html --standalone -c stylesheet.css index.md title.txt -o %DIST_FOLDER_FULLPATH%\index.html --toc --toc-depth=2 --template=template.html

copy stylesheet.css %DIST_FOLDER_FULLPATH%
xcopy images %DIST_FOLDER_FULLPATH%\images /Y /S /E /I
xcopy assets %DIST_FOLDER_FULLPATH%\assets /Y /S /E /I
