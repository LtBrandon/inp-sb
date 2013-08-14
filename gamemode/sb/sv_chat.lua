local meta = FindMetaTable("Player")
local FuncPrintMessage = meta.PrintMessage;

function meta:ChatPrint(msg,tab)
	self:PrintMessage(3,msg,tab)
end

function meta:PrintMessage( typ, msg, tab )
	if( typ ~= 3 ) then
		FuncPrintMessage( self, typ, msg );
		return;
	end
	
	if not tab then tab = "ALL" end
	if not (string.lower(type(msg)) == "table") then msg = {msg} end

	net.Start( "AddToChatBox" )
		net.WriteString( tab )
		net.WriteTable( msg )
	net.Send(self)
end

function DoSay( ply, text, isTeam )
	if IsValid(ply) then
		local col = team.GetColor(ply:Team())
		
		if isTeam then
			for i,k in pairs(team.GetPlayers(ply:Team())) do k:ChatPrint({ply, " ["..team.GetName(ply:Team()).."]: "..text}, "TEAM") end
		else
			http.Post("http://diaspora-chat.eu01.aws.af.cm/server", {
				message = text,
				username = ply:Nick(),
				appkey = "testlol",
				server = "#1",
				rankcolor = 'rgba(' .. col.r .. ', ' .. col.g .. ', ' .. col.b .. ', ' .. col.a .. ')'
			}, function() end, function()  end);
			
			for i,k in pairs(player.GetAll()) do k:ChatPrint({ply, ": "..text}, "ALL") end
		end
	end
end

net.Receive("PlayerSay", function(len, ply)
	local str = net.ReadString()
	local isTeam = net.ReadBit()
	local say = hook.Run("PlayerSay", ply, str, isTeam)
	
	if string.len(say) > 0 then
		DoSay(ply, say, isTeam)
	end
end)