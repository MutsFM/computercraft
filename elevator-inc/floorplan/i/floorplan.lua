-- TO DO:
-- *Add additional info5 line for each floor
-- *Add 2 additional warning lines for each floor
-- *Add color for the background and text for the warning lines (lines on y == 14 & 15), in both color customisation settings and the floorInformation function
-- *Add all of this to a new version of the touchscreen for the architech HQ, make a new folder within TS for those.



local monitorSide = "right"				-- Replace "right" with side to which the monitor is connected.

-- Floorplan Information

local buildingName = "ArchiTech HQ"
local buildingNamePos = 4 			-- See table in readme for positions.
local subtitle = "Floor Plan"
local subtitlePos = 5 				-- See table in readme for positions.
local indicationPos = 2				-- 1 for max 18 characters, 2 for max 17 characters, 3 for max 16 characters - Including spaces

local nameGroundFloor = "Reception & Exit" 
local gfInfo1 = "You can find the "			-- Max 18 Characters, including spaces, for each line
local gfInfo2 = "reception on this"
local gfInfo3 = "floor, as well as" 
local gfInfo4 = "all exits from "
local gfInfo5 = "the building."

local nameFloor1 = "Offices"
local f1info1 = "ArchiTech Offices"			-- Max 18 Characters, including spaces, for each line
local f1info2 = "for Traffic Lights"
local f1info3 = "and Elevator"
local f1info4 = "departments."
local f1info5 = ""

local nameFloor2 = "Showrooms"
local f2info1 = "Showrooms for the"
local f2info2 = "ArchiTech Traffic"
local f2info3 = "Lights and the"
local f2info4 = "ArchiTech Elevator"
local f2info5 = "products."

local nameFloor3 = "Showrooms"
local f3info1 = "Showroom for the"
local f3info2 = "ArchiTech Metro"
local f3info3 = "Systems products."
local f3info4 = "Caution:"
local f3info5 = "Running Train!"

local nameFloor4 = "Meeting Rooms"
local f4info1 = "ArchiTech meeting"			-- Max 18 Characters, including spaces, for each line
local f4info2 = "rooms can be found"
local f4info3 = "on this floor."
local f4info4 = ""
local f4info5 = ""

local nameFloor5 = "Offices"
local f5info1 = "ArchiTech Offices"			-- Max 18 Characters, including spaces, for each line
local f5info2 = "for Metro Systems"
local f5info3 = "department."
local f5info4 = ""
local f5info5 = ""

local nameFloor6 = "Executive Offices"
local f6info1 = "ArchiTech's "			-- Max 18 Characters, including spaces, for each line
local f6info2 = "Executives have" 
local f6info3 = "their offices on"
local f6info4 = "this floor."
local f6info5 = "Restricted Access."

-- Color Customisation Options

local sbckc = colors.white				-- Screen background color. Replace 'white' with another color code.
local tttxtc = colors.black				-- Color of the title at the top. Replace 'black' with another color code. 
local ttbckc = colors.white				-- Color of the background for the title at the top. Replace 'white' with another color code.
local tstxtc = colors.black				-- Color of the subtitle at the top. Replace 'black' with another color code.
local tsbckc = colors.white				-- Color of the background for the subtitle at the top. Replace 'white' with another color code.
local bbckc = colors.white				-- Color of the background for the text at the bottom. Replace 'white' with another color code.
local btxtc = colors.black				-- Color of the text on the botom. Replace 'black' with another color code.
local fbckc = colors.black				-- Color of the background of the floors. Replace 'black' with another color code.
local ftxtc = colors.white				-- Color of the text of the floors. Replace 'white' with another color code.
local ibckc = colors.white				-- Color of the background of the floors' indication. Replace 'white' with another color code.
local itxtc = colors.black				-- Color of the text of the floors' indication. Replace 'black' with another color code.
local mbckc = colors.black				-- Color of the background of the menu buttons. Replace 'black' with another color code.
local mtxtc = colors.white				-- Color of the text of the menu buttons. Replace 'white' with another color code.

