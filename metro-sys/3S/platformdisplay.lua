-- For circular lines!
-- The information below needs to be entered in the same order on every station!
local station1 = "Aktash"
local timeBetweenS1S2 = 15	-- in seconds
local station2 = "Veternik"
local timeBetweenS2S3 = 20	-- in seconds
local station3 = "Ulpiana"
local timeBetweenS3S1 = 35	-- in seconds
local timeAtStation = 15 	-- in seconds

-- For station specific information
local stationnumber = 1				-- Enter which stationnumber the current station has. For example, for Ulpiana enter 3
local monitorNumber = 'monitor_0'	-- Enter the platform's monitor number	
local mcComputer = 1 				-- Enter the computer id for the platform's metrocontroller computer


-- Screen Customisation
local bgc = colors.white			-- sets display's background color
local tc = colors.black				-- sets display's text color
local lc = colors.green				-- sets the display's line name color
local lineName = "Green Line" 		-- sets the line name


-- ******************************
-- CODE BELOW IS NOT ADJUSTABLE!!
-- ******************************

local s1
local s2
local s3
local tbs1s2
local tbs2s3
local tbs3s1

-- these variables are used to store the calculated time and display them on the screen
local ats1 = "On Platform"
local bs3s1 = "Arriving" -- to be amended if more than three stations
local ats3
local bs2s3
local ats2
local bs1s2

-- these variables are used to store the seconds until the next train, to be used for calculated time
local tats
local secats2
local secats3
local secbs3s1
local secbs2s3
local secbs1s2

-- code to connect screen and open network connection



function setStation()

	if stationnumber==1 then
		s1 = station1
		s2 = station2
		s3 = station3
		tbs1s2 = timeBetweenS1S2
		tbs2s3 = timeBetweenS2S3
		tbs3s1 = timeBetweenS3S1
	end
	
	if stationnumber==2 then
		s1 = station2
		s2 = station3
		s3 = station1
		tbs1s2 = timeBetweenS2S3
		tbs2s3 = timeBetweenS3S1
		tbs3s1 = timeBetweenS1S2
	end
	
	if stationnumber==3 then
		s1 = station3
		s2 = station1
		s3 = station2
		tbs1s2 = timeBetweenS3S1
		tbs2s3 = timeBetweenS1S2
		tbs3s1 = timeBetweenS2S3
	end
	
end

function calculateTimings()

	tats = timeAtStation
	
	secats3 = tbs3s1+tats
	ats3 = convertTimings(secats3)
		
	secbs2s3 = tbs3s1+tats+tbs2s3
	bs2s3 = convertTimings(secbs2s3)
	
	secats2 = tbs3s1+tats+tbs2s3+tats
	ats2 = convertTimings(secats2)

	secbs1s2 = tbs3s1+tats+tbs2s3+tats+tbs1s2
	bs1s2 = convertTimings(secbs1s2)
		
end

function convertTimings(sec)

	if sec < 3600 and sec > 59 then

		minutes = math.floor(sec/60);
		seconds = sec-(math.floor(sec/60)*60);
		
			if minutes < 10 then
				minutes = "0"..minutes;
			end
			
			if seconds < 10 then
				seconds = "0"..seconds;
			end
		
		newTiming = minutes..":"..seconds;
	
	end
	
	if sec < 60 then
				
				if sec <10 then
				seconds = "0"..sec;
				end
				
				if sec > 9 then
				seconds = sec;
				end
				
		newTiming  = "00:"..seconds;
	end
        
	return newTiming;

end

-- SCRIPT FOR DRAWING MAIN SCREEN

-- needs customisaiton options for colors and text
function mainScreen()
	
	mon.setBackgroundColor(bgc)
	mon.clear()
	mon.setTextColor(tc)
	mon.setCursorPos(1,1)
	mon.write(s1)
	mon.setCursorPos(1,2)
	mon.setTextColor(lc)
	mon.write(lineName)
	mon.setCursorPos(1,4)
	mon.setTextColor(tc)
	mon.write("Next Train In:")
	mon.setCursorPos(5,5)
	mon.write("Unknown")
	
	searchNextTrain()
	
end

-- END SCRIPT FOR DRAWING MAIN SCREEN
-- //////////////////////////////////////////
-- SCRIPT FOR COUNT DOWN UNTIL TRAIN ARRIVES

-- code for displaying the time
function displayTime(newTime)

	mon.clearLine(5)
	mon.setCursorPos(5,5)
	mon.write(newTime)
	
end

-- Code going from station/track furthest away to arrival at station, and subsequently searching for the next train
function setBtwS1S2()

	displayTime(bs1s2)
	listenArrivalS2()
	
end

function listenArrivalS2()
	
	senderID, message = rednet.receive()
	
	if message==(s2.."Arrival") then
		setAtS2()
	end
	
	if message~=(s2.."Arrival") then
		listenArrivalS2()
	end
	
end

function setAtS2()

	displayTime(ats2)
	
	listenDepartureS2()
	
end

