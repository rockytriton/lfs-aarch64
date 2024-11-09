Script for building LFS 12.2 in parallels on a Mac with ARM processor

This work with Ubuntu as the host system.  Others probably work too.

You will first need to add a drive to the host machine, partition it and format it.  
Then install the "host requirements" from LFS.
Then mount and set your $LFS variable

It does not modify the boot loader, so after buildind, you can run "sudo update-grub" on the host to add a grub entry

First step is to create the tools.

cd scripts/build-tools
sudo -E ./setup.sh

You will get prompted for the password to create for the LFS user during that process, then it will run on and build everything.

This will build the tools environment.  After that's finished you can create your tar file of the tools as LFS suggests so you don't have to rebuild the tools again when starting over.

After build-tools finishes, you can make sure its fully done by looking at the $LFS/usr/share/lfs/installed file.

cat $LFS/usr/share/lfs/installed

It should end with:
tools_cleanup

that would mean the last step finished.

Occasionally some builds may fail but succeed on a second run, so first try running the last command again, it will pickup where it left off typically.  If it fails more than once then maybe something else went wrong and you'll need to debug the output.

After tools are built, copy the scripts folder to /usr/share/lfs/scripts, enter chroot enviornment, cd to that directory and run:

./build.sh base

that will build a base bootable image of LFS.  Other than base, the other options are "dev", "xorg", "lxqt", "xfce".  

If you just run ./build.sh xfce, it will build everything needed for xfce.

Before rebooting, do:
Set your root password:
passwd root

Create a normal user:
useradd -m lfsuser
passwd lfsuser

Note that during the build process, sometimes things will fail and will succeed on a second try.  Especially for some reason, the build always seems to stop after "expect" is built, but running it again and it shows it was successful and continues on.

Anyway, at the very least, you can get some ideas from these scripts on how to fix your build to run on aarch64.

Check the notes.txt file from some specific changes that were necessary on different packages.

