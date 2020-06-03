# ArchiTech Traffic Lights

This readme explains how the ArchiTech traffic lights function and can be installed in Minecraft. It requires the Computer Craft (CC:Tweaked) mod.

This readme will first show the different traffic lights and auxiliary equipment. The traffic lights are customisable and come with different lighting sequences, icons to be displayed, and colours to choose from.

# Table of Contents
To be added

# Important #1 - File Titles
Several files in this repository need to be titled differently on your computer in Minecraft in order to work. These files have been titled differently from their intended Minecraft file title in order to be quickly able to identify which file suits your use case.

Each section below will indicate which files need to be titled differently on your computer in Minecraft, and will provide the correct title for use in Minecraft.

For example, the `startup-ps` needs to be titled as followed on your computer in Minecraft: `startup`

# Important #2 - File Naming Convention
The file names for the traffic light programs are constructed as followed, so that you can identify which program you need.

### Traffic Lights for Vehicles
* The `tl` at the beginning indicates that the program is for the traffic lights for vehicles.
* The numbers indicate how many traffic lights are included per section. A section is a (group of) traffic light(s) that displays the same status.
* The `plus` indicates an additional section.

> For example, the program `tl-3plus1` is a traffic light program with two sections: the first section with three traffic lights, and a second section with one traffic light.
>
> One possible set up with this file is for a three lane, one-way street, with a single lane side street, as shown below:
[insert image]
>
> Another possible set up is for a two-plus-one lane street, with one single-lane side street, as shown below:
[insert image]
>
> In this example, the lights on the main street are all green at the same time - the two traffic lights on the left as well as the one on the right side of the main street. When the side street has green, all main street traffic lights are red.

> Another example is the `tl-2plus1plus1` file. This is a traffic light program with three sections: one main street with two traffic lights that are on opposite sides, and two side streets that do not have green at the same time.
> [insert image]
>
> **Note:** if you want the side streets to have green at the same time, choose the `tl-2plus2` file.

### Pedestrian Lights

* The `plc` at the beginning indicates that the program is for pedestrian lights.
* The numbers indicate the amount of pedestrian lights supported by the file.

> For example, the `plc-2` file is a pedestrian light programme supporting 2 pedestrian lights.
>
> **Note:** Pedestrian lights all have green at the same time, while all traffic lights have red during that time.

### Traffic Lights for Vehicles and Pedestrians combined

To add.


# ArchiTech Traffic Lights Overview
ArchiTech Traffic Lights provides traffic lights for several main use cases:
* Traffic lights for vehicles
* Traffic lights for vehicles and pedestrians
* Traffic lights for vehicles and pedestrians, with pedestrian detection
* Traffic lights for vehicles and pedestrians, with audible indicators
* Traffic lights for vehicles and pedestrians, with pedestrian detection and audible indicators

How to set up the traffic lights for these use cases is described in more detail below in the section **“Use Cases”**.

**The files for the use cases are furthermore subdivided based on traffic scenarios, e.g. 3 traffic lights on a through road and 1 on a side street, or 6 traffic lights on a through road and 2 on a side street. If your traffic scenario is not covered, open an issue and I would be happy to add the files for your scenario. You can of course also download the files on your computer (either IRL or in Minecraft) and adjust the files from this repository to suit your needs. In such case, feel free to also create a pull request with your new files, so that the library of covered scenarios by ArchiTech Elevator Inc. can be expanded.**

## Showcase of Traffic Lights for Vehicles
The traffic light for vehicles comes with 4 different lighting sequences and with 5 icons.

### Sequences


| The Standard Sequence | The UK/German Sequence | Warning Sequence | Stop Sequence |
|:---:|:---:|:---:|:---:|
| Insert GIF | Insert GIF | Insert GIF | Insert GIF |
| The standard green-yellow/orange-red traffic light sequence. | A variation on the standard sequence, in which before a red light turns green, it will shortly show the yellow/orange light together with the red light to alert drivers that it soon will turn green. | A yellow/orange flashing warning sequence. | A flashing sequence for the red light, which in some countries indicate the traffic light should be seen as a stop sign. |

### Icons
To add

## Showcase Traffic Lights for Pedestrians
To add

----

# Use Cases
ArchiTech Traffic Lights cover the following use cases:

