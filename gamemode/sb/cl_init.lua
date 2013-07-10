
--local dir = debug.getinfo(1).source:sub(2)
local tbl = string.Explode("/", debug.getinfo(1).source:sub(2) )
local currfile = table.remove(tbl)
tbl = table.concat(tbl,"/")

local f,_ = file.Find(tbl.."/*","GAME")

for k,v in pairs(f) do
		if v:sub(0,3) == "cl_" then
			if v ~= currfile then
				MsgN(v)
				include(v)
			end
		elseif v:sub(0,3) == "sh_" then
			if v ~= currfile then
				MsgN(v)
				include(v)
			end
		end
end