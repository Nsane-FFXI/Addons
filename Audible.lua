_addon.name     = 'Audible'
_addon.author   = 'Nsane'
_addon.version  = '24.8.19'

packets = require('packets')

--[[ To create your own matching sounds...
Website: https://voicemaker.in/

Voice: Matthew
Volume: -10dB
Version: 2
Audio Settings: WAV-48000Hz]]



ID = {}
local group = {'party1_count', 'party2_count', 'party3_count'}
local position = {{'p0','p1','p2','p3','p4','p5'}, {'a10','a11','a12','a13','a14','a15'}, {'a20','a21','a22','a23','a24','a25'}}



function ADDplayer(list, player)

    if (player == nil) or list:contains (player.name) then return end
    if (player.hpp <= 0) then
    else list[player.name] = player end

end

function players()

    local party = windower.ffxi.get_party()
    local zone = party.p0.zone
    local members = S{}
    for g = 1, #group do
        for p = 1, party[group[g]] do
            local party_member = party[position[g][p]]
            if zone == party_member.zone then
                if g == 1 then								--if you would like this Alliance wide make this,   if g == 1 or 2 or 3 then
                    ADDplayer(members, party_member)
                end
            end
        end
    end

	return members

end

ID.players = players

function playerIDs()

    local IDs = S{}
    for name, player in pairs(ID.players()) do
        local ID = player.mob and player.mob.id or player.id
        if ID ~= nil then
            IDs[ID] = true
        end
    end

	return IDs

end






