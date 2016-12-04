
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

-- this has to be kept in sync with init.lua one
local glass_list = {
	"black", "blue", "cyan", "green", "magenta",
	"orange", "purple", "red", "yellow", 
}

for i in ipairs(glass_list) do
	local name = glass_list[i]
	minetest.register_craft({
		output = 'abriglass:stained_glass_'..name..' 2',
		recipe = {
			{'abriglass:clear_glass', 'dye:'..name, 'abriglass:clear_glass' },
		}
	})

	minetest.register_craft({
		type = "cooking",
		recipe = "abriglass:stained_glass_"..name,
		output = "abriglass:clear_glass",
	})
end

minetest.register_craft({
	output = 'abriglass:stained_glass_frosted 6',
	recipe = {
		{'abriglass:clear_glass', '', 'abriglass:clear_glass' },
		{'abriglass:clear_glass', 'dye:white', 'abriglass:clear_glass' },
		{'abriglass:clear_glass', '', 'abriglass:clear_glass' },
	}
})

minetest.register_craft({
	output = 'abriglass:stainedglass_pattern01 9',
	recipe = {
		{'abriglass:glass_light_yellow', 'abriglass:glass_light_yellow', 'abriglass:glass_light_yellow' },
		{'abriglass:glass_light_yellow', 'abriglass:glass_light_blue', 'abriglass:glass_light_yellow' },
		{'abriglass:glass_light_yellow', 'abriglass:glass_light_yellow', 'abriglass:glass_light_yellow' },
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
		{'abriglass:glass_light_red', 'abriglass:clear_glass', 'abriglass:glass_light_red' },
		{'abriglass:clear_glass', 'abriglass:clear_glass', 'abriglass:clear_glass' },
		{'abriglass:glass_light_red', 'abriglass:clear_glass', 'abriglass:glass_light_red' },
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
	recipe = "abriglass:stained_glass_frosted",
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

minetest.register_craft({
	output = 'abriglass:oneway_glass_desert_brick 2',
	recipe = {
		{'abriglass:clear_glass', 'default:mese_crystal_fragment', 'default:desert_stonebrick' },
	}
})

minetest.register_craft({
	output = 'abriglass:oneway_glass_stone_brick 2',
	recipe = {
		{'abriglass:clear_glass', 'default:mese_crystal_fragment', 'default:stonebrick' },
	}
})

-- missing crafts for:
-- ghost_crystal
-- oneway_glass_dark
-- oneway_glass_pale
-- oneway_wall_dark
-- oneway_wall_pale
