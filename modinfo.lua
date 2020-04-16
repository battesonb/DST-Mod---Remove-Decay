name = "Remove Decay"
version = "1.1.0"
author = "Byron Batteson"
description = "[i]version "..version.."[/i]\n"..
[[

This mod allows you to toggle whether various items in the game decay. This can either provide relief from some of the worries while playing or it can result in making the game extremely easy. It is up to you to tweak it.

[h1]Supported items[/h1]
1. Amulets
2. Lantern
3. Thermal stone
4. Torch
5. Umbrellas
]]
forumthread = ""
api_version = 2
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
    name = "BLUE_AMULET_DECAY",
    label = "Amulet decay (Blue)",
    options = {
      {description = "On", data = true},
      {description = "Off", data = false},
    },
    default = true,
  },
  {
    name = "GREEN_AMULET_DECAY",
    label = "Amulet decay (Green)",
    options = {
      {description = "On", data = true},
      {description = "Off", data = false},
    },
    default = true,
  },
  {
    name = "ORANGE_AMULET_DECAY",
    label = "Amulet decay (Orange)",
    options = {
      {description = "On", data = true},
      {description = "Off", data = false},
    },
    default = true,
  },
  {
    name = "PURPLE_AMULET_DECAY",
    label = "Amulet decay (Purple)",
    options = {
      {description = "On", data = true},
      {description = "Off", data = false},
    },
    default = true,
  },
  {
    name = "RED_AMULET_DECAY",
    label = "Amulet decay (Red)",
    options = {
      {description = "On", data = true},
      {description = "Off", data = false},
    },
    default = true,
  },
  {
    name = "YELLOW_AMULET_DECAY",
    label = "Amulet decay (Yellow)",
    options = {
      {description = "On", data = true},
      {description = "Off", data = false},
    },
    default = true,
  },
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
  {
    name = "GRASS_UMBRELLA_DECAY",
    label = "Umbrella decay (Grass)",
    options = {
      {description = "On", data = true},
      {description = "Off", data = false},
    },
    default = true,
  },
  {
    name = "UMBRELLA_DECAY",
    label = "Umbrella decay (Pig skin)",
    options = {
      {description = "On", data = true},
      {description = "Off", data = false},
    },
    default = true,
  },
}