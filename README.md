# Very small docker container for Linux x86_64

First, making a minimal executable.
The following guide was used, and it was modified to the 64-bit Linux world.

http://www.muppetlabs.com/~breadbox/software/tiny/teensy.html

The executable is compiled with nasm (pre-compiled file sits in /bin folder):

`nasm -f bin -o helloelf helloelf.asm`

The end result is a 173B binary that writes 'Hello, World!' to stdout.

This can be built into a 'scratch' container with the Dockerfile included.

`docker build . -t helloelf`

`docker run helloelf`

### Additional references:

https://en.wikipedia.org/wiki/Executable_and_Linkable_Format

http://man7.org/linux/man-pages/man5/elf.5.html

https://github.com/torvalds/linux/blob/master/include/uapi/linux/elf.h

https://blog.rchapman.org/posts/Linux_System_Call_Table_for_x86_64/