windower.register_event('incoming chunk', function(id, data)

	if id == 0x028 then local action = packets.parse('incoming', data)

	--Readies
	if action['Actor'] >= 1000000 then
	if T{43, 326, 675}:contains (action["Target 1 Action 1 Message"]) then	--Message ID 43/675 is, {actor} readies {weapon_skill}.
																			--Message ID 326 is, {actor} readies {ability}.
		--Aita
				if     T{3389, 4323, 4355}:contains (action['Target 1 Action 1 Param']) then windower.play_sound (windower.addon_path .. "FFaudio/Fulminous Smash.wav")
				elseif T{3390, 4324, 4356}:contains (action['Target 1 Action 1 Param']) then windower.play_sound (windower.addon_path .. "FFaudio/Flaming Kick.wav")
				elseif T{3391, 4325, 4357}:contains (action['Target 1 Action 1 Param']) then windower.play_sound (windower.addon_path .. "FFaudio/Icy Grasp.wav")
				elseif T{3392, 4326, 4358}:contains (action['Target 1 Action 1 Param']) then windower.play_sound (windower.addon_path .. "FFaudio/Flashflood.wav")
				elseif T{3393, 4327, 4359}:contains (action['Target 1 Action 1 Param']) then windower.play_sound (windower.addon_path .. "FFaudio/Eroding Flesh.wav")
				elseif T{3394, 4328}	  :contains (action['Target 1 Action 1 Param']) then windower.play_sound (windower.addon_path .. "FFaudio/Vivisection.wav")
		--Aminon
				elseif T{3402, 4367}	  :contains (action['Target 1 Action 1 Param']) then windower.play_sound (windower.addon_path .. "FFaudio/Demonfire.wav")
				elseif T{3403, 4368}	  :contains (action['Target 1 Action 1 Param']) then windower.play_sound (windower.addon_path .. "FFaudio/Frozen Bloodh.wav")
				elseif T{3405, 4369}	  :contains (action['Target 1 Action 1 Param']) then windower.play_sound (windower.addon_path .. "FFaudio/Blast of Reticence.wav")
				elseif T{3406, 4370}	  :contains (action['Target 1 Action 1 Param']) then windower.play_sound (windower.addon_path .. "FFaudio/Ensepulcher.wav")
				elseif T{3407, 4371}	  :contains (action['Target 1 Action 1 Param']) then windower.play_sound (windower.addon_path .. "FFaudio/Ceaseless Surge.wav")
				elseif T{3408, 4372}	  :contains (action['Target 1 Action 1 Param']) then windower.play_sound (windower.addon_path .. "FFaudio/Torrential Pain.wav")
		--Dhartok
				elseif T{3372, 4296, 4346}:contains (action['Target 1 Action 1 Param']) then windower.play_sound (windower.addon_path .. "FFaudio/Cesspool.wav")
		--Gartell
				elseif T{2726, 3367, 4309}:contains (action['Target 1 Action 1 Param']) then windower.play_sound (windower.addon_path .. "FFaudio/Shrieking Gale.wav")
				elseif T{3368, 4310}	  :contains	(action['Target 1 Action 1 Param']) then windower.play_sound (windower.addon_path .. "FFaudio/Undulating Shockwave.wav")
				end
			end

	--uses
	if T{100, 101, 119, 135, 734, 738}:contains (action["Target 1 Action 1 Message"]) then	--Message ID 100/738 is, {actor} uses {ability}.
																							--Message ID 101 is, {actor} uses {weapon_skill}.
																							--Message ID 119/734 is, {actor} uses {ability} on {target}.
		--Monster SP's																		--Message ID 135 is, {actor} uses {weapon_skill} on {target}.
				if	   T{303, 690, 1009, 1485, 2020, 2243}	:contains (action['Param']) then windower.play_sound (windower.addon_path .. "FFaudio/Mob Hundred Fists.wav")
				elseif T{688, 1008, 2242, 2939}				:contains (action['Param']) then windower.play_sound (windower.addon_path .. "FFaudio/Mob Mighty Strikes.wav")
				elseif T{691, 1011, 2245, 2944}				:contains (action['Param']) then windower.play_sound (windower.addon_path .. "FFaudio/Mob Manafont.wav")
				elseif T{692, 1012, 2246, 2942}				:contains (action['Param']) then windower.play_sound (windower.addon_path .. "FFaudio/Mob Chainspell.wav")
				elseif T{693, 1013, 2247}					:contains (action['Param']) then windower.play_sound (windower.addon_path .. "FFaudio/Mob Perfect Dodge.wav")
				elseif T{694, 1014, 2248, 2379, 2940}		:contains (action['Param']) then windower.play_sound (windower.addon_path .. "FFaudio/Mob Invincible.wav")
				elseif T{695, 1015, 2249}					:contains (action['Param']) then windower.play_sound (windower.addon_path .. "FFaudio/Mob Blood Weapon.wav")
				--elseif T{696, 1018, 2251}					:contains (action['Param']) then windower.play_sound (windower.addon_path .. "FFaudio/Mob Soul Voice.wav")
				elseif T{730, 1020, 2253, 3175}				:contains (action['Param']) then windower.play_sound (windower.addon_path .. "FFaudio/Mob Meikyo Shisui.wav")
				--elseif T{731, 1021, 2105, 2254, 2382}		:contains (action['Param']) then windower.play_sound (windower.addon_path .. "FFaudio/Mob Mijin Gakure.wav")
				elseif T{734, 1023, 2256}					:contains (action['Param']) then windower.play_sound (windower.addon_path .. "FFaudio/Mob Astral Flow.wav")
				elseif T{740, 1016, 2250}					:contains (action['Param']) then windower.play_sound (windower.addon_path .. "FFaudio/Mob Familiar.wav")
				--elseif T{1893, 2255}						:contains (action['Param']) then windower.play_sound (windower.addon_path .. "FFaudio/Mob Spirit Surge.wav")
				--elseif T{1933, 2006, 2257, 3481}			:contains (action['Param']) then windower.play_sound (windower.addon_path .. "FFaudio/Mob Azure Lore.wav")
				--elseif T{1934, 2007, 2258, 4153}			:contains (action['Param']) then windower.play_sound (windower.addon_path .. "FFaudio/Mob Wild Card.wav")
				--elseif T{1935, 2008, 2259}				:contains (action['Param']) then windower.play_sound (windower.addon_path .. "FFaudio/Mob Overdrive.wav")
				--elseif T{2260, 2710, 3087}				:contains (action['Param']) then windower.play_sound (windower.addon_path .. "FFaudio/Mob Trance.wav")
				--elseif T{2261, 2358}						:contains (action['Param']) then windower.play_sound (windower.addon_path .. "FFaudio/Mob Tabula Rasa.wav")
				elseif T{3173}								:contains (action['Param']) then windower.play_sound (windower.addon_path .. "FFaudio/Mob Brazen Rush.wav")
				--elseif T{3177}							:contains (action['Param']) then windower.play_sound (windower.addon_path .. "FFaudio/Mob Intervene.wav")
				--elseif T{3180, 4216}						:contains (action['Param']) then windower.play_sound (windower.addon_path .. "FFaudio/Mob Soul Enslavement.wav")
				--elseif T{3182}							:contains (action['Param']) then windower.play_sound (windower.addon_path .. "FFaudio/Mob Larceny.wav")
				elseif T{3186}								:contains (action['Param']) then windower.play_sound (windower.addon_path .. "FFaudio/Mob Yaegasumi.wav")
				elseif T{3265, 3479}						:contains (action['Param']) then windower.play_sound (windower.addon_path .. "FFaudio/Mob Elemental Sforzo.wav")
				--elseif T{3480, 4217}						:contains (action['Param']) then windower.play_sound (windower.addon_path .. "FFaudio/Mob Mikage.wav")
				--elseif T{3482}							:contains (action['Param']) then windower.play_sound (windower.addon_path .. "FFaudio/Mob Bolster.wav")
				--elseif T{3546}							:contains (action['Param']) then windower.play_sound (windower.addon_path .. "FFaudio/Mob Unbridled Wisdom.wav")
				--elseif T{413, 711, 712, 735, 736, 737, 738,
						 -- 739, 1019, 1065, 1091, 1121, 1122,
						 -- 1151, 1153, 1327, 1389, 1557, 1641,
						 -- 1931, 1932, 2148, 2252, 2941}	:contains (action['Param']) then windower.play_sound (windower.addon_path .. "FFaudio/Mob Eagle Eye Shot.wav")
				end
			end

	--starts casting, not cast
	if T{3, 327, 716}:contains (action["Target 1 Action 1 Message"]) then	--Message ID 3 is, {actor} starts casting {spell}.
																			--Message ID 327 is, {actor} starts casting ${spell} on ${target}.
																			--Message ID 716 is, {actor} starts casting ${weapon_skill}.
				if action['Target 1 Action 1 Param'] == 277 then windower.play_sound (windower.addon_path .. "FFaudio/Mob Dread Spikes.wav")
				end
			end
		end

	--Debuffs Landing on mob
		if playerIDs():contains (action['Actor']) then --Party wide actions
		--if action['Actor'] == windower.ffxi.get_player().id then --Just your actions
        if T{82, 127, 141, 160, 164, 203, 236, 237, 242, 243, 267, 268, 269, 270, 271, 272, 277, 278, 279, 320, 374, 375, 412, 453, 645, 754, 755, 804}:contains (action["Target 1 Action 1 Message"]) then

				if	   action['Target 1 Action 1 Param'] == 5   then windower.play_sound (windower.addon_path .. "FFaudio/Blinded.wav")
				elseif action['Target 1 Action 1 Param'] == 6   then windower.play_sound (windower.addon_path .. "FFaudio/Silenced.wav")
				elseif action['Target 1 Action 1 Param'] == 7   then windower.play_sound (windower.addon_path .. "FFaudio/Petrified.wav")
				elseif action['Target 1 Action 1 Param'] == 8   then windower.play_sound (windower.addon_path .. "FFaudio/Diseased.wav")
				elseif action['Target 1 Action 1 Param'] == 10  then windower.play_sound (windower.addon_path .. "FFaudio/Stunned.wav")
				elseif action['Target 1 Action 1 Param'] == 11  then windower.play_sound (windower.addon_path .. "FFaudio/Bound.wav")
				elseif action['Target 1 Action 1 Param'] == 15  then windower.play_sound (windower.addon_path .. "FFaudio/Doomed.wav")
				elseif action['Target 1 Action 1 Param'] == 16  then windower.play_sound (windower.addon_path .. "FFaudio/Amnesiad.wav")
				elseif action['Target 1 Action 1 Param'] == 21  then windower.play_sound (windower.addon_path .. "FFaudio/Addled.wav")
				elseif action['Target 1 Action 1 Param'] == 22  then windower.play_sound (windower.addon_path .. "FFaudio/Intimidated.wav")
				elseif action['Target 1 Action 1 Param'] == 28  then windower.play_sound (windower.addon_path .. "FFaudio/Terrored.wav")
				elseif action['Target 1 Action 1 Param'] == 31  then windower.play_sound (windower.addon_path .. "FFaudio/Plagued.wav")
				elseif action['Target 1 Action 1 Param'] == 128 then windower.play_sound (windower.addon_path .. "FFaudio/Burned.wav")
				elseif action['Target 1 Action 1 Param'] == 129 then windower.play_sound (windower.addon_path .. "FFaudio/Frosted.wav")
				elseif action['Target 1 Action 1 Param'] == 130 then windower.play_sound (windower.addon_path .. "FFaudio/Choked.wav")
				elseif action['Target 1 Action 1 Param'] == 131 then windower.play_sound (windower.addon_path .. "FFaudio/Rasped.wav")
				elseif action['Target 1 Action 1 Param'] == 132 then windower.play_sound (windower.addon_path .. "FFaudio/Shocked.wav")
				elseif action['Target 1 Action 1 Param'] == 133 then windower.play_sound (windower.addon_path .. "FFaudio/Drowned.wav")
				elseif action['Target 1 Action 1 Param'] == 136 then windower.play_sound (windower.addon_path .. "FFaudio/Strength Downed.wav")
				elseif action['Target 1 Action 1 Param'] == 137 then windower.play_sound (windower.addon_path .. "FFaudio/Dexterity Downed.wav")
				elseif action['Target 1 Action 1 Param'] == 138 then windower.play_sound (windower.addon_path .. "FFaudio/Agility Downed.wav")
				elseif action['Target 1 Action 1 Param'] == 139 then windower.play_sound (windower.addon_path .. "FFaudio/Vitality Downed.wav")
				elseif action['Target 1 Action 1 Param'] == 140 then windower.play_sound (windower.addon_path .. "FFaudio/Intelligence Downed.wav")
				elseif action['Target 1 Action 1 Param'] == 141 then windower.play_sound (windower.addon_path .. "FFaudio/Mind Downed.wav")
				elseif action['Target 1 Action 1 Param'] == 142 then windower.play_sound (windower.addon_path .. "FFaudio/Charisma Downed.wav")
				--elseif action['Target 1 Action 1 Param'] == 156 then windower.play_sound (windower.addon_path .. "FFaudio/Flashed.wav") -- off because PLD tank
				elseif action['Target 1 Action 1 Param'] == 192 then windower.play_sound (windower.addon_path .. "FFaudio/Requiemed.wav")
				elseif action['Target 1 Action 1 Param'] == 194 then windower.play_sound (windower.addon_path .. "FFaudio/Elegyed.wav")
				elseif action['Target 1 Action 1 Param'] == 217 then windower.play_sound (windower.addon_path .. "FFaudio/Threnodyed.wav")
				elseif action['Target 1 Action 1 Param'] == 223 then windower.play_sound (windower.addon_path .. "FFaudio/Nocturned.wav")
				elseif action['Target 1 Action 1 Param'] == 597 then windower.play_sound (windower.addon_path .. "FFaudio/Inundated.wav")
				elseif T{2, 19}   :contains (action["Target 1 Action 1 Param"]) then windower.play_sound (windower.addon_path .. "FFaudio/Slept.wav")
				elseif T{3, 540}  :contains (action["Target 1 Action 1 Param"]) then windower.play_sound (windower.addon_path .. "FFaudio/Poisoned.wav")
				elseif T{4, 566}  :contains (action["Target 1 Action 1 Param"]) then windower.play_sound (windower.addon_path .. "FFaudio/Paralyzed.wav")
				elseif T{9, 20}   :contains (action["Target 1 Action 1 Param"]) then windower.play_sound (windower.addon_path .. "FFaudio/Cursed.wav")
				elseif T{12, 567} :contains (action["Target 1 Action 1 Param"]) then windower.play_sound (windower.addon_path .. "FFaudio/Gravitied.wav")
				elseif T{13, 565} :contains (action["Target 1 Action 1 Param"]) then windower.play_sound (windower.addon_path .. "FFaudio/Slowed.wav")
				elseif T{14, 17}  :contains (action["Target 1 Action 1 Param"]) then windower.play_sound (windower.addon_path .. "FFaudio/Charmed.wav")
				elseif T{146, 561}:contains (action["Target 1 Action 1 Param"]) then windower.play_sound (windower.addon_path .. "FFaudio/Accuracy Downed.wav")
				elseif T{147, 557}:contains (action["Target 1 Action 1 Param"]) then windower.play_sound (windower.addon_path .. "FFaudio/Attack Downed.wav")
				elseif T{148, 562}:contains (action["Target 1 Action 1 Param"]) then windower.play_sound (windower.addon_path .. "FFaudio/Distracted.wav")
				elseif T{149, 558}:contains (action["Target 1 Action 1 Param"]) then windower.play_sound (windower.addon_path .. "FFaudio/Defense Downed.wav")
				elseif T{167, 560}:contains (action["Target 1 Action 1 Param"]) then windower.play_sound (windower.addon_path .. "FFaudio/Magic Defense Downed.wav")
				elseif T{174, 563}:contains (action["Target 1 Action 1 Param"]) then windower.play_sound (windower.addon_path .. "FFaudio/Magic Accuracy Downed.wav")
				elseif T{175, 559}:contains (action["Target 1 Action 1 Param"]) then windower.play_sound (windower.addon_path .. "FFaudio/Magic Attack Downed.wav")
				elseif T{404, 564}:contains (action["Target 1 Action 1 Param"]) then windower.play_sound (windower.addon_path .. "FFaudio/Frazzled.wav")
				end
			end
		if T{2, 7, 252, 385, 386, 387, 388, 389, 390, 391, 392, 393, 394, 395, 396, 397, 398, 769, 770}:contains (action['Target 1 Action 1 Message']) then
				if     action['Param'] == 502 then windower.play_sound (windower.addon_path .. "FFaudio/Kaustra'd.wav")
				elseif action['Param'] == 503 then windower.play_sound (windower.addon_path .. "FFaudio/Impacted.wav")
				--elseif T{23, 24, 25, 26, 27, 33, 34, 35, 36, 37}:contains (action['Param']) then windower.play_sound (windower.addon_path .. "FFaudio/Dia'd.wav")
				elseif T{230, 231, 232, 233, 234}:contains (action['Param']) then windower.play_sound (windower.addon_path .. "FFaudio/Bio'd.wav")
				elseif T{278, 885}:contains (action['Param']) then windower.play_sound (windower.addon_path .. "FFaudio/GeoHelix'd.wav")
				elseif T{279, 886}:contains (action['Param']) then windower.play_sound (windower.addon_path .. "FFaudio/HydroHelix'd.wav")
				elseif T{280, 887}:contains (action['Param']) then windower.play_sound (windower.addon_path .. "FFaudio/AnemoHelix'd.wav")
				elseif T{281, 888}:contains (action['Param']) then windower.play_sound (windower.addon_path .. "FFaudio/PyroHelix'd.wav")
				elseif T{282, 889}:contains (action['Param']) then windower.play_sound (windower.addon_path .. "FFaudio/CryoHelix'd.wav")
				elseif T{283, 890}:contains (action['Param']) then windower.play_sound (windower.addon_path .. "FFaudio/IonoHelix'd.wav")
				elseif T{284, 891}:contains (action['Param']) then windower.play_sound (windower.addon_path .. "FFaudio/NoctoHelix'd.wav")
				elseif T{285, 892}:contains (action['Param']) then windower.play_sound (windower.addon_path .. "FFaudio/LuminoHelix'd.wav")
				end
			end

	if T{603, 608}:contains (action["Target 1 Action 1 Added Effect Message"]) and action["Target 1 Action 1 Added Effect Animation"] == 7 then	--Message ID 603 is, Thief TH
																																				--Message ID 608 is, Bounty Shot
		--Treasure Hunter
				if action['Target 1 Action 1 Added Effect Param'] == 8  then windower.play_sound (windower.addon_path .. "FFaudio/TH8.wav")
				elseif action['Target 1 Action 1 Added Effect Param'] == 9  then windower.play_sound (windower.addon_path .. "FFaudio/TH9.wav")
				elseif action['Target 1 Action 1 Added Effect Param'] == 10 then windower.play_sound (windower.addon_path .. "FFaudio/TH10.wav")
				elseif action['Target 1 Action 1 Added Effect Param'] == 11 then windower.play_sound (windower.addon_path .. "FFaudio/TH11.wav")
				elseif action['Target 1 Action 1 Added Effect Param'] == 12 then windower.play_sound (windower.addon_path .. "FFaudio/TH12.wav")
				elseif action['Target 1 Action 1 Added Effect Param'] == 13 then windower.play_sound (windower.addon_path .. "FFaudio/TH13.wav")
				elseif action['Target 1 Action 1 Added Effect Param'] == 14 then windower.play_sound (windower.addon_path .. "FFaudio/TH14.wav")
				end
			end

	if T{159, 168, 231, 321, 322, 341, 342, 343, 344, 378, 400, 401, 405, 570, 607, 647, 792, 805, 806}:contains (action["Target 1 Action 1 Message"]) then

		--Dispelling Buffs
				if	   action['Target 1 Action 1 Param'] == 34  then windower.play_sound (windower.addon_path .. "FFaudio/Blaze Spikes.wav")
				elseif action['Target 1 Action 1 Param'] == 35  then windower.play_sound (windower.addon_path .. "FFaudio/Ice Spikes.wav")
				elseif action['Target 1 Action 1 Param'] == 36  then windower.play_sound (windower.addon_path .. "FFaudio/Blink.wav")
				elseif action['Target 1 Action 1 Param'] == 37  then windower.play_sound (windower.addon_path .. "FFaudio/Stoneskin.wav")
				elseif action['Target 1 Action 1 Param'] == 38  then windower.play_sound (windower.addon_path .. "FFaudio/Shock Spikes.wav")
				elseif action['Target 1 Action 1 Param'] == 39  then windower.play_sound (windower.addon_path .. "FFaudio/Aquaveil.wav")
				elseif action['Target 1 Action 1 Param'] == 40  then windower.play_sound (windower.addon_path .. "FFaudio/Protect.wav")
				elseif action['Target 1 Action 1 Param'] == 41  then windower.play_sound (windower.addon_path .. "FFaudio/Shell.wav")
				elseif action['Target 1 Action 1 Param'] == 66  then windower.play_sound (windower.addon_path .. "FFaudio/Utsusemi.wav")
				elseif action['Target 1 Action 1 Param'] == 69  then windower.play_sound (windower.addon_path .. "FFaudio/Invisible.wav")
				elseif action['Target 1 Action 1 Param'] == 70  then windower.play_sound (windower.addon_path .. "FFaudio/Deodorize.wav")
				elseif action['Target 1 Action 1 Param'] == 71  then windower.play_sound (windower.addon_path .. "FFaudio/Sneak.wav")
				elseif action['Target 1 Action 1 Param'] == 100 then windower.play_sound (windower.addon_path .. "FFaudio/Barfire.wav")
				elseif action['Target 1 Action 1 Param'] == 101 then windower.play_sound (windower.addon_path .. "FFaudio/Barblizzard.wav")
				elseif action['Target 1 Action 1 Param'] == 102 then windower.play_sound (windower.addon_path .. "FFaudio/Baraero.wav")
				elseif action['Target 1 Action 1 Param'] == 103 then windower.play_sound (windower.addon_path .. "FFaudio/Barstone.wav")
				elseif action['Target 1 Action 1 Param'] == 104 then windower.play_sound (windower.addon_path .. "FFaudio/Barthunder.wav")
				elseif action['Target 1 Action 1 Param'] == 105 then windower.play_sound (windower.addon_path .. "FFaudio/Barwater.wav")
				elseif action['Target 1 Action 1 Param'] == 106 then windower.play_sound (windower.addon_path .. "FFaudio/Barsleep.wav")
				elseif action['Target 1 Action 1 Param'] == 107 then windower.play_sound (windower.addon_path .. "FFaudio/Barpoison.wav")
				elseif action['Target 1 Action 1 Param'] == 108 then windower.play_sound (windower.addon_path .. "FFaudio/Barparalyze.wav")
				elseif action['Target 1 Action 1 Param'] == 109 then windower.play_sound (windower.addon_path .. "FFaudio/Barblind.wav")
				elseif action['Target 1 Action 1 Param'] == 110 then windower.play_sound (windower.addon_path .. "FFaudio/Barsilence.wav")
				elseif action['Target 1 Action 1 Param'] == 111 then windower.play_sound (windower.addon_path .. "FFaudio/Barpetrify.wav")
				elseif action['Target 1 Action 1 Param'] == 112 then windower.play_sound (windower.addon_path .. "FFaudio/Barvirus.wav")
				elseif action['Target 1 Action 1 Param'] == 113 then windower.play_sound (windower.addon_path .. "FFaudio/Reraise.wav")
				elseif action['Target 1 Action 1 Param'] == 116 then windower.play_sound (windower.addon_path .. "FFaudio/Phalanx.wav")
				elseif action['Target 1 Action 1 Param'] == 152 then windower.play_sound (windower.addon_path .. "FFaudio/Magic Barrier.wav")
				elseif action['Target 1 Action 1 Param'] == 154 then windower.play_sound (windower.addon_path .. "FFaudio/Shining Ruby.wav")
				elseif action['Target 1 Action 1 Param'] == 170 then windower.play_sound (windower.addon_path .. "FFaudio/Adloquium.wav")
				elseif action['Target 1 Action 1 Param'] == 173 then windower.play_sound (windower.addon_path .. "FFaudio/Dread Spikes.wav")
				elseif action['Target 1 Action 1 Param'] == 176 then windower.play_sound (windower.addon_path .. "FFaudio/Quickened.wav")
				elseif action['Target 1 Action 1 Param'] == 195 then windower.play_sound (windower.addon_path .. "FFaudio/Paeon.wav")
				elseif action['Target 1 Action 1 Param'] == 196 then windower.play_sound (windower.addon_path .. "FFaudio/Ballad.wav")
				elseif action['Target 1 Action 1 Param'] == 197 then windower.play_sound (windower.addon_path .. "FFaudio/Minne.wav")
				elseif action['Target 1 Action 1 Param'] == 198 then windower.play_sound (windower.addon_path .. "FFaudio/Minuet.wav")
				elseif action['Target 1 Action 1 Param'] == 199 then windower.play_sound (windower.addon_path .. "FFaudio/Madrigal.wav")
				elseif action['Target 1 Action 1 Param'] == 200 then windower.play_sound (windower.addon_path .. "FFaudio/Prelude.wav")
				elseif action['Target 1 Action 1 Param'] == 201 then windower.play_sound (windower.addon_path .. "FFaudio/Mambo.wav")
				elseif action['Target 1 Action 1 Param'] == 214 then windower.play_sound (windower.addon_path .. "FFaudio/March.wav")
				elseif action['Target 1 Action 1 Param'] == 215 then windower.play_sound (windower.addon_path .. "FFaudio/Etude.wav")
				elseif action['Target 1 Action 1 Param'] == 216 then windower.play_sound (windower.addon_path .. "FFaudio/Carol.wav")
				elseif action['Target 1 Action 1 Param'] == 219 then windower.play_sound (windower.addon_path .. "FFaudio/Mazurka.wav")
				elseif action['Target 1 Action 1 Param'] == 220 then windower.play_sound (windower.addon_path .. "FFaudio/Sirvente.wav")
				elseif action['Target 1 Action 1 Param'] == 221 then windower.play_sound (windower.addon_path .. "FFaudio/Dirge.wav")
				elseif action['Target 1 Action 1 Param'] == 222 then windower.play_sound (windower.addon_path .. "FFaudio/Scherzo.wav")
				elseif action['Target 1 Action 1 Param'] == 228 then windower.play_sound (windower.addon_path .. "FFaudio/Embrava.wav")
				elseif action['Target 1 Action 1 Param'] == 251 then windower.play_sound (windower.addon_path .. "FFaudio/Food.wav")
				elseif action['Target 1 Action 1 Param'] == 270 then windower.play_sound (windower.addon_path .. "FFaudio/Aftermath 1.wav")
				elseif action['Target 1 Action 1 Param'] == 271 then windower.play_sound (windower.addon_path .. "FFaudio/Aftermath 2.wav")
				elseif action['Target 1 Action 1 Param'] == 272 then windower.play_sound (windower.addon_path .. "FFaudio/Aftermath 3.wav")
				elseif action['Target 1 Action 1 Param'] == 274 then windower.play_sound (windower.addon_path .. "FFaudio/Enlight.wav")
				elseif action['Target 1 Action 1 Param'] == 275 then windower.play_sound (windower.addon_path .. "FFaudio/Auspice.wav")
				elseif action['Target 1 Action 1 Param'] == 286 then windower.play_sound (windower.addon_path .. "FFaudio/Baramnesia.wav")
				elseif action['Target 1 Action 1 Param'] == 288 then windower.play_sound (windower.addon_path .. "FFaudio/Endark.wav")
				elseif action['Target 1 Action 1 Param'] == 289 then windower.play_sound (windower.addon_path .. "FFaudio/Animus Augeo.wav")
				elseif action['Target 1 Action 1 Param'] == 293 then windower.play_sound (windower.addon_path .. "FFaudio/Negate Petrify.wav")
				elseif action['Target 1 Action 1 Param'] == 294 then windower.play_sound (windower.addon_path .. "FFaudio/Negate Terror.wav")
				elseif action['Target 1 Action 1 Param'] == 295 then windower.play_sound (windower.addon_path .. "FFaudio/Negate Amnesia.wav")
				elseif action['Target 1 Action 1 Param'] == 296 then windower.play_sound (windower.addon_path .. "FFaudio/Negate Doom.wav")
				elseif action['Target 1 Action 1 Param'] == 297 then windower.play_sound (windower.addon_path .. "FFaudio/Negate Poison.wav")
				elseif action['Target 1 Action 1 Param'] == 310 then windower.play_sound (windower.addon_path .. "FFaudio/Fighters.wav")
				elseif action['Target 1 Action 1 Param'] == 311 then windower.play_sound (windower.addon_path .. "FFaudio/Monks.wav")
				elseif action['Target 1 Action 1 Param'] == 312 then windower.play_sound (windower.addon_path .. "FFaudio/Healers.wav")
				elseif action['Target 1 Action 1 Param'] == 313 then windower.play_sound (windower.addon_path .. "FFaudio/Wizards.wav")
				elseif action['Target 1 Action 1 Param'] == 314 then windower.play_sound (windower.addon_path .. "FFaudio/Warlocks.wav")
				elseif action['Target 1 Action 1 Param'] == 315 then windower.play_sound (windower.addon_path .. "FFaudio/Rogues.wav")
				elseif action['Target 1 Action 1 Param'] == 316 then windower.play_sound (windower.addon_path .. "FFaudio/Gallants.wav")
				elseif action['Target 1 Action 1 Param'] == 317 then windower.play_sound (windower.addon_path .. "FFaudio/Chaos.wav")
				elseif action['Target 1 Action 1 Param'] == 318 then windower.play_sound (windower.addon_path .. "FFaudio/Beast.wav")
				elseif action['Target 1 Action 1 Param'] == 319 then windower.play_sound (windower.addon_path .. "FFaudio/Choral.wav")
				elseif action['Target 1 Action 1 Param'] == 320 then windower.play_sound (windower.addon_path .. "FFaudio/Hunters.wav")
				elseif action['Target 1 Action 1 Param'] == 321 then windower.play_sound (windower.addon_path .. "FFaudio/Samurai.wav")
				elseif action['Target 1 Action 1 Param'] == 322 then windower.play_sound (windower.addon_path .. "FFaudio/Ninjas.wav")
				elseif action['Target 1 Action 1 Param'] == 323 then windower.play_sound (windower.addon_path .. "FFaudio/Drachen.wav")
				elseif action['Target 1 Action 1 Param'] == 324 then windower.play_sound (windower.addon_path .. "FFaudio/Evokers.wav")
				elseif action['Target 1 Action 1 Param'] == 325 then windower.play_sound (windower.addon_path .. "FFaudio/Magus.wav")
				elseif action['Target 1 Action 1 Param'] == 326 then windower.play_sound (windower.addon_path .. "FFaudio/Corsairs.wav")
				elseif action['Target 1 Action 1 Param'] == 327 then windower.play_sound (windower.addon_path .. "FFaudio/Puppet.wav")
				elseif action['Target 1 Action 1 Param'] == 328 then windower.play_sound (windower.addon_path .. "FFaudio/Dancers.wav")
				elseif action['Target 1 Action 1 Param'] == 329 then windower.play_sound (windower.addon_path .. "FFaudio/Scholars.wav")
				elseif action['Target 1 Action 1 Param'] == 330 then windower.play_sound (windower.addon_path .. "FFaudio/Bolters.wav")
				elseif action['Target 1 Action 1 Param'] == 331 then windower.play_sound (windower.addon_path .. "FFaudio/Casters.wav")
				elseif action['Target 1 Action 1 Param'] == 332 then windower.play_sound (windower.addon_path .. "FFaudio/Coursers.wav")
				elseif action['Target 1 Action 1 Param'] == 333 then windower.play_sound (windower.addon_path .. "FFaudio/Blitzers.wav")
				elseif action['Target 1 Action 1 Param'] == 334 then windower.play_sound (windower.addon_path .. "FFaudio/Tacticians.wav")
				elseif action['Target 1 Action 1 Param'] == 335 then windower.play_sound (windower.addon_path .. "FFaudio/Allies.wav")
				elseif action['Target 1 Action 1 Param'] == 336 then windower.play_sound (windower.addon_path .. "FFaudio/Misers.wav")
				elseif action['Target 1 Action 1 Param'] == 337 then windower.play_sound (windower.addon_path .. "FFaudio/Companions.wav")
				elseif action['Target 1 Action 1 Param'] == 338 then windower.play_sound (windower.addon_path .. "FFaudio/Avengers.wav")
				elseif action['Target 1 Action 1 Param'] == 339 then windower.play_sound (windower.addon_path .. "FFaudio/Naturalists.wav")
				elseif action['Target 1 Action 1 Param'] == 403 then windower.play_sound (windower.addon_path .. "FFaudio/Reprisal.wav")
				elseif action['Target 1 Action 1 Param'] == 407 then windower.play_sound (windower.addon_path .. "FFaudio/Klimaform.wav")
				elseif action['Target 1 Action 1 Param'] == 432 then windower.play_sound (windower.addon_path .. "FFaudio/Temper.wav")
				elseif action['Target 1 Action 1 Param'] == 458 then windower.play_sound (windower.addon_path .. "FFaudio/Earthen Armor.wav")
				elseif action['Target 1 Action 1 Param'] == 542 then windower.play_sound (windower.addon_path .. "FFaudio/Strength Boost.wav")
				elseif action['Target 1 Action 1 Param'] == 555 then windower.play_sound (windower.addon_path .. "FFaudio/Magic Accuracy Boost.wav")
				elseif action['Target 1 Action 1 Param'] == 587 then windower.play_sound (windower.addon_path .. "FFaudio/TP Bonus.wav")
				elseif action['Target 1 Action 1 Param'] == 600 then windower.play_sound (windower.addon_path .. "FFaudio/Runeist.wav")
				elseif action['Target 1 Action 1 Param'] == 604 then windower.play_sound (windower.addon_path .. "FFaudio/Mighty Guard.wav")
				elseif action['Target 1 Action 1 Param'] == 608 then windower.play_sound (windower.addon_path .. "FFaudio/Negate Virus.wav")
				elseif action['Target 1 Action 1 Param'] == 609 then windower.play_sound (windower.addon_path .. "FFaudio/Negate Curse.wav")
				elseif action['Target 1 Action 1 Param'] == 610 then windower.play_sound (windower.addon_path .. "FFaudio/Negate Charm.wav")
				elseif action['Target 1 Action 1 Param'] == 624 then windower.play_sound (windower.addon_path .. "FFaudio/Winds Blessing.wav")
				elseif action['Target 1 Action 1 Param'] == 626 then windower.play_sound (windower.addon_path .. "FFaudio/Negate Sleep.wav")
				elseif T{33, 58}  	  :contains (action['Target 1 Action 1 Param']) then windower.play_sound (windower.addon_path .. "FFaudio/Haste.wav")
				elseif T{42, 539} 	  :contains (action['Target 1 Action 1 Param']) then windower.play_sound (windower.addon_path .. "FFaudio/Regen.wav")
				elseif T{43, 541} 	  :contains (action['Target 1 Action 1 Param']) then windower.play_sound (windower.addon_path .. "FFaudio/Refresh.wav")
				elseif T{80, 119, 542}:contains (action["Target 1 Action 1 Param"]) then windower.play_sound (windower.addon_path .. "FFaudio/STR Boost.wav")
				elseif T{81, 120, 543}:contains (action["Target 1 Action 1 Param"]) then windower.play_sound (windower.addon_path .. "FFaudio/DEX Boost.wav")
				elseif T{82, 121, 544}:contains (action["Target 1 Action 1 Param"]) then windower.play_sound (windower.addon_path .. "FFaudio/VIT Boost.wav")
				elseif T{83, 122, 545}:contains (action["Target 1 Action 1 Param"]) then windower.play_sound (windower.addon_path .. "FFaudio/AGI Boost.wav")
				elseif T{84, 123, 546}:contains (action["Target 1 Action 1 Param"]) then windower.play_sound (windower.addon_path .. "FFaudio/INT Boost.wav")
				elseif T{85, 124, 547}:contains (action["Target 1 Action 1 Param"]) then windower.play_sound (windower.addon_path .. "FFaudio/MND Boost.wav")
				elseif T{86, 125, 548}:contains (action["Target 1 Action 1 Param"]) then windower.play_sound (windower.addon_path .. "FFaudio/CHR Boost.wav")
				elseif T{90, 553} 	  :contains (action['Target 1 Action 1 Param']) then windower.play_sound (windower.addon_path .. "FFaudio/Accuracy Boost.wav")
				elseif T{91, 549} 	  :contains (action['Target 1 Action 1 Param']) then windower.play_sound (windower.addon_path .. "FFaudio/Attack Boost.wav")
				elseif T{92, 554} 	  :contains (action['Target 1 Action 1 Param']) then windower.play_sound (windower.addon_path .. "FFaudio/Evasion Boost.wav")
				elseif T{93, 550} 	  :contains (action['Target 1 Action 1 Param']) then windower.play_sound (windower.addon_path .. "FFaudio/Defense Boost.wav")
				elseif T{94, 277} 	  :contains (action['Target 1 Action 1 Param']) then windower.play_sound (windower.addon_path .. "FFaudio/Enfire.wav")
				elseif T{95, 278}	  :contains (action['Target 1 Action 1 Param']) then windower.play_sound (windower.addon_path .. "FFaudio/Enblizzard.wav")
				elseif T{96, 279}	  :contains (action['Target 1 Action 1 Param']) then windower.play_sound (windower.addon_path .. "FFaudio/Enaero.wav")
				elseif T{97, 280} 	  :contains (action['Target 1 Action 1 Param']) then windower.play_sound (windower.addon_path .. "FFaudio/Enstone.wav")
				elseif T{98, 281}	  :contains (action['Target 1 Action 1 Param']) then windower.play_sound (windower.addon_path .. "FFaudio/Enthunder.wav")
				elseif T{99, 282} 	  :contains (action['Target 1 Action 1 Param']) then windower.play_sound (windower.addon_path .. "FFaudio/Enwater.wav")
				elseif T{171, 291}	  :contains (action['Target 1 Action 1 Param']) then windower.play_sound (windower.addon_path .. "FFaudio/Animus Minuo.wav")
				elseif T{178, 589}	  :contains (action['Target 1 Action 1 Param']) then windower.play_sound (windower.addon_path .. "FFaudio/Firestorm.wav")
				elseif T{179, 590}	  :contains (action['Target 1 Action 1 Param']) then windower.play_sound (windower.addon_path .. "FFaudio/Hailstorm.wav")
				elseif T{180, 591}	  :contains (action['Target 1 Action 1 Param']) then windower.play_sound (windower.addon_path .. "FFaudio/Windstorm.wav")
				elseif T{181, 592}	  :contains (action['Target 1 Action 1 Param']) then windower.play_sound (windower.addon_path .. "FFaudio/Sandstorm.wav")
				elseif T{182, 593}	  :contains (action['Target 1 Action 1 Param']) then windower.play_sound (windower.addon_path .. "FFaudio/Thunderstorm.wav")
				elseif T{183, 594}	  :contains (action['Target 1 Action 1 Param']) then windower.play_sound (windower.addon_path .. "FFaudio/Rainstorm.wav")
				elseif T{184, 595}	  :contains (action['Target 1 Action 1 Param']) then windower.play_sound (windower.addon_path .. "FFaudio/Aurorastorm.wav")
				elseif T{185, 596}	  :contains (action['Target 1 Action 1 Param']) then windower.play_sound (windower.addon_path .. "FFaudio/Voidstorm.wav")
				elseif T{190, 551}	  :contains (action['Target 1 Action 1 Param']) then windower.play_sound (windower.addon_path .. "FFaudio/Magic Attack Boost.wav")
				elseif T{191, 552}	  :contains (action['Target 1 Action 1 Param']) then windower.play_sound (windower.addon_path .. "FFaudio/Magic Defense Boost.wav")
				elseif T{265, 581}	  :contains (action['Target 1 Action 1 Param']) then windower.play_sound (windower.addon_path .. "FFaudio/Flurry.wav")
				elseif T{556, 611}	  :contains (action['Target 1 Action 1 Param']) then windower.play_sound (windower.addon_path .. "FFaudio/Magic Evasion Boost.wav")
				end
			end
		end

		--Misc. for x028
		if action['Actor'] == windower.ffxi.get_player().id then
				if	   T{653, 654}	  :contains (action["Target 1 Action 1 Message"]) then windower.play_sound (windower.addon_path .. "FFaudio/Immunobreak.wav")
				elseif T{655, 656}	  :contains (action["Target 1 Action 1 Message"]) then windower.play_sound (windower.addon_path .. "FFaudio/Completely.wav")
				elseif T{78, 198, 328}:contains (action["Target 1 Action 1 Message"]) then windower.play_sound (windower.addon_path .. "FFaudio/Too Far.wav")
				elseif T{792}		  :contains (action["Target 1 Action 1 Message"]) then windower.play_sound (windower.addon_path .. "FFaudio/Multiple.wav")
				end
			end

	--Debuffs Landing on you
		if action['Target 1 ID'] == windower.ffxi.get_player().id then
		if T{82, 127, 141, 160, 164, 203, 236, 237, 242, 243, 267, 268, 269, 270, 271, 272, 277, 278, 279, 320, 374, 375, 412, 453, 645, 754, 755, 804}:contains (action["Target 1 Action 1 Message"]) then

				if	   action['Target 1 Action 1 Param'] == 5   then windower.play_sound (windower.addon_path .. "FFaudio/Blinded.wav")
				elseif action['Target 1 Action 1 Param'] == 6   then windower.play_sound (windower.addon_path .. "FFaudio/Silenced.wav")
				elseif action['Target 1 Action 1 Param'] == 7   then windower.play_sound (windower.addon_path .. "FFaudio/Petrified.wav")
				elseif action['Target 1 Action 1 Param'] == 8   then windower.play_sound (windower.addon_path .. "FFaudio/Diseased.wav")
				elseif action['Target 1 Action 1 Param'] == 10  then windower.play_sound (windower.addon_path .. "FFaudio/Stunned.wav")
				elseif action['Target 1 Action 1 Param'] == 11  then windower.play_sound (windower.addon_path .. "FFaudio/Bound.wav")
				elseif action['Target 1 Action 1 Param'] == 15  then windower.play_sound (windower.addon_path .. "FFaudio/Doomed.wav")
				elseif action['Target 1 Action 1 Param'] == 16  then windower.play_sound (windower.addon_path .. "FFaudio/Amnesiad.wav")
				elseif action['Target 1 Action 1 Param'] == 21  then windower.play_sound (windower.addon_path .. "FFaudio/Addled.wav")
				elseif action['Target 1 Action 1 Param'] == 22  then windower.play_sound (windower.addon_path .. "FFaudio/Intimidated.wav")
				elseif action['Target 1 Action 1 Param'] == 23  then windower.play_sound (windower.addon_path .. "FFaudio/Kaustra'd.wav")
				elseif action['Target 1 Action 1 Param'] == 28  then windower.play_sound (windower.addon_path .. "FFaudio/Terrored.wav")
				elseif action['Target 1 Action 1 Param'] == 31  then windower.play_sound (windower.addon_path .. "FFaudio/Plagued.wav")
				elseif action['Target 1 Action 1 Param'] == 128 then windower.play_sound (windower.addon_path .. "FFaudio/Burned.wav")
				elseif action['Target 1 Action 1 Param'] == 129 then windower.play_sound (windower.addon_path .. "FFaudio/Frosted.wav")
				elseif action['Target 1 Action 1 Param'] == 130 then windower.play_sound (windower.addon_path .. "FFaudio/Choked.wav")
				elseif action['Target 1 Action 1 Param'] == 131 then windower.play_sound (windower.addon_path .. "FFaudio/Rasped.wav")
				elseif action['Target 1 Action 1 Param'] == 132 then windower.play_sound (windower.addon_path .. "FFaudio/Shocked.wav")
				elseif action['Target 1 Action 1 Param'] == 133 then windower.play_sound (windower.addon_path .. "FFaudio/Drowned.wav")
				elseif action['Target 1 Action 1 Param'] == 136 then windower.play_sound (windower.addon_path .. "FFaudio/Strength Downed.wav")
				elseif action['Target 1 Action 1 Param'] == 137 then windower.play_sound (windower.addon_path .. "FFaudio/Dexterity Downed.wav")
				elseif action['Target 1 Action 1 Param'] == 138 then windower.play_sound (windower.addon_path .. "FFaudio/Agility Downed.wav")
				elseif action['Target 1 Action 1 Param'] == 139 then windower.play_sound (windower.addon_path .. "FFaudio/Vitality Downed.wav")
				elseif action['Target 1 Action 1 Param'] == 140 then windower.play_sound (windower.addon_path .. "FFaudio/Intelligence Downed.wav")
				elseif action['Target 1 Action 1 Param'] == 141 then windower.play_sound (windower.addon_path .. "FFaudio/Mind Downed.wav")
				elseif action['Target 1 Action 1 Param'] == 142 then windower.play_sound (windower.addon_path .. "FFaudio/Charisma Downed.wav")
				elseif action['Target 1 Action 1 Param'] == 156 then windower.play_sound (windower.addon_path .. "FFaudio/Flashed.wav")
				elseif action['Target 1 Action 1 Param'] == 192 then windower.play_sound (windower.addon_path .. "FFaudio/Requiemed.wav")
				elseif action['Target 1 Action 1 Param'] == 194 then windower.play_sound (windower.addon_path .. "FFaudio/Elegyed.wav")
				elseif action['Target 1 Action 1 Param'] == 217 then windower.play_sound (windower.addon_path .. "FFaudio/Threnodyed.wav")
				elseif action['Target 1 Action 1 Param'] == 223 then windower.play_sound (windower.addon_path .. "FFaudio/Nocturned.wav")
				elseif action['Target 1 Action 1 Param'] == 597 then windower.play_sound (windower.addon_path .. "FFaudio/Inundated.wav")
				elseif T{2, 19}   :contains (action['Target 1 Action 1 Param']) then windower.play_sound (windower.addon_path .. "FFaudio/Slept.wav")
				elseif T{3, 540}  :contains (action['Target 1 Action 1 Param']) then windower.play_sound (windower.addon_path .. "FFaudio/Poisoned.wav")
				elseif T{4, 566}  :contains (action['Target 1 Action 1 Param']) then windower.play_sound (windower.addon_path .. "FFaudio/Paralyzed.wav")
				elseif T{9, 20}   :contains (action['Target 1 Action 1 Param']) then windower.play_sound (windower.addon_path .. "FFaudio/Cursed.wav")
				elseif T{12, 567} :contains (action['Target 1 Action 1 Param']) then windower.play_sound (windower.addon_path .. "FFaudio/Gravitied.wav")
				elseif T{13, 565} :contains (action['Target 1 Action 1 Param']) then windower.play_sound (windower.addon_path .. "FFaudio/Slowed.wav")
				elseif T{14, 17}  :contains (action['Target 1 Action 1 Param']) then windower.play_sound (windower.addon_path .. "FFaudio/Charmed.wav")
				elseif T{146, 561}:contains (action['Target 1 Action 1 Param']) then windower.play_sound (windower.addon_path .. "FFaudio/Accuracy Downed.wav")
				elseif T{147, 557}:contains (action['Target 1 Action 1 Param']) then windower.play_sound (windower.addon_path .. "FFaudio/Attack Downed.wav")
				elseif T{148, 562}:contains (action['Target 1 Action 1 Param']) then windower.play_sound (windower.addon_path .. "FFaudio/Evasion Downed.wav")
				elseif T{149, 558}:contains (action['Target 1 Action 1 Param']) then windower.play_sound (windower.addon_path .. "FFaudio/Defense Downed.wav")
				elseif T{167, 560}:contains (action['Target 1 Action 1 Param']) then windower.play_sound (windower.addon_path .. "FFaudio/Magic Defense Downed.wav")
				elseif T{174, 563}:contains (action['Target 1 Action 1 Param']) then windower.play_sound (windower.addon_path .. "FFaudio/Magic Accuracy Downed.wav")
				elseif T{175, 559}:contains (action['Target 1 Action 1 Param']) then windower.play_sound (windower.addon_path .. "FFaudio/Magic Attack Downed.wav")
				elseif T{404, 564}:contains (action['Target 1 Action 1 Param']) then windower.play_sound (windower.addon_path .. "FFaudio/Magic Evasion Downed.wav")
				end
			end
		if T{2, 7, 252, 385, 386, 387, 388, 389, 390, 391, 392, 393, 394, 395, 396, 397, 398, 769, 770}:contains (action['Target 1 Action 1 Message']) then
				if     action['Param'] == 502 then windower.play_sound (windower.addon_path .. "FFaudio/Kaustra'd.wav")
				elseif action['Param'] == 503 then windower.play_sound (windower.addon_path .. "FFaudio/Impacted.wav")
				elseif T{23, 24, 25, 26, 27, 33, 34, 35, 36, 37}:contains (action['Param']) then windower.play_sound (windower.addon_path .. "FFaudio/Dia'd.wav")
				elseif T{230, 231, 232, 233, 234}:contains (action['Param']) then windower.play_sound (windower.addon_path .. "FFaudio/Bio'd.wav")
				elseif T{278, 885}:contains (action['Param']) then windower.play_sound (windower.addon_path .. "FFaudio/GeoHelix'd.wav")
				elseif T{279, 886}:contains (action['Param']) then windower.play_sound (windower.addon_path .. "FFaudio/HydroHelix'd.wav")
				elseif T{280, 887}:contains (action['Param']) then windower.play_sound (windower.addon_path .. "FFaudio/AnemoHelix'd.wav")
				elseif T{281, 888}:contains (action['Param']) then windower.play_sound (windower.addon_path .. "FFaudio/PyroHelix'd.wav")
				elseif T{282, 889}:contains (action['Param']) then windower.play_sound (windower.addon_path .. "FFaudio/CryoHelix'd.wav")
				elseif T{283, 890}:contains (action['Param']) then windower.play_sound (windower.addon_path .. "FFaudio/IonoHelix'd.wav")
				elseif T{284, 891}:contains (action['Param']) then windower.play_sound (windower.addon_path .. "FFaudio/NoctoHelix'd.wav")
				elseif T{285, 892}:contains (action['Param']) then windower.play_sound (windower.addon_path .. "FFaudio/LuminoHelix'd.wav")
				end
			end
		end
end






    if id == 0x029 then local action_message = packets.parse('incoming', data)
        if T{64, 204, 206, 321, 322, 341, 342, 343, 344, 350, 351, 378, 531, 647}:contains (action_message.Message) then	--Message ID 64/204/350/531 is, {target} is no longer {status}.
		if action_message['Actor'] == windower.ffxi.get_player().id then													--Message ID 206 is, {target}'s {status} effect wears off.
																															--Message ID 321/322 is, {actor} uses {ability}. {target}'s {status} effect wears off.
		--Buffs Wearing
				if     action_message['Param 1'] == 36  then windower.play_sound (windower.addon_path .. "FFaudio/Blink.wav")
			 -- elseif action_message['Param 1'] == 37  then windower.play_sound (windower.addon_path .. "FFaudio/Stoneskin.wav") -- Off, because of Cure Solace
				elseif action_message['Param 1'] == 39  then windower.play_sound (windower.addon_path .. "FFaudio/Aquaveil.wav")
				elseif action_message['Param 1'] == 40  then windower.play_sound (windower.addon_path .. "FFaudio/Protect.wav")
				elseif action_message['Param 1'] == 41  then windower.play_sound (windower.addon_path .. "FFaudio/Shell.wav")
				elseif action_message['Param 1'] == 66  then windower.play_sound (windower.addon_path .. "FFaudio/Utsusemi.wav")
				elseif action_message['Param 1'] == 69  then windower.play_sound (windower.addon_path .. "FFaudio/Invisible.wav")
				elseif action_message['Param 1'] == 70  then windower.play_sound (windower.addon_path .. "FFaudio/Deodorize.wav")
				elseif action_message['Param 1'] == 71  then windower.play_sound (windower.addon_path .. "FFaudio/Sneak.wav")
				elseif action_message['Param 1'] == 113 then windower.play_sound (windower.addon_path .. "FFaudio/Reraise.wav")
				elseif action_message['Param 1'] == 116 then windower.play_sound (windower.addon_path .. "FFaudio/Phalanx.wav")
				elseif action_message['Param 1'] == 152 then windower.play_sound (windower.addon_path .. "FFaudio/Magic Barrier.wav")
				elseif action_message['Param 1'] == 154 then windower.play_sound (windower.addon_path .. "FFaudio/Shining Ruby.wav")
				elseif action_message['Param 1'] == 170 then windower.play_sound (windower.addon_path .. "FFaudio/Adloquium.wav")
				elseif action_message['Param 1'] == 228 then windower.play_sound (windower.addon_path .. "FFaudio/Embrava.wav")
				elseif action_message['Param 1'] == 251 then windower.play_sound (windower.addon_path .. "FFaudio/Food.wav")
				elseif action_message['Param 1'] == 275 then windower.play_sound (windower.addon_path .. "FFaudio/Auspice.wav")
				elseif action_message['Param 1'] == 289 then windower.play_sound (windower.addon_path .. "FFaudio/Animus Augeo.wav")
				elseif action_message['Param 1'] == 403 then windower.play_sound (windower.addon_path .. "FFaudio/Reprisal.wav")
				elseif action_message['Param 1'] == 407 then windower.play_sound (windower.addon_path .. "FFaudio/Klimaform.wav")
				elseif action_message['Param 1'] == 432 then windower.play_sound (windower.addon_path .. "FFaudio/Temper.wav")
				elseif action_message['Param 1'] == 458 then windower.play_sound (windower.addon_path .. "FFaudio/Earthen Armor.wav")
				elseif action_message['Param 1'] == 176 then windower.play_sound (windower.addon_path .. "FFaudio/Quickened.wav")
				elseif action_message['Param 1'] == 555 then windower.play_sound (windower.addon_path .. "FFaudio/Magic Accuracy Boost.wav")
				elseif action_message['Param 1'] == 587 then windower.play_sound (windower.addon_path .. "FFaudio/TP Bonus.wav")
				elseif action_message['Param 1'] == 604 then windower.play_sound (windower.addon_path .. "FFaudio/Mighty Guard.wav")
				elseif action_message['Param 1'] == 624 then windower.play_sound (windower.addon_path .. "FFaudio/Winds Blessing.wav")
				elseif T{33, 58}  :contains (action_message['Param 1']) then windower.play_sound (windower.addon_path .. "FFaudio/Haste.wav")
				elseif T{42, 539} :contains (action_message['Param 1']) then windower.play_sound (windower.addon_path .. "FFaudio/Regen.wav")
				elseif T{43, 541} :contains (action_message['Param 1']) then windower.play_sound (windower.addon_path .. "FFaudio/Refresh.wav")
				elseif T{90, 553} :contains (action_message['Param 1']) then windower.play_sound (windower.addon_path .. "FFaudio/Accuracy Boost.wav")
				elseif T{91, 549} :contains (action_message['Param 1']) then windower.play_sound (windower.addon_path .. "FFaudio/Attack Boost.wav")
				elseif T{92, 554} :contains (action_message['Param 1']) then windower.play_sound (windower.addon_path .. "FFaudio/Evasion Boost.wav")
				elseif T{93, 550} :contains (action_message['Param 1']) then windower.play_sound (windower.addon_path .. "FFaudio/Defense Boost.wav")
				elseif T{171, 291}:contains (action_message['Param 1']) then windower.play_sound (windower.addon_path .. "FFaudio/Animus Minuo.wav")
				elseif T{190, 551}:contains (action_message['Param 1']) then windower.play_sound (windower.addon_path .. "FFaudio/Magic Attack Boost.wav")
				elseif T{191, 552}:contains (action_message['Param 1']) then windower.play_sound (windower.addon_path .. "FFaudio/Magic Defense Boost.wav")
				elseif T{265, 581}:contains (action_message['Param 1']) then windower.play_sound (windower.addon_path .. "FFaudio/Flurry.wav")
				elseif T{556, 611}:contains (action_message['Param 1']) then windower.play_sound (windower.addon_path .. "FFaudio/Magic Evasion Boost.wav")

		--Aftermaths
				elseif action_message['Param 1'] == 270 then windower.play_sound (windower.addon_path .. "FFaudio/Aftermath 1.wav")
				elseif action_message['Param 1'] == 271 then windower.play_sound (windower.addon_path .. "FFaudio/Aftermath 2.wav")
				elseif action_message['Param 1'] == 272 then windower.play_sound (windower.addon_path .. "FFaudio/Aftermath 3.wav")

		--Songs
				elseif action_message['Param 1'] == 195 then windower.play_sound (windower.addon_path .. "FFaudio/Paeon.wav")
				elseif action_message['Param 1'] == 196 then windower.play_sound (windower.addon_path .. "FFaudio/Ballad.wav")
				elseif action_message['Param 1'] == 197 then windower.play_sound (windower.addon_path .. "FFaudio/Minne.wav")
				elseif action_message['Param 1'] == 198 then windower.play_sound (windower.addon_path .. "FFaudio/Minuet.wav")
				elseif action_message['Param 1'] == 199 then windower.play_sound (windower.addon_path .. "FFaudio/Madrigal.wav")
				elseif action_message['Param 1'] == 200 then windower.play_sound (windower.addon_path .. "FFaudio/Prelude.wav")
				elseif action_message['Param 1'] == 201 then windower.play_sound (windower.addon_path .. "FFaudio/Mambo.wav")
				elseif action_message['Param 1'] == 214 then windower.play_sound (windower.addon_path .. "FFaudio/March.wav")
				elseif action_message['Param 1'] == 215 then windower.play_sound (windower.addon_path .. "FFaudio/Etude.wav")
				elseif action_message['Param 1'] == 216 then windower.play_sound (windower.addon_path .. "FFaudio/Carol.wav")
				elseif action_message['Param 1'] == 219 then windower.play_sound (windower.addon_path .. "FFaudio/Mazurka.wav")
				elseif action_message['Param 1'] == 220 then windower.play_sound (windower.addon_path .. "FFaudio/Sirvente.wav")
				elseif action_message['Param 1'] == 221 then windower.play_sound (windower.addon_path .. "FFaudio/Dirge.wav")
				elseif action_message['Param 1'] == 222 then windower.play_sound (windower.addon_path .. "FFaudio/Scherzo.wav")

		--Rolls
				elseif action_message['Param 1'] == 310 then windower.play_sound (windower.addon_path .. "FFaudio/Fighters.wav")
				elseif action_message['Param 1'] == 311 then windower.play_sound (windower.addon_path .. "FFaudio/Monks.wav")
				elseif action_message['Param 1'] == 312 then windower.play_sound (windower.addon_path .. "FFaudio/Healers.wav")
				elseif action_message['Param 1'] == 313 then windower.play_sound (windower.addon_path .. "FFaudio/Wizards.wav")
				elseif action_message['Param 1'] == 314 then windower.play_sound (windower.addon_path .. "FFaudio/Warlocks.wav")
				elseif action_message['Param 1'] == 315 then windower.play_sound (windower.addon_path .. "FFaudio/Rogues.wav")
				elseif action_message['Param 1'] == 316 then windower.play_sound (windower.addon_path .. "FFaudio/Gallants.wav")
				elseif action_message['Param 1'] == 317 then windower.play_sound (windower.addon_path .. "FFaudio/Chaos.wav")
				elseif action_message['Param 1'] == 318 then windower.play_sound (windower.addon_path .. "FFaudio/Beast.wav")
				elseif action_message['Param 1'] == 319 then windower.play_sound (windower.addon_path .. "FFaudio/Choral.wav")
				elseif action_message['Param 1'] == 320 then windower.play_sound (windower.addon_path .. "FFaudio/Hunters.wav")
				elseif action_message['Param 1'] == 321 then windower.play_sound (windower.addon_path .. "FFaudio/Samurai.wav")
				elseif action_message['Param 1'] == 322 then windower.play_sound (windower.addon_path .. "FFaudio/Ninjas.wav")
				elseif action_message['Param 1'] == 323 then windower.play_sound (windower.addon_path .. "FFaudio/Drachen.wav")
				elseif action_message['Param 1'] == 324 then windower.play_sound (windower.addon_path .. "FFaudio/Evokers.wav")
				elseif action_message['Param 1'] == 325 then windower.play_sound (windower.addon_path .. "FFaudio/Magus.wav")
				elseif action_message['Param 1'] == 326 then windower.play_sound (windower.addon_path .. "FFaudio/Corsairs.wav")
				elseif action_message['Param 1'] == 327 then windower.play_sound (windower.addon_path .. "FFaudio/Puppet.wav")
				elseif action_message['Param 1'] == 328 then windower.play_sound (windower.addon_path .. "FFaudio/Dancers.wav")
				elseif action_message['Param 1'] == 329 then windower.play_sound (windower.addon_path .. "FFaudio/Scholars.wav")
				elseif action_message['Param 1'] == 330 then windower.play_sound (windower.addon_path .. "FFaudio/Bolters.wav")
				elseif action_message['Param 1'] == 331 then windower.play_sound (windower.addon_path .. "FFaudio/Casters.wav")
				elseif action_message['Param 1'] == 332 then windower.play_sound (windower.addon_path .. "FFaudio/Coursers.wav")
				elseif action_message['Param 1'] == 333 then windower.play_sound (windower.addon_path .. "FFaudio/Blitzers.wav")
				elseif action_message['Param 1'] == 334 then windower.play_sound (windower.addon_path .. "FFaudio/Tacticians.wav")
				elseif action_message['Param 1'] == 335 then windower.play_sound (windower.addon_path .. "FFaudio/Allies.wav")
				elseif action_message['Param 1'] == 336 then windower.play_sound (windower.addon_path .. "FFaudio/Misers.wav")
				elseif action_message['Param 1'] == 337 then windower.play_sound (windower.addon_path .. "FFaudio/Companions.wav")
				elseif action_message['Param 1'] == 338 then windower.play_sound (windower.addon_path .. "FFaudio/Avengers.wav")
				elseif action_message['Param 1'] == 339 then windower.play_sound (windower.addon_path .. "FFaudio/Naturalists.wav")
				elseif action_message['Param 1'] == 600 then windower.play_sound (windower.addon_path .. "FFaudio/Runeist.wav")

		--Spikes
				elseif action_message['Param 1'] == 34  then windower.play_sound (windower.addon_path .. "FFaudio/Blaze Spikes.wav")
				elseif action_message['Param 1'] == 35  then windower.play_sound (windower.addon_path .. "FFaudio/Ice Spikes.wav")
				elseif action_message['Param 1'] == 38  then windower.play_sound (windower.addon_path .. "FFaudio/Shock Spikes.wav")
				elseif action_message['Param 1'] == 173 then windower.play_sound (windower.addon_path .. "FFaudio/Dread Spikes.wav")

		--Enfeebles wearing
				elseif action_message['Param 1'] == 5   then windower.play_sound (windower.addon_path .. "FFaudio/Blind.wav")
				elseif action_message['Param 1'] == 6   then windower.play_sound (windower.addon_path .. "FFaudio/Silence.wav")
				elseif action_message['Param 1'] == 7   then windower.play_sound (windower.addon_path .. "FFaudio/Petrify.wav")
				elseif action_message['Param 1'] == 11  then windower.play_sound (windower.addon_path .. "FFaudio/Bind.wav")
				elseif action_message['Param 1'] == 21  then windower.play_sound (windower.addon_path .. "FFaudio/Addle.wav")
				elseif action_message['Param 1'] == 134 then windower.play_sound (windower.addon_path .. "FFaudio/Dia.wav")
				elseif action_message['Param 1'] == 597 then windower.play_sound (windower.addon_path .. "FFaudio/Inundate.wav")
				elseif T{2, 19}   :contains (action_message['Param 1']) then  windower.play_sound (windower.addon_path .. "FFaudio/Sleep.wav")
				elseif T{3, 540}  :contains (action_message['Param 1']) then  windower.play_sound (windower.addon_path .. "FFaudio/Poison.wav")
				elseif T{4, 566}  :contains (action_message['Param 1']) then  windower.play_sound (windower.addon_path .. "FFaudio/Paralyze.wav")
				elseif T{12, 567} :contains (action_message['Param 1']) then  windower.play_sound (windower.addon_path .. "FFaudio/Gravity.wav")
				elseif T{13, 565} :contains (action_message['Param 1']) then  windower.play_sound (windower.addon_path .. "FFaudio/Slow.wav")
				elseif T{148, 562}:contains (action_message['Param 1']) then  windower.play_sound (windower.addon_path .. "FFaudio/Evasion Down.wav")
				elseif T{404, 564}:contains (action_message['Param 1']) then  windower.play_sound (windower.addon_path .. "FFaudio/Magic Evasion Down.wav")

		--Status wearing
				elseif action_message['Param 1'] == 8   then windower.play_sound (windower.addon_path .. "FFaudio/Disease.wav")
				elseif action_message['Param 1'] == 10  then windower.play_sound (windower.addon_path .. "FFaudio/Stun.wav")
				elseif action_message['Param 1'] == 15  then windower.play_sound (windower.addon_path .. "FFaudio/Doom.wav")
				elseif action_message['Param 1'] == 16  then windower.play_sound (windower.addon_path .. "FFaudio/Amnesia.wav")
				elseif action_message['Param 1'] == 28  then windower.play_sound (windower.addon_path .. "FFaudio/Terror.wav")
				elseif action_message['Param 1'] == 31  then windower.play_sound (windower.addon_path .. "FFaudio/Virus.wav")
				elseif action_message['Param 1'] == 22  then windower.play_sound (windower.addon_path .. "FFaudio/Intimidate.wav")
				elseif action_message['Param 1'] == 155 then windower.play_sound (windower.addon_path .. "FFaudio/Medicate.wav")
				elseif action_message['Param 1'] == 156 then windower.play_sound (windower.addon_path .. "FFaudio/Flash.wav")
				elseif T{9, 20}   :contains (action_message['Param 1']) then  windower.play_sound (windower.addon_path .. "FFaudio/Curse.wav")
				elseif T{14, 17}  :contains (action_message['Param 1']) then  windower.play_sound (windower.addon_path .. "FFaudio/Charm.wav")
				elseif T{177, 259}:contains (action_message['Param 1']) then  windower.play_sound (windower.addon_path .. "FFaudio/Encumbrance.wav")

		--Helix
				elseif action_message['Param 1'] == 23  then windower.play_sound (windower.addon_path .. "FFaudio/Kaustra.wav")
				elseif action_message['Param 1'] == 186 then windower.play_sound (windower.addon_path .. "FFaudio/Helix.wav")

		--Down Syndrome's
				elseif action_message['Param 1'] == 136 then windower.play_sound (windower.addon_path .. "FFaudio/Strength Down.wav")
				elseif action_message['Param 1'] == 137 then windower.play_sound (windower.addon_path .. "FFaudio/Dexterity Down.wav")
				elseif action_message['Param 1'] == 138 then windower.play_sound (windower.addon_path .. "FFaudio/Agility Down.wav")
				elseif action_message['Param 1'] == 139 then windower.play_sound (windower.addon_path .. "FFaudio/Vitality Down.wav")
				elseif action_message['Param 1'] == 140 then windower.play_sound (windower.addon_path .. "FFaudio/Intelligence Down.wav")
				elseif action_message['Param 1'] == 141 then windower.play_sound (windower.addon_path .. "FFaudio/Mind Down.wav")
				elseif action_message['Param 1'] == 142 then windower.play_sound (windower.addon_path .. "FFaudio/Charisma Down.wav")
				elseif T{146, 561}:contains (action_message['Param 1']) then windower.play_sound (windower.addon_path .. "FFaudio/Accuracy Down.wav")
				elseif T{147, 557}:contains (action_message['Param 1']) then windower.play_sound (windower.addon_path .. "FFaudio/Attack Down.wav")
				elseif T{149, 558}:contains (action_message['Param 1']) then windower.play_sound (windower.addon_path .. "FFaudio/Defense Down.wav")
				elseif T{174, 565}:contains (action_message['Param 1']) then windower.play_sound (windower.addon_path .. "FFaudio/Magic Accuracy Down.wav")
				elseif T{167, 560}:contains (action_message['Param 1']) then windower.play_sound (windower.addon_path .. "FFaudio/Magic Defense Down.wav")
				elseif T{175, 559}:contains (action_message['Param 1']) then windower.play_sound (windower.addon_path .. "FFaudio/Magic Attack Down.wav")

		--Bard Enfeebs 
				elseif action_message['Param 1'] == 192 then windower.play_sound (windower.addon_path .. "FFaudio/Requiem.wav")
				elseif action_message['Param 1'] == 194 then windower.play_sound (windower.addon_path .. "FFaudio/Elegy.wav")
				elseif action_message['Param 1'] == 217 then windower.play_sound (windower.addon_path .. "FFaudio/Threnody.wav")
				elseif action_message['Param 1'] == 223 then windower.play_sound (windower.addon_path .. "FFaudio/Nocturne.wav")

		--Elemental Dots
				elseif action_message['Param 1'] == 128 then windower.play_sound (windower.addon_path .. "FFaudio/Burn.wav")
				elseif action_message['Param 1'] == 129 then windower.play_sound (windower.addon_path .. "FFaudio/Frost.wav")
				elseif action_message['Param 1'] == 130 then windower.play_sound (windower.addon_path .. "FFaudio/Choke.wav")
				elseif action_message['Param 1'] == 131 then windower.play_sound (windower.addon_path .. "FFaudio/Rasp.wav")
				elseif action_message['Param 1'] == 132 then windower.play_sound (windower.addon_path .. "FFaudio/Shock.wav")
				elseif action_message['Param 1'] == 133 then windower.play_sound (windower.addon_path .. "FFaudio/Drown.wav")
				elseif action_message['Param 1'] == 135 then windower.play_sound (windower.addon_path .. "FFaudio/Bio.wav")

		--Enspells
				elseif action_message['Param 1'] == 274  then windower.play_sound (windower.addon_path .. "FFaudio/Enlight.wav")
				elseif action_message['Param 1'] == 288  then windower.play_sound (windower.addon_path .. "FFaudio/Endark.wav")
				elseif T{94, 277}:contains (action_message['Param 1']) then windower.play_sound (windower.addon_path .. "FFaudio/Enfire.wav")
				elseif T{95, 278}:contains (action_message['Param 1']) then windower.play_sound (windower.addon_path .. "FFaudio/EEnblizzard.wav")
				elseif T{96, 279}:contains (action_message['Param 1']) then windower.play_sound (windower.addon_path .. "FFaudio/Enaero.wav")
				elseif T{97, 280}:contains (action_message['Param 1']) then windower.play_sound (windower.addon_path .. "FFaudio/Enstone.wav")
				elseif T{98, 281}:contains (action_message['Param 1']) then windower.play_sound (windower.addon_path .. "FFaudio/Enthunder.wav")
				elseif T{99, 282}:contains (action_message['Param 1']) then windower.play_sound (windower.addon_path .. "FFaudio/Enwater.wav")

		--Storms
				elseif T{178, 589}:contains (action_message['Param 1']) then windower.play_sound (windower.addon_path .. "FFaudio/Firestorm.wav")
				elseif T{179, 590}:contains (action_message['Param 1']) then windower.play_sound (windower.addon_path .. "FFaudio/Hailstorm.wav")
				elseif T{180, 591}:contains (action_message['Param 1']) then windower.play_sound (windower.addon_path .. "FFaudio/Windstorm.wav")
				elseif T{181, 592}:contains (action_message['Param 1']) then windower.play_sound (windower.addon_path .. "FFaudio/Sandstorm.wav")
				elseif T{182, 593}:contains (action_message['Param 1']) then windower.play_sound (windower.addon_path .. "FFaudio/Thunderstorm.wav")
				elseif T{183, 594}:contains (action_message['Param 1']) then windower.play_sound (windower.addon_path .. "FFaudio/Rainstorm.wav")
				elseif T{184, 595}:contains (action_message['Param 1']) then windower.play_sound (windower.addon_path .. "FFaudio/Aurorastorm.wav")
				elseif T{185, 596}:contains (action_message['Param 1']) then windower.play_sound (windower.addon_path .. "FFaudio/Voidstorm.wav")

		--Negates/Buffers
				elseif action_message['Param 1'] == 293 then windower.play_sound (windower.addon_path .. "FFaudio/Negate Petrify.wav")
				elseif action_message['Param 1'] == 294 then windower.play_sound (windower.addon_path .. "FFaudio/Negate Terror.wav")
				elseif action_message['Param 1'] == 295 then windower.play_sound (windower.addon_path .. "FFaudio/Negate Amnesia.wav")
				elseif action_message['Param 1'] == 296 then windower.play_sound (windower.addon_path .. "FFaudio/Negate Doom.wav")
				elseif action_message['Param 1'] == 297 then windower.play_sound (windower.addon_path .. "FFaudio/Negate Poison.wav")
				elseif action_message['Param 1'] == 608 then windower.play_sound (windower.addon_path .. "FFaudio/Negate Virus.wav")
				elseif action_message['Param 1'] == 609 then windower.play_sound (windower.addon_path .. "FFaudio/Negate Curse.wav")
				elseif action_message['Param 1'] == 610 then windower.play_sound (windower.addon_path .. "FFaudio/Negate Charm.wav")
				elseif action_message['Param 1'] == 626 then windower.play_sound (windower.addon_path .. "FFaudio/Negate Sleep.wav")

		--Attribute Boost
				elseif T{80, 119, 542}:contains (action_message['Param 1']) then windower.play_sound (windower.addon_path .. "FFaudio/STR Boost.wav")
				elseif T{81, 120, 543}:contains (action_message['Param 1']) then windower.play_sound (windower.addon_path .. "FFaudio/DEX Boost.wav")
				elseif T{82, 121, 544}:contains (action_message['Param 1']) then windower.play_sound (windower.addon_path .. "FFaudio/VIT Boost.wav")
				elseif T{83, 122, 545}:contains (action_message['Param 1']) then windower.play_sound (windower.addon_path .. "FFaudio/AGI Boost.wav")
				elseif T{84, 123, 546}:contains (action_message['Param 1']) then windower.play_sound (windower.addon_path .. "FFaudio/INT Boost.wav")
				elseif T{85, 124, 547}:contains (action_message['Param 1']) then windower.play_sound (windower.addon_path .. "FFaudio/MND Boost.wav")
				elseif T{86, 125, 548}:contains (action_message['Param 1']) then windower.play_sound (windower.addon_path .. "FFaudio/CHR Boost.wav")

		--Bar Elements
				elseif action_message['Param 1'] == 100 then windower.play_sound (windower.addon_path .. "FFaudio/Barfire.wav")
				elseif action_message['Param 1'] == 101 then windower.play_sound (windower.addon_path .. "FFaudio/Barblizzard.wav")
				elseif action_message['Param 1'] == 102 then windower.play_sound (windower.addon_path .. "FFaudio/Baraero.wav")
				elseif action_message['Param 1'] == 103 then windower.play_sound (windower.addon_path .. "FFaudio/Barstone.wav")
				elseif action_message['Param 1'] == 104 then windower.play_sound (windower.addon_path .. "FFaudio/Barthunder.wav")
				elseif action_message['Param 1'] == 105 then windower.play_sound (windower.addon_path .. "FFaudio/Barwater.wav")

		--Bar Ailments
				elseif action_message['Param 1'] == 106 then windower.play_sound (windower.addon_path .. "FFaudio/Barsleep.wav")
				elseif action_message['Param 1'] == 107 then windower.play_sound (windower.addon_path .. "FFaudio/Barpoison.wav")
				elseif action_message['Param 1'] == 108 then windower.play_sound (windower.addon_path .. "FFaudio/Barparalyze.wav")
				elseif action_message['Param 1'] == 109 then windower.play_sound (windower.addon_path .. "FFaudio/Barblind.wav")
				elseif action_message['Param 1'] == 110 then windower.play_sound (windower.addon_path .. "FFaudio/Barsilence.wav")
				elseif action_message['Param 1'] == 111 then windower.play_sound (windower.addon_path .. "FFaudio/Barpetrify.wav")
				elseif action_message['Param 1'] == 112 then windower.play_sound (windower.addon_path .. "FFaudio/Barvirus.wav")
				elseif action_message['Param 1'] == 286 then windower.play_sound (windower.addon_path .. "FFaudio/Baramnesia.wav")

		--Dancer Steps
				elseif action_message['Param 1'] >= 386 and action_message['Param 1'] <= 390 then windower.play_sound (windower.addon_path .. "FFaudio/Quick Step.wav")
				elseif action_message['Param 1'] >= 391 and action_message['Param 1'] <= 395 then windower.play_sound (windower.addon_path .. "FFaudio/Box Step.wav")
				elseif action_message['Param 1'] >= 396 and action_message['Param 1'] <= 400 then windower.play_sound (windower.addon_path .. "FFaudio/Stutter Step.wav")
				elseif action_message['Param 1'] >= 448 and action_message['Param 1'] <= 452 then windower.play_sound (windower.addon_path .. "FFaudio/Feather Step.wav")
				end
			end

		--Bard
			if action_message['Actor'] == windower.ffxi.get_player().id then
				if     action_message['Param 1'] == 52  then windower.play_sound (windower.addon_path .. "FFaudio/Soul Voice.wav")
				elseif action_message['Param 1'] == 231 then windower.play_sound (windower.addon_path .. "FFaudio/Marcato.wav")
				elseif action_message['Param 1'] == 347 then windower.play_sound (windower.addon_path .. "FFaudio/Nightingale.wav")
				elseif action_message['Param 1'] == 348 then windower.play_sound (windower.addon_path .. "FFaudio/Troubadour.wav")
				elseif action_message['Param 1'] == 409 then windower.play_sound (windower.addon_path .. "FFaudio/Pianissimo.wav")
				elseif action_message['Param 1'] == 455 then windower.play_sound (windower.addon_path .. "FFaudio/Tenuto.wav")
				elseif action_message['Param 1'] == 499 then windower.play_sound (windower.addon_path .. "FFaudio/Clarion Call.wav")
				end
			end

		--Black Mage
			if action_message['Actor'] == windower.ffxi.get_player().id then
				if     action_message['Param 1'] == 47  then windower.play_sound (windower.addon_path .. "FFaudio/Manafont.wav")
				elseif action_message['Param 1'] == 79  then windower.play_sound (windower.addon_path .. "FFaudio/Elemental Seal.wav")
				elseif action_message['Param 1'] == 229 then windower.play_sound (windower.addon_path .. "FFaudio/Manawell.wav")
				elseif action_message['Param 1'] == 437 then windower.play_sound (windower.addon_path .. "FFaudio/Mana Wall.wav")
				elseif action_message['Param 1'] == 493 then windower.play_sound (windower.addon_path .. "FFaudio/Subtle Sorcery.wav")
				elseif action_message['Param 1'] == 598 then windower.play_sound (windower.addon_path .. "FFaudio/Cascade.wav")
				end
			end

		--Blue Mage
			if action_message['Actor'] == windower.ffxi.get_player().id then
				if     action_message['Param 1'] == 163 then windower.play_sound (windower.addon_path .. "FFaudio/Azure Lore.wav")
				elseif action_message['Param 1'] == 164 then windower.play_sound (windower.addon_path .. "FFaudio/Chain Affinity.wav")
				elseif action_message['Param 1'] == 165 then windower.play_sound (windower.addon_path .. "FFaudio/Burst Affinity.wav")
				elseif action_message['Param 1'] == 355 then windower.play_sound (windower.addon_path .. "FFaudio/Convergence.wav")
				elseif action_message['Param 1'] == 356 then windower.play_sound (windower.addon_path .. "FFaudio/Diffusion.wav")
				elseif action_message['Param 1'] == 457 then windower.play_sound (windower.addon_path .. "FFaudio/Efflux.wav")
				elseif action_message['Param 1'] == 485 then windower.play_sound (windower.addon_path .. "FFaudio/Unbridled Learning.wav")
				elseif action_message['Param 1'] == 505 then windower.play_sound (windower.addon_path .. "FFaudio/Unbridled Wisdom.wav")
				end
			end

		--Corsair
			if action_message['Actor'] == windower.ffxi.get_player().id then
				if     action_message['Param 1'] == 308 then windower.play_sound (windower.addon_path .. "FFaudio/Double Up.wav")
				elseif action_message['Param 1'] == 357 then windower.play_sound (windower.addon_path .. "FFaudio/Snake Eye.wav")
				elseif action_message['Param 1'] == 467 then windower.play_sound (windower.addon_path .. "FFaudio/Triple Shot.wav")
				elseif action_message['Param 1'] == 601 then windower.play_sound (windower.addon_path .. "FFaudio/Crooked Cards.wav")
				end
			end

		--Dancer
			if action_message['Actor'] == windower.ffxi.get_player().id then
				if     action_message['Param 1'] == 376 then windower.play_sound (windower.addon_path .. "FFaudio/Trance.wav")
				elseif action_message['Param 1'] == 410 then windower.play_sound (windower.addon_path .. "FFaudio/Saber Dance.wav")
				elseif action_message['Param 1'] == 411 then windower.play_sound (windower.addon_path .. "FFaudio/Fan Dance.wav")
				elseif action_message['Param 1'] == 442 then windower.play_sound (windower.addon_path .. "FFaudio/Presto.wav")
				elseif action_message['Param 1'] == 468 then windower.play_sound (windower.addon_path .. "FFaudio/Drain Samba.wav")
				elseif action_message['Param 1'] == 469 then windower.play_sound (windower.addon_path .. "FFaudio/Aspir Samba.wav")
				elseif action_message['Param 1'] == 470 then windower.play_sound (windower.addon_path .. "FFaudio/Haste Samba.wav")
				elseif action_message['Param 1'] == 507 then windower.play_sound (windower.addon_path .. "FFaudio/Grand Pas.wav")
				elseif action_message['Param 1'] == 582 then windower.play_sound (windower.addon_path .. "FFaudio/Contradance.wav")
				end
			end

		--Dark Knight
			if action_message['Actor'] == windower.ffxi.get_player().id then
				if     action_message['Param 1'] == 51  then windower.play_sound (windower.addon_path .. "FFaudio/Blood Weapon.wav")
				elseif action_message['Param 1'] == 63  then windower.play_sound (windower.addon_path .. "FFaudio/Souleater.wav")
				elseif action_message['Param 1'] == 64  then windower.play_sound (windower.addon_path .. "FFaudio/Last Resort.wav")
				elseif action_message['Param 1'] == 75  then windower.play_sound (windower.addon_path .. "FFaudio/Arcane Circle.wav")
				elseif action_message['Param 1'] == 345 then windower.play_sound (windower.addon_path .. "FFaudio/Dark Seal.wav")
				elseif action_message['Param 1'] == 436 then windower.play_sound (windower.addon_path .. "FFaudio/Diabolic Eye.wav")
				elseif action_message['Param 1'] == 439 then windower.play_sound (windower.addon_path .. "FFaudio/Nether Void.wav")
				elseif action_message['Param 1'] == 464 then windower.play_sound (windower.addon_path .. "FFaudio/Arcane Crest.wav")
				elseif action_message['Param 1'] == 479 then windower.play_sound (windower.addon_path .. "FFaudio/Scarlet Delirium.wav")
				elseif action_message['Param 1'] == 497 then windower.play_sound (windower.addon_path .. "FFaudio/Soul Enslavement.wav")
				elseif action_message['Param 1'] == 599 then windower.play_sound (windower.addon_path .. "FFaudio/Consume Mana.wav")
				end
			end

		--Dragoon
			if action_message['Actor'] == windower.ffxi.get_player().id then
				if     action_message['Param 1'] == 118 then windower.play_sound (windower.addon_path .. "FFaudio/Ancient Circle.wav")
				elseif action_message['Param 1'] == 126 then windower.play_sound (windower.addon_path .. "FFaudio/Spirit Surge.wav")
				elseif action_message['Param 1'] == 466 then windower.play_sound (windower.addon_path .. "FFaudio/Dragon Breaker.wav")
				elseif action_message['Param 1'] == 503 then windower.play_sound (windower.addon_path .. "FFaudio/Fly High.wav")
				elseif action_message['Param 1'] == 619 then windower.play_sound (windower.addon_path .. "FFaudio/Spirit Bond.wav")
				end
			end

		--Geomancer
			if action_message['Actor'] == windower.ffxi.get_player().id then
				if     action_message['Param 1'] == 508 then windower.play_sound (windower.addon_path .. "FFaudio/Widened Compass.wav")
				elseif action_message['Param 1'] == 513 then windower.play_sound (windower.addon_path .. "FFaudio/Bolster.wav")
				elseif action_message['Param 1'] == 517 then windower.play_sound (windower.addon_path .. "FFaudio/Collimated Fervor.wav")
				elseif action_message['Param 1'] == 518 then windower.play_sound (windower.addon_path .. "FFaudio/Dematerialize.wav")
				elseif action_message['Param 1'] == 519 then windower.play_sound (windower.addon_path .. "FFaudio/Theurgic Focus.wav")
				elseif action_message['Param 1'] == 569 then windower.play_sound (windower.addon_path .. "FFaudio/Blaze of Glory.wav")
				elseif action_message['Param 1'] == 584 then windower.play_sound (windower.addon_path .. "FFaudio/Entrust.wav")
				end
			end

		--Monk
			if action_message['Actor'] == windower.ffxi.get_player().id then
				if     action_message['Param 1'] == 46  then windower.play_sound (windower.addon_path .. "FFaudio/Hundred Fists.wav")
				elseif action_message['Param 1'] == 59  then windower.play_sound (windower.addon_path .. "FFaudio/Focus.wav")
				elseif action_message['Param 1'] == 60  then windower.play_sound (windower.addon_path .. "FFaudio/Dodge.wav")
				elseif action_message['Param 1'] == 61  then windower.play_sound (windower.addon_path .. "FFaudio/Counterstance.wav")
				elseif action_message['Param 1'] == 88  then windower.play_sound (windower.addon_path .. "FFaudio/Mantra.wav")
				elseif action_message['Param 1'] == 341 then windower.play_sound (windower.addon_path .. "FFaudio/Formless Strikes.wav")
				elseif action_message['Param 1'] == 406 then windower.play_sound (windower.addon_path .. "FFaudio/Footwork.wav")
				elseif action_message['Param 1'] == 436 then windower.play_sound (windower.addon_path .. "FFaudio/Perfect Counter.wav")
				elseif action_message['Param 1'] == 461 then windower.play_sound (windower.addon_path .. "FFaudio/Impetus.wav")
				elseif action_message['Param 1'] == 491 then windower.play_sound (windower.addon_path .. "FFaudio/Inner Strength.wav")
				elseif action_message['Param 1'] == 615 then windower.play_sound (windower.addon_path .. "FFaudio/Boost.wav")
				end
			end

		--Ninja
			if action_message['Actor'] == windower.ffxi.get_player().id then
				if     action_message['Param 1'] == 352 then windower.play_sound (windower.addon_path .. "FFaudio/Sange.wav")
				elseif action_message['Param 1'] == 420 then windower.play_sound (windower.addon_path .. "FFaudio/Yonin.wav")
				elseif action_message['Param 1'] == 421 then windower.play_sound (windower.addon_path .. "FFaudio/Innin.wav")
				elseif action_message['Param 1'] == 441 then windower.play_sound (windower.addon_path .. "FFaudio/Futae.wav")
				elseif action_message['Param 1'] == 484 then windower.play_sound (windower.addon_path .. "FFaudio/Issekigan.wav")
				elseif action_message['Param 1'] == 502 then windower.play_sound (windower.addon_path .. "FFaudio/Mikage.wav")
				end
			end

		--Paladin
			if action_message['Actor'] == windower.ffxi.get_player().id then
				if     action_message['Param 1'] == 50  then windower.play_sound (windower.addon_path .. "FFaudio/Invincible.wav")
				elseif action_message['Param 1'] == 62  then windower.play_sound (windower.addon_path .. "FFaudio/Sentinel.wav")
				elseif action_message['Param 1'] == 74  then windower.play_sound (windower.addon_path .. "FFaudio/Holy Circle.wav")
				elseif action_message['Param 1'] == 114 then windower.play_sound (windower.addon_path .. "FFaudio/Cover.wav")
				elseif action_message['Param 1'] == 344 then windower.play_sound (windower.addon_path .. "FFaudio/Fealty.wav")
				elseif action_message['Param 1'] == 438 then windower.play_sound (windower.addon_path .. "FFaudio/Divine Emblem.wav")
				elseif action_message['Param 1'] == 463 then windower.play_sound (windower.addon_path .. "FFaudio/Sepulcher.wav")
				elseif action_message['Param 1'] == 478 then windower.play_sound (windower.addon_path .. "FFaudio/Palisade.wav")
				elseif action_message['Param 1'] == 496 then windower.play_sound (windower.addon_path .. "FFaudio/Intervene.wav")
				elseif action_message['Param 1'] == 621 then windower.play_sound (windower.addon_path .. "FFaudio/Majesty.wav")
				elseif action_message['Param 1'] == 623 then windower.play_sound (windower.addon_path .. "FFaudio/Rampart.wav")
				end
			end

		--Ranger
			if action_message['Actor'] == windower.ffxi.get_player().id then
				if     action_message['Param 1'] == 72  then windower.play_sound (windower.addon_path .. "FFaudio/Sharpshot.wav")
				elseif action_message['Param 1'] == 73  then windower.play_sound (windower.addon_path .. "FFaudio/Barrage.wav")
				elseif action_message['Param 1'] == 77  then windower.play_sound (windower.addon_path .. "FFaudio/Camouflage.wav")
				elseif action_message['Param 1'] == 115 then windower.play_sound (windower.addon_path .. "FFaudio/Unlimited Shot.wav")
				elseif action_message['Param 1'] == 350 then windower.play_sound (windower.addon_path .. "FFaudio/Stealth Shot.wav")
				elseif action_message['Param 1'] == 351 then windower.play_sound (windower.addon_path .. "FFaudio/Flashy Shot.wav")
				elseif action_message['Param 1'] == 371 then windower.play_sound (windower.addon_path .. "FFaudio/Velocity Shot.wav")
				elseif action_message['Param 1'] == 433 then windower.play_sound (windower.addon_path .. "FFaudio/Double Shot.wav")
				elseif action_message['Param 1'] == 482 then windower.play_sound (windower.addon_path .. "FFaudio/Decoy Shot.wav")
				elseif action_message['Param 1'] == 500 then windower.play_sound (windower.addon_path .. "FFaudio/Overkill.wav")
				elseif action_message['Param 1'] == 628 then windower.play_sound (windower.addon_path .. "FFaudio/Hover Shot.wav")
				end
			end

		--Red Mage
			if action_message['Actor'] == windower.ffxi.get_player().id then
				if     action_message['Param 1'] == 48  then windower.play_sound (windower.addon_path .. "FFaudio/Chainspell.wav")
				elseif action_message['Param 1'] == 230 then windower.play_sound (windower.addon_path .. "FFaudio/Spontaneity.wav")
				elseif action_message['Param 1'] == 419 then windower.play_sound (windower.addon_path .. "FFaudio/Composure.wav")
				elseif action_message['Param 1'] == 454 then windower.play_sound (windower.addon_path .. "FFaudio/Saboteur.wav")
				elseif action_message['Param 1'] == 494 then windower.play_sound (windower.addon_path .. "FFaudio/Stymie.wav")
				end
			end

		--Samurai
			if action_message['Actor'] == windower.ffxi.get_player().id then
				if     action_message['Param 1'] == 54  then windower.play_sound (windower.addon_path .. "FFaudio/Meikyo Shisui.wav")
				elseif action_message['Param 1'] == 67  then windower.play_sound (windower.addon_path .. "FFaudio/Third Eye.wav")
				elseif action_message['Param 1'] == 117 then windower.play_sound (windower.addon_path .. "FFaudio/Warding Circle.wav")
				elseif action_message['Param 1'] == 353 then windower.play_sound (windower.addon_path .. "FFaudio/Hasso.wav")
				elseif action_message['Param 1'] == 354 then windower.play_sound (windower.addon_path .. "FFaudio/Seigan.wav")
				elseif action_message['Param 1'] == 408 then windower.play_sound (windower.addon_path .. "FFaudio/Sekkanoki.wav")
				elseif action_message['Param 1'] == 440 then windower.play_sound (windower.addon_path .. "FFaudio/Sengikori.wav")
				elseif action_message['Param 1'] == 483 then windower.play_sound (windower.addon_path .. "FFaudio/Hagakure.wav")
				elseif action_message['Param 1'] == 501 then windower.play_sound (windower.addon_path .. "FFaudio/Yaegasumi.wav")
				end
			end

		--Scholar
			if action_message['Actor'] == windower.ffxi.get_player().id then
				if     action_message['Param 1'] == 358 then windower.play_sound (windower.addon_path .. "FFaudio/Light Arts.wav")
				elseif action_message['Param 1'] == 359 then windower.play_sound (windower.addon_path .. "FFaudio/Dark Arts.wav")
				elseif action_message['Param 1'] == 360 then windower.play_sound (windower.addon_path .. "FFaudio/Penury.wav")
				elseif action_message['Param 1'] == 361 then windower.play_sound (windower.addon_path .. "FFaudio/Parsimony.wav")
				elseif action_message['Param 1'] == 362 then windower.play_sound (windower.addon_path .. "FFaudio/Celerity.wav")
				elseif action_message['Param 1'] == 363 then windower.play_sound (windower.addon_path .. "FFaudio/Alacrity.wav")
				elseif action_message['Param 1'] == 364 then windower.play_sound (windower.addon_path .. "FFaudio/Rapture.wav")
				elseif action_message['Param 1'] == 365 then windower.play_sound (windower.addon_path .. "FFaudio/Ebullience.wav")
				elseif action_message['Param 1'] == 366 then windower.play_sound (windower.addon_path .. "FFaudio/Accession.wav")
				elseif action_message['Param 1'] == 367 then windower.play_sound (windower.addon_path .. "FFaudio/Manifestation.wav")
				elseif action_message['Param 1'] == 377 then windower.play_sound (windower.addon_path .. "FFaudio/Tabula Rasa.wav")
				elseif action_message['Param 1'] == 401 then windower.play_sound (windower.addon_path .. "FFaudio/Addendum White.wav")
				elseif action_message['Param 1'] == 402 then windower.play_sound (windower.addon_path .. "FFaudio/Addendum Black.wav")
				elseif action_message['Param 1'] == 416 then windower.play_sound (windower.addon_path .. "FFaudio/Enlightenment.wav")
				elseif action_message['Param 1'] == 469 then windower.play_sound (windower.addon_path .. "FFaudio/Perpetuance.wav")
				elseif action_message['Param 1'] == 470 then windower.play_sound (windower.addon_path .. "FFaudio/Immanence.wav")
				end
			end

		--Summoner
			if action_message['Actor'] == windower.ffxi.get_player().id then
				if     action_message['Param 1'] == 55  then windower.play_sound (windower.addon_path .. "FFaudio/Astral Flow.wav")
				elseif action_message['Param 1'] == 283 then windower.play_sound (windower.addon_path .. "FFaudio/Perfect Defense.wav")
				elseif action_message['Param 1'] == 431 then windower.play_sound (windower.addon_path .. "FFaudio/Avatars Favor.wav")
				elseif action_message['Param 1'] == 504 then windower.play_sound (windower.addon_path .. "FFaudio/Astral Conduit.wav")
				elseif action_message['Param 1'] == 583 then windower.play_sound (windower.addon_path .. "FFaudio/Apogee.wav")
				end
			end

		--Thief
			if action_message['Actor'] == windower.ffxi.get_player().id then
				if     action_message['Param 1'] == 32  then windower.play_sound (windower.addon_path .. "FFaudio/Flee.wav")
				elseif action_message['Param 1'] == 49  then windower.play_sound (windower.addon_path .. "FFaudio/Perfect Dodge.wav")
				elseif action_message['Param 1'] == 65  then windower.play_sound (windower.addon_path .. "FFaudio/Sneak Attack.wav")
				elseif action_message['Param 1'] == 76  then windower.play_sound (windower.addon_path .. "FFaudio/Hide.wav")
				elseif action_message['Param 1'] == 87  then windower.play_sound (windower.addon_path .. "FFaudio/Trick Attack.wav")
				elseif action_message['Param 1'] == 342 then windower.play_sound (windower.addon_path .. "FFaudio/Assassins Charge.wav")
				elseif action_message['Param 1'] == 343 then windower.play_sound (windower.addon_path .. "FFaudio/Feint.wav")
				elseif action_message['Param 1'] == 462 then windower.play_sound (windower.addon_path .. "FFaudio/Conspirator.wav")
				end
			end

		--Warrior
			if action_message['Actor'] == windower.ffxi.get_player().id then
				if     action_message['Param 1'] == 44  then windower.play_sound (windower.addon_path .. "FFaudio/Mighty Strikes.wav")
				elseif action_message['Param 1'] == 56  then windower.play_sound (windower.addon_path .. "FFaudio/Berserk.wav")
				elseif action_message['Param 1'] == 57  then windower.play_sound (windower.addon_path .. "FFaudio/Defender.wav")
				elseif action_message['Param 1'] == 58  then windower.play_sound (windower.addon_path .. "FFaudio/Aggressor.wav")
				elseif action_message['Param 1'] == 68  then windower.play_sound (windower.addon_path .. "FFaudio/Warcry.wav")
				elseif action_message['Param 1'] == 340 then windower.play_sound (windower.addon_path .. "FFaudio/Warriors Charge.wav")
				elseif action_message['Param 1'] == 405 then windower.play_sound (windower.addon_path .. "FFaudio/Retaliation.wav")
				elseif action_message['Param 1'] == 435 then windower.play_sound (windower.addon_path .. "FFaudio/Restraint.wav")
				elseif action_message['Param 1'] == 460 then windower.play_sound (windower.addon_path .. "FFaudio/Blood Rage.wav")
				elseif action_message['Param 1'] == 490 then windower.play_sound (windower.addon_path .. "FFaudio/Brazen Rush.wav")
				end
			end

		--White Mage
			if action_message['Actor'] == windower.ffxi.get_player().id then
				if     action_message['Param 1'] == 78  then windower.play_sound (windower.addon_path .. "FFaudio/Divine Seal.wav")
				elseif action_message['Param 1'] == 417 then windower.play_sound (windower.addon_path .. "FFaudio/Afflatus Solace.wav")
				elseif action_message['Param 1'] == 418 then windower.play_sound (windower.addon_path .. "FFaudio/Afflatus Misery.wav")
				elseif action_message['Param 1'] == 453 then windower.play_sound (windower.addon_path .. "FFaudio/Divine Caress.wav")
				elseif action_message['Param 1'] == 477 then windower.play_sound (windower.addon_path .. "FFaudio/Sacrosanctity.wav")
				elseif action_message['Param 1'] == 492 then windower.play_sound (windower.addon_path .. "FFaudio/Asylum.wav")
				end
			end

		--BST+PUP
			if action_message['Actor'] == windower.ffxi.get_player().id then
				if     action_message['Param 1'] == 166 then windower.play_sound (windower.addon_path .. "FFaudio/Overdrive.wav")
				elseif action_message['Param 1'] == 498 then windower.play_sound (windower.addon_path .. "FFaudio/Unleash.wav")
				end
		end
	end

		--Misc. for x029
				if     action_message["Message"] == 34  then windower.play_sound (windower.addon_path .. "FFaudio/MP.wav")
				elseif action_message["Message"] == 35  then windower.play_sound (windower.addon_path .. "FFaudio/No Tools.wav")
				elseif action_message["Message"] == 111 then windower.play_sound (windower.addon_path .. "FFaudio/Medicated.wav")
				elseif action_message["Message"] == 216 then windower.play_sound (windower.addon_path .. "FFaudio/No Ammo.wav")
				elseif action_message["Message"] == 563 then windower.play_sound (windower.addon_path .. "FFaudio/Luopan.wav")
				elseif action_message["Message"] == 584 then windower.play_sound (windower.addon_path .. "FFaudio/Trial.wav")
				elseif T{78, 198, 328}:contains (action_message["Message"]) then windower.play_sound (windower.addon_path .. "FFaudio/Too Far.wav")
				end
			end

end)