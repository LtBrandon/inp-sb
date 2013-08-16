----------------------------------------------------------
--				Client Init Lua File					--
----------------------------------------------------------
local include = include
local file = file

include("shared.lua")
include("diaspora.lua")

include("vgui/cl_init.lua")
include("sb/cl_init.lua")


function GM:ForceDermaSkin()

	return "Diaspora"
	
end

--[[
local gamemodeDir = string.Explode("/",debug.getinfo(1).source, false)[2]

local _, dirs = file.Find("gamemodes/"..gamemodeDir.."/gamemode/*","GAME")

for _,v in pairs(dirs) do

	local files = file.Find("gamemodes/"..gamemodeDir.."/gamemode/"..v.."/*","GAME")

	for _,j in pairs(files) do

		-- Shared file check
		MsgN("J", j)
		if j:sub(0,3) == "sh_" then
			include(gamemodeDir.."/gamemode/"..v.."/"..j)
			MsgN("[INCLUDED]",gamemodeDir.."/gamemode/"..v.."/"..j)

		-- Client file check
		elseif j:sub(0,3) == "cl_" then 
			include(gamemodeDir.."/gamemode/"..v.."/"..j)
			MsgN("[INCLUDED]",gamemodeDir.."/gamemode/"..v.."/"..j)

		-- Server file check
		elseif j:sub(0,3) == "sv_" then
			--ServerSide file; Client shouldn't really have this. 
		else
			print("File: "..v.."/"..j.." is unrecognized")
		end			
	end	
end
]]