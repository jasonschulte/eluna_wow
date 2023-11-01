local PLAYER_EVENT_ON_ENTER_COMBAT =  33 -- (event, player, enemy)
local PLAYER_EVENT_ON_LEAVE_COMBAT =  34 -- (event, player, enemy)
local HUNTER_CLASS = 3
local ASPECT_OF_THE_HAWK = { 13165, 14318, 14319, 14320, 14321, 14322, 25296, 27044, 61846, 61847 }
local ASPECT_OF_THE_VIPER = 34074

local function HasHawkAspect(player)
    for _,SpellID in pairs(ASPECT_OF_THE_HAWK) do
        if player:HasSpell(SpellID) then
            return true
        end
    end
end

local function HasViperAspect(player)
    if player:HasSpell(ASPECT_OF_THE_VIPER) then
        return true
    end
end

local function MaxHawkAspect(player)
    local MaxHawkAspect = 0
    for _,SpellID in pairs(ASPECT_OF_THE_HAWK) do
        if player:HasSpell(SpellID) then
            MaxHawkAspect = SpellID
        end
    end
    return MaxHawkAspect
end

local function OnEnterCombat(event, player, enemy)
    player:SendBroadcastMessage("Entering Combat ...") -- .. player:GetClass() .. " " .. player:GetClassAsString()
    if player:GetClass() == HUNTER_CLASS and HasHawkAspect(player) then
        player:CastSpell(player, MaxHawkAspect(player))
    end    
end

local function OnLeaveCombat(event, player, enemy)
    if player:GetClass() == HUNTER_CLASS and HasViperAspect(player) then
        player:CastSpell(player, ASPECT_OF_THE_VIPER)
    end
end

RegisterPlayerEvent(PLAYER_EVENT_ON_ENTER_COMBAT, OnEnterCombat)
RegisterPlayerEvent(PLAYER_EVENT_ON_LEAVE_COMBAT, OnLeaveCombat)