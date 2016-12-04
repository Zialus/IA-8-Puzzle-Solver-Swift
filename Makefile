all:
	swift build -Xswiftc -O -c release
	mv ./.build/release/8PuzzleSolver .

clean:
	swift build --clean
	if [ -f ./8PuzzleSolver ]; then rm ./8PuzzleSolver; fi

test: test23

test1:
	./8PuzzleSolver < InputExamples/depth1/5.txt

test11:
	./8PuzzleSolver < InputExamples/depth11/5.txt

test23:
	./8PuzzleSolver < InputExamples/depth23/3.txt
