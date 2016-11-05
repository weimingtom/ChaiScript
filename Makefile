CC := gcc
CPP := g++
RM := rm -rf

# c++11: r5.0.0-5.5.1
# (MinGW) Fatal error: can't write samples/example.o: File too big
# no error: r5.0.0-r5.3.0 (5.4failed, 5.3.1failed, 5.2ok,r5.3ok, r5.0.0ok)
# https://github.com/weimingtom/ChaiScript/tree/8d96abe73091c2eb6d5c53a2d94fb5884bbcb5fa
# ChaiScript-Release-5.3.0
CPPFLAGS := -g -O0 -DWIN32 -std=c++11 -Iinclude

OBJS_DLL := src/chaiscript_stdlib.o 
OBJS_EXE := src/main.o
OBJS_EXEAMPLE := samples/example.o 

DLL := chaiscript_stdlib.dll
EXE := chaiscript.exe 
EXEAMPLE := example.exe 

all: $(EXE)

$(EXE): $(OBJS_EXE) $(DLL)
	$(CPP) $(CPPFLAGS) $(OBJS_EXE) -o $(EXE)

$(EXEAMPLE): $(OBJS_EXEAMPLE) $(DLL)
	$(CPP) $(CPPFLAGS) $(OBJS_EXEAMPLE) -o $(EXEAMPLE)

$(DLL) : $(OBJS_DLL)
	$(CPP) $(CPPFLAGS) -shared $(OBJS_DLL) -o $(DLL) 

%.o:%.cpp
	$(CPP) $(CPPFLAGS) -o $@ -c $<

clean:
	$(RM) $(OBJS_EXEAMPLE) $(EXEAMPLE) 
	$(RM) $(OBJS_EXE) $(EXE) 
	$(RM) $(OBJS_DLL) $(DLL)
	$(RM) *.exe *.dll a.txt
