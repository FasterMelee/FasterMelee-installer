# FAQ

Help, Faster Melee won't run or compile! If this is you, keep reading for fixes to some common errors. Note that **all of these errors will be found at the bottom of log.txt**.

## How do I run Faster Melee?

With the latest release, you have three options. Either run `./launch-fm` to run the shortcut created in the directory you originally ran the installer in, click on your desktop/Applications shortcut, or find the `dolphin-emu` executable, located in `FasterMelee-VERSION/bin/`.

## While compiling, I get stuck on "cmaking..."!

You do not have all the dependencies installed. Try installing standard Dolphin (typically called `dolphin-emu` in repositories) and retry the Faster Melee installation afterwards.

## I get errors like `undefined reference to 'linux_netlink_start_event_monitor'`!

You have the general version of libusb installed, or Ishiiruka is trying to build libusb from `Externals/`. Install the *development* version of libusb, commonly called `libusb-1.0.0-dev`, and retry.

## My adapter doesn't work!

You have to install rules, prompted in the installer. If you've already compiled, no problem, just re-run it and continue until it asks you to install rules. You can close the installer as after you see `Rules added!`.

## But I installed rules already!

Make sure you have NO versions of dolphin open. Unplug your adapter. Plug in your adapter. Start Faster Melee. Enjoy. If something's still going run, re-run the installer as stated above.

## Something's still going wrong!

Join the [Faster Melee Discord](https://discordapp.com/invite/fastermelee), read \#start, and ask your question.