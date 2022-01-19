
# Building

```bash
cmake -E make_directory build && cmake -E chdir build cmake .. --toolchain cmake/Toolchains/ti-cgt-toolchain.cmake -G Ninja
cmake --build build --config Debug --target gpiointerrupt
```
