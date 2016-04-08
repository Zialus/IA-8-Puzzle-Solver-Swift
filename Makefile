all:
	swift build
	mv ./.build/debug/8PuzzleSolver .

clean:
	if [ -f ./8PuzzleSolver ]; then rm ./8PuzzleSolver; fi
	if [ -d ./.build/ ]; then rm -rf ./.build/; fi
