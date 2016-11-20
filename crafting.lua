
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

minetest.register_craft({
	output = 'abriglass:stainedglass_pattern01 9',
	recipe = {
		{'abriglass:glass_light_yellow', 'abriglass:glass_light_yellow', 'abriglass:glass_light_yellow' },
		{'abriglass:glass_light_yellow', 'abriglass:glass_light_blue', 'abriglass:glass_light_yellow' },
		{'abriglass:glass_light_yellow', 'abriglass:glass_light_yellow', 'abriglass:glass_light_yellow' },
	}
})


minetest.register_craft({
	output = 'abriglass:stainedglass_pattern04 9',
	recipe = {
		{'abriglass:glass_light_green', 'abriglass:glass_light_red', 'abriglass:glass_light_green' },
		{'abriglass:glass_light_red', 'abriglass:glass_light_blue', 'abriglass:glass_light_red' },
		{'abriglass:glass_light_green', 'abriglass:glass_light_red', 'abriglass:glass_light_green' },
	}
})

minetest.register_craft({
	output = 'abriglass:stainedglass_pattern05 9',
	recipe = {
		{'abriglass:glass_light_blue', 'abriglass:glass_light_blue', 'abriglass:glass_light_blue' },
		{'abriglass:glass_light_blue', 'abriglass:glass_light_green', 'abriglass:glass_light_blue' },
		{'abriglass:glass_light_blue', 'abriglass:glass_light_blue', 'abriglass:glass_light_blue' },
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

-- missing crafts for:
-- ghost_crystal
-- stainedglass_tiles_dark, stainedglass_tiles_pale,
-- stainedglass_pattern02,
-- stainedglass_pattern03, 
-- oneway_glass_dark
-- oneway_glass_pale
-- oneway_wall_dark
-- oneway_wall_pale
-- hidden_light

-- and missing also recipes for undecorated glass..
-- likelly ones without torches in recipe, just glass and dye
