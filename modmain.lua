_G = GLOBAL
TUNING = _G.TUNING

local fueledOptions = {
	{ name = "BLUE_AMULET_DECAY", prefab = "blueamulet" },
	{ name = "PURPLE_AMULET_DECAY", prefab = "purpleamulet" },
	{ name = "YELLOW_AMULET_DECAY", prefab = "yellowamulet" },
	{ name = "LANTERN_DECAY", prefab = "lantern" },
	{ name = "MINER_HAT_DECAY", prefab = "minerhat" },
	{ name = "TORCH_DECAY", prefab = "torch" },
	{ name = "THERMAL_STONE_DECAY", prefab = "heatrock" },
	{ name = "GRASS_UMBRELLA_DECAY", prefab = "umbrella" },
	{ name = "UMBRELLA_DECAY", prefab = "grass_umbrella" },
}

for i,option in ipairs(fueledOptions) do
	if not (GetModConfigData(option["name"])) then
		local function RemoveFueledFunction(inst)
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

		AddPrefabPostInit(option["prefab"], RemoveFueledFunction)
	end
end

local finiteUsesOptions = {
	{ name = "GREEN_AMULET_DECAY", prefab = "greenamulet" },
	{ name = "ORANGE_AMULET_DECAY", prefab = "orangeamulet" },
	{ name = "RED_AMULET_DECAY", prefab = "amulet" },
}

for i,option in ipairs(finiteUsesOptions) do
	if not (GetModConfigData(option["name"])) then
		local function RemoveFiniteUsesFunction(inst)
			if not GLOBAL.TheWorld.ismastersim then
				return inst
			end
	
			inst:AddTag('nodecay')

			inst.components.finiteuses.GetPercent = function() return 1 end
			inst.components.finiteuses.SetPercent = function() end
			inst.components.finiteuses.Use = function() end
			inst.components.finiteuses.SetUses = function()
				self.current = self.total
			end
		end

		AddPrefabPostInit(option["prefab"], RemoveFiniteUsesFunction)
	end
end
