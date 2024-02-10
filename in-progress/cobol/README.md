Adapted instructions from here: https://bigdanzblog.wordpress.com/2020/05/05/installing-gnucobol-on-windows/

Navigate [here](https://sourceforge.net/projects/gnucobol/files/gnucobol/nightly_snapshots/) and look under the "ready-to-use-binaries for Win32" section for a download link. At time of writing it's [this](https://ci.appveyor.com/api/projects/GitMensch/gnucobol-3-x-win32-posix/artifacts/gnucobol-3.3-dev-MinGW-binaries%20(debug).zip?job=Environment:%20BUILD_TYPE=MSYS,%20BUILD_BIN=C:\MinGW\msys\1.0\bin)


Add a section to the PATH environment variable pointing to the `bin` folder inside the thing you just downloaded

Put that same PATH inside of `cobol.bat` for the `COB_MAIN_DIR` variable

Then put that file in the `bin` folder.
Open a command prompt (separate from VSCode)
Now you should be able to run `cobol -V` and it should work

Close/reopen VSCode
Open the VSCode terminal
`cobol -V` should run now

Create a cobol.cob file with your COBOL code
Compile with `cobol -t- cobol.cob`
Run with `cobol` once the .exe is made
