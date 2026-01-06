require "SCVNE"

--=============== DEFINE CHARACTERS: ==============--

defineCharacter("AOKA", "Kuronou Aoka", "aoka.png", 5, 2, 120)
    defineExpression("AOKA", "normal", 2, 0)
    defineExpression("AOKA", "smile" , 1, 1)
    defineExpression("AOKA", "hatred", 0, 1)

defineCharacter("PURP", "Purple Aoka", "purpleaoka.png", 5, 2, 120)
    defineExpression("PURP", "normal", 2, 0)
    defineExpression("PURP", "smile" , 1, 1)
    
--============== DEFINE BACKGROUNDS: ==============--

defineBackground("BG1", "singlecreate_light.jpg",100)
defineBackground("BG2", "singlecreate_conflict.jpg",100)