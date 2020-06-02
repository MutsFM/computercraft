-- ArchiTech Traffic Lights
-- Pedestrian SoundOS
-- SoundDemo

local speakerSide = "front"				-- side to which the speaker is attached

local speedBundle = "back"
local soundBundle = "right"

-- Volume Customisation
-- Enter 1 for default, Enter 2 for increased sound range, Enter 3 for max sound range
local volume = 1

-- ******************************
-- CODE BELOW IS NOT ADJUSTABLE!!
-- ******************************

-- Sound Customisation
-- Enter 1 for High Click
-- Enter 2 for Mid Click
-- Enter 3 for Low Click
-- Enter 4 for Lowest Click
-- Enter 5 for Bell
-- Enter 6 for Plop
-- Enter 7-10 for Nonsense
local sound

local speaker = peripheral.wrap(speakerSide)
local selectedSound

-- Terminal Info
term.clear()
term.setTextColor(colors.red)
term.setCursorPos(14,1)
print("ArchiTech Traffic Lights")
term.setTextColor(colors.white)
term.setCursorPos(1,3)
print("Pedestrian Sound Controller")
print("Demo Version")

-- Listening Function

function listen()
	
	os.pullEvent("redstone")
	
	speedCable = redstone.getBundledInput(speedBundle)
	soundInput()
	
	if speedCable == 1 then
		slowSound()
	elseif speedCable == 2 then
		endingSound()
	elseif speedCable == 16 then
		fastSound()
	end
	
	restart()
	
end

-- Sound Selection Function
-- To optimise, by integrating soundselector
function soundInput()

	cable = redstone.getBundledInput(soundBundle)
	
	if cable == 1 then
		sound = 1
	elseif cable == 2 then
		sound = 2
	elseif cable == 4 then
		sound = 3
	elseif cable == 8 then
		sound = 4
	elseif cable == 16 then
		sound = 5
	elseif cable == 32 then
		sound = 6
	elseif cable == 64 then
		sound = 7
	elseif cable == 128 then
		sound = 8
	elseif cable == 256 then
		sound = 9
	elseif cable == 512 then
		sound = 10		
	end
	
	soundSelector()
	
end


-- Sound Functions

function slowSound()
	
	soundInput()
	speaker.playSound(selectedSound, volume)
	
	cable = redstone.getBundledInput(speedBundle)
	
	if cable == 1 then
		sleep(1)
		slowSound()
	end
	
	if cable == 2 then
		endingSound()
	end
	
	if cable == 16 then
		fastSound()
	end
	
	if cable ~= 1 or cable ~= 2 or cable ~= 16 then
		listen()
	end

end

function fastSound()
	
	soundInput()
	speaker.playSound(selectedSound, volume)
	
	cable = redstone.getBundledInput(speedBundle)
	
	if cable == 1 then
		slowSound()
	end
	
	if cable == 2 then
		endingSound()
	end
	
	if cable == 16 then
		sleep(0.2)
		fastSound()
	end
	
	if cable ~= 1 or cable ~= 2 or cable ~= 16 then
		listen()
	end
end

function endingSound()
	
	soundInput()
	cable = redstone.getBundledInput(speedBundle)
	
	if cable == 1 then
		slowSound()
	end
		
	if cable == 2 then
		sleep(0.5)
		speaker.playSound(selectedSound, volume)
		sleep(0.2)
		speaker.playSound(selectedSound, volume)
		endingSound()
	end
	
	if cable == 16 then
		fastSound()
	end
	
	if cable ~= 1 or cable ~= 2 or cable ~= 16 then
		listen()
	end
end

-- Utility Functions

function restart()
	
	listen()
	
end

function soundSelector()

	if sound == 1 then
		selectedSound = "minecraft:block.lever.click"
	elseif sound == 2 then
		selectedSound = "minecraft:entity.arrow.shoot"
	elseif sound == 3 then
		selectedSound = "minecraft:block.lava.pop"
	elseif sound == 4 then
		selectedSound = "minecraft:entity.player.small_fall"
	elseif sound == 5 then
		selectedSound = "minecraft:entity.arrow.hit_player"
	elseif sound == 6 then
		selectedSound = "minecraft:entity.donkey.chest"
	elseif sound == 7 then
		selectedSound = "minecraft:entity.bat.death"
	elseif sound == 8 then
		selectedSound = "minecraft:entity.blaze.shoot"
	elseif sound == 9 then
		selectedSound = "minecraft:entity.donkey.death"
	elseif sound == 10 then
		selectedSound = "minecraft:entity.player.burp"
	end

end

function printInfo()

	term.clear()
	term.setTextColor(colors.red)
	term.setCursorPos(19,1)
	print("ArchiTech Inc.")
	term.setTextColor(colors.white)
	term.setCursorPos(14,2)
	print("Traffic Light Solutions")
	term.setCursorPos(17,3)
	print("Pedestrian SoundOS")
	
	term.setCursorPos(1,5)
	if sound == 1 then print("Sound: Click") end

end

function start()
	
	soundSelector()
	printInfo()
	restart()
	
end

start()
