# 8-Puzzle-Solver-Swift

A swift implementation of 7 different algorithms to solve the 8-puzzle game.

## Instructions for Fedora 23

### How to install swift (and its dependencies)

``` bash
curl https://github.com/Zialus/swift-rpm/releases/download/swift-3.0-DEVELOPMENTSNAPSHOT20160301a/swift-3.0-DEVELOPMENTSNAPSHOT20160301a.x86_64.rpm -O -L
sudo dnf install libbsd python libicu clang
sudo rpm -Uvh swift-3.0-DEVELOPMENTSNAPSHOT20160301a.x86_64.rpm
```

## Instructions for Ubuntu 14.04

### How to install swift (and its dependencies)

``` bash
sudo apt-get install clang-3.6
sudo update-alternatives --install /usr/bin/clang clang /usr/bin/clang-3.6 100
sudo update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-3.6 100

wget -qO- http://dev.iachieved.it/iachievedit.gpg.key | sudo apt-key add -
echo "deb http://iachievedit-repos.s3.amazonaws.com/ trusty main" | sudo tee --append /etc/apt/sources.list
sudo apt-get update
sudo apt-get install swift-2.2
```

## General Instructions

### How to compile

To compile just run the makefile with the command:

``` text
make
```

on the terminal

### How to run it

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
