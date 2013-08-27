local GM = GM
local chat = chat
local hook = hook

local function InitGame()
	chat.AddText(Color(255, 255, 255), "Welcome to ", Color(100, 255, 100), "Spacebuild Infinity")
	chat.AddText(Color(255, 255, 255), "Visit ", Color(100, 255, 100), "http://inp.io", Color(255, 255, 255), " for more information on Spacebuild Infinity")
	chat.AddText(Color(255, 255, 255), "Visit ", Color(100, 255, 100), "https://github.com/awilliamson/inp-sb", Color(255, 255, 255), " for the latest version or to report bugs.")
end

function GM:OnEnterEnvironment(env, ent)
	print("OnEnter")
	if env:getName() ~= "" then
		chat.AddText(Color(255,255,255), "Entering ", Color(100,255,100), env:getName())
	end
end

function GM:OnLeaveEnvironment(env, ent)
	print("OnLeave")
	if env:getName() ~= "" then
		chat.AddText(Color(255,255,255), "Entering ", Color(100,255,100), env:getName())
	end
end

hook.Add("Initialize", "SBClientInit", InitGame)