| **Use Case** | **Folder** | **Description** |
|:---:|:---:|:---:|
| *Traffic lights for vehicles* | TL | Set of traffic lights for vehicles only. |
| *Traffic lights for vehicles and pedestrians* | WPL | Expands on the vehicles set with traffic lights for pedestrians. The pedestrian traffic lights are part of the sequence. |
| *Traffic lights for vehicles and pedestrians, with pedestrian detection* | WPD | Expands the WPL set by adding pedestrian detection. The pedestrian traffic lights only become part of the sequence once the player requests a green light for pedestrians. |
| *Traffic lights for vehicles and pedestrians, with pedestrian sounds* | WPLS | Expands the WPL set by adding an audible indication to pedestrians. It plays an alternating sequence of sounds, depending on whether the pedestrian traffic light is green, yellow/orange, or red. The pedestrian traffic lights are part of the sequence. |
| *Traffic lights for vehicles and pedestrians, with pedestrian detection and sounds* | WPDS | Expands the WPD set by adding an audible indication to pedestrians. It plays an alternating sequence of sounds, depending on whether the pedestrian traffic light is green, yellow/orange, or red. The pedestrian traffic lights only become part of the sequence once the player requests a green light for pedestrians. The sounds will only start to play once the player has made a request. |

## Traffic Lights for Vehicles

This use case only requires you to place **one** traffic light computer and the monitors necessary for the desired amount of traffic lights. Note that one traffic light consist of 2 monitors placed on top of each other. You then need to connect the traffic lights to the computer using network cables. To make the cables going into the ground more visually pleasing, you can use a modem block (note: not the modem object itself, but the block!) as floor tile.

You need to place the **startup-tl** file from the main traffic lights folder on your computer, and title it `startup`.

You then need to select the traffic scenario that fits your needs from the `TL` folder. You however need to title this program as `trafficlight` on your traffic light computer in Minecraft.

> For example, the program `tl-2plus1` should be named `trafficlight` on your traffic light computer in Minecraft.

See the 'File Naming Convention' near the top of this readme to identify which file suits your traffic scenario.

For more detailed information on the files, see the section on individual files.

## Traffic Lights for Vehicles and Pedestrians

This use case requires you to place **two** computers: a traffic light computer and a pedestrian light computer. You also need to install the monitors for the desired amount of traffic lights and pedestrian lights. 

Note that one traffic light consist of 2 monitors placed on top of each other, and that one pedestrian light consist of 1 monitor. 

You then need to connect the traffic lights, pedestrian lights and both computers using network cables - make sure all are on the same wired network. To make the cables going into the ground more visually pleasing, you can use a modem block (note: not the modem object itself, but the block!) as floor tile. You can branch of pedestrian lights from the 'pole' that is created by the traffic light.

You need to place the **startup-tl** file from the main traffic lights folder on your computer, and title it `startup`.

You need to place the **startup-plc** file from the main traffic lights folder on your pedestrian light computer, and title it `startup`.

You then need to select the traffic scenario that fits your needs from the `WPL` folder. You however need to title this program as `trafficlight` on your traffic light computer in Minecraft.

> For example, the program `tl-2plus2` should be named `trafficlight` on your traffic light computer in Minecraft.

You also need to title the pedestrian light program as `plc` on your pedestrian light computer. 

> For example, `plc-1.lua` should be named `plc` on your pedestrian light computer in Minecraft.

**IMPORTANT: In order for the use case to work, you need to first boot the pedestrian light computer, and boot the traffic light computer second.**

For more detailed information on the files, see the section on individual files.

## Traffic Lights for Vehicles and Pedestrians, with Pedestrian Detection

This use case requires you to place **two** computers: a traffic light computer and a pedestrian light computer. You also need to install the monitors for the desired amount of traffic lights and pedestrian lights. 

Note that one traffic light consist of 2 monitors placed on top of each other, and that one pedestrian light consist of 1 monitor. 

You then need to connect the traffic lights, pedestrian lights and both computers using network cables - make sure all are on the same wired network. To make the cables going into the ground more visually pleasing, you can use a modem block (note: not the modem object itself, but the block!) as floor tile. You can branch of pedestrian lights from the 'pole' that is created by the traffic light.

You need to make sure the pressure plates are connected via redstone to the side of the pedestrian light computer. (If not on the right side, make sure to adjust the file.)

