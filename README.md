# ReaperTrackSwitcher Version 1.0
Change your active tracks in Reaper with the press of a button.

## What is this?
This is a tool enabling users of Reaper (the DAW) to quickly select which tracks are active. It is intended for live performance.

With Reaper Track Switcher (known as RTS from here on), you could use a MIDI program change code to choose which synth to play. Because this operates at the track level, each setting can select a unique VST or hardware instrument.

One competing solution is found in the SWS/S&M extensions and is known as Live Configs. If their software works for you, there is no reason to use RTS. However, RTS allows multiple tracks to be set in a single config, and more importantly RTS configs are selected by control code and not by MIDI values. If you find that SWS/S&M Live Configs are forcing you to map your configs onto a fader when you would prefer to use buttons, then RTS may be what you need.

RTS data is embedded within the project file. Each new project you create is a clean slate.

## Installation
First, copy all the files in AppDataScripts. Paste them in your Reaper scripts folder. On Windows, this should be found at "%APPDATA%/Reaper/Scripts". (If you don't know what this means, open Windows Explorer, and in the "address bar" type the text in quotes and press enter. Paste the files into there.)

Next, copy all the files in InstallScripts. Paste them in the folder where Reaper is installed. This is likely to be found at "%PROGRAMFILES%\REAPER (x64)".

In Reaper, open the action list. Next to where it says ReaScript, click Load. Navigate to your Reaper scripts folder (if you aren't there already), then shift-click to select all of the scripts you placed there, and then click open.

## Tutorial
RTS is operated through the Reaper action list.

First, you will need to set configs. Add two or more tracks to your project. Add a virtual instrument to each one.

Click on one of the tracks (not master). In the default Reaper skin, that track should look lighter than the others. You may also multi-select tracks at this point.

Open the action list and run "RTS Set config in group 01.lua". This should confirm the name(s) of the track(s) that you just wrote to slot 1-1.

Next run the action "RTS Use config 01-02.lua". Then select a different track and run "RTS Set config in group 01.lua" again. Notice how it remembers that you selected config 01-02 and then modified that particular config.

Now try switching back and forth between configs 01-01 and 01-02. Notice how it affects each of the tracks you selected. RTS will only modify tracks that have been placed in one of your configs; unlisted tracks will not be modified.

Run the action "RTS Display all configs.lua" for a summary of what you have done.

At this point you are ready to go! You might want to set a shortcut key or MIDI code to trigger each of your selected configs.

Just remember: any time you want to create a configuration, first use the config you are interested in, then select your tracks in Reaper, and finally set the config.

If you ever want to delete a config, all you have to do is set the config when you have no tracks selected.

## What are groups? Why does everything start with "1-"?

Short answer: just ignore it and use group 1 all the time.

Long answer: Some users may want to have more than one complete group of configs, all running simultaneously. Each group keeps track of the entire set of tracks included within, and does not modify any unlisted tracks.

If you need more than one group, read on.

## Not enough scripts?
Only 25 config scripts are included in this repository, and only for group 1. However, you can very easily add more scripts if this is not enough. If you want to add support for config 01-26, for example, simply clone the file "RTS Use config 01-25.lua", rename it appropriately, and then open it in Notepad and change the number "25" to "26". Scripts for additional groups can be created just as easily.

By default, RTS supports up to 32 groups and up to 128 configs per group. You can increase these limits; see "RTS Utils.lua".

## Disclaimer
These scripts are third-party extensions to Reaper and are not endorsed by its maintainers. There is absolutely no warranty provided for these scripts. You may use the scripts for any legal purpose you desire, but no support is offered.
