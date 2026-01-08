require "SCVNE";require "Characters"

--================= WRITE SCRIPT: =================--
-- Initializing the Background
changeBG(-9999,"BG1", 0)

-- Initializing Aoka's position and expression
changeExpression(-9999, "AOKA", "neutral")
showCharacter(0, "AOKA", 0)
moveCharacter(0, "AOKA", 1400, 0, "bko")
rotateCharacter(0, "AOKA", nil, nil, 45, "bko")

-- Initializing Purple Aoka's position and expression
changeExpression(-9999, "PURP", "neutral")
showCharacter(0, "PURP", 0)
moveCharacter(0, "PURP", -1400, 0, "bko")
rotateCharacter(0, "PURP", nil, nil, 45, "bko")
flipCharacter(0, "PURP", 0)

-- Example of moving them into frame
moveCharacter(750, "AOKA", 500, nil, "cnsti")
rotateCharacter(1000, "AOKA", nil, nil, 0, "bko")
moveCharacter(750, "PURP", -500, nil, "cnsti")
rotateCharacter(1000, "PURP", nil, nil, 0, "bko")

-- The Dialogue
showDialogue(1000, "AOKA", "neutralTalk", 30, "Oh boy I sure do love being Kuronou Aoka from ArcCreate huhu yo")
showDialogue(-1, "PURP", "neutralTalk" , 30, "you're so right it's awesome")

clearText(6800)
changeExpression(6800, "AOKA", "annoyed")

showDialogue(9000, "AOKA", "annoyed", 45, "Fuck you purple aoka")

-- Switching the scene, a pause, background change, and textbox clear at the same time.
changeBG(12000,"BG2",200)
clearText(12200)

-- Purple Aoka is dead.
hideCharacter(12500,"PURP",200)
showText(13000, 30, "and that was the last thing purple aoka heard before she was put in the magma")