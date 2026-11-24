@echo on

python build/gen.py
if errorlevel 1 exit 1

REM Only build gn itself: the default target also runs check scripts that need a POSIX shell and cipd.
ninja -C out gn.exe
if errorlevel 1 exit 1

mkdir %PREFIX%\bin

echo "Copying Binaries"
copy out\gn.exe %PREFIX%\bin\gn.exe

