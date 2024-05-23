local mounts = {
    [1] = {name = 'Widow Queen', id = 1, item = 12320, count = 1}, -- Seet Smelling Bait
    [2] = {name = 'War Bear', id = 3, item = 5907, count = 1}, -- Slingshot
	[3] = {name = 'Undead Cavebear', id = 12, item = 12304, count = 1}, -- Maxilla Maximus
	[4] = {name = 'Titanica', id = 7, item = 12318, count = 1},-- Giant Shrimp
	[5] = {name = 'Tin Lizzard', id = 8, item = 5907, count = 1},
	[6] = {name = 'Stampor', id = 11, item = 5907, count = 1},
	[7] = {name = 'Rapid Boar', id = 10, item = 5907, count = 1},
	[8] = {name = 'Racing Bird', id = 2, item = 5907, count = 1},
	[9] = {name = 'Midnight Panther', id = 5, item = 5907, count = 1},
	[10] = {name = 'Draptor', id = 6, item = 5907, count = 1},
	[11] = {name = 'Blazebringer', id = 9, item = 5907, count = 1},
	[12] = {name = 'Black Sheep', id = 4, item = 5907, count = 1},
	[13] = {name = 'War Horse', id = 17, item = 5907, count = 1},
	[14] = {name = 'Uniwheel', id = 15, item = 5907, count = 1},
	[15] = {name = 'Tiger Slug', id = 14, item = 5907, count = 1},
	[16] = {name = 'Tamed Panda', id = 19, item = 5907, count = 1},
	[17] = {name = 'Shadow Draptor', id = 24, item = 5907, count = 1},
	[18] = {name = 'Rented Horse (Marrom)', id = 22, item = 5907, count = 1},
	[19] = {name = 'Kingly Deer', id = 18, item = 5907, count = 1},
	[20] = {name = 'Dromedary', id = 20, item = 5907, count = 1},
	[21] = {name = 'Donkey', id = 13, item = 5907, count = 1},
	[22] = {name = 'Crystal Wolf', id = 16, item = 5907, count = 1},
	[23] = {name = 'Armoured War Horse', id = 23, item = 5907, count = 1},
	[24] = {name = 'Manta Ray', id = 28, item = 5907, count = 1},
	[25] = {name = 'Ladybug', id = 27, item = 5907, count = 1},
	[26] = {name = 'Magma Crawler', id = 30, item = 5907, count = 1},
	[27] = {name = 'Ironblight', id = 29, item = 5907, count = 1},
	[28] = {name = 'Gnarlhound', id = 32, item = 5907, count = 1},
	[29] = {name = 'Dragonling', id = 31, item = 5907, count = 1},
	[30] = {name = 'Steelbeak', id = 34, item = 5907, count = 1},
	[31] = {name = 'Crimson Ray', id = 33, item = 5907, count = 1},
	[32] = {name = 'Water Buffalo', id = 35, item = 5907, count = 1},
	[33] = {name = 'The Hellgrip', id = 39, item = 5907, count = 1},
	[34] = {name = 'Shock Head', id = 42, item = 5907, count = 1},
	[35] = {name = 'Ursagrodon', id = 38, item = 5907, count = 1},
	[36] = {name = 'Walker', id = 43, item = 5907, count = 1},
	[37] = {name = 'Winter King', id = 52, item = 5907, count = 1},
	[38] = {name = 'Tombstinger', id = 36, item = 5907, count = 1},
	[39] = {name = 'Tempest', id = 51, item = 5907, count = 1},
	[40] = {name = 'Platesaurian', id = 37, item = 5907, count = 1},
	[41] = {name = 'Nethersteed', id = 50, item = 5907, count = 1},
	[42] = {name = 'Jade Pincer', id = 49, item = 5907, count = 1},
	[43] = {name = 'Jade Lion', id = 48, item = 5907, count = 1},
	[44] = {name = 'Flamesteed', id = 47, item = 5907, count = 1},
	[45] = {name = 'Desert King', id = 41, item = 5907, count = 1},
	[46] = {name = 'Death Crawler', id = 46, item = 5907, count = 1},
	[47] = {name = 'Carpacosaurus', id = 45, item = 5907, count = 1},
	[48] = {name = 'Azudocus', id = 44, item = 5907, count = 1},
	[49] = {name = 'Woodland Prince', id = 54, item = 5907, count = 1},
	[50] = {name = 'Siegebreaker', id = 56, item = 5907, count = 1},
	[51] = {name = 'Poisonbane', id = 57, item = 5907, count = 1},
	[52] = {name = 'Hailstorm Fury', id = 55, item = 5907, count = 1},
	[53] = {name = 'Doombringer', id = 53, item = 5907, count = 1},
	[54] = {name = 'Blackpelt', id = 58, item = 5907, count = 1},
	[55] = {name = 'Tundra Rambler', id = 62, item = 5907, count = 1},
	[56] = {name = 'Steel Bee', id = 60, item = 5907, count = 1},
	[57] = {name = 'Highland Yak', id = 63, item = 5907, count = 1},
	[58] = {name = 'Golden Dragonfly', id = 59, item = 5907, count = 1},
	[59] = {name = 'Glacier Vagabond', id = 64, item = 5907, count = 1},
	[60] = {name = 'Copper Fly', id = 61, item = 5907, count = 1},
	[61] = {name = 'Noble Lion', id = 40, item = 5907, count = 1},
	[62] = {name = 'Glooth Glider', id = 71, item = 5907, count = 1},
	[63] = {name = 'Shadow Hart', id = 72, item = 5907, count = 1},
	[64] = {name = 'Magic Carpet', id = 66, item = 5907, count = 1},
	[65] = {name = 'Flying Divan', id = 65, item = 5907, count = 1},
	[66] = {name = 'Floating Kashmir', id = 67, item = 5907, count = 1},
	[67] = {name = 'Emperor Deer', id = 74, item = 5907, count = 1},
	[68] = {name = 'Black Stag', id = 73, item = 5907, count = 1},
	[69] = {name = 'Ringtail Waccoon', id = 68, item = 5907, count = 1},
	[70] = {name = 'Night Waccoon', id = 69, item = 5907, count = 1},
	[71] = {name = 'Emerald Waccoon', id = 70, item = 5907, count = 1},
	[72] = {name = 'Venompaw', id = 76, item = 5907, count = 1},
	[73] = {name = 'Flitterkatzen', id = 75, item = 5907, count = 1},
	[74] = {name = 'Batcat', id = 77, item = 5907, count = 1},
	[75] = {name = 'Sea Devil', id = 78, item = 5907, count = 1},
	[76] = {name = 'Plumfish', id = 80, item = 5907, count = 1},
	[77] = {name = 'Coralripper', id = 79, item = 5907, count = 1},
	[78] = {name = 'Silverneck', id = 83, item = 5907, count = 1},
	[79] = {name = 'Noctungra', id = 82, item = 5907, count = 1},
	[80] = {name = 'Gorongra', id = 81, item = 5907, count = 1},
	[81] = {name = 'Slagsnare', id = 84, item = 5907, count = 1},
	[82] = {name = 'Razorcreep', id = 86, item = 5907, count = 1},
	[83] = {name = 'Nightstinger', id = 85, item = 5907, count = 1},
	[84] = {name = 'Rift Runner', id = 87, item = 5907, count = 1},
	[85] = {name = 'Nightdweller', id = 88, item = 5907, count = 1},
	[86] = {name = 'Frostflare', id = 89, item = 5907, count = 1},
	[87] = {name = 'Cinderhoof', id = 90, item = 5907, count = 1},
	[88] = {name = 'Mouldpincer', id = 91, item = 5907, count = 1},
	[89] = {name = 'Leafscuttler', id = 93, item = 5907, count = 1},
	[90] = {name = 'Bloodcurl', id = 92, item = 5907, count = 1},
	[91] = {name = 'Vortexion', id = 99, item = 5907, count = 1},
	[92] = {name = 'Swamp Snapper', id = 95, item = 5907, count = 1},
	[93] = {name = 'Sparkion', id = 94, item = 5907, count = 1},
	[94] = {name = 'Reed Lurker', id = 97, item = 5907, count = 1},
	[95] = {name = 'Neon Sparkid', id = 98, item = 5907, count = 1},
	[96] = {name = 'Mould Shell', id = 96, item = 5907, count = 1},
	[97] = {name = 'Snow Pelt', id = 102, item = 5907, count = 1},
	[98] = {name = 'Shadow Claw', id = 101, item = 5907, count = 1},
	[99] = {name = 'Ivory Fang', id = 100, item = 5907, count = 1},
	[100] = {name = 'Wolpertinger', id = 105, item = 5907, count = 1},
	[101] = {name = 'Jackalope', id = 103, item = 5907, count = 1},
	[102] = {name = 'Dreadhare', id = 104, item = 5907, count = 1},
	[103] = {name = 'Stone Rhino', id = 106, item = 5907, count = 1},
	[104] = {name = 'Shadow Sphinx', id = 109, item = 5907, count = 1},
	[105] = {name = 'Gold Sphinx', id = 107, item = 5907, count = 1},
	[106] = {name = 'Emerald Sphinx', id = 108, item = 5907, count = 1},
	[107] = {name = 'Lagoon Saurian', id = 112, item = 5907, count = 1},
	[108] = {name = 'Jungle Saurian', id = 110, item = 5907, count = 1},
	[109] = {name = 'Ember Saurian', id = 111, item = 5907, count = 1},
	[110] = {name = 'Prismatic Unicorn', id = 115, item = 5907, count = 1},
	[111] = {name = 'Blazing Unicorn', id = 113, item = 5907, count = 1},
	[112] = {name = 'Arctic Unicorn', id = 114, item = 5907, count = 1},
	[113] = {name = 'Gloom Widow', id = 118, item = 5907, count = 1},
	[114] = {name = 'Cranium Spider', id = 116, item = 5907, count = 1},
	[115] = {name = 'Cave Tarantula', id = 117, item = 5907, count = 1},
	[116] = {name = 'Toxic Toad', id = 122, item = 5907, count = 1},
	[117] = {name = 'Sanguine Frog', id = 121, item = 5907, count = 1},
	[118] = {name = 'Marsh Toad', id = 120, item = 5907, count = 1},
	[119] = {name = 'Mole', id = 119, item = 5907, count = 1},
	[120] = {name = 'Jungle Tiger', id = 125, item = 5907, count = 1},
	[121] = {name = 'Feral Tiger', id = 124, item = 5907, count = 1},
	[122] = {name = 'Ebony Tiger', id = 123, item = 5907, count = 1},
	[123] = {name = 'Fleeting Knowledge', id = 126, item = 5907, count = 1},
	[124] = {name = 'Tawny Owl', id = 127, item = 5907, count = 1},
	[125] = {name = 'Snowy Owl', id = 128, item = 5907, count = 1},
	[126] = {name = 'Boreal Owl', id = 129, item = 5907, count = 1},
	[127] = {name = 'Lacewing Moth', id = 130, item = 5907, count = 1},
	[128] = {name = 'Hibernal Moth', id = 131, item = 5907, count = 1},
	[129] = {name = 'Muffled Snowman', id = 136, item = 5907, count = 1},
	[130] = {name = 'Festive Snowman', id = 135, item = 5907, count = 1},
	[131] = {name = 'Dark Percht Sleigh', id = 134, item = 5907, count = 1},
	[132] = {name = 'Cold Percht Sleigh', id = 132, item = 5907, count = 1},
	[133] = {name = 'Caped Snowman', id = 137, item = 5907, count = 1},
	[134] = {name = 'Bright Percht Sleigh', id = 133, item = 5907, count = 1},
	[135] = {name = 'Rabbit Rickshaw', id = 138, item = 5907, count = 1},
	[136] = {name = 'Cony Cart', id = 140, item = 5907, count = 1},
	[137] = {name = 'Bunny Dray', id = 139, item = 5907, count = 1},
	[138] = {name = 'Swamp Crocovile', id = 142, item = 5907, count = 1},
	[139] = {name = 'River Crocovile', id = 141, item = 5907, count = 1},
	[140] = {name = 'Nightmarish Crocovile', id = 143, item = 5907, count = 1},
	[141] = {name = 'Jousting Eagle', id = 145, item = 5907, count = 1},
	[142] = {name = 'Cerberus Champion', id = 146, item = 5907, count = 1},
	[143] = {name = 'Zaoan Badger', id = 155, item = 5907, count = 1},
	[144] = {name = 'Red Rolling Barrel', id = 257, item = 5907, count = 1},
	[145] = {name = 'Gryphon', id = 144, item = 5907, count = 1},
	[146] = {name = 'Green Rolling Barrel', id = 158, item = 5907, count = 1},
	[147] = {name = 'Floating Scholar', id = 160, item = 5907, count = 1},
	[148] = {name = 'Floating Sage', id = 159, item = 5907, count = 1},
	[149] = {name = 'Floating Augur', id = 161, item = 5907, count = 1},
	[150] = {name = 'Ether Badger', id = 154, item = 5907, count = 1},
	[151] = {name = 'Dark Percht Sleigh Variant', id = 149, item = 5907, count = 1},
	[152] = {name = 'Cold Percht Sleigh Variant', id = 150, item = 5907, count = 1},
	[153] = {name = 'Bright Percht Sleigh Variant', id = 148, item = 5907, count = 1},
	[154] = {name = 'Blue Rolling Barrel', id = 156, item = 5907, count = 1},
	[155] = {name = 'Battle Badger', id = 153, item = 5907, count = 1},
	[156] = {name = 'Snow Strider', id = 164, item = 5907, count = 1},
	[157] = {name = 'Haze', id = 162, item = 5907, count = 1},
	[158] = {name = 'Dusk Pryer', id = 165, item = 5907, count = 1},
	[159] = {name = 'Dawn Strayer', id = 166, item = 5907, count = 1},
	[160] = {name = 'Antelope', id = 163, item = 5907, count = 1},
	[161] = {name = 'Voracious Hyaena', id = 171, item = 5907, count = 1},
	[162] = {name = 'Scruffy Hyaena', id = 173, item = 5907, count = 1},
	[163] = {name = 'Savanna Ostrich', id = 168, item = 5907, count = 1},
	[164] = {name = 'Eventide Nandu', id = 170, item = 5907, count = 1},
	[165] = {name = 'Cunning Hyaena', id = 172, item = 5907, count = 1},
	[166] = {name = 'Coral Rhea', id = 169, item = 5907, count = 1},
	[167] = {name = 'White Lion', id = 174, item = 5907, count = 1},
	[168] = {name = 'Phantasmal Jade', id = 167, item = 5907, count = 1},
	[169] = {name = 'Merry Mammoth', id = 176, item = 5907, count = 1},
	[170] = {name = 'Holiday Mammoth', id = 177, item = 5907, count = 1},
	[171] = {name = 'Festive Mammoth', id = 178, item = 5907, count = 1},
	[172] = {name = 'Krakoloss', id = 175, item = 5907, count = 1},
	[173] = {name = 'Void Watcher', id = 179, item = 5907, count = 1},
	[174] = {name = 'Rune Watcher', id = 180, item = 5907, count = 1},
	[175] = {name = 'Rift Watcher', id = 181, item = 5907, count = 1},
	[176] = {name = 'Peony', id = 186, item = 5907, count = 1},
	[177] = {name = 'Hyacinth', id = 185, item = 5907, count = 1},
	[178] = {name = 'Dandelion', id = 187, item = 5907, count = 1},
	[179] = {name = 'Singeing Steed', id = 184, item = 5907, count = 1},
	[180] = {name = 'Shellodon', id = 183, item = 5907, count = 1},
	[181] = {name = 'Phant', id = 182, item = 5907, count = 1},
	[182] = {name = 'Rustwurm', id = 188, item = 5907, count = 1},
	[183] = {name = 'Gloomwurm', id = 190, item = 5907, count = 1},
	[184] = {name = 'Bogwurm', id = 189, item = 5907, count = 1},
	[185] = {name = 'Radiant Raven', id = 193, item = 5907, count = 1},
	[186] = {name = 'Mystic Raven', id = 192, item = 5907, count = 1},
	[187] = {name = 'Emerald Raven', id = 191, item = 5907, count = 1},
	[188] = {name = 'Gloothomotive', id = 194, item = 5907, count = 1},
	[189] = {name = 'Topaz Shrine', id = 195, item = 5907, count = 1},
	[190] = {name = 'Poppy Ibex', id = 198, item = 5907, count = 1},
	[191] = {name = 'Obsidian Shrine', id = 197, item = 5907, count = 1},
	[192] = {name = 'Mint Ibex', id = 199, item = 5907, count = 1},
	[193] = {name = 'Jade Shrine', id = 196, item = 5907, count = 1},
	[194] = {name = 'Cinnamon Ibex', id = 200, item = 5907, count = 1},
	[195] = {name = 'Tourney Horse', id = 205, item = 5907, count = 1},
	[196] = {name = 'Noxious Ripptor', id = 202, item = 5907, count = 1},
	[197] = {name = 'Parade Horse', id = 203, item = 5907, count = 1},
	[198] = {name = 'Jousting Horse', id = 204, item = 5907, count = 1},
	[199] = {name = 'Giant Beaver', id = 201, item = 5907, count = 1},
	[200] = {name = 'Tangerine Flecked Koi', id = 207, item = 5907, count = 1},
	[201] = {name = 'Ink Spotted Koi', id = 209, item = 5907, count = 1},
	[202] = {name = 'Brass Speckled Koi', id = 208, item = 5907, count = 1},
	[203] = {name = 'Mutated Abomination', id = 206, item = 5907, count = 1}
}

