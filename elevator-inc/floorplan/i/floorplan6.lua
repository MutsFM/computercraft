-- ArchiTech Elevators Inc.
-- Floor Plan Software
-- Version for 6 floors
-- Interactive

-- ********************
-- Adjustable variables
-- ********************

local monitorSide = "right"				-- Replace "right" with side to which the monitor is connected.

-- Floorplan Information

local buildingName = "ArchiTech HQ"
local buildingNamePos = 4 			-- See table in readme for positions.
local subtitle = "Floor Plan"
local subtitlePos = 5 				-- See table in readme for positions.
local indicationPos = 2				-- 1 for max 18 characters, 2 for max 17 characters, 3 for max 16 characters - Including spaces

local indicationGroundFloor = "Reception & Exit" 
local gfInfo1 = "You can find the "			-- Max 18 Characters, including spaces, for each line
local gfInfo2 = "reception on this"
local gfInfo3 = "floor, as well as" 
local gfInfo4 = "all exits from "
local gfInfo5 = "the building."
local gfInfo6 = ""
local gfInfo7 = ""
local gfw1 = ""								-- If used, best to center the text by using spaces on both sides of your word(s), until you have 18 characters, including the spaces
local gfw2 = ""								-- See floors 3 and 6 for examples

local indicationFloor1 = "Offices"
local f1info1 = "ArchiTech Offices"			-- Max 18 Characters, including spaces, for each line
local f1info2 = "for Traffic Lights"
local f1info3 = "and Elevator"
local f1info4 = "departments."
local f1info5 = ""
local f1info6 = ""
local f1info7 = ""
local f1w1 = ""								-- If used, best to center the text by using spaces on both sides of your word(s), until you have 18 characters, including the spaces
local f1w2 = ""

local indicationFloor2 = "Showrooms"				
local f2info1 = "Showrooms for the"
local f2info2 = "ArchiTech Traffic"
local f2info3 = "Lights and the"
local f2info4 = "ArchiTech Elevator"
local f2info5 = "products."
local f2info6 = ""
local f2info7 = ""
local f2w1 = ""								-- If used, best to center the text by using spaces on both sides of your word(s), until you have 18 characters, including the spaces
local f2w2 = ""

local indicationFloor3 = "Showrooms"
local f3info1 = "Showroom for the"
local f3info2 = "ArchiTech Metro"
local f3info3 = "Systems products."
local f3info4 = ""
local f3info5 = ""
local f3info6 = ""
local f3info7 = ""
local f3w1 = "     Caution:     "			-- If used, best to center the text by using spaces on both sides of your word(s), until you have 18 characters, including the spaces
local f3w2 = "  Running Train!  "

local indicationFloor4 = "Meeting Rooms"
local f4info1 = "ArchiTech meeting"			-- Max 18 Characters, including spaces, for each line
local f4info2 = "rooms can be found"
local f4info3 = "on this floor."
local f4info4 = ""
local f4info5 = ""
local f4info6 = ""
local f4info7 = ""
local f4w1 = ""								-- If used, best to center the text by using spaces on both sides of your word(s), until you have 18 characters, including the spaces
local f4w2 = ""

local indicationFloor5 = "Offices"
local f5info1 = "ArchiTech Offices"			-- Max 18 Characters, including spaces, for each line
local f5info2 = "for Metro Systems"
local f5info3 = "department."
local f5info4 = ""
local f5info5 = ""
local f5info6 = ""
local f5info7 = ""
local f5w1 = ""								-- If used, best to center the text by using spaces on both sides of your word(s), until you have 18 characters, including the spaces
local f5w2 = ""

local indicationFloor6 = "Executive Offices"
local f6info1 = "ArchiTech's "				-- Max 18 Characters, including spaces, for each line
local f6info2 = "Executives have" 
local f6info3 = "their offices on"
local f6info4 = "this floor."
local f6info5 = ""
local f6info6 = ""
local f6info7 = ""
local f6w1 = "    Restricted    "			-- If used, best to center the text by using spaces on both sides of your word(s), until you have 18 characters, including the spaces
local f6w2 = "      Access      "