local esbckc = colors.white				-- Screen background color for the explanation pages. Replace 'white' with another color code.
local ebckc = colors.white				-- Color of the background of the floor's explanation. Replace 'white' with another color code.
local etxtc = colors.black				-- Color of the text of the floors' explanation. Replace 'black with another color code.

-- ******************************
-- CODE BELOW IS NOT ADJUSTABLE!!
-- ******************************

mon = peripheral.wrap(monitorSide)

-- Terminal

term.clear()
term.setTextColor(colors.red)
term.setCursorPos(16,1)
print("ArchiTech Elevator Inc.")
term.setTextColor(colors.white)
term.setCursorPos(1,3)
print("Floorplan Software")
print("Version for 6 floors, fully interactive")

function topScreen(bckcolor)

	-- Background Color
	mon.setBackgroundColor(bckcolor)
	mon.clear()
	
	-- Title
	mon.setBackgroundColor(ttbckc)
	mon.setCursorPos(buildingNamePos, 2)
	mon.setTextColor(tttxtc)
	mon.write(buildingName)
	
	-- Subtitle
	mon.setCursorPos(subtitlePos,3)
	mon.setBackgroundColor(tsbckc)
	mon.setTextColor(tstxtc)
	mon.write(subtitle)
	
end

function backButton()

	

end

function mainScreen()

	topScreen(sbckc)
	
	-- Ground Floor
	mon.setBackgroundColor(fbckc)
	mon.setTextColor(ftxtc)
	mon.setCursorPos(1,5)
	mon.write("Ground Floor")
	mon.setBackgroundColor(ibckc)
	mon.setTextColor(itxtc)
	mon.setCursorPos(indicationPos,6)
	mon.write(nameGroundFloor)
	
	-- Floor 1
	mon.setBackgroundColor(fbckc)
	mon.setTextColor(ftxtc)
	mon.setCursorPos(1,8)
	mon.write("Floor 1")
	mon.setBackgroundColor(ibckc)
	mon.setTextColor(itxtc)
	mon.setCursorPos(indicationPos,9)
	mon.write(nameFloor1)
	
	-- Floor 2	
	mon.setBackgroundColor(fbckc)
	mon.setTextColor(ftxtc)
	mon.setCursorPos(1,11)
	mon.write("Floor 2")
	mon.setBackgroundColor(ibckc)
	mon.setTextColor(itxtc)
	mon.setCursorPos(indicationPos,12)
	mon.write(nameFloor2)
	
	-- Floor 3	
	mon.setBackgroundColor(fbckc)
	mon.setTextColor(ftxtc)
	mon.setCursorPos(1,14)
	mon.write("Floor 3")
	mon.setBackgroundColor(ibckc)
	mon.setTextColor(itxtc)
	mon.setCursorPos(indicationPos,15)
	mon.write(nameFloor3)
	
	-- Menu Button to Floors 4-6
	mon.setBackgroundColor(mbckc)
	mon.setTextColor(mtxtc)
	mon.setCursorPos(4,18)
	mon.write(" Floors 4-6 >>>")
	
	mainScreenListen()
	
end

function mainScreenListen()
	
	event, side, x, y = os.pullEvent("monitor_touch")
	
	if x > 0 and x < 13 and y == 5 then
		floorInformation("   Ground Floor   ", mainScreen, gfInfo1, gfInfo2, gfInfo3, gfInfo4, gfInfo5)
	elseif x > 0 and x < 8 and y == 8 then
		floorInformation("     Floor 1      ", mainScreen, f1info1, f1info2, f1info3, f1info4, f1info5)
	elseif x > 0 and x < 8 and y == 11 then
		floorInformation("     Floor 2      ", mainScreen, f2info1, f2info2, f2info3, f2info4, f2info5)
	elseif x > 0 and x < 8 and y == 14 then
		floorInformation("     Floor 3      ", mainScreen, f3info1, f3info2, f3info3, f3info4, f3info5)
	elseif x > 3 and y == 18 then
		secondMainScreen()
	else
		mainScreenListen()
	end

