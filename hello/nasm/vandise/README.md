# Exercises for Programmers - Hello
This is the "Hello <name>!" program in NASM. It requires NASM v2.13+ and an x86_64 machine.

Note that this was developed on a Mac, so there are subtle differences when making system calls when contrasted to Linux or Windows. The main difference is that Mac requires system calls to be in hex as opposed to integers. Ie `0x2000004` = 4 on every other OS.

## Compiling
To compile on a Mac, you can run the following command:

```
/usr/local/Cellar/nasm/2.13.01/bin/nasm -f macho64 hello.asm && ld -macosx_version_min 10.7.0 -lSystem -o hello hello.o
```

Set the appropriate flags for your OS as needed.

## Additional Notes
You will have to utilize an absolute path (or configure your environment) to a newer version NASM as Macs come default with version 0.98.