-- Color Customisation Options

local fpsbckc = colors.white			-- Screen background color. Replace 'white' with another color code.
local tttxtc = colors.black				-- Color of the title at the top. Replace 'black' with another color code. 
local ttbckc = colors.white				-- Color of the background for the title at the top. Replace 'white' with another color code.
local tstxtc = colors.black				-- Color of the subtitle at the top. Replace 'black' with another color code.
local tsbckc = colors.white				-- Color of the background for the subtitle at the top. Replace 'white' with another color code.
local bbckc = colors.white				-- Color of the background for the text at the bottom. Replace 'white' with another color code.
local btxtc = colors.black				-- Color of the text on the botom. Replace 'black' with another color code.
local fpfbckc = colors.black			-- Color of the background of the floors. Replace 'black' with another color code.
local fpftxtc = colors.white			-- Color of the text of the floors. Replace 'white' with another color code.
local ibckc = colors.white				-- Color of the background of the floors' indication. Replace 'white' with another color code.
local itxtc = colors.black				-- Color of the text of the floors' indication. Replace 'black' with another color code.
local mbckc = colors.black				-- Color of the background of the menu buttons. Replace 'black' with another color code.
local mtxtc = colors.white				-- Color of the text of the menu buttons. Replace 'white' with another color code.

local esbckc = colors.white				-- Screen background color for the explanation pages. Replace 'white' with another color code.
local ebckc = colors.white				-- Color of the background of the floor's explanation. Replace 'white' with another color code.
local etxtc = colors.black				-- Color of the text of the floors' explanation. Replace 'black with another color code.
local wbckc = colors.gray				-- Color of the background of the warning displayed on the floors' explanation pages. Replace 'white' with another color code.
local wtxtc = colors.red				-- Color of the text of the warning displayed on the floors' explanation pages. Replace 'white' with another color code.

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

-- Screen Drawing Functions

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

function mainScreen()

	topScreen(fpsbckc)
	
	-- Ground Floor
	mon.setBackgroundColor(fpfbckc)
	mon.setTextColor(fpftxtc)
	mon.setCursorPos(1,5)
	mon.write("Ground Floor")
	mon.setBackgroundColor(ibckc)
	mon.setTextColor(itxtc)
	mon.setCursorPos(indicationPos,6)
	mon.write(indicationGroundFloor)
	
	-- Floor 1
	mon.setBackgroundColor(fpfbckc)
	mon.setTextColor(fpftxtc)
	mon.setCursorPos(1,8)
	mon.write("Floor 1")
	mon.setBackgroundColor(ibckc)
	mon.setTextColor(itxtc)
	mon.setCursorPos(indicationPos,9)
	mon.write(indicationFloor1)
	
	-- Floor 2	
	mon.setBackgroundColor(fpfbckc)
	mon.setTextColor(fpftxtc)
	mon.setCursorPos(1,11)
	mon.write("Floor 2")
	mon.setBackgroundColor(ibckc)
	mon.setTextColor(itxtc)
	mon.setCursorPos(indicationPos,12)
	mon.write(indicationFloor2)
	
	-- Floor 3	
	mon.setBackgroundColor(fpfbckc)
	mon.setTextColor(fpftxtc)
	mon.setCursorPos(1,14)
	mon.write("Floor 3")
	mon.setBackgroundColor(ibckc)
	mon.setTextColor(itxtc)
	mon.setCursorPos(indicationPos,15)
	mon.write(indicationFloor3)
	
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
		floorInformation("   Ground Floor   ", mainScreen, gfInfo1, gfInfo2, gfInfo3, gfInfo4, gfInfo5, gfInfo6, gfInfo7, gfw1, gfw2)
	elseif x > 0 and x < 8 and y == 8 then
		floorInformation("     Floor 1      ", mainScreen, f1info1, f1info2, f1info3, f1info4, f1info5, f1info6, f1info7, f1w1, f1w2)
	elseif x > 0 and x < 8 and y == 11 then
		floorInformation("     Floor 2      ", mainScreen, f2info1, f2info2, f2info3, f2info4, f2info5, f2info6, f2info7, f2w1, f2w2)
	elseif x > 0 and x < 8 and y == 14 then
		floorInformation("     Floor 3      ", mainScreen, f3info1, f3info2, f3info3, f3info4, f3info5, f3info6, f3info7, f3w1, f3w2)
	elseif x > 3 and y == 18 then
		secondMainScreen()
	else
		mainScreenListen()
	end

