-- ArchiTech Traffic Lights
-- Pedestrian SoundOS
-- Start-up Software

-- ******************************
-- CODE BELOW IS NOT ADJUSTABLE!!
-- ******************************

term.clear()
term.setTextColor(colors.red)
term.setCursorPos(19,1)
print("ArchiTech Inc.")
term.setTextColor(colors.white)
term.setCursorPos(14,2)
print("Traffic Light Solutions")
term.setCursorPos(1,5)
print("Software: Pedestrian SoundOS")
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
write("Starting Application.")
sleep(.3)
write(".")
sleep(.3)
shell.run("pedestrianSound")

