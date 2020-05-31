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

This use case requires you to place only **one** computer: a traffic light computer. You also need to install the monitors for the desired amount of traffic lights and pedestrian lights. 

Note that one traffic light consist of 2 monitors placed on top of each other, and that one pedestrian light consist of 1 monitor. 

You then need to connect the traffic lights, pedestrian lights and the traffic light computer using network cables - make sure all are on the same wired network. To make the cables going into the ground more visually pleasing, you can use a modem block (note: not the modem object itself, but the block!) as floor tile. You can branch of pedestrian lights from the 'pole' that is created by the traffic light.

You need to place the **startup-tl** file from the main traffic lights folder on your computer, and title it `startup`.

You then need to select the traffic scenario that fits your needs from the `WPL` folder. You however need to title this program as `trafficlight` on your traffic light computer in Minecraft.

> TOO ADJUST For example, the program `tl-2plus1` should be named `trafficlight` on your traffic light computer in Minecraft.

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

For more detailed information on the files, see the section on individual files.

## Traffic Lights for Vehicles and Pedestrians, with Pedestrian Sounds

To add.

## Traffic Lights for Vehicles and Pedestrians, with Pedestrian Detection and Sounds

This use case requires you to place **three** computers: a traffic light computer, a pedestrian light computer and a pedestrian sound computer. You also need to install the monitors for the desired amount of traffic lights and pedestrian lights. 

You furthermore need to place one speaker next to the pedestrian sound computer. It is advised to place both right underneath the asphalt in the middle of the junction.

Note that one traffic light consist of 2 monitors placed on top of each other, and that one pedestrian light consist of 1 monitor. 

You then need to connect the traffic lights, pedestrian lights, the traffic light computer and pedestrian light computer using network cables - make sure all are on the same wired network. To make the cables going into the ground more visually pleasing, you can use a modem block (note: not the modem object itself, but the block!) as floor tile. You can branch of pedestrian lights from the 'pole' that is created by the traffic light.

You need to make sure the pressure plates are connected via redstone to the side of the pedestrian light computer. (If not on the right side, make sure to adjust the file.)

You need to make sure to connect the pedestrian light computer to the pedestrian sound computer using a bundled wire. **The pedestrian sound computer should not be connected to the wired rednet network!** Make sure to connect the bundled wire is connected to the right side of the pedestrian sound computer and the speaker on its left - or otherwise adjust the file accordingly. Also make sure the bundled wire does not connect with the redstone coming from the pressure plates. Make sure the bundled wire is connected to the left of the pedestrian light controller - or otehrwise adjust the file accordingly.

You need to place the **startup-tl** file from the main traffic lights folder on your traffic light computer, and title it `startup`.

You need to place the **startup-plc** file from the main traffic lights folder on your pedestrian light computer, and title it `startup`.

You need to place the **startup-ps** file from the main traffic lights folder on your pedestrian sound computer, and title it `startup`.

You then need to select the files for the traffic scenario that fits your needs from the `WPDS` folder. See the 'File Naming Convention' near the top of this readme to identify which file suits your traffic scenario.

You however need to title the traffic light program as `trafficlight` on your traffic light computer in Minecraft.

> For example, the program `tl-2plus1plus1.lua` should be named `trafficlight` on your traffic light computer in Minecraft.

You also need to title the pedestrian light program as `plc` on your pedestrian light computer. 

> For example, `plc-8.lua` should be named `plc` on your pedestrian light computer in Minecraft.

The pedestrian sound program should be named `pedestrianSound` on your pedestrian sound computer in Minecraft.

For more detailed information on the files, see the section on individual files.