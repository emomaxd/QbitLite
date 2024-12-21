# QbitLite

QbitLite is a lightweight version of the [Qbit](https://github.com/emomaxd/Qbit), optimized for rapid application development without the editor component.

## Features

- Fast startup time for Qbit applications.
- Core engine functionalities tailored for performance.
- Simplified API for quick integration and development.
- Suitable for projects where a full editor is not required.

## Getting Started

To get started with QbitLite, check [QbitAppTemplate](https://github.com/emomaxd/QbitAppTemplate)

## Cloning and building the standalone library

```bash
git clone --recursive https://github.com/emomaxd/QbitLite.git
cd Scripts
./Setup.sh or ./Setup.bat
./CreateSolution.sh or ./CreateSolution.bat
cd ..
cmake --build . -- -j8
```

libEngine.a file will be inside Engine/ directory.