end

function secondMainScreen()
	
	topScreen(sbckc)
	
	-- Floor 4
	mon.setBackgroundColor(fbckc)
	mon.setTextColor(ftxtc)
	mon.setCursorPos(1,5)
	mon.write("Floor 4")
	mon.setBackgroundColor(ibckc)
	mon.setTextColor(itxtc)
	mon.setCursorPos(indicationPos,6)
	mon.write(nameFloor4)
	
	-- Floor 5
	mon.setBackgroundColor(fbckc)
	mon.setTextColor(ftxtc)
	mon.setCursorPos(1,8)
	mon.write("Floor 5")
	mon.setBackgroundColor(ibckc)
	mon.setTextColor(itxtc)
	mon.setCursorPos(indicationPos,9)
	mon.write(nameFloor5)
	
	-- Floor 6	
	mon.setBackgroundColor(fbckc)
	mon.setTextColor(ftxtc)
	mon.setCursorPos(1,11)
	mon.write("Floor 6")
	mon.setBackgroundColor(ibckc)
	mon.setTextColor(itxtc)
	mon.setCursorPos(indicationPos,12)
	mon.write(nameFloor6)
	
	-- Menu Button to mainScreen
	mon.setBackgroundColor(mbckc)
	mon.setTextColor(mtxtc)
	mon.setCursorPos(1,18)
	mon.write("<<< Floors G-3")
	
	secondMainScreenListen()
	
end

function secondMainScreenListen()
	
	event, side, x, y = os.pullEvent("monitor_touch")
	
	if x > 0 and x < 8 and y == 5 then
		floorInformation("     Floor 4      ", secondMainScreen, f4info1, f4info2, f4info3, f4info4, f4info5)
	elseif x > 0 and x < 8 and y == 8 then
		floorInformation("     Floor 5      ", secondMainScreen, f5info1, f5info2, f5info3, f5info4, f5info5)
	elseif x > 0 and x < 8 and y == 11 then
		floorInformation("     Floor 6      ", secondMainScreen, f6info1, f6info2, f6info3, f6info4, f6info5)
	elseif x > 0 and x < 15 and y == 18 then
		mainScreen()
	else
		secondMainScreenListen()
	end

end

function floorInformation(floorTitle, screen, info1, info2, info3, info4, info5)

	topScreen(esbckc)
	
	mon.setBackgroundColor(fbckc)
	mon.setTextColor(ftxtc)
	mon.setCursorPos(1,5)
	mon.write(floorTitle)
	
	
	mon.setBackgroundColor(ebckc)
	mon.setTextColor(etxtc)
	mon.setCursorPos(1,7)
	mon.write(info1)
	mon.setCursorPos(1,8)
	mon.write(info2)
	mon.setCursorPos(1,9)
	mon.write(info3)
	mon.setCursorPos(1,10)
	mon.write(info4)
	mon.setCursorPos(1,11)
	mon.write(info5)
		
	-- Menu Button to mainScreen
	mon.setBackgroundColor(mbckc)
	mon.setTextColor(mtxtc)
	mon.setCursorPos(1,18)
	mon.write("<<< Back")
	
	floorInformationListen(screen)
	
end

function floorInformationListen(goToScreen)

	local screenToGoTo = goToScreen
	
	event, side, x, y = os.pullEvent("monitor_touch")
	
	if x > 0 and x < 9 and y == 18 then
		if goToScreen == mainScreen then
			mainScreen()
		elseif goToScreen == secondMainScreen then
			secondMainScreen()
		end
	else
		floorInformationListen(screenToGoTo)
	end

end

mainScreen()






