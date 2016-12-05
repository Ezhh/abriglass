
-- clear glass recipe
minetest.register_craft({
	output = 'abriglass:clear_glass 4', -- intentional lower yield
	recipe = {
		{'default:glass', '', 'default:glass' },
		{'', 'default:glass', '' },
		{'default:glass', '', 'default:glass' },
	}
})


-- glass light recipes
local plain_colors = {
	"green", "blue", "red", "yellow",
}

local i
for i in ipairs(plain_colors) do
	local name = plain_colors[i]
	local nodesuffix = 'glass_light_'..name

	minetest.register_craft({
		output = 'abriglass:'..nodesuffix..' 4',
		recipe = {
			{'abriglass:clear_glass', 'default:torch', 'abriglass:clear_glass' },
			{'abriglass:clear_glass', 'dye:'..name, 'abriglass:clear_glass' },
		}
	})

	minetest.register_craft({
		type = "cooking",
		recipe = "abriglass:"..nodesuffix,
		output = "abriglass:clear_glass",
	})
end


-- undecorated coloured glass recipes
local dye_list = {
	{"black", "black",}, 
	{"blue", "blue",},
	{"cyan", "cyan",},
	{"green", "green",},
	{"magenta", "magenta",},
	{"orange", "orange",},
	{"purple", "violet",},
	{"red", "red",},
	{"yellow", "yellow",}, 
	{"frosted", "white",},
}

for i in ipairs(dye_list) do
	local name = dye_list[i][1]
	local dye = dye_list[i][2]

	minetest.register_craft({
		output = 'abriglass:stained_glass_'..name..' 6',
		recipe = {
			{'abriglass:clear_glass', '', 'abriglass:clear_glass' },
			{'abriglass:clear_glass', 'dye:'..dye, 'abriglass:clear_glass' },
			{'abriglass:clear_glass', '', 'abriglass:clear_glass' },
		}
	})

	minetest.register_craft({
		type = "cooking",
		recipe = "abriglass:stained_glass_"..name,
		output = "abriglass:clear_glass",
	})
end


-- patterned glass recipes
minetest.register_craft({
	output = 'abriglass:stainedglass_pattern01 9',
	recipe = {
		{'abriglass:stained_glass_yellow', 'abriglass:stained_glass_yellow', 'abriglass:stained_glass_yellow' },
		{'abriglass:stained_glass_yellow', 'abriglass:stained_glass_blue', 'abriglass:stained_glass_yellow' },
		{'abriglass:stained_glass_yellow', 'abriglass:stained_glass_yellow', 'abriglass:stained_glass_yellow' },
	}
})

minetest.register_craft({
	output = 'abriglass:stainedglass_pattern02 9',
	recipe = {
		{'abriglass:clear_glass', 'abriglass:clear_glass', 'abriglass:clear_glass' },
		{'abriglass:clear_glass', 'abriglass:clear_glass', 'abriglass:clear_glass' },
		{'abriglass:clear_glass', 'abriglass:clear_glass', 'abriglass:clear_glass' },
	}
})

minetest.register_craft({
	output = 'abriglass:stainedglass_pattern03 9',
	recipe = {
		{'abriglass:stained_glass_red', 'abriglass:clear_glass', 'abriglass:stained_glass_red' },
		{'abriglass:clear_glass', 'abriglass:clear_glass', 'abriglass:clear_glass' },
		{'abriglass:stained_glass_red', 'abriglass:clear_glass', 'abriglass:stained_glass_red' },
	}
})

minetest.register_craft({
	output = 'abriglass:stainedglass_pattern04 9',
	recipe = {
		{'abriglass:stained_glass_green', 'abriglass:stained_glass_red', 'abriglass:stained_glass_green' },
		{'abriglass:stained_glass_red', 'abriglass:stained_glass_blue', 'abriglass:stained_glass_red' },
		{'abriglass:stained_glass_green', 'abriglass:stained_glass_red', 'abriglass:stained_glass_green' },
	}
})

