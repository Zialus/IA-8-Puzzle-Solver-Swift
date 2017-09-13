DEBUGMODE = fulldebug
EXEC = 8PuzzleSolver

all:
	swift build -Xswiftc -O -Xswiftc -wmo -c release
	cp ./.build/release/$(EXEC) .

clean:
	swift package clean
	if [ -f ./$(EXEC) ]; then rm ./$(EXEC); fi

test: test23

test1:
	./8PuzzleSolver < InputExamples/depth1/5.txt

test11:
	./8PuzzleSolver < InputExamples/depth11/5.txt

test23:
	./8PuzzleSolver < InputExamples/depth23/3.txt
