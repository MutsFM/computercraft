# ArchiTech Traffic Lights

This readme explains how the ArchiTech traffic lights function and can be installed in Minecraft. It requires the Computer Craft (CC:Tweaked) mod.

This readme will first show the different traffic lights and auxiliary equipment. The traffic lights are customisable and come with different lighting sequences, icons to be displayed, and colours to choose from.

# Table of Contents

- To be added

# Important

Several files in this repository need to be titled differently on your computer in Minecraft in order to work. These files have been titled differently from their intended Minecraft file title in order to be quickly able to identify which file suits your use case.

Each section below will indicate which files need to be titled differently on your computer in Minecraft, and will provide the correct title for use in Minecraft.

For example, the `startup-ps` needs to be titled as followed on your computer in Minecraft: `startup` 

# ArchiTech Traffic Lights Overview

ArchiTech Traffic Lights provides traffic lights for several main use cases:
* Traffic lights for vehicles
* Traffic lights for vehicles and pedestrians
* Traffic lights for vehicles and pedestrians, with pedestrian detection
* Traffic lights for vehicles and pedestrians, with audible indicators
* Traffic lights for vehicles and pedestrians, with pedestrian detection and audible indicators

How to set up the traffic lights for these use cases is described in more detail below in the section **"Use Cases"**.

**The files for the use cases are furthermore subdivided based on traffic scenarios, e.g. 3 traffic lights on a through road and 1 on a side street, or 6 traffic lights on a through road and 2 on a side street. If your traffic scenario is not covered, open an issue and I would be happy to add a file for your scenario. (Of course you can always edit a scenario from this repository manually on your computers in Minecraft to fit your needs).**

## Traffic Lights for Vehicles
The traffic light for vehicles comes with 4 different lighting sequences and with 5 icons.

### Sequences

| **The Standard Sequence** | **The UK/German Sequence** | **Warning Sequence** | **Stop Sequence** |
|:------------- |:-------------:|:-------------:|:-----:|
| ![StandardSequence](/images/trafficlights/StandardSequence.gif) | ![GermanSequence](/images/trafficlights/GermanSequence.gif) | To Be added | To Be Added |
| The standard green-yellow-red traffic light sequence. | A variation on the standard sequence, in which before a red light turns green, it will shortly show the yellow/orange light together with the red light to alert drivers that it soon will turn green. | A yellow/orange flashing warning sequence | A flashing sequence for the red light, which in some countries indicate the traffic light should be seen as a stop sign. |




**The Standard Sequence**  
The standard green-yellow-red traffic light sequence.

![GermanSequence](/images/trafficlights/GermanSequence.gif)

**The UK/German Sequence**  
A variation on the standard sequence, in which before a red light turns green, it will shortly show the yellow/orange light together with the red light to alert drivers that it soon will turn green.




# Use Cases

ArchiTech Traffic Lights cover the following use cases:

| **Use Case** | **Folder** | **Description** |
|:------------- |:-------------|:----------|
| *Traffic lights for vehicles* | Core | Core set of traffic lights for vehicles |
| *Traffic lights for vehicles and pedestrians* | WPL | Core + traffic lights for pedestrians. The pedestrian lights are included automatically in the sequence|
| *Traffic lights for vehicles and pedestrians, with pedestrian detection* | WPD | WPL + pedestrian detection. The pedestrian lights only become part of the sequence once the player requests a green light for pedestrians. |
| *Traffic lights for vehicles and pedestrians* | WPLS | WPL + Audible Sound for pedestrians. The pedestrian lights are included automatically in the sequence. Will play alternating sounds, depending on the traffic light situation for the pedestrian. |
| *Traffic lights for vehicles and pedestrians, with pedestrian detection and audible indicators* | WPDS | WPD + Audible Sound for pedestrians. Same sounds as WPLS, but will only play the appropriate sounds once the player has requested a green light for pedestrians. |

In short

Only explain the logic behind the files names, not list them all. Also indicate that other variations can be created upon demand though issue opening.
