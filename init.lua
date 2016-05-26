

--[[
What it is: Simple mod for extra glass, including plain and patterned stained glass, and one way glass.
Who did it: Shara RedCat.
]]


--boring glass because why not?

minetest.register_node("abriglass:clear_glass", {
	description = "Clear Glass",
	tiles = {"abriglass_clearglass.png"},
	groups = {cracky = 3},
	use_texture_alpha = true,
	sunlight_propagates = true,
	paramtype = "light",
	drawtype = "glasslike",
	sounds = default.node_sound_glass_defaults(),
})


--glass lights

minetest.register_node("abriglass:glass_light_green", {
	description = "Green Glass Light",
	tiles = {"abriglass_lightgreen.png"},
	groups = {cracky = 3},
	use_texture_alpha = true,
	sunlight_propagates = true,
	light_source = 14,
	drawtype = "glasslike",
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_node("abriglass:glass_light_blue", {
	description = "Blue Glass Light",
	tiles = {"abriglass_lightblue.png"},
	groups = {cracky = 3},
	use_texture_alpha = true,
	sunlight_propagates = true,
	light_source = 14,
	drawtype = "glasslike",
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_node("abriglass:glass_light_red", {
	description = "Red Glass Light",
	tiles = {"abriglass_lightred.png"},
	groups = {cracky = 3},
	use_texture_alpha = true,
	sunlight_propagates = true,
	light_source = 14,
	drawtype = "glasslike",
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_node("abriglass:glass_light_yellow", {
	description = "Yellow Glass Light",
	tiles = {"abriglass_lightyellow.png"},
	groups = {cracky = 3},
	use_texture_alpha = true,
	sunlight_propagates = true,
	light_source = 14,
	drawtype = "glasslike",
	sounds = default.node_sound_glass_defaults(),
})

--crystal, for later use in crafting recipes

minetest.register_node("abriglass:ghost_crystal", {
	description = "Ghost Crystal",
	tiles = {"abriglass_ghost_crystal.png"},
	groups = {cracky = 3},
	use_texture_alpha = true,
	sunlight_propagates = true,
	light_source = 14,
	drawtype = "glasslike",
	sounds = default.node_sound_glass_defaults(),
})

--patterned glass

local pattern_list = {   --{name, description, image}
	{"stainedglass_tiles_dark", "Stained Glass", "stainedglass_tiles1",},
	{"stainedglass_tiles_pale", "Stained Glass", "stainedglass_tiles2",},
	{"stainedglass_pattern01", "Stained Glass", "stainedglass_pattern01",},
	{"stainedglass_pattern02", "Cage Glass", "stainedglass_pattern02",},
	{"stainedglass_pattern03", "Stained Glass", "stainedglass_pattern03",},
	{"stainedglass_pattern04", "Stained Glass Cross", "stainedglass_pattern04",},
	{"stainedglass_pattern05", "Stained Glass", "stainedglass_pattern05",},
}

for i in ipairs(pattern_list) do
	local name = pattern_list[i][1]
	local description = pattern_list[i][2]
	local image = pattern_list[i][3]

	minetest.register_node("abriglass:"..name, {
		description = description,
		tiles = {"abriglass_"..image..".png"},
		groups = {cracky = 3},
		use_texture_alpha = true,
		sunlight_propagates = true,
		light_source = 5,
		drawtype = "glasslike",
		paramtype2 = "facedir",
		sounds = default.node_sound_glass_defaults(),
	})
end

--one-way glass

minetest.register_node("abriglass:oneway_glass_dark", {
	description = "Dark One-Way Glass",
	drawtype = "nodebox",
	paramtype = "light",
    paramtype2 = "facedir",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
		},
	},
    groups = {cracky = 3},
	tiles = {"abriglass_oneway_plain_glass.png", -- up
			 "abriglass_oneway_plain_glass.png", -- down
			 "abriglass_oneway_plain_glass.png", -- right
			 "abriglass_oneway_plain_glass.png", -- left
			 "abriglass_oneway_face.png", -- back
			 "abriglass_oneway_wall.png"}, -- front
	is_ground_content = false,
	sunlight_propagates = true,
	inventory_image = minetest.inventorycube("abriglass_oneway_face.png")
})

minetest.register_node("abriglass:oneway_glass_pale", {
	description = "White One-Way Glass",
	drawtype = "nodebox",
	paramtype = "light",
    paramtype2 = "facedir",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
		},
	},
    groups = {cracky = 3},
	tiles = {"abriglass_oneway_plain_glass.png", -- up
			 "abriglass_oneway_plain_glass.png", -- down
			 "abriglass_oneway_plain_glass.png", -- right
			 "abriglass_oneway_plain_glass.png", -- left
			 "abriglass_oneway_face.png^[colorize:#F8F8FF:200", -- back
			 "abriglass_oneway_wall.png^[colorize:#E6E6FA:200"}, -- front
	is_ground_content = false,
	sunlight_propagates = true,
	inventory_image = minetest.inventorycube("abriglass_oneway_face.png^[colorize:#F8F8FF:200")
})


--normal blocks to match one-way glass

minetest.register_node("abriglass:oneway_wall_dark", {
	description = "Dark Block",
	tiles = {"abriglass_oneway_wall.png"},
	groups = {cracky = 3},
    paramtype2 = "facedir",
})

minetest.register_node("abriglass:oneway_wall_pale", {
	description = "Pale Block",
	tiles = {"abriglass_oneway_wall.png^[colorize:#E6E6FA:200"},
	groups = {cracky = 3},
    paramtype2 = "facedir",
})


--light node

minetest.register_node("abriglass:hidden_light", {
	description = "Hidden Light",
	tiles = {"abriglass_oneway_plain_glass.png"}, 
	groups = {cracky = 3, not_in_creative_inventory=1},
	use_texture_alpha = true,
	sunlight_propagates = true,
	walkable = false,
	light_source = 7,
	drawtype = "glasslike",
})


--undecorated coloured glass, all using plain glass texture

local glass_list = {   --{name, description, colour}
	{"black", "Darkened", "292421", }, {"blue", "Blue", "0000FF", },
	{"cyan", "Cyan", "00FFFF", }, {"green", "Green", "00FF00", }, 
	{"magenta", "Magenta", "FF00FF", }, {"orange", "Orange", "FF6103", }, 
	{"purple", "Purple", "800080", }, {"red", "Red", "FF0000", }, 
	{"yellow", "Yellow", "FFFF00", },
}

for i in ipairs(glass_list) do
	local name = glass_list[i][1]
	local description = glass_list[i][2]
	local colour = glass_list[i][3]

	minetest.register_node("abriglass:stained_glass_"..name, {
		description = description.." Glass",
		tiles = {"abriglass_plainglass.png^[colorize:#"..colour..":122"},
		groups = {cracky = 3},
		use_texture_alpha = true,
		sunlight_propagates = true,
		light_source = 4,
		drawtype = "glasslike",
		sounds = default.node_sound_glass_defaults(),
	})
end

minetest.register_node("abriglass:stained_glass_frosted", {
	description = "Frosted Glass",
	tiles = {"abriglass_plainglass.png"}, --base texture
	groups = {cracky = 3},
	use_texture_alpha = true,
	sunlight_propagates = true,
	light_source = 4,
	drawtype = "glasslike",
	sounds = default.node_sound_glass_defaults(),
})


