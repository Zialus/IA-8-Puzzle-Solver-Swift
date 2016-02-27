# How to install swift(and its dependencies) on Fedora 23

```
curl https://github.com/corinnekrych/swift-rpm/releases/download/2.2-SNAPSHOT20160111a/swift-2.2-SNAPSHOT20160111a.x86_64.rpm -O -L
sudo dnf install libbsd python gcc-c++ clang libicu
sudo rpm -Uvh swift-2.2-SNAPSHOT20160111a.x86_64.rpm
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