# cx_freeze_rhel9_fail

- `docker build` the Dockerfile
- `docker run` with bash
- run the following commands:

```bash
    1  cd cx_Freeze-7.1.1/samples/simple
    2  python3 setup.py build
    3  cd build/exe.linux-x86_64-3.9/
    4  ./hello
```
