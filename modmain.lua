TUNING.LUM=TUNING.LUM or {}

-- Hunger
TUNING.LUM.HUNGER={
    MAX=1.0*TUNING.WILSON_HUNGER,
    RATE=1.0*TUNING.WILSON_HUNGER_RATE,
}

-- Health
TUNING.LUM.HEALTH=1.0*TUNING.WILSON_HEALTH
-- Sanity
TUNING.LUM.SANITY=1.0*TUNING.WILSON_SANITY
-- Damage Multiplier
TUNING.LUM.ATTACKMULT=1.0

-- Walking and Running Speeds
TUNING.LUM.SPEEDS={
    WALK=1.0*TUNING.WILSON_WALK_SPEED,
    RUN=1.0*TUNING.WILSON_RUN_SPEED,
}

PrefabFiles = {
	"lum",
}

Assets = {
    Asset( "IMAGE", "images/saveslot_portraits/lum.tex" ),
    Asset( "ATLAS", "images/saveslot_portraits/lum.xml" ),
    Asset( "IMAGE", "images/selectscreen_portraits/lum.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/lum.xml" ),
    Asset( "IMAGE", "images/selectscreen_portraits/wod_silho.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/wod_silho.xml" ),
    Asset( "IMAGE", "bigportraits/lum.tex" ),
    Asset( "ATLAS", "bigportraits/lum.xml" ),

}

table.insert(GLOBAL.CHARACTER_GENDERS.MALE, "lum")


AddModCharacter("lum")

