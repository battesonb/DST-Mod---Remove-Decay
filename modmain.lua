local COMPONENT = {
	FUELED = "fueled",
	FINITE_USES = "finiteuses",
	PERISHABLE = "perishable",
}

local options = {
	{ name = "BLUE_AMULET_DECAY", prefab = "blueamulet", component = COMPONENT.FUELED },
	{ name = "PURPLE_AMULET_DECAY", prefab = "purpleamulet", component = COMPONENT.FUELED },
	{ name = "YELLOW_AMULET_DECAY", prefab = "yellowamulet", component = COMPONENT.FUELED },
	{ name = "LANTERN_DECAY", prefab = "lantern", component = COMPONENT.FUELED },
	{ name = "MINER_HAT_DECAY", prefab = "minerhat", component = COMPONENT.FUELED },
	{ name = "TORCH_DECAY", prefab = "torch", component = COMPONENT.FUELED },
	{ name = "THERMAL_STONE_DECAY", prefab = "heatrock", component = COMPONENT.FUELED },
	{ name = "UMBRELLA_DECAY", prefab = "umbrella", component = COMPONENT.FUELED },
	{ name = "GREEN_AMULET_DECAY", prefab = "greenamulet", component = COMPONENT.FINITE_USES },
	{ name = "ORANGE_AMULET_DECAY", prefab = "orangeamulet", component = COMPONENT.FINITE_USES },
	{ name = "RED_AMULET_DECAY", prefab = "amulet", component = COMPONENT.FINITE_USES },
	{ name = "GRASS_UMBRELLA_DECAY", prefab = "grass_umbrella", component = COMPONENT.PERISHABLE },
}

for i,option in ipairs(options) do
	if not (GetModConfigData(option.name)) then
		local function PatchFueledComponent(inst)
			inst.components.fueled.GetPercent = function() return 1 end
			inst.components.fueled.SetPercent = function() end
			inst.components.fueled.IsEmpty = function() return false end
			inst.components.fueled.StopConsuming = function() end
			inst.components.fueled.StartConsuming = function() end
			inst.components.fueled.SetUpdateFn = function() end
		end

		local function PatchFiniteUsesComponent(inst)
			inst.components.finiteuses.GetPercent = function() return 1 end
			inst.components.finiteuses.SetPercent = function() end
			inst.components.finiteuses.Use = function() end
			inst.components.finiteuses.SetUses = function()
				self.current = self.total
			end
		end

		local function PatchPerishable(inst)
			inst.components.perishable.GetPercent = function() return 1 end
			inst.components.perishable.SetPercent = function() end
			inst.components.perishable.StartPerishing = function() end
			inst.components.perishable.SetOnPerishFn = function() end
		end

		local function RemoveDecayFunction(inst)
			if not GLOBAL.TheWorld.ismastersim then
				return inst
			end
	
			inst:AddTag('nodecay')

			if (option.component == "fueled") then
				PatchFueledComponent(inst)
			elseif (option.component == "fueled") then
				PatchFiniteUsesComponent(inst)
			elseif (option.component == "perishable") then
				PatchPerishable(inst)
			end
		end

		AddPrefabPostInit(option.prefab, RemoveDecayFunction)
	end
end
