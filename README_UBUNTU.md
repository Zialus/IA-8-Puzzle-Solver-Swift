# How to install swift on Ubuntu 14.04

```
wget https://swift.org/builds/development/ubuntu1404/swift-DEVELOPMENT-SNAPSHOT-2016-02-25-a/swift-DEVELOPMENT-SNAPSHOT-2016-02-25-a-ubuntu14.04.tar.gz
tar xzf swift-DEVELOPMENT-SNAPSHOT-2016-02-25-a-ubuntu14.04.tar.gz
cd swift-DEVELOPMENT-SNAPSHOT-2016-02-25-a-ubuntu14.04
sudo rsync -aviP usr/ /usr/ --remove-source-files
```

# Dependencies
```
sudo apt-get install clang libicu-dev
```

# How to install the 8-puzzle-solver
```
git clone https://github.com/Zialus/8-puzzle-swift.git
cd 8-puzzle-swift
swift build
```

# How to run it

```
./.build/debug/8puzzle
```