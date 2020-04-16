name = "Remove Decay"
version = "1.0.0"
author = "Byron Batteson"
description = "Version: "..version.."\n"..
[[

This mod allows you to tweak the decay on various items in the game.

This can either provide relief from some of the worries while playing or it can result in making the game extremely easy. It is up to you to tweak it.

Current items
=================
1. Lantern
3. Thermal stone
2. Torch
]]
forumthread = ""
api_version = 1
icon_atlas = "modicon.xml"
icon = "modicon.tex"
dont_starve_compatible = true
reign_of_giants_compatible = true
shipwrecked_compatible = true
dst_compatible = true
all_clients_require_mod = true
client_only_mod = false
server_filter_tags = {}

configuration_options =
{
  {
    name = "LANTERN_DECAY",
    label = "Lantern decay",
    options = {
      {description = "On", data = true},
      {description = "Off", data = false},
    },
    default = false,
  },
  {
    name = "MINER_HAT_DECAY",
    label = "Miner hat decay",
    options = {
      {description = "On", data = true},
      {description = "Off", data = false},
    },
    default = true,
  },
  {
    name = "THERMAL_STONE_DECAY",
    label = "Thermal stone decay",
    options = {
      {description = "On", data = true},
      {description = "Off", data = false},
    },
    default = false,
  },
  {
    name = "TORCH_DECAY",
    label = "Torch decay",
    options = {
      {description = "On", data = true},
      {description = "Off", data = false},
    },
    default = true,
  },
}