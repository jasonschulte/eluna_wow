local PLAYER_EVENT_ON_ENTER_COMBAT =  33 // (event, player, enemy)
local PLAYER_EVENT_ON_LEAVE_COMBAT =  34 // (event, player, enemy)

local function OnEnterCombat(event, player, enemy)
    player:SendBroadcastMessage("Entering Combat")
end

local function OnLeaveCombat(event, player, enemy)
    player:SendBroadcastMessage("Leaving Combat")
end

RegisterPlayerEvent(PLAYER_EVENT_ON_ENTER_COMBAT, OnEnterCombat)
RegisterPlayerEvent(PLAYER_EVENT_ON_LEAVE_COMBAT, OnLeaveCombat)