CASTLE24H = {
	castleNome = "[Castle 24H] - ", -- Prefixo que ir· aparecer nas mensagens
	mensagemPrecisaGuild = "You are not in a guild.", -- Mensagem que ir· aparecer caso o player n„o tenha guild
	mensagemGuildDominante = "Your guild already own The Castle.", -- Mensagem caso o player tente dominar o castelo mesmo sendo da sua guild
	mensagemGuildNaoDominante = "Your guild dont own The Castle.", -- Caso o castelo n„o seja da guild do player
	mensagemLevelMinimo = "You don't have enough level to invade.", -- Caso o player n„o tenha n√≠vel para entrar
	mensagemBemvindo = "Welcome to your castle.", -- Mensagem de bem-vindo √† guild dominante
	levelParaDominar = true, -- true para precisar de nivel para dominar e false para n„o precisar
	level = 100, -- caso o levelParaDominar seja true, qual o nivel?
	tempoAvisar = 10, -- Tempo em SEGUNDOS para n„o ficar spammando que o player est· invadindo
}

function CASTLE24H:getGuildIdFromCastle()
  local guildId  = -1
  local resultId = db.storeQuery("SELECT `guild_id` FROM `castle`;")
  if (resultId ~= false) then
    guildId = result.getDataInt(resultId, "guild_id")
    result.free(resultId)
  end
  return guildId
end

function CASTLE24H:setGuildOwnerCastle(guild_id)

local guild = Guild(guild_id)

 db.query("UPDATE `castle` SET guild_id = "..guild_id.." WHERE id = 1;")
 db.query("UPDATE `castle` SET name = '"..guild:getName().."' WHERE id = 1;")

end