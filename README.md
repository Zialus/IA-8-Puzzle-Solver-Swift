# 8-Puzzle-Solver-Swift

A `swift` implementation of 7 different algorithms to solve the 8-puzzle game.

[![Swift][swift-badge]][swift-url]
[![Platform][platform-badge]][platform-url]
[![Travis][travis-badge]][travis-url]

[swift-badge]: https://img.shields.io/badge/Swift-4.0-orange.svg?style=flat
[swift-url]: https://swift.org
[platform-badge]: https://img.shields.io/badge/Platforms-OS%20X%20--%20Linux-lightgray.svg?style=flat
[platform-url]: https://swift.org
[travis-badge]: https://travis-ci.org/Zialus/IA-8-Puzzle-Solver-Swift.svg?branch=master
[travis-url]: https://travis-ci.org/Zialus/IA-8-Puzzle-Solver-Swift

## Instructions

### How to compile

To compile just run the makefile, by executing the following command on the terminal:

``` text
make
```

### How to run

``` bash
./8PuzzleSolver
```

For additional debug functionality you can run the program with one of the
following parameters:

-   `debug`
-   `fulldebug`

**For example:**

``` bash
./8PuzzleSolver debug
```

## INPUT

**Example**:

```text
3 4 2 5 1 7 6 0 8
1 2 3 8 0 4 7 6 5
```

That input is equivalent to the two following game tables:

```text
3  4  2                1  2  3
5  1  7                8     4
6     8                7  6  5
```

`0` represents the blank position.
