---
title: Avoid Dependency Hell&mdash;VirtualBox Your Projects
category: Web Development
date: 2011-03-06
---

I manage a separate VirtualBox image for every project I do. What are the benefits of doing so?

## Why Virtualize?

**Avoid dependency hell.** Ever come back to a project 2-3 months later, and not be able to run it because you've already upgraded your libraries to new versions? Debugging these scenarios always take a lot of trial and error. This won't happen anymore if you freeze the entire development environment along with the project code.

**Write once, run everywhere** VirtualBox images are extremely portable. VirtualBox can run on every major operating system, which means you can concievably work anywhere. If you develop on a Windows machine and want to collaborate with someone on OS X, you may run into problems with versioning. If both of you run VirtualBox, the problems all disappear. 

**No more debugging development environments for your developers.** Related to the point above. Have someone joining your project? Instead of handing them a lengthy and error-prone installation guide, just give them a copy of your VirtualBox image. This saves a ridiculous amount of time and gets them up to speed with zero issues. This benefit of VirtualBox goes up the more contributers you have on your project.

**Ubuntu is closer to a production environment.** While not exactly the same, a Ubuntu minimal install is much closer to your production server than either Windows or OS X. You'll be able to solve OS-specific issues early, so your live deployment will be certain to go without a hitch.

## Preconceived Doubts

**Isn't system performance severely degraded with virtualization?** This really depends on what you're working on. For standard web development and design tasks, a virtualized Ubuntu is more than enough power. I'm running this on a 13" MacBook Air with 1.86 GHz Core 2 Duo, and I've never had a problem with performance. Compiling might be a bit slower than you're used to.

**But it's such a waste of hard drive space!** Disk space is cheap these days.  My laptop has a 120 GB HD. That's probably less storage space than most of you are running. Also, installing with the Ubuntu Minimal CD image means you only install only the basic building blocks of the OS, and download what you need through apt-get. My freshly installed images weigh in 1.5 GBs each. Not bad, right?

**Doesn't it take a long time to setup your dev environment over and over?** Okay, you've got me there. The actual process of installing Ubuntu doesn't take very long, but getting the right packages and plugins can take a little while. Of course, most of this time is either downloading or compiling, so you're not actually stuck at the computer.

**Doesn't this take a lot of system memory?** This is a valid point. If you have under 2 GBs of RAM, performance will definitely be severely degraded with the disc swaps happening every transaction. I've never done virtualization with anything less than 4 GBs, but--then again, my Ubuntu images run just fine with 512mb of allotted RAM each. I have two images running at any one time, along with Chrome and Photoshop, and performance has been fine.

## The Barebones How-To

Interested in setting up a virtual image? Download these first:

* Latest version of [VirtualBox](http://www.virtualbox.org/wiki/Downloads)
* [Ubuntu 10.10 64-bit Minimal CD](https://help.ubuntu.com/community/Installation/MinimalCD) (15.6MB)
* An FTP program--I recommend [Transmit](http://panic.com/transmit/) for OS X, [FileZilla](http://filezilla-project.org/) otherwise

**Install VirtualBox.** Create a new virtual machine with the default settings for a Ubuntu 64-bit guest OS. 512 MB of ram and 8 GBs of disk space is usually enough. If you have hard drive space to spare, I suggest increasing it to 20 GB. It's possible to increase the virtual disk size later, but it's a pain in the ass.

**Select your new virtual disk and open "Settings."** With the Settings window open, click the Network button, and select the Adapter 2 tab. Enable the adapter and choose 'Host-only Adapter' from the dropdown menu. This is the first step in giving your host OS access to Ubuntu.

**Boot up the new virtual disk.** Select the Ubunut Minimal CD .iso you downloaded earlier. Ubuntu is straightfoward to install. When it's done, login with your new username and password. The first command you should run is `sudo apt-get install openssh-server`. This will allow SSH and SFTP connections from your host OS to the new guest.

**Using either vi or nano, open** `sudo vi /etc/network/interfaces`. Add the following lines to the bottom of the file:

    auto eth1
    iface eth1 inet static
      address 192.168.56.101
      netmask 255.255.255.0

Save and exit. Run these commands in the console:

    sudo /etc.d/init/networking restart
    sudo ifdown eth1
    sudo ifup eth1

You're done. At this point, you should be able to SSH into your new virtual machine from the host OS, or mount the virtual drive with your FTP program.
