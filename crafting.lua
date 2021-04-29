
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


-- cooking recipes
local cook_list = { "stainedglass_pattern01", "stainedglass_pattern02", "stainedglass_pattern03", "stainedglass_pattern04", "stainedglass_pattern05", "stainedglass_tiles_dark", "stainedglass_tiles_pale"}

for i = 1, #cook_list do
	local name = cook_list[i]

	minetest.register_craft({
		type = "cooking",
		recipe = "abriglass:"..name,
		output = "abriglass:clear_glass",
	})
end


-- porthole recipes
local port_recipes = {
	{"wood",}, {"junglewood",},
}

for i in ipairs(port_recipes) do
	local name = port_recipes[i][1]

	minetest.register_craft({
		output = "abriglass:porthole_"..name.." 4",
		recipe = {
			{"default:glass", "", "default:glass",},
			{"default:"..name, "", "default:steel_ingot",},
			{"default:glass", "", "default:glass",},
		}
	})
end


-- one-way one side recipes
local oneway_recipe_list = {
	{"desert_brick", "default:desert_stonebrick", "default:desert_stonebrick",},
	{"stone_brick", "default:stonebrick", "default:stonebrick",},
	{"sandstone_brick", "default:sandstonebrick", "default:sandstonebrick",},
    	{"desertstone", "default:desert_stone", "default:desert_stone",},
	{"stone", "default:stone", "default:stone",},
	{"sandstone", "default:sandstone", "default:sandstone",},
    	{"dirt", "default:dirt", "default:dirt",},
	{"snow", "default:snowblock", "default:snowblock",},
	{"dirt_grass", "default:grass", "default:dirt",},
	{"dirt_snow", "default:snow", "default:dirt",},
	{"desert_sandstone_brick", "default:desert_sandstone_brick", "default:desert_sandstone_brick",},
	{"silver_sandstone_brick", "default:silver_sandstone_brick", "default:silver_sandstone_brick",},
	{"obsidian_brick", "default:obsidian", "default:obsidian",},
        {"dark", "abriglass:oneway_wall_dark", "abriglass:oneway_wall_dark",},
	{"pale", "abriglass:oneway_wall_pale", "abriglass:oneway_wall_pale",},
}

if minetest.get_modpath("ethereal") then
	table.insert(oneway_recipe_list, {"snowbrick", "ethereal:snowbrick", "ethereal:snowbrick", })
	table.insert(oneway_recipe_list, {"icebrick", "ethereal:icebrick", "ethereal:icebrick", })
end

for i in ipairs(oneway_recipe_list) do
	local name = oneway_recipe_list[i][1]
	local ingredient = oneway_recipe_list[i][2]
        local ingredient2 = oneway_recipe_list[i][3]
        
	minetest.register_craft({
		output = "abriglass:oneway_glass_one_"..name.." 2",
		recipe = {
			{'abriglass:clear_glass', 'default:mese_crystal_fragment', ingredient },
		}
	})
end

-- one-way two sides recipes

for i in ipairs(oneway_recipe_list) do
	local name = oneway_recipe_list[i][1]
	local ingredient = oneway_recipe_list[i][2]
        local ingredient2 = oneway_recipe_list[i][3]

	minetest.register_craft({
		output = "abriglass:oneway_glass_two_"..name.." 2",
		recipe = {
			{'abriglass:clear_glass', 'default:mese_crystal_fragment', ingredient },
			{'', '', ingredient2 },
                }
	})
end

-- one-way three sides recipes

for i in ipairs(oneway_recipe_list) do
	local name = oneway_recipe_list[i][1]
	local ingredient = oneway_recipe_list[i][2]
        local ingredient2 = oneway_recipe_list[i][3]

	minetest.register_craft({
		output = "abriglass:oneway_glass_three_"..name.." 2",
		recipe = {
			{'abriglass:clear_glass', 'default:mese_crystal_fragment', ingredient },
			{'', '', ingredient2 },
			{'', '', ingredient2 },
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

