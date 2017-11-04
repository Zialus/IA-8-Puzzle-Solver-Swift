DEBUGMODE = fulldebug
EXEC = 8PuzzleSolver

all:
	swift build -Xswiftc -O -Xswiftc -wmo -c release
	cp ./.build/release/$(EXEC) .

clean:
	swift package clean
	if [ -f ./$(EXEC) ]; then rm ./$(EXEC); fi

test: test1 test11 test23

test1:
	time ./$(EXEC) < InputExamples/depth1/5.txt

test11:
	time ./$(EXEC) < InputExamples/depth11/5.txt

test23:
	time ./$(EXEC) < InputExamples/depth23/3.txt

test28:
	time ./$(EXEC) < InputExamples/depth28/3.txt
