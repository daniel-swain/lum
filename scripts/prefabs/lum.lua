
local MakePlayerCharacter = require "prefabs/player_common"


local assets = {

        Asset( "ANIM", "anim/player_basic.zip" ),
        Asset( "ANIM", "anim/player_idles_shiver.zip" ),
        Asset( "ANIM", "anim/player_actions.zip" ),
        Asset( "ANIM", "anim/player_actions_axe.zip" ),
        Asset( "ANIM", "anim/player_actions_pickaxe.zip" ),
        Asset( "ANIM", "anim/player_actions_shovel.zip" ),
        Asset( "ANIM", "anim/player_actions_blowdart.zip" ),
        Asset( "ANIM", "anim/player_actions_eat.zip" ),
        Asset( "ANIM", "anim/player_actions_item.zip" ),
        Asset( "ANIM", "anim/player_actions_uniqueitem.zip" ),
        Asset( "ANIM", "anim/player_actions_bugnet.zip" ),
        Asset( "ANIM", "anim/player_actions_fishing.zip" ),
        Asset( "ANIM", "anim/player_actions_boomerang.zip" ),
        Asset( "ANIM", "anim/player_bush_hat.zip" ),
        Asset( "ANIM", "anim/player_attacks.zip" ),
        Asset( "ANIM", "anim/player_idles.zip" ),
        Asset( "ANIM", "anim/player_rebirth.zip" ),
        Asset( "ANIM", "anim/player_jump.zip" ),
        Asset( "ANIM", "anim/player_amulet_resurrect.zip" ),
        Asset( "ANIM", "anim/player_teleport.zip" ),
        Asset( "ANIM", "anim/wilson_fx.zip" ),
        Asset( "ANIM", "anim/player_one_man_band.zip" ),
        Asset( "ANIM", "anim/shadow_hands.zip" ),
        Asset( "SOUND", "sound/sfx.fsb" ),
        Asset( "SOUND", "sound/wilson.fsb" ),
        Asset( "ANIM", "anim/beard.zip" ),

		-- Don't forget to include your character's custom assets!
        Asset( "ANIM", "anim/lum.zip" ),
}
local prefabs = {}

local start_inv =
{
	-- todo: Add pickpocket glove, add banana phone
}


local function updateStats(inst)

        if GetClock():IsDusk() then
            inst.components.locomotor.walkspeed = (TUNING.LUM.SPEEDS.WALK * 1.3)
            inst.components.locomotor.runspeed = (TUNING.LUM.SPEEDS.RUN * 1.3)
        elseif GetClock():IsNight() then
            inst.components.locomotor.walkspeed = (TUNING.LUM.SPEEDS.WALK * 1.5)
            inst.components.locomotor.runspeed = (TUNING.LUM.SPEEDS.RUN * 1.5)
        else
            inst.components.locomotor.walkspeed = TUNING.LUM.SPEEDS.WALK
            inst.components.locomotor.runspeed = TUNING.LUM.SPEEDS.RUN
        end
end


local fn = function(inst)
	
	inst.soundsname = "wilson"
	inst.MiniMapEntity:SetIcon( "wilson.png" )
	inst.components.combat.damagemultiplier = TUNING.LUM.ATTACKMULT
	inst.components.locomotor.walkspeed = TUNING.LUM.SPEEDS.WALK
	inst.components.locomotor.runspeed = TUNING.LUM.SPEEDS.RUN
	
	-- Less Sanity degen at night
	inst.components.sanity.night_drain_mult = (TUNING.WENDY_SANITY_MULT * .90)
	inst.components.sanity.neg_aura_mult = (TUNING.WENDY_SANITY_MULT * .90)


    inst.components.sanity:SetMax(TUNING.LUM.SANITY)
	inst.components.health:SetMaxHealth(TUNING.LUM.HEALTH)
	inst.components.hunger:SetMax(TUNING.LUM.HUNGER.MAX)
	inst.components.hunger:SetRate(TUNING.LUM.HUNGER.RATE)

    -- Embrace the Night
    inst:ListenForEvent("dusktime", function() updateStats(inst) end , GetWorld())
    inst:ListenForEvent("nighttime", function() updateStats(inst) end , GetWorld())
    updateStats(inst)

    STRINGS.CHARACTERS.GENERIC= require "speech_lum"
	
end

STRINGS.CHARACTER_TITLES.lum = "debugLumizze"
STRINGS.CHARACTER_NAMES.lum = "debugLumizze" 
STRINGS.CHARACTER_DESCRIPTIONS.lum = "*Winks infinitely.\n *A bard in waiting."
STRINGS.CHARACTER_QUOTES.lum = "\"Such winks. Wow.\""


return MakePlayerCharacter("lum", prefabs, assets, fn)