function listenDepartureS2()
	
	senderID, message = rednet.receive()
	
	if message==(s2.."Departure") then
		setBtwS2S3()
	end
	
	if message~=(s2.."Departure") then
		listenDepartureS2()
	end
	
end

function setBtwS2S3()

	displayTime(bs2s3)
	
	listenArrivalS3()
	
end

function listenArrivalS3()
	
	senderID, message = rednet.receive()
	
	if message==(s3.."Arrival") then
		setAtS3()
	end
	
	if message~=(s3.."Arrival") then
		listenArrivalS3()
	end
	
end

function setAtS3()

	displayTime(ats3)
	
	listenDepartureS3()
	
end

function listenDepartureS3()
	
	senderID, message = rednet.receive()
	
	if message==(s3.."Departure") then
		setBtwS3S1()
	end
	
	if message~=(s3.."Departure") then
		listenDepartureS3()
	end
	
end

function setBtwS3S1()

	displayTime(bs3s1)
	
	listenArrivalS1()
end

function listenArrivalS1()

	senderID, message = rednet.receive()
	
	if message==(s1.."Arrival") then
		setAtS1()
	end
	
	if message~=(s1.."Arrival") then
		listenArrivalS1()
	end

end

function setAtS1()

	displayTime(ats1)
	
	listenDepartureS1()
end

function listenDepartureS1()
	
	senderID, message = rednet.receive()
	
	if message==(s1.."Departure") then
		searchNextTrain()
	end
	
	if message~=(s1.."Departure") then
		listenDepartureS1()
	end
	
end

-- END SCRIPT FOR COUNT DOWN UNTIL NEXT TRAIN
-- //////////////////////////////////////////
-- SCRIPT FOR SEARCH FOR NEXT TRAIN

function searchNextTrain()						-- if more stations are added, to be renamed searchNTbtws3s1 and function for first other station to be named searchTrain()

	rednet.send(mcComputer, "IsBetween"..s3..s1) -- first asks the station's metrocontroller computer whether a train is approaching.
	print("starting to look for a train")
	answerNTbtws3s1()
	
end

function answerNTbtws3s1()

	senderID, message = rednet.receive() -- then waits for the response from the station's metrocontroller computer
	
	if senderID~=mcComputer then
		answerNTbtws3s1()
	end
	
	if senderID==mcComputer and message=="Yes" then	-- if there is a train between the previous station and this station, then mcComputer will say yes..
		setBtwS3S1()								-- ..and then we can start the protocols as of setBtwS3S1
	end
	
	if senderID==mcComputer and message=="No" then -- if there is no train between the previous and this station, then mcComputer will say no..
		searchNTats3()								-- .. and then we can look at the next station
	end
		
end

function searchNTats3()

	rednet.send(mcComputer, "IsAt"..s3)
	
	answerNTats3()

end

function answerNTats3()

	senderID, message = rednet.receive()
	
	if senderID~=mcComputer then
		answerNTats3()
	end
	
	if senderID==mcComputer and message=="Yes" then
		setAtS3()
	end
	
	if senderID==mcComputer and message=="No" then
		searchNTbtws2s3()								
	end
		
end

function searchNTbtws2s3()

	rednet.send(mcComputer, "IsBetween"..s2..s3)
	
	answerNTbtws2s3()

end

function answerNTbtws2s3()

	senderID, message = rednet.receive()
	
	if senderID~=mcComputer then
		answerNTbtws2s3()
	end
	
	if senderID==mcComputer and message=="Yes" then
		setBtwS2S3()
	end
	
	if senderID==mcComputer and message=="No" then
		searchNTats2()								
	end
		
end

function searchNTats2()

	rednet.send(mcComputer, "IsAt"..s2)
	
	answerNTats2()

end

function answerNTats2()

	senderID, message = rednet.receive()
	
	if senderID~=mcComputer then
		answerNTats2()
	end
	
	if senderID==mcComputer and message=="Yes" then
		setAtS2()
	end
	
	if senderID==mcComputer and message=="No" then
		searchNTbtws1s2()								
	end
		
end

function searchNTbtws1s2()

	rednet.send(mcComputer, "IsBetween"..s1..s2)
	
	answerNTbtws1s2()

end

function answerNTbtws1s2()

	senderID, message = rednet.receive()
	
	if senderID~=mcComputer then
		answerNTbtws1s2()
	end
	
	if senderID==mcComputer and message=="Yes" then
		setBtwS1S2()
	end
	
	if senderID==mcComputer and message=="No" then
		trainUnknown()								
	end
		
end

function trainUnknown()

	mon.clearLine(5)
	mon.setCursorPos(5,5)
	mon.write("Unknown")
	print("Couldnt Find Train")
	
	sleep(30)
	
	searchNextTrain()

end

function start()

	term.clear()
	term.setTextColor(colors.red)
	term.setCursorPos(16,1)
	print("ArchiTech MetroSys.")
	term.setTextColor(colors.white)
	term.setCursorPos(1,3)
	
	mon = peripheral.wrap(monitorNumber)

	setStation()
	print(s1.." Controller OS Operating")
	
	calculateTimings()
	mainScreen()

end

start()