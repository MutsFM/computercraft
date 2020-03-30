# MutsFM's Elevator Inc.
=====

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
fdsa

# Individual Files
The explanations below are ordered by the computer that uses them.
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
In addition, this file will replicate a computer booting - which sole purpose is immersion only, with no real function.
### floorcontroller
**Important!! You need to enter the corresponding floor number in lines 9 and 18, on the floor's controller computer in Mincraft, for the system to work!**</br>
This file controls whether or not your floor is activated or deactivated.</br>
The programme automatically listens for rednet messages (via the wired connection).</br>



