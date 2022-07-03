+++
title = "Control your Android device from PC 📱💻"
date = 2020-04-28T07:14:00+05:30
tags = ["android", "linux", "windows", "utilities"]
+++

Wouldn't it be convenient if you could mirror your Android device's screen onto your PC and interact with it?

I have just the right tool for this job that lets you do all this and more and it's called "scrcpy".
It is a tool created by folks at Genymotion.

### What you'll need

Android device with Lollipop (API 21 / Android 5.0) or newer with USB debugging turned on.
adb - Android debugging bridge.
scrcpy itself.

### **Installation instructions:**

#### Windows

You can get the pre built release which includes both adb and scrcpy from [here](https://github.com/Genymobile/scrcpy/releases/).

#### Linux

Install the packages android-tools and scrcpy using your distro's package manager, there's also a snap package.

```bash
# Debian
sudo apt install android-tools scrcpy
# Arch
sudo pacman -S android-tools scrcpy
```

#### macOS

brew cask install android-platform-tools
brew install scrcpy

#### USB Debugging

You can enable USB debugging in the device system settings, under Developer options.
Go to Settings > About phone and tap Build number seven times.

Return to the previous screen to find Developer options at the bottom.
In developer options turn on Android debugging.

On some devices, the Developer options screen might be located or named differently.

#### Connecting

Now you can connect your device to your PC using a USB cable or Wifi and run scrcpy from a terminal (bash / cmd / Powershell).

To connect wirelessly your devices have to be on the same local network.
Open a teminal and type

```bash
adb tcpip 5555
adb connect DEVICE-IP:5555
```

Replace DEVICE-IP with your android devices IP address which can be found under **Settings > About > IP Address**.

Now you're connected with your device and can interact with it using keyboard and mouse.

Some of the most used keyboard shortcuts:
Ctrl + b / Right click - Back
Ctrl + h / Middle click - Home
Ctrl + s - Recent apps
Ctrl + p - Power button
Ctrl + o - Turn device screen off
Ctrl + n - Expand notifications panel
Ctrl + Shift + n - Collapse notification panel

If you are facing lag when connected wirelessly you can run scrcpy at a lower resolution using

```bash
scrcpy -m 640 # Sets max size to 640px
or at a lower bitrate using
scrcpy -b 3M # Sets bitrate to 3 MB
```

More options and keyboard shortcuts can be found by running scrcpy --help.

You can also visit the project's [GitHub page](https://github.com/Genymobile/scrcpy/) if you want to know more.
