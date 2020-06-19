rem Build instruction assume using WSL + Clang for Windows (with MSVC x86+x64 toolset for -m32 switch)
rem This assume NDK r19 or later. See https://github.com/LuaJIT/LuaJIT/issues/477 for more information.
rem Make sure the prebuilt is already in your PATH environment variable.
rem Also make sure lj_ircall.h.patch is applied to src/lj_ircall.h. In this repo, the patch has been
rem applied. However if you updated LuaJIT from the latest v2.1 branch, you may need to reapply it.
rem If you're confused which one should be added your path:
rem <NDK_ROOT>\toolchains\llvm\prebuilt\windows-x86_64\bin

mkdir android\arm64-v8a
mkdir android\armeabi-v7a
mkdir android\x86

rem Reset error level
ver > nul

rem ARMv8
if not exist android\arm64-v8a\libluajit.a (
	wsl make clean
	if "%ERRORLEVEL%" == "1" goto :error
	wsl make HOST_LUA=luajit HOST_CC=clang.exe HOST_CFLAGS=-D_CRT_SECURE_NO_WARNINGS CC=clang CROSS=aarch64-linux-android- STATIC_CC=aarch64-linux-android21-clang "DYNAMIC_CC=aarch64-linux-android21-clang -fPIC" "TARGET_AR=aarch64-linux-android-ar.exe rcus" TARGET_LD=aarch64-linux-android21-clang TARGET_STRIP=aarch64-linux-android-strip.exe amalg
	if "%ERRORLEVEL%" == "1" goto :error
	copy src\libluajit.a android\arm64-v8a\libluajit.a
	if "%ERRORLEVEL%" == "1" goto :error
)

rem ARMv7
if not exist android\armeabi-v7a\libluajit.a (
	wsl make clean
	if "%ERRORLEVEL%" == "1" goto :error
	wsl make HOST_LUA=luajit "HOST_CC=clang.exe -m32" HOST_CFLAGS=-D_CRT_SECURE_NO_WARNINGS CC=clang CROSS=arm-linux-android- STATIC_CC=armv7a-linux-androideabi16-clang "DYNAMIC_CC=armv7a-linux-androideabi16-clang -fPIC" "TARGET_AR=arm-linux-androideabi-ar.exe rcus" TARGET_LD=armv7a-linux-androideabi16-clang TARGET_STRIP=arm-linux-androideabi-strip.exe amalg
	if "%ERRORLEVEL%" == "1" goto :error
	copy src\libluajit.a android\armeabi-v7a\libluajit.a
	if "%ERRORLEVEL%" == "1" goto :error
)

rem x86
if not exist android\x86\libluajit.a (
	wsl make clean
	if "%ERRORLEVEL%" == "1" goto :error
	wsl make HOST_LUA=luajit "HOST_CC=clang.exe -m32" HOST_CFLAGS=-D_CRT_SECURE_NO_WARNINGS CC=clang CROSS=i686-linux-android- STATIC_CC=i686-linux-android16-clang "DYNAMIC_CC=i686-linux-android16-clang -fPIC" "TARGET_AR=i686-linux-android-ar.exe rcus" TARGET_LD=i686-linux-android16-clang TARGET_STRIP=i686-linux-android-strip.exe amalg
	if "%ERRORLEVEL%" == "1" goto :error
	copy src\libluajit.a android\x86\libluajit.a
	if "%ERRORLEVEL%" == "1" goto :error
)

goto :done

:error
exit /b 1

:done
