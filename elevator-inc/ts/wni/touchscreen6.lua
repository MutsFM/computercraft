-- ArchiTech Elevators Inc.
-- TouchScreen Software
-- Version: Groundfloor + 6 floors
-- Design: Original
-- With Non-Interactive Floor Plan

-- ********************
-- Adjustable variables
-- ********************

local floor = "Floor1" 				-- Replace "Floor1" with corresponding floor number, e.g. "Floor6". Groundfloor should be added as "Floor0".
local monitorSide = "right"				-- Replace "right" with side to which the monitor is connected.

-- Floor Selector
	-- Color Customisation Options
		-- Floor Selection Screen
local sbckc = colors.white				-- Screen background color. Replace 'white' with another color code.
local ttxtc = colors.black				-- Color of the top text. Replace 'black' with another color code. 
local bckc = colors.black				-- Color of the background of the floor buttons. Replace 'black' with another color code.
local ftxtc = colors.red				-- Color of the text of the respective floor. Replace 'red' with another color code.
local txtc = colors.white				-- Color of the text of the other floors. Replace 'white' with another color code.
local fpbbckc = colors.red				-- Color of the background of the floor plan button. Replace 'red' with another color code.
local fpbtxtc = colors.black			-- Color of the text of the floor plan button. Replace 'black' with another color code.

		-- Screen with Selection Confirmation
local csbckc = colors.black				-- Screen background color. Replace 'black' with another color code.
local cstextc = colors.white				-- Color of the text on the selection confirmation screen. Replace 'white' with another color code.

-- Floor Plan
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

-- Terminal Info
term.clear()
term.setTextColor(colors.red)
term.setCursorPos(16,1)
print("ArchiTech Elevator Inc.")
term.setTextColor(colors.white)
term.setCursorPos(1,3)
print("Touchscreen Operating Software")
print("Version: Ground Floor + 6 Floors in original design, with Non-Interactive Floor Plan")
print("Operating for: "..floor)

-- Function to Draw Floor Selector Screen 
function screen()
while true do
    mon.setBackgroundColor(sbckc)
    mon.clear()
    mon.setTextScale(1)
    mon.setTextColor(ttxtc)
    
    mon.setCursorPos(6,2)
    mon.write("Elevator")
    mon.setCursorPos(4,3)
    mon.write("Select Floor")
    
    mon.setBackgroundColor(bckc)	 
    mon.setTextColor(txtc)
    
    mon.setCursorPos(4,5)
    if floor == "Floor0" then
    	mon.setTextColor(ftxtc)
    	mon.write(" Ground Floor")			--Extra spacing before floor for aesthetic purposes
		mon.setTextColor(txtc)
    else
    	mon.write(" Ground Floor")
    end
    
    mon.setCursorPos(1,7)
    if floor == "Floor1" then
    	mon.setTextColor(ftxtc)
    	mon.write(" Floor 1")
		mon.setTextColor(txtc)
    else
    	mon.write(" Floor 1")
    end	
    
    mon.setCursorPos(11,7)
    if floor == "Floor2" then
    	mon.setTextColor(ftxtc)
    	mon.write(" Floor 2")
		mon.setTextColor(txtc)
    else
    	mon.write(" Floor 2")
    end	
    
    mon.setCursorPos(1,9)
    if floor == "Floor3" then
    	mon.setTextColor(ftxtc)
    	mon.write(" Floor 3")
		mon.setTextColor(txtc)
    else
    	mon.write(" Floor 3")
    end	
    
    mon.setCursorPos(11,9)
    if floor == "Floor4" then
    	mon.setTextColor(ftxtc)
    	mon.write(" Floor 4")
		mon.setTextColor(txtc)
    else
    	mon.write(" Floor 4")
    end	
    
    mon.setCursorPos(1,11)
    if floor == "Floor5" then
    	mon.setTextColor(ftxtc)
    	mon.write(" Floor 5")
		mon.setTextColor(txtc)
    else
    	mon.write(" Floor 5")
    end	
    
    mon.setCursorPos(11,11)
    if floor == "Floor6" then
    	mon.setTextColor(ftxtc)
    	mon.write(" Floor 6")
		mon.setTextColor(txtc)
    else
    	mon.write(" Floor 6")
    end	
        
    mon.setCursorPos(4,17)
    mon.write(" Request Cart")
    
	mon.setBackgroundColor(fpbbckc)
	mon.setTextColor(fpbtxtc)
	mon.setCursorPos(1, 19)
	mon.write(">>> Floor Plan <<<")
	
    listen()
