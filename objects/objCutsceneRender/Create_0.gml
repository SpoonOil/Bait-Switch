/// @description 
frame = 0

framesToFade = 80
framesPerPic = 100

maxFrames = 300
splashFrame = 230

speedFactor = 1.5

framesToFade = framesToFade/speedFactor
maxFrames = maxFrames/speedFactor
framesPerPic = framesPerPic/speedFactor
splashFrame = floor(splashFrame/speedFactor)


audio_play_sound(sndComboStrum1, 100, false)