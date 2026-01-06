  --=============================================--
--==                 CUSTOMIZATION:              ==--
  --=============================================--

--=============== Text Customization ==============--
textFont = "Saira Regular"
textFontSize = 55
textAlign = "upperleft"
textColor = {255,255,255}
textMaxWidth = 1830
textPositionX = 0
textPositionY = -280

textDropShadow = true
textShadowColor = {0,0,0}
textShadowOffset = 5
textShadowAlpha = 150

nameFont = "Saira Medium"
nameFontSize = 58
nameAlign = "middlecenter"
nameColor = {255,255,255}
nameMaxWidth = 830
namePositionX = -650
namePositionY = -165

nameDropShadow = true
nameShadowColor = {0,0,0}
nameShadowOffset = 6
nameShadowAlpha = 100

--============= Textbox Customization =============--
local textbox = Scene.createSprite("textbox.png","default","background")
textbox.scaleX = 280
textbox.scaleY = 200--110 * Context.screenAspectRatio
textbox.translationY = -520

local namePlate = Scene.createSprite("nameDisplay.png","default","background")
namePlate.scaleX = 90
namePlate.scaleY = 90
namePlate.translationX = -675
namePlate.translationY = -185

local textboxTriangles = Scene.createSprite("textboxTriangles.png","default","background")
textboxTriangles.scaleX = 287
textboxTriangles.scaleY = 242--30+(110 * Context.screenAspectRatio)
textboxTriangles.translationY = -660
textboxTriangles.textureOffsetX = Channel.saw("s",25000,0,1,0)
textboxTriangles.textureOffsetY = Channel.saw("s",200000,1,0,0)

--================= Misc Variables ================--
autoAdvanceTimer = 2000 -- How long (ms) it should wait to show the next text when timing is set to -1
characterInactiveAlpha = 150 -- Opacity of a character when they aren't talking
characterInactiveScale = 0.9 -- How much a character shrinks when they aren't talking















  --=============================================--
