require "SCVNE";require "Characters"

--================= WRITE SCRIPT: =================--
changeBG(-9999,"BG1", 0)

changeExpression(-9999, "AOKA", "normal")
showCharacter(0, "AOKA", 0)
moveCharacter(0, "AOKA", 1400, 120, "bko")

changeExpression(-9999, "PURP", "normal")
showCharacter(0, "PURP", 0)
moveCharacter(0, "PURP", -1400, 120, "bko")

moveCharacter(750, "AOKA", 500, nil, "cnsti")
moveCharacter(750, "PURP", -500, nil, "cnsti")
flipCharacter(-9999, "PURP", 0)

showDialogue(1000, "AOKA", "smile", 30, "Oh boy I sure do love being Kuronou Aoka from ArcCreate huhu yo")

showDialogue(-1, "PURP", "smile" , 30, "you're so right it's awesome")

clearText(6800)
changeExpression(6800, "AOKA", "hatred")

showDialogue(9000, "AOKA", "hatred", 30, "Fuck you purple aoka")

changeBG(12000,"BG2",200)
clearText(12200)

hideCharacter(12500,"PURP",200)
showText(13000, 30, "and that was the last thing purple aoka heard before she was put in the magma")