end

function secondMainScreen()
	
	topScreen(fpsbckc)
	
	-- Floor 4
	mon.setBackgroundColor(fpfbckc)
	mon.setTextColor(fpftxtc)
	mon.setCursorPos(1,5)
	mon.write("Floor 4")
	mon.setBackgroundColor(ibckc)
	mon.setTextColor(itxtc)
	mon.setCursorPos(indicationPos,6)
	mon.write(indicationFloor4)
	
	-- Floor 5
	mon.setBackgroundColor(fpfbckc)
	mon.setTextColor(fpftxtc)
	mon.setCursorPos(1,8)
	mon.write("Floor 5")
	mon.setBackgroundColor(ibckc)
	mon.setTextColor(itxtc)
	mon.setCursorPos(indicationPos,9)
	mon.write(indicationFloor5)
	
	-- Floor 6	
	mon.setBackgroundColor(fpfbckc)
	mon.setTextColor(fpftxtc)
	mon.setCursorPos(1,11)
	mon.write("Floor 6")
	mon.setBackgroundColor(ibckc)
	mon.setTextColor(itxtc)
	mon.setCursorPos(indicationPos,12)
	mon.write(indicationFloor6)
	
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
		floorInformation("     Floor 4      ", secondMainScreen, f4info1, f4info2, f4info3, f4info4, f4info5, f4info6, f4info7, f4w1, f4w2)
	elseif x > 0 and x < 8 and y == 8 then
		floorInformation("     Floor 5      ", secondMainScreen, f5info1, f5info2, f5info3, f5info4, f5info5, f5info6, f5info7, f5w1, f5w2)
	elseif x > 0 and x < 8 and y == 11 then
		floorInformation("     Floor 6      ", secondMainScreen, f6info1, f6info2, f6info3, f6info4, f6info5, f6info6, f6info7, f6w1, f6w2)
	elseif x > 0 and x < 15 and y == 18 then
		mainScreen()
	else
		secondMainScreenListen()
	end

end

function floorInformation(floorTitle, screen, info1, info2, info3, info4, info5, info6, info7, warning1, warning2)

	topScreen(esbckc)
	
	mon.setBackgroundColor(fpfbckc)
	mon.setTextColor(fpftxtc)
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
	mon.setCursorPos(1,12)
	mon.write(info6)
	mon.setCursorPos(1,13)
	mon.write(info7)
	
	-- Warnings
	mon.setBackgroundColor(wbckc)
	mon.setTextColor(wtxtc)
	mon.setCursorPos(1,15)
	mon.write(warning1)
	mon.setCursorPos(1,16)
	mon.write(warning2)
		
	-- Menu Button to mainScreen
	mon.setBackgroundColor(mbckc)
	mon.setTextColor(mtxtc)
	mon.setCursorPos(1,18)
	mon.write("<<< Back")
	
	floorInformationListen(screen)
	
end

function floorInformationListen(goToScreen)

	event, side, x, y = os.pullEvent("monitor_touch")
	
	if x > 0 and x < 9 and y == 18 then
		if goToScreen == mainScreen then
			mainScreen()
		elseif goToScreen == secondMainScreen then
			secondMainScreen()
		end
	else
		floorInformationListen(goToScreen)
	end

end

mainScreen()