end
end
 
function listen()
    event, side, x, y = os.pullEvent("monitor_touch")
    
    mon.setBackgroundColor(csbckc) 
    mon.setTextColor(cstextc)
    
    if x > 4 and x < 17 and y == 5 then
        selectionScreen("Floor0", "Ground Floor")
	elseif x > 1 and x < 9 and y == 7 then
		selectionScreen("Floor1", "Floor  1")
    elseif x > 11 and x < 19 and y == 7 then
		selectionScreen("Floor2", "Floor  2")
    elseif x > 1 and x < 9 and y == 9 then
		selectionScreen("Floor3", "Floor  3")
    elseif x > 11 and x < 19 and y == 9 then
		selectionScreen("Floor4", "Floor  4")
    elseif x > 1 and x < 9 and y == 11 then
		selectionScreen("Floor5", "Floor  5")
    elseif x > 11 and x < 19 and y == 11 then
		selectionScreen("Floor6", "Floor  6")
	elseif x > 4 and x < 17 and y == 17 then
        rednet.broadcast(floor)
		selectionScreen("Cart", "Cart Requested")
	elseif x > 4 and x < 17 and y == 19 then
		mainScreen()
    end
    
    screen()
end

function selectionScreen(message, selectedFloor)

    rednet.broadcast(message)
    mon.clear()
	
    if selectedFloor == "Ground Floor" then
		mon.setCursorPos(4,8)
		mon.write("Ground Floor")
	elseif selectedFloor == "Cart Requested" then
		mon.setCursorPos(3,8)
		mon.write("Cart Requested")
	else		
		mon.setCursorPos(6,8)
		mon.write(selectedFloor)
	end	
	
	if selectedFloor ~= "Cart Requested" then
		mon.setCursorPos(6,10)
		mon.write("Selected")
	end
	
	mon.setCursorPos(5,17)
	mon.write("Powered By:")
	mon.setCursorPos(6,18)
	mon.write("ArchiTech")
	mon.setCursorPos(4,19)
	mon.write("Elevator Inc.")
    sleep(3)		
	
end

-- Floor Plan 
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

function backToFloorSelection()

	mon.setBackgroundColor(fpbbckc)
	mon.setTextColor(fpbtxtc)
	mon.setCursorPos(1, 19)
	mon.write("<< Floor Selection")

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
	mon.setCursorPos(4,17)
	mon.write(" Floors 4-6 >>>")
	
	backToFloorSelection()
	
	mainScreenListen()
	
end

function mainScreenListen()
	
	event, side, x, y = os.pullEvent("monitor_touch")
	
	if x > 3 and y == 17 then
		secondMainScreen()
	elseif x > 0 and x < 19 and y == 19 then
		screen()
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
	mon.setCursorPos(1,17)
	mon.write("<<< Floors G-3")
	
	backToFloorSelection()
	
	secondMainScreenListen()
	
end

function secondMainScreenListen()
	
	event, side, x, y = os.pullEvent("monitor_touch")
	
	if x > 0 and x < 15 and y == 17 then
		mainScreen()
	elseif x > 0 and x < 19 and y == 19 then
		screen()		
	else
		secondMainScreenListen()
	end

end

function start()
    screen()
end

start()