--==                DON'T TOUCH:                 ==--
--==     (unless you know what you're doing)     ==--
  --=============================================--

textChannel = TextChannel.create().addKey(0,"","cnsti")
displayNameChannel = TextChannel.create().addKey(0,"","cnsti")

if textDropShadow == true then
    local textDropShadow = Scene.createText(textFont, textFontSize, 1, textAlign)

    textDropShadow.colorR = textShadowColor[1]
    textDropShadow.colorG = textShadowColor[2]
    textDropShadow.colorB = textShadowColor[3]
    textDropShadow.rectW = textMaxWidth
    textDropShadow.translationX = textPositionX+textShadowOffset
    textDropShadow.translationY = textPositionY-textShadowOffset
    textDropShadow.text = textChannel
    textDropShadow.colorA = textShadowAlpha
end

local text = Scene.createText(textFont, textFontSize, 1, textAlign)

text.colorR = textColor[1]
text.colorG = textColor[2]
text.colorB = textColor[3]
text.rectW = textMaxWidth
text.translationX = textPositionX
text.translationY = textPositionY
text.text = textChannel

if nameDropShadow == true then
    local nameDropShadow = Scene.createText(nameFont, nameFontSize, 1, nameAlign)

    nameDropShadow.colorR = nameShadowColor[1]
    nameDropShadow.colorG = nameShadowColor[2]
    nameDropShadow.colorB = nameShadowColor[3]
    nameDropShadow.rectW = nameMaxWidth
    nameDropShadow.translationY = namePositionY-nameShadowOffset
    nameDropShadow.translationX = namePositionX+nameShadowOffset
    nameDropShadow.text = displayNameChannel
    nameDropShadow.colorA = nameShadowAlpha
end

local black = Scene.createSprite("black.png","default")
black.layer = "Notes"
black.scaleX = 200000
black.scaleY = 200000
black.colorA = Channel.keyframe().addKey(0,255).addKey(200,0)

local charNameDisplay = Scene.createText(nameFont, nameFontSize, 1, nameAlign)

charNameDisplay.colorR = nameColor[1]
charNameDisplay.colorG = nameColor[2]
charNameDisplay.colorB = nameColor[3]
charNameDisplay.rectW = nameMaxWidth
charNameDisplay.translationX = namePositionX
charNameDisplay.translationY = namePositionY
charNameDisplay.text = displayNameChannel

textbox.layer = "Background"
textbox.sort = 100
textboxTriangles.layer = "Background"
textboxTriangles.sort = 101
namePlate.layer = "Background"
namePlate.sort = 99
namePlate.colorA = Channel.keyframe().addKey(-9999,0,"cnsti")

local characters = {}
local displayNames = {}
local characterScales = {}
local characterPortraitsX = {}
local characterPortraitsY = {}
local backgrounds = {}

Scene.hud.active = Channel.constant(0)
Scene.gameplayCamera.translationY = 100
Scene.gameplayCamera.rotationX = 20
local previousText = ""
local previousCharacter = "none"
local ending = 100
local auto = 0
local namePlateVisible = false

function showText(timing, speed, text, continuous, fromShowDialogue)
    if timing == -1 then
        realTiming = auto
    else
        realTiming = timing
    end

    if not continuous then
        textChannel.addKey(realTiming, "","s")
    else
        textChannel.addKey(realTiming, previousText,"s")
    end

    if speed == 0 then
        ending = realTiming+1
    else
        ending = realTiming+(string.len(text) * speed)
    end
    auto = ending + autoAdvanceTimer

    if fromShowDialogue != true then
        characters[previousCharacter].colorA.addKey(realTiming,255,"so")
        characters[previousCharacter].colorA.addKey(realTiming+200,characterInactiveAlpha,"cnsti")

        characters[previousCharacter].scaleX.addKey(realTiming,characterScales[previousCharacter]/characterPortraitsX[previousCharacter],"so")
        characters[previousCharacter].scaleX.addKey(realTiming+200,(characterScales[previousCharacter]/characterPortraitsX[previousCharacter])*characterInactiveScale,"cnsti")
 
        characters[previousCharacter].scaleY.addKey(realTiming,characterScales[previousCharacter]/characterPortraitsY[previousCharacter],"so")
        characters[previousCharacter].scaleY.addKey(realTiming+200,(characterScales[previousCharacter]/characterPortraitsY[previousCharacter])*characterInactiveScale,"cnsti")

        if namePlateVisible == true then
        namePlate.colorA.addKey(realTiming,255,"s")
        namePlate.colorA.addKey(realTiming+100,0,"cnsti")
        end
        namePlateVisible = false
        displayNameChannel.addKey(realTiming, "", "cnsti")
    end

    textChannel.addKey(ending, text,"cnsti")
    previousText = text
end

function showDialogue(timing, character, expression, speed, text, continuous)
    if timing == -1 then
        realTiming = auto
    else
        realTiming = timing
    end

    if character != previousCharacter then
        characters[previousCharacter].colorA.addKey(realTiming,255,"so")
        characters[previousCharacter].colorA.addKey(realTiming+200,characterInactiveAlpha,"cnsti")
        characters[character].colorA.addKey(realTiming,characterInactiveAlpha,"so")
        characters[character].colorA.addKey(realTiming+200,255,"cnsti")

        characters[previousCharacter].scaleX.addKey(realTiming,characterScales[previousCharacter]/characterPortraitsX[previousCharacter],"so")
        characters[previousCharacter].scaleX.addKey(realTiming+200,(characterScales[previousCharacter]/characterPortraitsX[previousCharacter])*characterInactiveScale,"cnsti")
        characters[character].scaleX.addKey(realTiming,(characterScales[character]/characterPortraitsX[character])*characterInactiveScale,"so")
        characters[character].scaleX.addKey(realTiming+200,characterScales[character]/characterPortraitsX[character],"cnsti")
    
        characters[previousCharacter].scaleY.addKey(realTiming,characterScales[previousCharacter]/characterPortraitsY[previousCharacter],"so")
        characters[previousCharacter].scaleY.addKey(realTiming+200,(characterScales[previousCharacter]/characterPortraitsY[previousCharacter])*characterInactiveScale,"cnsti")
        characters[character].scaleY.addKey(realTiming,(characterScales[character]/characterPortraitsY[character])*characterInactiveScale,"so")
        characters[character].scaleY.addKey(realTiming+200,characterScales[character]/characterPortraitsY[character],"cnsti")
    end

    displayNameChannel.addKey(realTiming, displayNames[character],"cnsti")
    if namePlateVisible == false then
        namePlate.colorA.addKey(realTiming,0,"s")
        namePlate.colorA.addKey(realTiming+100,255,"cnsti")

        namePlateVisible = true
    end
    previousCharacter = character
    changeExpression(realTiming, character, expression)
    showText(timing, speed, text, continuous, true)
end

function clearText(timing)
    displayNameChannel.addKey(timing, "", "cnsti")
    textChannel.addKey(timing, "", "cnsti")
    namePlate.colorA.addKey(timing,255,"s")
    namePlate.colorA.addKey(timing+100,0,"cnsti")
    namePlateVisible = false
    characters[previousCharacter].colorA.addKey(timing,255,"so")
    characters[previousCharacter].colorA.addKey(timing+200,characterInactiveAlpha,"cnsti")

    characters[previousCharacter].scaleX.addKey(timing,characterScales[previousCharacter]/characterPortraitsX[previousCharacter],"so")
    characters[previousCharacter].scaleX.addKey(timing+200,(characterScales[previousCharacter]/characterPortraitsX[previousCharacter])*characterInactiveScale,"cnsti")

    characters[previousCharacter].scaleY.addKey(timing,characterScales[previousCharacter]/characterPortraitsY[previousCharacter],"so")
    characters[previousCharacter].scaleY.addKey(timing+200,(characterScales[previousCharacter]/characterPortraitsY[previousCharacter])*characterInactiveScale,"cnsti")
    previousCharacter = "none"
end

function defineCharacter(name, displayName, spritesheet, portraitsX, portraitsY , scale)
    local charSprite = Scene.createSprite("Character Sprites/"..spritesheet,"default","background")
    charSprite.sort = 10
    charSprite.translationX = Channel.keyframe().addKey(-99999,0,"cnsti")
    charSprite.translationY = Channel.keyframe().addKey(-99999,150,"cnsti")
    charSprite.layer = "Background"
    charSprite.scaleX = Channel.keyframe().addKey(-99999,(scale/portraitsX)*characterInactiveScale,"cnsti")
    charSprite.scaleY = Channel.keyframe().addKey(-99999,(scale/portraitsY)*characterInactiveScale,"cnsti")
    charSprite.textureScaleX = 1/portraitsX
    charSprite.textureScaleY = 1/portraitsY
    charSprite.textureOffsetX = Channel.keyframe().addKey(-99999,0,"cnsti").setDefaultEasing("cnsti")
    charSprite.textureOffsetY = Channel.keyframe().addKey(-99999,portraitsY-1,"cnsti").setDefaultEasing("cnsti")
    charSprite.colorA = Channel.keyframe().addKey(-99999,characterInactiveAlpha,"cnsti")
    charSprite.rotationY = Channel.keyframe()
    charSprite.active = Channel.keyframe().addKey(0,0,"cnsti")

    characters[name] = charSprite 
    displayNames[name] = displayName
    characterScales[name] = scale
    characterPortraitsX[name] = portraitsX
    characterPortraitsY[name] = portraitsY
end

function defineBackground(name, image, scale)
    local newbg = Scene.createSprite("Backgrounds/"..image,"default","background")
    newbg.layer = "Background"
    newbg.sort = 0
    newbg.active = Channel.keyframe().addKey(-99999, 0, "cnsti")
    newbg.scaleX = scale
    newbg.scaleY = scale
    backgrounds[name] = newbg
end

local expressions = {}
function defineExpression(character, expression, x, y)
    expressions[character..expression] = {["x"] = x, ["y"] = y}
end

function changeExpression(timing, character, expression)
    characters[character].textureOffsetX.addKey(timing, expressions[character..expression]["x"], "cnsti")
    characters[character].textureOffsetY.addKey(timing, expressions[character..expression]["y"], "cnsti")
end

function showCharacter(timing, character, fade)
    characters[character].active.addKey(timing,1,"cnsti")
    if fade != 0 then
        characters[character].colorA.addKey(timing,0,"s")
    end
    characters[character].colorA.addKey(timing+fade,characterInactiveAlpha,"cnsti")
end

function hideCharacter(timing, character, fade)
    characters[character].active.addKey(timing+fade,0,"cnsti")
    if fade != 0 then
        characters[character].colorA.addKey(timing,characterInactiveAlpha,"s")
    end
    characters[character].colorA.addKey(timing+fade,0,"cnsti")
end

function moveCharacter(timing, character, x, y, easing)
    if x != nil then
        characters[character].translationX.addKey(timing,x,easing)
    end
    if y != nil then
        characters[character].translationY.addKey(timing,y,easing)
    end
end

function flipCharacter(timing, character, time)
    if time == 0 or not time then
        characters[character].rotationY.addKey(timing,-1*(characters[character].rotationY.valueAt(timing)),"cnsti")
    end
    characters[character].rotationY.addKey(timing,characters[character].rotationY.valueAt(timing),"s")
    characters[character].rotationY.addKey(timing+time,180+(characters[character].rotationY.valueAt(timing)),"cnsti")
end

local previousBG = nil
function changeBG(timing, bg, fade, clearCharacters)
    if clearCharacters == true then
        local fuck = {}
        for k,v in pairs(characters) do
            -- this shit doesn't work
        end
    end
    if fade != 0 then
        black.colorA = Channel.keyframe().addKey(timing,0,"so").addKey(timing+(fade*0.8),255).addKey(timing+(fade*1.2),255).addKey(timing+(fade*2),0,"si")
    end
    if previousBG != nil then
        backgrounds[previousBG].active.addKey(timing+fade,0,"cnsti")
    end
    backgrounds[bg].active.addKey(timing+fade,1,"cnsti")
    previousBG = bg
end

defineCharacter("none", "", "aoka.png", 5, 2, 120)
defineExpression("none", "none", 0, 0)
characters["none"].active = 0