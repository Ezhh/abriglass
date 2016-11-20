

--[[
What it is: Simple mod for extra glass, including plain and patterned stained glass, and one way glass.
Who did it: Shara RedCat.
]]


local is_darklands = true


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

minetest.register_craft({
	output = 'abriglass:clear_glass 4', -- intentional lower yield
	recipe = {
		{'default:glass', '', 'default:glass' },
		{'', 'default:glass', '' },
		{'default:glass', '', 'default:glass' },
	}
})


local plain_colors = {
	"green", "blue", "red", "yellow",
}
--glass lights

local i
for i in ipairs(plain_colors) do
	local name = plain_colors[i]
	local description = name:sub(1,1):upper()..name:sub(2).." Glass Light"

	local nodesuffix = 'glass_light_'..name

	minetest.debug("i="..i..", name="..name..", desc="..description);

	minetest.register_node("abriglass:"..nodesuffix, {
		description = "Green Glass Light",
		tiles = { "abriglass_light"..name..".png"},
		groups = {cracky = 3},
		use_texture_alpha = true,
		sunlight_propagates = true,
		light_source = (is_darklands and 14 or 4),
		drawtype = "glasslike",
		sounds = default.node_sound_glass_defaults(),
	})

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

--crystal, for later use in crafting recipes

minetest.register_node("abriglass:ghost_crystal", {
	description = "Ghost Crystal",
	tiles = {"abriglass_ghost_crystal.png"},
	wield_image = "abriglass_ghost_crystal_wield.png",
	groups = {cracky = 3},
	use_texture_alpha = true,
	sunlight_propagates = true,
	light_source = (is_darklands and 14 or 4),
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
		light_source = (is_darklands and 5 or 4),
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
	light_source = (is_darklands and 7 or 4), -- not sure about this one
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


