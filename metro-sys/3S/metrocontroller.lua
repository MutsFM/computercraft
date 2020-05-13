-- For circular lines!
-- The stations below need to be entered in the same order on every station! For the current station, enter which one it is.
local station1 = "Aktash"
local station2 = "Veternik"
local station3 = "Ulpiana"

local thisStation = 1			-- Enter the number of the station at which the controller computer is, using the number indicated above

local PlatformComputer = 0		-- Enter the computerID of the PlatformComputer at the station
local repeaterLeft = 1			-- Enter the computerID of the repeater computer in the direction of the previous station
local repeaterRight = 2			-- Enter the computerID of the repeater computer in the direction of the next station
local arrivalDetection = 3		-- Enter the computerID of the station's arrival detection computer
local departureDetection = 4	-- Enter the computerID of the station's departure detection computer


-- ******************************
-- CODE BELOW IS NOT ADJUSTABLE!!
-- ******************************

local s1
local s2
local s3

local stationName

function setStation()

	s1 = station1
	s2 = station2
	s3 = station3
	
	if thisStation == 1 then
		stationName = station1
	end
	
	if thisStation == 2 then
		stationName = station2
	end
	
	if thisStation == 3 then
		stationName = station3
	end
		
end

local AtS1 = false
local BetweenS1S2 = false
local AtS2 = false
local BetweenS2S3 = false
local AtS3 = false
local BetweenS3S1 = false

function receive()

	print("waiting for message")
	
    senderID, message = rednet.receive()
    
	if (senderID == arrivalDetection) or (senderID == departureDetection) then
		
		print("arrival or departure detected")
		rednet.send(PlatformComputer, message)
		rednet.send(repeaterRight, message)
		stationUpdate()
	
	elseif senderID == PlatformComputer then
		
		print("Question Received")
		platformQuestion()
	
	elseif (senderID == repeaterLeft) or (senderID == repeaterRight) then
		
		if message == (stationName.."Arrival") or message == (stationName.."Departure") then
			
			print("received my own message")
			restart()
		
		elseif senderID == repeaterLeft then
		
			print("passing on to the right")
			rednet.send(PlatformComputer, message)
			rednet.send(repeaterRight, message)
			stationUpdate()
			
		elseif senderID == repeaterRight then
		
			rednet.send(PlatformComputer, message)
			rednet.send(repeaterLeft, message)
			stationUpdate()
		
		end
			
	end
		    
    restart()
	
end

function stationUpdate()
	
	if message==(s1.."Arrival") then
		BetweenS3S1 = false
		AtS1 = true
	end
	
	if message==(s1.."Departure") then
		AtS1 = false
		BetweenS1S2 = true
	end
	
	if message==(s2.."Arrival") then
		BetweenS1S2 = false
		AtS2 = true
	end
	
	if message==(s2.."Departure") then
		AtS2 = false
		BetweenS2S3 = true
	end
	
	if message==(s3.."Arrival") then
		BetweenS2S3 = false
		AtS3 = true
	end
	
	if message==(s3.."Departure") then
		AtS3 = false
		BetweenS3S1 = true
	end
	
	testUpdate()

end

function testUpdate()
print("---------------------")

	if AtS1 == true then
		print("Train at "..s1)
	end
	
	if BetweenS1S2 == true then
		print("Train between "..s1.." and "..s2)
	end
	
	if AtS2 == true then
		print("Train at "..s2)
	end
	
	if BetweenS2S3 == true then
		print("Train between "..s2.." and "..s3)
	end
	
	if AtS3 == true then
		print("Train at "..s3)
	end
	
	if BetweenS3S1== true then
		print("Train between "..s3.." and "..s1)
	end
print("---------------------")
	
	restart()
end

function platformQuestion()
	
	if message==("IsAt"..s1) then
		if AtS1==true then
			rednet.send(PlatformComputer, "Yes")
			receive()
		end
			
		if AtS1==false then
			rednet.send(PlatformComputer, "No")
			receive()
		end
	end
	
	
	if message==("IsBetween"..s1..s2) then
		if BetweenS1S2==true then
			rednet.send(PlatformComputer, "Yes")
			receive()
		end
			
		if BetweenS1S2==false then
			rednet.send(PlatformComputer, "No")
			receive()
		end
	end
	
	if message==("IsAt"..s2) then
		if AtS2==true then
			rednet.send(PlatformComputer, "Yes")
			receive()
		end
			
		if AtS2==false then
			rednet.send(PlatformComputer, "No")
			receive()
		end
	end
	
	
	if message==("IsBetween"..s2..s3) then
		if BetweenS2S3==true then
			rednet.send(PlatformComputer, "Yes")
			receive()
		end
			
		if BetweenS2S3==false then
			rednet.send(PlatformComputer, "No")
			receive()
		end
	end
	
	if message==("IsAt"..s3) then
		if AtS3==true then
			rednet.send(PlatformComputer, "Yes")
			receive()
		end
			
		if AtS3==false then
			rednet.send(PlatformComputer, "No")
			receive()
		end
	end
	
	
	if message==("IsBetween"..s3..s1) then
		if BetweenS3S1==true then
			rednet.send(PlatformComputer, "Yes")
			receive()
		end
			
		if BetweenS3S1==false then
			rednet.send(PlatformComputer, "No")
			receive()
		end
	end
	
end

function restart()
    receive()
end

function start()
	
	term.clear()
	term.setTextColor(colors.red)
	term.setCursorPos(16,1)
	print("ArchiTech MetroSys.")
	term.setTextColor(colors.white)
	term.setCursorPos(1,3)
	
	setStation()
	print(stationName.." Controller OS Operating")

	receive()
	
end

start()
