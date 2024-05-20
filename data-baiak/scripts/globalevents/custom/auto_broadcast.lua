local AutoBroadCast = GlobalEvent("text")
function AutoBroadCast.onThink(interval, lastExecution)
    local messages = {

    "[Daily Reward]: Using the !reward command you receive your daily reward.",
    "[Task System]: Type !task, choose missions or check the status of the current one",
	"[Shop List]: Using !shop list, you will get a fast refill option but with 10% more cost.",
	"[Tools]: Need a hand? Type !tools, and receive couple of usefull tools.",
	"[BackPack]: No more space? Use !bp, to buy a backpack.",
	"[Food]: You can buy food from our services using !food",

}
    Game.broadcastMessage(messages[math.random(#messages)], MESSAGE_GAME_HIGHLIGHT) 
    return true
end
AutoBroadCast:interval(900000)
AutoBroadCast:register()