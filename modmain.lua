_G = GLOBAL
TUNING = _G.TUNING

local options = {
	{ name = "LANTERN_DECAY", prefab = "lantern" },
	{ name = "TORCH_DECAY", prefab = "torch" },
	{ name = "THERMAL_STONE_DECAY", prefab = "heatrock" },
	{ name = "MINER_HAT_DECAY", prefab = "minerhat" },
}

for i,option in ipairs(options) do
	if not (GetModConfigData(option["name"])) then
		local function RemoveDecayFunction(inst)
			if not GLOBAL.TheWorld.ismastersim then
				return inst
			end
	
			inst:AddTag('nodecay')
	
			inst:RemoveComponent("fueled")
			inst.components.fueled = {
				GetPercent = function() return 1 end,
				SetPercent = function() end,
				IsEmpty = function() return false end,
				StopConsuming = function() end,
				StartConsuming = function() end,
				SetUpdateFn = function() end,
			}
		end
	
		AddPrefabPostInit(option["prefab"], RemoveDecayFunction)
	end
end
