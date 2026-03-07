@echo off
echo =======================================================
echo KVJ Analytics Photo Carousel Updater
echo =======================================================
echo.
echo This script will automatically rename all photos in the
echo "India" and "International" folders to sequential names 
echo (1.jpg, 2.jpg...) so they appear correctly on the website.
echo.

:: Rename India photos
echo Processing India folder...
powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "$ErrorActionPreference = 'SilentlyContinue'; $folder = '.\assets\Photos\India'; $i = 1; Get-ChildItem -Path $folder -File | Where-Object { $_.Extension -match '\.(jpg|jpeg|png|webp|JPG|JPEG|PNG|WEBP)$' } | Sort-Object Name | ForEach-Object { $newName = \"$i$($_.Extension)\"; $tempName = \"temp_$i$($_.Extension)\"; Rename-Item $_.FullName -NewName $tempName; $i++ }; $i = 1; Get-ChildItem -Path $folder -File -Filter 'temp_*' | ForEach-Object { $newName = \"$i$($_.Extension)\"; Rename-Item $_.FullName -NewName $newName; $i++ }"
echo Done.
echo.

:: Rename International photos
echo Processing International folder...
powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "$ErrorActionPreference = 'SilentlyContinue'; $folder = '.\assets\Photos\International'; $i = 1; Get-ChildItem -Path $folder -File | Where-Object { $_.Extension -match '\.(jpg|jpeg|png|webp|JPG|JPEG|PNG|WEBP)$' } | Sort-Object Name | ForEach-Object { $newName = \"$i$($_.Extension)\"; $tempName = \"temp_$i$($_.Extension)\"; Rename-Item $_.FullName -NewName $tempName; $i++ }; $i = 1; Get-ChildItem -Path $folder -File -Filter 'temp_*' | ForEach-Object { $newName = \"$i$($_.Extension)\"; Rename-Item $_.FullName -NewName $newName; $i++ }"
echo Done.
echo.

echo =======================================================
echo Update Complete!
echo You can now refresh the training.html page in your browser.
echo =======================================================
pause
