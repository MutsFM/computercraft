-- ArchiTech Elevators Inc.
-- Floor Plan Software
-- Version for 6 floors
-- Non-Interactive

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
local indicationFloor1 = "Offices"
local indicationFloor2 = "Showrooms"
local indicationFloor3 = "Showrooms"
local indicationFloor4 = "Meeting Rooms"
local indicationFloor5 = "Offices"
local indicationFloor6 = "Executive Offices"

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
print("Version for 6 floors, non-interactive")

function topScreen()

	-- Background Color
	mon.setBackgroundColor(fpsbckc)
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

	topScreen()
	
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
	
	if x > 3 and y == 18 then
		secondMainScreen()
	else
		mainScreenListen()
	end

end

function secondMainScreen()
	
	topScreen()
	
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
	
	if x > 0 and x < 15 and y == 18 then
		mainScreen()
	else
		secondMainScreenListen()
	end

end

mainScreen()
