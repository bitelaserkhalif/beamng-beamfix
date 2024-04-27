
# Fix beamng No Texture issues easily!

This application is made for **BEAMNG Drive** zipped mods in order to find what causing NO TEXTURE, JBEAM and also LUA issues.


# How to?

 1. Download from releases
 2. **Edit the config.txt.**
	 - On the line that says "bNGmodPath=", pinpoint to your beamng folder . Example: *bNGmodPath="K:\beamng\0.30\mods"*
	 - This is optional, since version beamfix 0.3 features autodetectver on config. Set it to true to detect game version automatically.![Autodetect](https://github.com/bitelaserkhalif/beamng-beamfix/blob/master/manual_images/CMD5.png?raw=true "CMD autodetect")
 3. Double click the batch file
 4. Select the options. For json, choose 1. For jbeam, choose 2. For lua, choose 3. To exit hit X ![Choose wisely](https://github.com/bitelaserkhalif/beamng-beamfix/blob/master/manual_images/CMD.png?raw=true "CMD example")
 5. For json, you have two options: unpack all json (choose 1), or unpack *.materials.json file (choose 2). For cancel, choose C.  For other type like lua and jbeam, only one is available.![Choose wisely](https://github.com/bitelaserkhalif/beamng-beamfix/blob/master/manual_images/CMD2.png?raw=true "CMD example")
 6. After that, you have option to include (if exists) legacy materials.cs file. Choose Y to unpack, choose N to not include. For cancel, choose C. ![Choose wisely](https://github.com/bitelaserkhalif/beamng-beamfix/blob/master/manual_images/CMD3.png?raw=true "CMD example")
  7. After that, it would show which file to unpack. Press any key ![Any key!](https://github.com/bitelaserkhalif/beamng-beamfix/blob/master/manual_images/CMD4.png?raw=true "CMD example")
 8. Let it do the job unpacking....
 9. Open the resultant folder in [VSCode](https://code.visualstudio.com/), or [VSCodium](https://vscodium.com/) (for zero tracker experience)
 10. Hit CTRL + SHIFT + F to find in all files
 11. From beamng console (tilde button default), type the missing source texture path and filename ![Look at the red errors!](https://github.com/bitelaserkhalif/beamng-beamfix/blob/master/manual_images/20231002130733_1.jpg?raw=true "Errors is Red")
 12. You can then determine the mod name (from folder name) and disable.

# Warnings!

 - Every unpack overwrites the files on output folders.
 - Resultant could be BIG! (571 mods zipped, unpacked to 1 GB, YMMV)

# How to download?

Find in releases on right side.

# Configs!

On config.txt, several options are:

 - bNGmodPath: path to beamng mod folder. USE QUOTATION MARKS!

# Credits!

 - [7Zip team](https://www.7-zip.org/) for unpacking system

