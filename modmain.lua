_G = GLOBAL
TUNING = _G.TUNING

local options = {
	{ name = "BLUE_AMULET_DECAY", prefab = "blueamulet" },
	{ name = "GREEN_AMULET_DECAY", prefab = "greenamulet" },
	{ name = "ORANGE_AMULET_DECAY", prefab = "orangeamulet" },
	{ name = "PURPLE_AMULET_DECAY", prefab = "purpleamulet" },
	{ name = "RED_AMULET_DECAY", prefab = "amulet" },
	{ name = "YELLOW_AMULET_DECAY", prefab = "yellowamulet" },
	{ name = "LANTERN_DECAY", prefab = "lantern" },
	{ name = "MINER_HAT_DECAY", prefab = "minerhat" },
	{ name = "TORCH_DECAY", prefab = "torch" },
	{ name = "THERMAL_STONE_DECAY", prefab = "heatrock" },
	{ name = "GRASS_UMBRELLA_DECAY", prefab = "umbrella" },
	{ name = "UMBRELLA_DECAY", prefab = "grass_umbrella" },
}

for i,option in ipairs(options) do
	if not (GetModConfigData(option["name"])) then
		local function RemoveDecayFunction(inst)
			if not GLOBAL.TheWorld.ismastersim then
				return inst
			end
	
			inst:AddTag('nodecay')

			inst.components.fueled.GetPercent = function() return 1 end
			inst.components.fueled.SetPercent = function() end
			inst.components.fueled.IsEmpty = function() return false end
			inst.components.fueled.StopConsuming = function() end
			inst.components.fueled.StartConsuming = function() end
			inst.components.fueled.SetUpdateFn = function() end
		end
	
		AddPrefabPostInit(option["prefab"], RemoveDecayFunction)
	end
end