You need to place the **startup-tl** file from the main traffic lights folder on your traffic light computer, and title it `startup`.

You need to place the **startup-plc** file from the main traffic lights folder on your pedestrian light computer, and title it `startup`.

You then need to select the files for the traffic scenario that fits your needs from the `WPD` folder. See the 'File Naming Convention' near the top of this readme to identify which file suits your traffic scenario.

You however need to title the traffic light program as `trafficlight` on your traffic light computer in Minecraft.

> For example, the program `tl-2plus2.lua` should be named `trafficlight` on your traffic light computer in Minecraft.

You also need to title the pedestrian light program as `plc` on your pedestrian light computer. 

> For example, `plc-2.lua` should be named `plc` on your pedestrian light computer in Minecraft.

**IMPORTANT: In order for the use case to work, you need to first boot the pedestrian light computer, and boot the traffic light computer second.**

For more detailed information on the files, see the section on individual files.

## Traffic Lights for Vehicles and Pedestrians, with Pedestrian Sounds

This use case requires you to place **three** computers: a traffic light computer, a pedestrian light computer and a pedestrian sound computer. You also need to install the monitors for the desired amount of traffic lights and pedestrian lights. 

You furthermore need to place one speaker next to the pedestrian sound computer. It is advised to place both right underneath the asphalt in the middle of the junction.

Note that one traffic light consist of 2 monitors placed on top of each other, and that one pedestrian light consist of 1 monitor. 

You then need to connect the traffic lights, pedestrian lights, the traffic light computer and pedestrian light computer using network cables - make sure all are on the same wired network. To make the cables going into the ground more visually pleasing, you can use a modem block (note: not the modem object itself, but the block!) as floor tile. You can branch of pedestrian lights from the 'pole' that is created by the traffic light.

You need to make sure to connect the pedestrian light computer to the pedestrian sound computer using a bundled wire. **The pedestrian sound computer should not be connected to the wired rednet network!** Make sure to connect the bundled wire is connected to the right side of the pedestrian *sound* computer and the speaker on its left - or otherwise adjust the file accordingly. Make sure the bundled wire is connected to the left of the pedestrian *light* controller - or otherwise adjust the file accordingly.

You need to place the **startup-tl** file from the main traffic lights folder on your traffic light computer, and title it `startup`.

You need to place the **startup-plc** file from the main traffic lights folder on your pedestrian light computer, and title it `startup`.

You need to place the **startup-ps** file from the main traffic lights folder on your pedestrian sound computer, and title it `startup`.

You then need to select the files for the traffic scenario that fits your needs from the `WPLS` folder. See the 'File Naming Convention' near the top of this readme to identify which file suits your traffic scenario.

You however need to title the traffic light program as `trafficlight` on your traffic light computer in Minecraft.

> For example, the program `tl-2plus2.lua` should be named `trafficlight` on your traffic light computer in Minecraft.

You also need to title the pedestrian light program as `plc` on your pedestrian light computer. 

> For example, `plc-6.lua` should be named `plc` on your pedestrian light computer in Minecraft.

The pedestrian sound program should be named `pedestrianSound` on your pedestrian sound computer in Minecraft.

**IMPORTANT: In order for the use case to work, you need to first boot the pedestrian sound computer, secondly the pedestrian light computer, and boot the traffic light computer last.**

For more detailed information on the files, see the section on individual files.

## Traffic Lights for Vehicles and Pedestrians, with Pedestrian Detection and Sounds

This use case requires you to place **three** computers: a traffic light computer, a pedestrian light computer and a pedestrian sound computer. You also need to install the monitors for the desired amount of traffic lights and pedestrian lights. 

You furthermore need to place one speaker next to the pedestrian sound computer. It is advised to place both right underneath the asphalt in the middle of the junction.

Note that one traffic light consist of 2 monitors placed on top of each other, and that one pedestrian light consist of 1 monitor. 

You then need to connect the traffic lights, pedestrian lights, the traffic light computer and pedestrian light computer using network cables - make sure all are on the same wired network. To make the cables going into the ground more visually pleasing, you can use a modem block (note: not the modem object itself, but the block!) as floor tile. You can branch of pedestrian lights from the 'pole' that is created by the traffic light.

You need to make sure the pressure plates are connected via redstone to the side of the pedestrian light computer. (If not on the right side, make sure to adjust the file.)

