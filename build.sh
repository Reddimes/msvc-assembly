#!/bin/bash

/opt/msvc/bin/x86/ml /nologo /quiet Z:\\test.asm /link /subsystem:console /link /nologo
wine ./test.exe
