# 8-Puzzle-Solver-Swift

A `swift` implementation of 7 different algorithms to solve the 8-puzzle game.

[![Swift][swift-badge]][swift-url]
[![Platform][platform-badge]][platform-url]
[![Travis][travis-badge]][travis-url]

[swift-badge]: https://img.shields.io/badge/Swift-3.0-orange.svg?style=flat
[swift-url]: https://swift.org
[platform-badge]: https://img.shields.io/badge/Platforms-OS%20X%20--%20Linux-lightgray.svg?style=flat
[platform-url]: https://swift.org
[travis-badge]: https://travis-ci.org/Zialus/8-Puzzle-Solver-Swift.svg?branch=master
[travis-url]: https://travis-ci.org/Zialus/8-Puzzle-Solver-Swift

This program was tested on `MacOS 10.12 Sierra`, `Fedora 25`, and `Ubuntu 14.04`. All running `swift 3.0`.

## Instructions for Fedora 25

### How to install swift (and its dependencies)

``` bash
sudo dnf install libbsd python libicu clang
curl https://github.com/Zialus/swift-rpm/releases/download/swift-3.0-RELEASE/swift-3.0-RELEASE3.0.x86_64.rpm -O -L
sudo rpm -Uvh swift-3.0-RELEASE.x86_64.rpm
```

## Instructions for Ubuntu 14.04/15.10/16.04

### How to install swift (and its dependencies)

``` bash
sudo apt-get install clang
git clone https://github.com/kylef/swiftenv.git ~/.swiftenv
echo 'export SWIFTENV_ROOT="$HOME/.swiftenv"' >> ~/.bash_profile
echo 'export PATH="$SWIFTENV_ROOT/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(swiftenv init -)"' >> ~/.bash_profile
. ~/.bash_profile
swiftenv install 3.0
```

## General Instructions

### How to compile

To compile just run the makefile, by executing the following command on the terminal:

``` text
make
```

### How to run

``` bash
./8PuzzleSolver
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
