# MutsFM's Elevator Inc.
=====

This readme will first explain how to use the individual files in this repository. Below is an explanation of how to build the elevator system in minecraft itself.

Github repository files
=====

The following files should be in the repository:
  * startup-c
  * Fdsd
  * startup-t

IMPORTANT
=====
Every floor uses at least two computers: a controller computer and a touchscreen computer. Each uses its own startup script, however for clarity, the names of these scripts have, if necessary, been amended slightly to indicate which script belongs to which computer. Additionally, several scripts provided in the respository apply to the same computer and it depends on your elevator system (number of floors) which script you need.</br>
</br>
Therefore, several files in this repository need to be titled differently on your computer in minecraft. Each section below will indicate if this is the case.</br>
</br>
**If you do not title the scripts correctly on the computer in minecraft, the scripts will not work!**</br>
</br>
Example: "startup-c" is the startup script for the controller computer and should be titled "startup" on your computer in minecraft.

# Individual Files
### Controller Computer
The Controller Computer activates and deactivates the redstone signal as required for your minecart to reach the selected floor. It requires the following scripts:
- startup-c
- receivefloor
- flooractivated
- deactivatefloor
#### startup-c