minetest.register_craft({
	output = 'abriglass:stainedglass_pattern05 9',
	recipe = {
		{'abriglass:stained_glass_blue', 'abriglass:stained_glass_blue', 'abriglass:stained_glass_blue' },
		{'abriglass:stained_glass_blue', 'abriglass:stained_glass_green', 'abriglass:stained_glass_blue' },
		{'abriglass:stained_glass_blue', 'abriglass:stained_glass_blue', 'abriglass:stained_glass_blue' },
	}
})

minetest.register_craft({
	output = 'abriglass:stainedglass_tiles_dark 7',
	recipe = {
		{'abriglass:stained_glass_red', 'abriglass:stained_glass_green', 'abriglass:stained_glass_blue' },
		{'abriglass:stained_glass_yellow', 'abriglass:stained_glass_magenta', 'abriglass:stained_glass_cyan' },
		{'', 'abriglass:stained_glass_black', '' },
	}
})

minetest.register_craft({
	output = 'abriglass:stainedglass_tiles_pale 7',
	recipe = {
		{'abriglass:stained_glass_red', 'abriglass:stained_glass_green', 'abriglass:stained_glass_blue' },
		{'abriglass:stained_glass_yellow', 'abriglass:stained_glass_magenta', 'abriglass:stained_glass_cyan' },
		{'', 'abriglass:stained_glass_frosted', '' },
	}
})

minetest.register_craft({
	type = "cooking",
	recipe = "abriglass:stainedglass_pattern01",
	output = "abriglass:clear_glass",
})

minetest.register_craft({
	type = "cooking",
	recipe = "abriglass:stainedglass_pattern02",
	output = "abriglass:clear_glass",
})

minetest.register_craft({
	type = "cooking",
	recipe = "abriglass:stainedglass_pattern03",
	output = "abriglass:clear_glass",
})

minetest.register_craft({
	type = "cooking",
	recipe = "abriglass:stainedglass_pattern04",
	output = "abriglass:clear_glass",
})

minetest.register_craft({
	type = "cooking",
	recipe = "abriglass:stainedglass_pattern05",
	output = "abriglass:clear_glass",
})

minetest.register_craft({
	type = "cooking",
	recipe = "abriglass:stainedglass_tiles_dark",
	output = "abriglass:clear_glass",
})

minetest.register_craft({
	type = "cooking",
	recipe = "abriglass:stainedglass_tiles_pale",
	output = "abriglass:clear_glass",
})


-- one-way recipes
local oneway_recipe_list = {
	{"abriglass:oneway_glass_desert_brick", "default:desert_stonebrick",},
	{"abriglass:oneway_glass_stone_brick", "default:stonebrick",},
	{"abriglass:oneway_glass_dark", "abriglass:oneway_wall_dark",},
	{"abriglass:oneway_glass_pale", "abriglass:oneway_wall_pale",},
}

for i in ipairs(oneway_recipe_list) do
	local name = oneway_recipe_list[i][1]
	local ingredient = oneway_recipe_list[i][2]

	minetest.register_craft({
		output = name.." 2",
		recipe = {
			{'abriglass:clear_glass', 'default:mese_crystal_fragment', ingredient },
		}
	})
end

minetest.register_craft({
	output = 'abriglass:oneway_wall_dark 2',
	recipe = {
		{'default:clay_lump', 'default:clay_lump', 'default:clay_lump'},
		{'default:clay_lump', 'dye:black', 'default:clay_lump'},
		{'default:clay_lump', 'default:clay_lump', 'default:clay_lump'},
	}
})

minetest.register_craft({
	output = 'abriglass:oneway_wall_pale 2',
	recipe = {
		{'default:clay_lump', 'default:clay_lump', 'default:clay_lump'},
		{'default:clay_lump', 'dye:white', 'default:clay_lump'},
		{'default:clay_lump', 'default:clay_lump', 'default:clay_lump'},
	}
})



-- missing crafts for:
-- ghost_crystal
