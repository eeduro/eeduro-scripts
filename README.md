# EEDURO scripts

Clone this repository:

```bash
git clone git://github.com/eeduro/eeduro-scripts.git eeduro-project
```

Setup workspace:

```bash
./setup.sh
```

The setup script...

 * checks if all packages are installed
 * clones the eeros-framework repository
 * clones the eeduro-platform repository
 * downloads the Linaro toolchain (gcc 4.7.3)
 * creates the build-x86-64 folder
 * creates the build-armhf folder

Build for host system:

```bash
cd build-x86-64
make
```

Build for target system:

```bash
cd build-armhf
make
```

Copy the essential binaries to the robot:

```bash
./copy2robot.sh
```

Remove build folders:

```bash
./clean.sh
```

Remove all downloaded and generated files:

```bash
./distclean.sh
```
