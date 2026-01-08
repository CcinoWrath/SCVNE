
# SCVNE
ArcCreate Scenecontrol Visual Novel Engine

# How to use:

## Installation:

Just put the files in the Scenecontrol folder.

## Creating an Entry:

Create a chart difficulty, and name a lua file the same as the difficulty.

(ex: `Entry1.aff` will use `Entry1.lua` as it's script.)

## Please:

Unless you know what you're doing, don't add code to `VN.lua`.

There are however customization settings in there you can modify.

# Functions:

## Defining Assets:

`defineCharacter(name, displayName, spritesheet, portraitsX, portraitsY , scale)`

- **name** *(string)*: The character's identifier that you'll use in other functions.

- **displayName** *(string)*: The character's full name to be shown on the textbox.

- **spritesheet** *(string)*: The image containing the character's expressions. (include the file extension but not the folder path, eg. "aoka.png")

- **portraitsX / Y** *(number)*: The amount of sprites in the sprite sheet horizontally and vertically.

- **scale** *(number)*: How big the sprite is by default.

`defineCharacterPart(character, partName, spritesheet, portraitsX, portraitsY , scale, offsetX, offsetY, sort)`

- **character** *(string)*: Character identifier.

- **partName** *(string)*: The part's identifier that you'll use in other functions.

- **spritesheet & portraitsX / Y**: Same as `defineCharacter()`

- **scale** *(number)*: How big the sprite is compared to the character, usually keep at 1.

- **offsetX/Y (number)**: Position offset from the default position. (Usually a very small number)

- **sort** *(number)*: How far it layers above or below the base character. Don't set to 0, this may cause Z-fighting.


`defineExpression(character, expression, parts)`

- **character** *(string)*: Character identifier.

- **expression** *(string)*: The expression's identifier that you'll use in other functions.

- **parts** *(table)*: A table containing the change in sprites for each part. Example below:

```
defineExpression("AOKA", "neutral",{
["eyebrows"] = {0,0}, -- These coordinates define what
["eyes"] = {0,0},     -- sprite in each spritesheet to use.
["mouth"] = {0,0},    -- You only need to include the ones that actually change.
["AOKA"] = {0,0},     -- Putting in the character identifier will change the base sprite.
})
```

`defineBackground(name, image, scale)`

- **name** *(string)*: The background's identifier that you'll use in other functions.

- **image** *(string)*: The image to use. (include the file extension but not the folder path, eg. "bg.png")

- **scale** *(number)*: How big the sprite is.

## Adding Dialogue:

`showDialogue(timing, character, expression, speed, text, continuous)` 

Shows a character saying something.

`showText(timing, speed, text, continuous, fromShowDialogue)`

Shows text not said by a character.

- **timing** *(number)*: Self explanitory.

- **character** *(string)*: Character identifier.

- **expression** *(string)*: Expression identifier.

- **speed** *(number)*: Time in ms between each letter, lower numbers are faster.

- **text** *(string)*: What to show in the textbox

- **continuous** *(bool)*: Set to true to continue from the previous dialogue, otherwise don't include.

`clearText(timing)`

Resets the textbox to be empty.

- **timing** *(number)*: Self explanitory.

## Character Stuff:

- **timing** *(number)*: Self explanitory.

- **character** *(string)*: Character identifier.

`changeExpression(timing, character, expression)`

Changes a character's expression separate from dialogue.

- **expression** *(string)*: Expression identifier.

`showCharacter(timing, character, fade)`

`hideCharacter(timing, character, fade)`

Shows or hides a character.

- **fade** *(number)*: How many ms to fade in and out.

`moveCharacter(timing, character, x, y, easing)`

Adds a keyframe for a character's `translationX` and `translationY`.

- **x / y** *(number)*: Position reached at `timing`. Set either to `nil` to not change it.

- **easing** *(string)*: [Easing](https://github.com/Tempestissiman/ArcadeScenecontrol/wiki/Easings).

`rotateCharacter(timing, character, x, y, z, easing)`

Adds a keyframe for a character's `translationX` and `translationY`.
Note: used internally by `flipCharacter()`

- **x / y / z** *(number)*: Rotation reached at `timing`. Set any of them to `nil` to not change it.

- **easing** *(string)*: [Easing](https://github.com/Tempestissiman/ArcadeScenecontrol/wiki/Easings).

`flipCharacter(timing, character, time)`
Note: This will always set the character's `rotationY` to either 0 or 180 depending on the current rotation.

- **time** *(number)*: How long it takes the character to flip around. Set to 0 to change instantly.

## Scene:

`changeBG(timing, bg, fade)`

- **timing** *(number)*: Self explanitory.

- **bg** *(string)*: Background identifier.

- **fade** *(number)*: How long it takes the screen to fade in and out. Set to 0 to change BG without black screen.
