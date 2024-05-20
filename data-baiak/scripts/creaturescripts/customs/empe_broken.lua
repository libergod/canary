dofile("./_woe.lua")

local config = woe_config


local empe_broken = CreatureEvent("Emp_Broken")

function empe_broken.onDeath(creature, corpse, killer, mostDamageKiller, unjustified, mostDamageUnjustified)
	
	local play = Player(killer)
	Woe.getInfo()
	local guild = killer:getGuild()
	local Guild_ID = guild:getId()
	
	if Woe.isTime() then
		if killer:isPlayer() then
			if Woe.isRegistered(killer) then
				Woe.updateInfo({infoLua[1], Guild_ID, killer:getId(), os.time()})
				broadcastMessage("The Castle " .. Castle.name .. " has been conquest by " .. play:getName() .. " for " .. guild:getName() .. ".", MESSAGE_ADMINISTRADOR)
				--Woe.deco("Actually the castle " .. Castle.name .. " is owned by " .. guild:getName() .. ".")
				Woe.expulsar(Guild_ID, Castle.salas.a.fromx, Castle.salas.a.tox, Castle.salas.a.fromy, Castle.salas.a.toy, Castle.salas.a.z, Castle._exit)
				Woe.expulsar(Guild_ID, Castle.salas.b.fromx, Castle.salas.b.tox, Castle.salas.b.fromy, Castle.salas.b.toy, Castle.salas.b.z, Castle._exit)
				Woe.expulsar(Guild_ID, Castle.salas.c.fromx, Castle.salas.c.tox, Castle.salas.c.fromy, Castle.salas.c.toy, Castle.salas.c.z, Castle._exit)
				
				Woe.removePre()
				Woe.removePortals()
				Woe.removeEntry()
				--Woe.remove()
				Woe.save()
				Game.setStorageValue(stor.WoeTime, 0)
				Game.setStorageValue(stor.Started, 0)
			end
		end
		if creature:isMonster() then
			creature:remove()
		end

		Game.setStorageValue(24503, -1)
		Game.createMonster("Emperium", Castle.empePos, false, true)
		Game.createMonster("PreEmpes", Castle.PreEmpes[1], false, true)
		Game.createMonster("PreEmpes2", Castle.PreEmpes[2], false, true)
	end
	
	return true
end

empe_broken:register()


