# MutsFM's Elevator Inc.

This readme will first explain shortly how the elevator system works in Minecraft. Below that is an explanation on how the individual files in this repository work. 

Github repository files
=====

The following files should be in the repository:
  * startup-c
  * floorcontroller
  * activatefloor
  * deactivatefloor

IMPORTANT
=====
Every floor uses at least two computers: a controller computer and a touchscreen computer. Each uses its own startup script, however for clarity, the names of these scripts have, if necessary, been amended slightly to indicate which script belongs to which computer. Additionally, several scripts provided in the respository apply to the same computer and it depends on your elevator system (number of floors) which script you need.</br>
</br>
Therefore, several files in this repository need to be titled differently on your computer in Minecraft. Each section below will indicate if this is the case.</br>
</br>
**If you do not title the scripts correctly on the computer in minecraft, the scripts will not work!**</br>
</br>
Example: "startup-c" is the startup script for the controller computer and should be titled "startup" on your computer in minecraft.

# How the Elevator System Works
Functioning and layout to be added</br>
</br>
### Controller Computer
On your controller computer, you need to install the startup-c and floorcontroller programmes. You need to title the startup-c programme as startup. You need to replace "Floor1" in lines 9 and 18 of the floorcontroller programme with the corresponding floor number, e.g. "Floor6". Note that groundfloor should be entered as "Floor0".</br>
</br>
### Touchscreen Computer
On your touchscreen computer, you need to install the startup-t and touchscreen programmes. You need to title the startup-t programme as startup. You need to replace "Floor1" in the line on the cart request in the listen function in the touchscreen programme with the corresponding floor number, e.g. "Floor6". Note that the groundfloor should be entered as "Floor0".</br>
**NOTE:** The touchscreen programme in this repository is for a 7 floor building, however in the folder "ts" you can find additional touchscreen programmes for buildings with more floors. The number behind "touchscreen" indicates for how many floors that programme is designed. For example, touchscreen20n is designed for a building with 20 floors with a numpad design rather than the original design. You however need to title these programmes as **touchscreen** on your computer in Minecraft, in order for the system to work. If the exact amount of floors for your building is not covered, it is advised to select the first higher numbered touchscreen, and then delete the non-required floors from both the screen and listen functions, using the computer in Minecraft.</br>
**NOTE:** In the original design, touchscreen programmes for up to 10 floors display all available floors on the screen. Touchscreen programmes for more than 10 floors use multiple pages to display all floors. In the numpad design, a maximum of 25 floors is displayed at one page, with the possiblity to display more than 25 floors by using multiple pages. </br>
**NOTE:** You can also use the touchscreen to indicate to persons on which floor they currently are, by changing the color of the floor on the screen. See the description in the individual file below for more information.



# Individual Files
The explanations below are ordered by the type of computer that uses them.

## Controller Computer
The Controller Computer activates and deactivates the redstone signal as required for your minecart to reach the selected floor. It requires the following scripts:
- startup-c
- floorcontroller
- activatefloor (optional)
- deactivatefloor (optional)

### startup-c
**Important!** This file should be titled as followed on your controller computer in Minecraft: **startup** </br>
This file will be automatically loaded when your controller computer in Minecraft boots.</br>
It has two main purposes:
* To connect your computer to the rednet network. (Make sure you connect the wired modem on the left side of the monitor.)
* To automatically start the floorcontroller programme.
</br>
In addition, this file will replicate a computer booting - which sole purpose is immersion only, with no real function.

### floorcontroller
**Important! You need to enter the corresponding floor number in lines 9 and 18, on the floor's controller computer in Mincraft, for the system to work! Ground Floor should be entered as "Floor0"**</br>
This file controls whether or not your floor is activated or deactivated.</br>
The programme automatically listens for rednet messages (via the wired connection).</br>
If the message corresponds to the floor number, then it will activate the redstone signal and then start to listen for messages again.</br>
If the message concerns the request for a cart, it will ignore the message and starts to listen for messages again. </br>
If the message does not correspond to the floor number, it will deactivate the redstone signal and then start to listen for messages again. </br>
It uses the restart function to start to listen for messages again. This function is therefore called when the programme is started.</br>

### activatefloor & deactivatefloor (optional)
Both files are optional, and do not need to be present on the controller computer.</br>
They are useful for testing whether the redstone and tracks have been correctly installed, as they allow you to activate and deactivate the redstone signal, without having to run the full programme and using a touchscreen monitor to send the messages.</br>


## Touchscreen Computer
The Touchscreen Computer allows the players to select the floor they wish to activate via the touchscreen. It requires the following scripts:
- startup-t
- touchscreen

### startup-t
**Important!** This file should be titled as followed on your controller computer in Minecraft: **startup** </br>
It has two main purposes:
* To connect your computer to the rednet network. (Make sure you connect the wired modem on the left side of the monitor.)
* To automatically start the touchscreen programme.
</br>
In addition, this file will replicate a computer booting - which sole purpose is immersion only, with no real function.

### touchscreen
**Important! You need to enter the corresponding floor number in the line on the cart request in the listen function, on the floor's controller computer in Mincraft, for the system to work! Ground Floor should be entered as "Floor0"**</br>
This file allows your players to select a floor for the elevator.</br> 
It has two main purposes:
* It registers the input from the player on the touchscreen, and 
* If the player selects a floor, it sends out a corresponding rednet message to controller computers.</br>

The touchscreen programme in this repository is for a 7 floor building, however in the folder "ts" you can find additional touchscreen programmes for buildings with more floors and with different designs. The number behind "touchscreen" indicates for how many floors that programme is designed. For example, touchscreen20n is designed for a building with 20 floors with a numpad design rather than the original design. </br> 
</br>
**IMPORTANT!** You however need to title these programmes as **touchscreen** on your computer in Minecraft, in order for the system to work. If the exact amount of floors for your building is not covered, it is advised to select the first higher numbered touchscreen, and delete the non-required floors from both the screen and listen functions, using the computer in Minecraft.</br>
</br>
**NOTE:** An extra feature you can implement is to indicate on which floor the player is currently standing, by changing the appearance of the floor number on the screen.</br>
The touchscreen programmes in the repository provide an example by changing the color of the text for "Floor1". (Example in comments, to activate, you need to delete the "--" at the start of the lines above and below the line of "Floor1".)</br>
You may also consider changing the color of the background, or both. Regardless, you need to set the command to change the color in the line about the command to write the floor, and the command to revert the color back in the line below it.</br>
</br>
The code for the touchscreen programme differs significantly, depending on whether you are running a programme for 10 floors or less, or a programme for more than 10 floors. In case of the latter, it also depends on whether you are running a programme for the original design or the numpad design. This readme will therefore first set out the touchscreen programme for the original design, then for touchscreen programmes for more than 10 floors with the original design, and then for touchscreen programmes for more than 10 floors running the numpad design.</br>
</br>
*Original Design*
The screen function is used to draw the touchscreen, presenting the floors which the players can choose by hitting them on the screen.</br>
The listen function waits for the player to hit the screen, and if a player hits a floor number, then sends the accompanying message over rednet to the controller computers.</br>
</br>
*Original Design 10+*
To be added.</br>
</br>
*Numpad Design*
Code is similar to the original design, with the major differences being that:
* the floors are displayed as numerical buttons (e.g. "1", "2") rather than buttons including the word floor (e.g. "Floor 1", "Floor2");
* a maximum of 25 floors can be displayed on the screen.</br>
</br>
*Numpad Design 10+*
To be added</br>
