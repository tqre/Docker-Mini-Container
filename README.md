# Very small 'Hello, World!' executable for linux x86_64

This piece was constructed to make a very small executable.
The following guide was used, and it was modified to the 64-bit Linux world.

http://www.muppetlabs.com/~breadbox/software/tiny/teensy.html

The executable is compiled with nasm:

'nasm -f bin -o helloelf helloelf.asm'

resulting in 'helloelf' executable binary

I'm trying to run this inside a docker container, but the container hangs... inspecting.

Additional references:

https://en.wikipedia.org/wiki/Executable_and_Linkable_Format

http://man7.org/linux/man-pages/man5/elf.5.html

https://github.com/torvalds/linux/blob/master/include/uapi/linux/elf.h

