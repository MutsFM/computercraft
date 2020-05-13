local modemSide = "back"		-- Enter the side to which the modem is placed

-- ******************************
-- CODE BELOW IS NOT ADJUSTABLE!!
-- ******************************

term.clear()
term.setTextColor(colors.red)
term.setCursorPos(19,1)
print("ArchiTech Inc.")
term.setTextColor(colors.white)
term.setCursorPos(14,2)
print("Metro System Solutions")
term.setCursorPos(1,5)
print("Software: Repeater OS")
print("Version : 1.0")
term.setCursorPos(1,9)
write("Loading Software.")
sleep(.3)
write(".")
sleep(.3)
print(".")
sleep(.3)
print("Load Complete!")
sleep(.3)
write("Establishing Network Connection.")
rednet.open(modemSide, true)
sleep(.3)
write(".")
sleep(.3)
print(".")
sleep(.3)
check = rednet.isOpen(modemSide)
if check == true then print("Network Connection Established") end
if check ~= true then 
	print("Critical Network Error Detected")
	print("Please make sure you have connected and activated a wired modem on the correct side")
	print("You can change which side you can connect the modem by editing this startup")
	print("If problems persist, please contact the ArchiTech helpdesk at:")
	print("https://github.com/MutsFM/computercraft")
	return
end
sleep(.3)
write("Starting Application.")
sleep(.3)
write(".")
sleep(.3)
shell.run("repeatercomputer.lua")