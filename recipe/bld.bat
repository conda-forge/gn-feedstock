set c_compiler=clang
set cxx_compiler=clang++
python build/gen.py
ninja -C out
mkdir -p %LIBRARY_PREFIX%/bin
xcopy out/gn.exe %LIBRARY_PREFIX%/bin/gn.exe
