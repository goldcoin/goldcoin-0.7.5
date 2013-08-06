rmdir /s /Q obj
del gldcoind.exe
mkdir obj
mingw32-make -f makefile.mingw STATIC=1
strip gldcoind.exe
pause