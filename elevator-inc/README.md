# MutsFM's Elevator Inc.

This readme will first explain shortly how the "MutsFM Elevator Inc" elevator system works in Minecraft and a quick guide to setting up your own system using "MutsFM Elevator Inc" software. Below that is an explanation on how the individual files in this repository work.

# Table of Contents
- [Github Repository Files](https://github.com/MutsFM/computercraft/tree/master/elevator-inc#github-repository-files)
- [Important](https://github.com/MutsFM/computercraft/tree/master/elevator-inc#important)
- [How the Elevator System Works](https://github.com/MutsFM/computercraft/tree/master/elevator-inc#how-the-elevator-system-works)
- [Quick Start Guide for Setting Up the Software](https://github.com/MutsFM/computercraft/tree/master/elevator-inc#quick-start-guide-for-setting-up-the-software)
- [Invidual Files](https://github.com/MutsFM/computercraft/tree/master/elevator-inc#individual-files)
  - [Controller Computer](https://github.com/MutsFM/computercraft/tree/master/elevator-inc#controller-computer-1)
  - [Touchscreen Computer](https://github.com/MutsFM/computercraft/tree/master/elevator-inc#touchscreen-computer-1)
  - [Cart Dispenser Computer](https://github.com/MutsFM/computercraft/tree/master/elevator-inc#cart-dispenser-1)

Github repository files
=====

The following files should be in the repository:
  * startup-c
  * floorcontroller
  * floorcontroller-lf
  * activatefloor
  * deactivatefloor
  * startup-t
  * touchscreen
  * startup-d
  * cartdispenser

IMPORTANT
=====
Every floor uses two computers: a controller computer and a touchscreen computer. Each uses its own startup script, however for clarity, the names of these scripts have been amended slightly in this repository to indicate which script belongs to which computer. Additionally, several scripts provided in the respository apply to the same computer and it depends on the needs of your elevator system (e.g. number of floors or visual design for your touchscreen) which script you require.

Therefore, several files in this repository need to be titled differently on your computer in Minecraft. Each section below will indicate if this is the case.

**If you do not title the scripts correctly on the computer in minecraft, the system will not work!**

Example: "startup-c" is the startup script for the controller computer and should be titled `startup` on your controller computer in minecraft.

# How the Elevator System Works
#### General Principle
Using Railcraft, minecarts travel upwards on redstone powered elevator tracks and conversely travel downwards on unpowered elevator tracks. If an elevator track is powered by redstone, all other elevator tracks below it are powered as well. By selecting which elevator track to power, you determine how far the minecart travels upwards or downwards.

#### Elevator System
Every floor needs to have a controller computer and a 'touchscreen' connected to a computer. The player clicks on a floor number displayed on the touchscreen. The touchscreen computer registers this input, and sends out a corresponding message for the selected floor over the rednet network. Controller computers listen for these messages and once they receive a message, they act accordingly by either activating or deactivating their redstone output. The redstone output from the controller computer in turn influences the elevator track located at that level.

Below are visual representations of the layout for one floor of the elevator system.

![ElevatorSkeleton](/images/elevator-inc/ElevatorSkeleton.gif)
![PCView](/images/elevator-inc/pcview.png)
![TopDownView](/images/elevator-inc/topview.png)

**Note:** The elevator tracks and network cables should be extended upwards and downwards as necessary. The glass blocks are added for visibility, while green blocks added as contrast. Both the glass blocks and green blocks merely serve illustrative purposes, and can be replaced by any block suitable for your building's interior style.

**Note:** The disk station is optional, however may speed up the elevator system's building and installation process. See [Additional Tips](https://github.com/MutsFM/computercraft/tree/master/elevator-inc#additional-tips) below.

If the floor is selected, the controller computer powers the elevator track at the floor and all elevator tracks below it, allowing for the cart to reach that floor - regardless if the cart is coming from a higher or lower floor.

If the floor is unselected, the controller computer does not power the elevator track at the floor. It may however still be powered if a floor above the respective floor is selected. The power then however comes from the controller computer above.

For aesthetic purposes, it is advised to reserve at least a floor space of 4 blocks wide by 6 blocks long. Smaller would be possible, at the cost of aesthetics. Due to the height of the touchscreen, every floor needs to be at least 3 blocks high.

#### Network
All computers (both controller and touchscreen) in a building's elevator system are connected via network wires. Although wireless connection is a possibility in ComputerCraft, it may result in unwanted interference from other computers broadcasting on the wireless communication channel used by the elevator system. In addition, elevator systems in two adjacent buildings would need to broadcast on different channels, in order for the systems to operate separately. This would however require a lot of small changes to the code on each computer in the system to be done in Minecraft itself. Therefore, a closed wired network has been chosen as the better solution, as this can be implemented without the risk of interference and without the need to make any changes to the network code from the computer in Minecraft.

#### Cart Dispenser
The software comes with a feature to request an empty Minecart to be delivered to your respective floor. You would need to set up a cart dispenser system in the basement of your building for this feature to work.

![DispenserSystem](/images/elevator-inc/DispenserSystem.png)
![DispenserComputer](/images/elevator-inc/DispenserComputer.png)

The cart dispenser feature is however optional. Should you not wish to have such feature, you can comment out the button in the touchscreen programme (for more information, see the individual file on the cart dispenser below). In that case, you need to bring your own minecart with you.

**NOTE:** The cart dispenser system as pictured on the Wiki can only supply three minecarts, due to the limited storage capacity of the cart dispenser. A cart dispenser system with more capacity is currently in development.

---
# Quick Start Guide for Setting Up the Software
### Controller Computer
The back of your controller computer needs to be placed against a block against which in turn the elevator track is placed on at the other side. Alternatively, the elevator track can be placed against the back of the controller computer.

On your controller computer, you need to install the startup-c and floorcontroller programmes. You need to title the startup-c programme as `startup`. You need to replace `"Floor1"` in the first line of the floorcontroller programme with the corresponding floor number, e.g. `"Floor6"`. Note that groundfloor should be entered as `"Floor0"`.

On your controller computer on the **lowest** floor of your building that you want players to access, you should not install the floorcontroller programme, but rather the floorcontroller-lf programme. You however need to title the floorcontroller-lf programme as `floorcontroller`.

### Touchscreen Computer
The touchscreen computer requires a 2 wide, 3 high construction of monitors, to be placed on the right side of the touchscreen computer.

On your touchscreen computer, you need to install the startup-t and touchscreen programmes. You need to title the startup-t programme as `startup`. You need to replace `"Floor1"` in the first line of the touchscreen programme with the corresponding floor number, e.g. `"Floor6"`. Note that the groundfloor should be entered as `"Floor0"`.

**NOTE:** If you wish, you can customise the colors on the screen by changing the color codes in the section 'Color Customisation Options'.

**NOTE:** The touchscreen programme in this repository is for a 7 floor building, however in the folder "ts" you can find additional touchscreen programmes for buildings with more floors. The number behind "touchscreen" indicates for how many floors that programme is designed. For example, touchscreen20n is designed for a building with 20 floors and is presented in a numpad design rather than the original design. You however need to title these programmes as `touchscreen` on your computer in Minecraft, in order for the system to work. If the exact amount of floors for your building is not covered, it is advised to select the first higher numbered touchscreen, and then delete the non-required floors from both the screen and listen functions, using the computer in Minecraft.

**NOTE:** In the original design, touchscreen programmes for up to 10 floors display all available floors on the screen. Touchscreen programmes for more than 10 floors use multiple pages to display all floors. In the numpad design, a maximum of 25 floors is displayed at one page, with the possiblity to display more than 25 floors by using multiple pages. 

### Cart Dispenser Computer
The cart dispenser computer requires a cart dispenser placed at the back of if, with its opening faceing towards the tracks. A booster track, powered by redstone, is required to be placed on the first track from the cart dispener. (The two additional tracks as pictured in the image above are not required, merely the booster track.)

On your cart dispenser computer, you need to install the startup-d and cart dispenser programmes. You need to title the startup-d programme as `startup`. You need to fill the cart dispenser with minecarts. You need to connect the cart dispenser computer with a wired modem and cables to your elevator system.

### Additional Tips
The quickest way to build a lot of floors is to use worldedit. Build one floor, and subsequently copy and paste additional floors above or below it. **NOTE:** One small drawback however is that Minecraft copies the computers rather then replacing them with new computers; said differently, the copied computers are copies of the original floor's computer and are therefore not assigned a unique computerID. This means that all computers in your system use the same programme files, making it impossible to assign different floors. **You therefore always need to place new computers in case you use worldedit to copy and paste your floors.** Nevertheless, replacing only the computers is still significantly quicker than building all floors.

The quickest way to get the programmes in this repository on your computercraft computers depends on whether you have access to the world's save files.

*If you have access to the world's save files*, the easiest way would be to simply download the programmes in this repository and subsequently copy and paste them in the respective computercraft computer folders. (Don't forget to adjust them accordingly!)

*If you do not have access to the world's save files*, then the easiest way would be to use git to download all files to one computer in Minecraft, and subsequently put them on a disk. Copy and pasting them from that disk on the respective computers in Minecraft is much faster than typing the 'git get' command for every programme, due to the length of the command.

This latter method however requires the 'git' programme to be installed on a computer on your Minecraft server. Should you not have access to the programme, ask your server's admin to place it on a computer for you.

To get the programmes using git on your computer in Minecraft, use the command structure as presented in the following example:

`git get MutsFM computercraft master elevator-inc/startup-c startup`

---
# Individual Files
The explanations below are ordered by the type of computer that uses them.

- [Controller Computer](https://github.com/MutsFM/computercraft/tree/master/elevator-inc#controller-computer-1)
  - [startup-c](https://github.com/MutsFM/computercraft/tree/master/elevator-inc#startup-c)
  - [floorcontroller](https://github.com/MutsFM/computercraft/tree/master/elevator-inc#floorcontroller)
  - [floorcontroller](https://github.com/MutsFM/computercraft/tree/master/elevator-inc#floorcontroller-lf)
  - [activatefloor & deactivatefloor (optional)](https://github.com/MutsFM/computercraft/tree/master/elevator-inc#activatefloor--deactivatefloor-optional)
- [Touchscreen Computer](https://github.com/MutsFM/computercraft/tree/master/elevator-inc#touchscreen-computer-1)
  - [startup-t](https://github.com/MutsFM/computercraft/tree/master/elevator-inc#startup-t)
  - [touchscreen](https://github.com/MutsFM/computercraft/tree/master/elevator-inc#touchscreen)
- [Cart Dispenser Computer](https://github.com/MutsFM/computercraft/tree/master/elevator-inc#cart-dispenser-1)
  - [startup-d](https://github.com/MutsFM/computercraft/tree/master/elevator-inc#startup-d)
  - [cartdispenser](https://github.com/MutsFM/computercraft/tree/master/elevator-inc#cartdispenser)

---
## Controller Computer
The Controller Computer activates and deactivates the redstone signal as required for your minecart to reach the selected floor. The back of your controller computer needs to be placed against a block against which in turn the elevator track is placed on at the other side. Alternatively, the elevator track can be placed against the back of the controller computer. 
It requires the following scripts:
- startup-c
- floorcontroller
- activatefloor (optional)
- deactivatefloor (optional)

The controller computer on the lowest floor of your building that you want the players to access, requires the floorcontroller-lf programme instead of the floorcontroller programme.

---
### startup-c
**Important!** This file should be titled as followed on your controller computer in Minecraft: `startup` 
This file will be automatically loaded when your controller computer in Minecraft boots.
It has two main purposes:
* To connect your computer to the rednet network. (Make sure you connect the wired modem on the left side of the monitor.)
* To automatically start the floorcontroller programme.

In addition, this file will replicate a computer booting - which sole purpose is immersion only, with no real function.

---
### floorcontroller
**Important!** You need to enter the corresponding floor number in the first line, on the floor's controller computer in Mincraft, for the system to work! Ground Floor should be entered as `"Floor0"`.

This file controls whether or not your floor is activated or deactivated.

The programme automatically listens for rednet messages (via the wired connection).
* If the message corresponds to the floor number, it will activate the redstone signal at the back of the computer and then start to listen for messages again.
* If the message concerns the request for a cart, it will ignore the message and starts to listen for messages again. 
* If the message does not correspond to the floor number, it will deactivate the redstone signal and then start to listen for messages again.

It uses the restart function to start to listen for messages again. This function is therefore called when the programme is started.

---
### floorcontroller-lf
**Important!** This file should be titled as followed on your controller computer in Minecraft: `floorcontroller`

This file should only be installed on the controller computer on the lowest floor of your building that you want players to access. Depending on your design, this could be the ground floor, however if you have basements, it needs to be installed on the lowest basement floor's controller computer. (Please note that at the moment basement levels require further changes to the code, besides the variables). 

This programme lets the controller computer emit a continous redstone signal, with the purpose to prevent the player from going into the cart dispenser area.

---
### activatefloor & deactivatefloor (optional)
Both files are optional, and do not need to be present on the controller computer.
They are useful for testing whether the redstone and tracks have been correctly installed, as they allow you to activate and deactivate the redstone signal, without having to run the full programme and using a touchscreen monitor to send the messages.

---
## Touchscreen Computer
The Touchscreen Computer allows the players to select the floor they wish to activate via the touchscreen. It requires the following scripts:
- startup-t
- touchscreen

---
### startup-t
**Important!** This file should be titled as followed on your controller computer in Minecraft: `startup`

It has two main purposes:
* To connect your computer to the rednet network. (Make sure you connect the wired modem on the left side of the monitor.)
* To automatically start the touchscreen programme.

In addition, this file will replicate a computer booting - which sole purpose is immersion only, with no real function.

---
### touchscreen
**Important!** You need to enter the corresponding floor number in the first line, on the floor's touchscreen computer in Mincraft, for the system to work! Ground Floor should be entered as `"Floor0"`

This programme allows your players to select a floor for the elevator.

It has three main purposes:
* It connects to the screen. (Make sure the monitor is placed on the right side of the computer!),
* It registers the input from the player on the touchscreen, and 
* If the player selects a floor, it sends out a corresponding rednet message to controller computers, or
* If the player selects "request cart", it sends out a corresponding rednet message to the cart dispenser computer.

The touchscreen also includes a feature that displays the corresponding floor number differently from the other floors, allowing players to identify on which floor they are.

The touchscreen programme furthermore allows for easy customisation of the colors displayed on the screen. You can change the colors in the Color Customisation Options section. This is described in further detail below.

**Note:** The cart request function and system is optional. The elevator system will still work, even if the cart dispense function is not installed. In such case, the 'cart request' button on the touchscreen will merely not result in a cart to be delivered to the floor. If desired, you could delete or comment out the respective sections in the touchscreen programme. Touchscreen programmes without a cart request function are currently considered for a future release of Elevator-Inc.

The touchscreen programme in this repository is for a 7 floor building, however in the folder "ts" you can find additional touchscreen programmes for buildings with more floors and with different designs. The number behind "touchscreen" indicates for how many floors that programme is designed. For example, touchscreen20n is designed for a building with 20 floors with a numpad design rather than the original design.  

**IMPORTANT!** You however need to title these programmes as `touchscreen` on your computer in Minecraft, in order for the system to work. If the exact amount of floors for your building is not covered, it is advised to select the first higher numbered touchscreen, and delete the non-required floors from both the screen and listen functions, using the computer in Minecraft.

The code for the touchscreen programme differs significantly, depending on whether you are running a programme for 10 floors or less, or a programme for more than 10 floors. In case of the latter, it also depends on whether you are running a programme for the original design or the numpad design. This readme will therefore first set out the touchscreen programme for the original design, then for touchscreen programmes for more than 10 floors with the original design, and then for touchscreen programmes for more than 10 floors running the numpad design.

**NOTE:** In all versions, you need to replace `"Floor1"` in the first line of the touchscreen programme with the corresponding floor number, e.g. `"Floor6"`. Note that the groundfloor should be entered as `"Floor0"`.

#### Original Design
The screen function is used to draw the touchscreen, presenting the floors which the players can choose by hitting them on the screen.

The listen function waits for the player to hit the screen, and if a player hits a floor number, then sends the accompanying message over rednet to the controller computers.

*Color customization.* By changing the color codes in the respective lines, you can change the following elements:
**TO BE MADE INTO A TABLE**
- `sbckc` allows you to change the screen's background color.
- `ttxtc` allows you to change the color of the text presented at the top of the screen.
- `bckc` allows you to change the background color of the floor number buttons.
- `ftxtc` allows you to change the color of the text for the floor number corresponding to the floor (as entered in the first line of the programme).
- `txtc` allows you to change the color of the text for the other floor numbers.

You can also change the floor selection confirmation screen's colors, by changing the color code of `csbckc` to change the screen's background color, and `cstextc` to change the color of the text.

#### Original Design 10+ Floors
To be added.

#### Numpad Design
Code is similar to the original design, with the major differences being that the floors are displayed as numerical buttons (e.g. "1", "2") rather than buttons including the word floor (e.g. "Floor 1", "Floor2"), and that a maximum of 25 floors can be displayed on the screen.

To add colour customisation options.

#### Numpad Design 25+ Floors
To be added

---
## Cart Dispenser
The Cart Dispenser Computer dispenses a cart upon request by the player. It requires the following scripts:
- startup-d
- cartdispenser

**Note:** The cart request function and system is optional. The elevator system will still work, even if the cart dispense function is not installed. In such case, the 'cart request' button on the touchscreen will merely not result in a cart to be delivered to the floor. If desired, you could delete or comment out the respective sections in the touchscreen programme. Touchscreen programmes without a cart request function are currently considered for a future release of Elevator-Inc.

---
### startup-d
**Important!** This file should be titled as followed on your controller computer in Minecraft: `startup`

It has two main purposes:
* To connect your computer to the rednet network. (Make sure you connect the wired modem on the left side of the monitor.)
* To automatically start the cartdispenser programme.

In addition, this file will replicate a computer booting - which sole purpose is immersion only, with no real function.

---
### cartdispenser
Upon receiving a "cart request" rednet message, this programme applies a redstone to the cart dispenser, making it dispense one cart, which is then propelled by the redstone powered booster track towards the elevator tracks.
