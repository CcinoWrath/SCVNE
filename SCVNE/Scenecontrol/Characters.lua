require "SCVNE"

--=============== DEFINE CHARACTERS: ==============--
defineCharacter("AOKA", "Kuronou Aoka", "aoka.png", 2, 1, 100)
    defineCharacterPart("AOKA", "eyebrows", "aokaEyebrows.png", 6, 1, 1, 0.5, 2.13, 3)
    defineCharacterPart("AOKA", "eyes", "aokaEyes.png", 5, 1, 1, 0.5, 2.13, 1)
    defineCharacterPart("AOKA", "mouth", "aokaMouth.png", 6, 1, 1, 0.5, 2.13, 1)
    defineCharacterPart("AOKA", "bangs", "aokaBangs.png", 1, 1, 1, 0.5, 2.13, 2)
    
    defineExpression("AOKA", "neutral",{
        ["AOKA"] = {0,0},
        ["eyebrows"] = {0,0}, -- these coordinates define what
        ["eyes"] = {0,0},     -- sprite in each spritesheet to use.
        ["mouth"] = {0,0},
    })

    defineExpression("AOKA", "neutralTalk",{
        ["eyebrows"] = {1,0}, -- it only needs to include the parts that change.
        ["mouth"] = {1,0},
    })

    defineExpression("AOKA", "annoyed",{
        ["AOKA"] = {0,0},
        ["eyebrows"] = {3,0},
        ["eyes"] = {1,0},
        ["mouth"] = {3,0},
    })

defineCharacter("PURP", "Purple Aoka", "purpleaoka.png", 2, 1, 100)
    defineExpression("PURP", "neutral",{
        ["PURP"] = {0,0}, -- you also don't have to use parts if you don't want
    })
    defineExpression("PURP", "neutralTalk",{
        ["PURP"] = {1,0}, -- you can just use one spritesheet for the character
    })

--[[
defineCharacter("AOKA", "Kuronou Aoka", "aoka.png", 5, 2, 120)
    defineExpression("AOKA", "normal", 2, 0)
    defineExpression("AOKA", "smile" , 1, 1)
    defineExpression("AOKA", "hatred", 0, 1)

defineCharacter("PURP", "Purple Aoka", "purpleaoka.png", 5, 2, 120)
    defineExpression("PURP", "normal", 2, 0)
    defineExpression("PURP", "smile" , 1, 1)
]]

--============== DEFINE BACKGROUNDS: ==============--

defineBackground("BG1", "singlecreate_light.jpg",100)
defineBackground("BG2", "singlecreate_conflict.jpg",100)