local Enums = {}

local Utils = loadstring(game:HttpGet('https://raw.githubusercontent.com/difficuItly/idsurghdkofg/main/ray%20casting'))()

Enums.NETWORK = {}
Enums.NETWORK.CHAT = 1
Enums.NETWORK.ATTACK = 2
Enums.NETWORK.DRAG = 3
Enums.NETWORK.STOMP = 4
Enums.NETWORK.PLAY_BOOMBOX = 5
Enums.NETWORK.STOP_BOOMBOX = 6
Enums.NETWORK.SET_SIGN_IMAGE = 7
Enums.NETWORK.SPRAY_IMAGE = 8
Enums.NETWORK.INTERACTABLE_LOCK = 9
Enums.NETWORK.INTERACTABLE_CLICK = 10
Enums.NETWORK.INTERACTABLE_KNOCK = 11

if Utils.IsOriginal then
    Enums.NETWORK.SET_GROUP = 12
    Enums.NETWORK.LEAVE_GROUP = 13
    Enums.NETWORK.SET_HAT = 14
    Enums.NETWORK.REMOVE_HAT = 15
    Enums.NETWORK.SET_HAT_COLOR = 16
    Enums.NETWORK.TAG_REPLICATE = 17
else

end



return Enums