local mount = TalkAction("!mount")
function mount.onSay(player, words, param)
    if param == "unlock" then
        player:registerEvent("Mount_Modal_Window")
        local title = "Mount Unlocker"
        local message = "List of available mounts to unlock:"
	
        local window = ModalWindow(1200, title, message)
        window:addButton(100, "Unlock")
        window:addButton(101, "Cancel")
   
        local mountsAvailable = 0
        local mountsAvailableForUnlock = 0
        for i = 1, #mounts do
			Spdlog.info("[Has Mounts] - Mounts ID: "..mounts[i].id)
            if not(player:hasMount(mounts[i])) then
                mountsAvailable = mountsAvailable + 1
                if player:getItemCount(mounts[i].item) >= mounts[i].count then
                    mountsAvailableForUnlock = mountsAvailableForUnlock + 1
                    window:addChoice(i,""..mounts[i].name)
                end
            end
        end
   
        window:setDefaultEnterButton(100)
        window:setDefaultEscapeButton(101)
       
        if mountsAvailableForUnlock > 0 then
            window:sendToPlayer(player)
        else
            local text = "There " .. (mountsAvailable > 0 and ("is " .. mountsAvailable .. " mount" .. (mountsAvailable > 1 and "s" or "")) or "are no more mounts") .. " available to unlock."
            text = text .. (mountsAvailable > 0 and "You do not have the required items in your inventory to unlock any of the mounts available." or "") .. ""
            player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, text)
        end
    elseif param == "list" then
        local list = "List of locked mounts and item needed:"
        for j = 1, #mounts do
			Spdlog.info("[Has Mounts] - Mounts ID: "..mounts[j].id)
            if not(player:hasMount(mounts[j].id)) then
                list = list ..'\n['.. mounts[j].name..'] \nItem: ' ..ItemType(mounts[j].item):getName() ..' x'..mounts[j].count
            end
        end
        player:showTextDialog(8977, list)
    else
        player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, '\nMount Commands:\n!mount list -- Shows locked mounts\n!mount unlock -- Unlock mounts')
    end
    return false
end

mount:groupType("normal")
mount:separator(" ")
mount:register()

local mountmodal = CreatureEvent("Mount_Modal_Window")
mountmodal:type("modalwindow")

function mountmodal.onModalWindow(player, modalWindowId, buttonId, choiceId)
    if modalWindowId == 1200 then
        if buttonId == 100 then
            if doPlayerRemoveItem(player, mounts[choiceId].item, mounts[choiceId].count) then
                player:addMount(mounts[choiceId].id)
                player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, ''.. mounts[choiceId].name ..' unlocked!')
            else
                player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, 'Couldn\'t unlock mount.')
            end
        end
    end
    player:unregisterEvent("Mount_Modal_Window")
    return true
end

mountmodal:register()