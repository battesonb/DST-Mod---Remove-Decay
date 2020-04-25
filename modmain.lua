local options = {
	{ name = "BLUE_AMULET_DECAY", prefab = "blueamulet" },
	{ name = "PURPLE_AMULET_DECAY", prefab = "purpleamulet" },
	{ name = "YELLOW_AMULET_DECAY", prefab = "yellowamulet" },
	{ name = "LANTERN_DECAY", prefab = "lantern" },
	{ name = "MINER_HAT_DECAY", prefab = "minerhat" },
	{ name = "TORCH_DECAY", prefab = "torch" },
	{ name = "THERMAL_STONE_DECAY", prefab = "heatrock" },
	{ name = "UMBRELLA_DECAY", prefab = "umbrella" },
	{ name = "GREEN_AMULET_DECAY", prefab = "greenamulet" },
	{ name = "ORANGE_AMULET_DECAY", prefab = "orangeamulet" },
	{ name = "RED_AMULET_DECAY", prefab = "amulet" },
	{ name = "GRASS_UMBRELLA_DECAY", prefab = "grass_umbrella" },
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

			if (inst.components.fueled ~= nil) then
				PatchFueledComponent(inst)
			elseif (inst.components.finiteuses ~= nil) then
				PatchFiniteUsesComponent(inst)
			elseif (inst.components.perishable ~= nil) then
				PatchPerishable(inst)
			end
		end

		AddPrefabPostInit(option.prefab, RemoveDecayFunction)
	end
end
