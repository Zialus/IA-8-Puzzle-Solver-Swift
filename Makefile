all:
	swift build -Xswiftc -O -c release
	mv ./.build/release/8PuzzleSolver .

clean:
	swift build --clean
	if [ -f ./8PuzzleSolver ]; then rm ./8PuzzleSolver; fi
