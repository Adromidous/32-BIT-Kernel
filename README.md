**WELCOME TO TKOS**  


This is a 32-Bit Kernel I'm currently developing in my free time to understand Operating Systems at a deeper level and apply the knowledge I learn in school into this project.

Some of the programming languages/technologies I'm currently using are:  

1. Assembly -> x86 Architecture
2. GCC -> Compiler Collection
3. QEMU -> Hardware Virtualization
4. VirtualBox -> For Ubuntu OS


Some of the features I created in this project so far are:  
1. 16-Bit Bootloader (Initial stage complete).


Features that I'm currently building:
1. Filesystem (FAT12/16)
2. User Interface
3. Basic Commands -> ls, cd, mkdir
4. Basic Kernel


Some pictures I've included to keep track of my progress:  
![QEMU_bootloader](https://github.com/Adromidous/32-BIT-Kernel/assets/110305385/b255633d-6fb6-4f31-9b62-e9ac9ae77cd1)  
Command: qemu-system-x86_64 -boot a -fda ./build/tkos.bin  
This command was to run the binary floppy disk file on QEMU to make sure the bootloader was booting the kernel sector.  