You need to make sure to connect the pedestrian light computer to the pedestrian sound computer using a bundled wire. **The pedestrian sound computer should not be connected to the wired rednet network!** Make sure to connect the bundled wire is connected to the right side of the pedestrian sound computer and the speaker on its left - or otherwise adjust the file accordingly. Also make sure the bundled wire does not connect with the redstone coming from the pressure plates. Make sure the bundled wire is connected to the left of the pedestrian *light* controller - or otherwise adjust the file accordingly.

You need to place the **startup-tl** file from the main traffic lights folder on your traffic light computer, and title it `startup`.

You need to place the **startup-plc** file from the main traffic lights folder on your pedestrian light computer, and title it `startup`.

You need to place the **startup-ps** file from the main traffic lights folder on your pedestrian sound computer, and title it `startup`.

You then need to select the files for the traffic scenario that fits your needs from the `WPDS` folder. See the 'File Naming Convention' near the top of this readme to identify which file suits your traffic scenario.

You however need to title the traffic light program as `trafficlight` on your traffic light computer in Minecraft.

> For example, the program `tl-2plus1plus1.lua` should be named `trafficlight` on your traffic light computer in Minecraft.

You also need to title the pedestrian light program as `plc` on your pedestrian light computer. 

> For example, `plc-8.lua` should be named `plc` on your pedestrian light computer in Minecraft.

The pedestrian sound program should be named `pedestrianSound` on your pedestrian sound computer in Minecraft.

**IMPORTANT: In order for the use case to work, you need to first boot the pedestrian sound computer, secondly the pedestrian light computer, and boot the traffic light computer last.**

For more detailed information on the files, see the section on individual files.


# Individual Files

Table of contents to be added.

## Traffic Light Computer

The traffic light computer handles the traffic lights for vehicles. It requires the following two scrips:

* startup-tl
* trafficlight

### startup-tl

**Important!** This files should be titled `startup` on your traffic light computer in Minecraft. This file will be automatically loaded when your traffic light computer in Minecraft boots. It has two main purposes:

* To connect your computer to the rednet network. (Make sure you connect the wired modem on the back side of the computer - or adjust the programme accordingly).
* To automatically start the trafficlight programme.

In addition, this file will replicate a computer booting - which sole purpose is immersion only, with no real function.

### trafficlight

Choose the traffic light programme from the folder covering your use case and covers the needs of your traffic scenario. See the 'File Naming Convention' near the top of this readme to identify which file suits your traffic scenario.

**Important!** Make sure to title the programme on your traffic light computer as `trafficlight`.

This programme handles the traffic lights for vehicles, and if applicable for your use case, handles the coordination with the pedestrian traffic light computer.

Make sure to enter all monitors' IDs for each vehicle traffic light that is included in your traffic scenario, by adjusting the x in `monitor_x` to the number of the monitor for each `mon#` variable. You can identify the monitor ID in the chat in Minecraft when activating and deactivating the monitor's wired modem.

If applicable to your use case, make sure to add the pedestrian light computer's ID in the `pedComputer` varbiable.

Enter the sequence you want the traffic lights to display in the `sequence` variable. For a visualisation of the available sequences, see the sequences sections of this ReadMe. 
* Enter `1` for the standard sequence
* Enter `2` for the UK/German sequence
* Enter `3` for the warning sequence
* Enter `4` for the stop light sequence

Depending on your country, the middle colour may be yellow or orange. Enter `1` in the `middle` variable for an orange light, and enter `2` for a yellow light.

You can adjust the duration of each light type in the Time Customisation section. 
* `timeforgreen#` You can adjust the duration of the green light for each road section separately.
* `timeforyellow` Adjust the duration of the yellow light. Applies to all road sections.
* `timeforturnred` Adjust the duration between the light of section A turning red and the light of the next section turning green. Applies to all road sections.
* `warning interval` Adjust the speed at which the light blinks in the warning sequence and the stop light sequence.

## Pedestrian Light Computer

The pedestrian light computer handles the traffic lights for pedestrians. It requires the following two scrips:

* startup-plc
* plc

### startup-tl

**Important!** This files should be titled `startup` on your pedestrian light computer in Minecraft. This file will be automatically loaded when your pedestrian light computer in Minecraft boots. It has two main purposes:

* To connect your computer to the rednet network. (Make sure you connect the wired modem on the back side of the computer - or adjust the programme accordingly).
* To automatically start the plc programme.

In addition, this file will replicate a computer booting - which sole purpose is immersion only, with no real function.

### plc

Choose the pedestrian light programme from the folder covering your use case and covers the needs of your traffic scenario. See the 'File Naming Convention' near the top of this readme to identify which file suits your traffic scenario.

**Important!** Make sure to title the programme on your pedestrian light computer as `plc`.

This programme handles the traffic lights for pedestrians, handles the coordination with the pedestrian traffic light computer, and if applicable for your use case, handles the coordination with the pedestrian sound computer.

Make sure to enter all monitors' IDs for each pedestrian traffic light that is included in your traffic scenario, by adjusting the x in `monitor_x` to the number of the monitor for each `ped#` variable. You can identify the monitor ID in the chat in Minecraft when activating and deactivating the monitor's wired modem.

If applicable to your chosen use case: adjust `redstoneInput` to the side where the redstone signal coming from the pressure plates (wheter via redstone dust or via a cable) is going into the pedestrian light computer. *(Only in use cases with pedestrian detection.)*

If applicable to your chosen use case: adjust `bundleSide` to the side of the pedestrian light computer where the bundled wire going to the pedestrian sound computer is connected to the pedestrian light computer. *(Only in use cases with pedestrian sounds.)*

Make sure to add the traffic light computer's ID in the `tlComputer` varbiable.

Enter the sequence you want the pedestrian lights to display in the `sequence` variable. For a visualisation of the available sequences, see the sequences sections of this ReadMe. 
* Enter `1` for the steady sequence
* Enter `2` for the blinking sequence on the bottom light
* Enter `3` for the slider sequence

You can customise the colours to be displayed on the pedestrian light. 
* Adjust `topLightColor` to change the color in which the word STOP is displayed in the upper part of the pedestrian light in all sequences. 
* Adjust `bottomLightColor` to change the color in which the word WALK is displayed in the bottom part of the pedestrian light in the steady and blink sequences, or the color of the sliding part in the slider sequence.
* If applicable, adjust `bottomWaitColor` to change the color of the word WAIT, which appears when the player requests the pedestrian light to turn green. *(Only applicable to pedestrian detection use cases.)*

You can adjust the duration of each light type in the Time Customisation section. 
* `timeforgreen#` You can adjust the duration of the green light.
* `timeforyellow` Adjust this variable to change how long the bottom light blinks before turning red.

## Pedestrian Sound Computer

The pedestrian sound computer is used to control the auditory indication to player on the status of the pdestrian lights. It requires the following two scrips:

* startup-ps
* pedestrianSound

### startup-ps

**Important!** This files should be titled `startup` on your pedestrian sound computer in Minecraft. This file will be automatically loaded when your pedestrian sound computer in Minecraft boots.

The sole purpose of this programme is to automatically start the pedestrianSound programme.

In addition, this file will replicate a computer booting - which sole purpose is immersion only, with no real function.

### pedestrianSound
**Important!** Make sure to title the programme on your pedestrian light computer as `pedestrianSound`.

This programme handles the redstone inputs received from the pedestrian light computer in order to determine which of three sound patterns to play:
* **Slow pattern.** Used to indicate to players that the pedestrian light is red.
* **Fast pattern.** Used to indicate to players that the pedestrian light is green.
* **Burst pattern.** Used to indicate to players that the pedestrian light is blinking.

In use cases with pedestrian detection, the slow pattern will only start when the player has requested a green light by stepping on the pressure plates.

Make sure that the bundled wire coming from the pedestrian light computer is connected to the right side of the pedestrian sound computer - or adjust the `bundleSide` variable accordingly.

Make sure that the speaker is connected to the left side of the pedestrian sound computer - or adjust the `speakerSide` variable accordingly.

Enter in the `sound` variable which sound you would like the speaker to make.
* Enter `1` for a High Click
* Enter `2` for a Mid Click
* Enter `3` for a Low Click
* Enter `4` for an even Lower Click
* Enter `5` for a Bell
* Enter `6` for a Plop
* Enter `7`, `8`, `9`, or `10` for a nonsense sound

Enter in the `volume` variable the range at which the sound is heard by players. Enter `1` for the default range, `2` for an extended range, and `3` for the maximum range.