
/* EMOTE DATUMS */
/datum/emote/living
	mob_type_allowed_typecache = /mob/living
	mob_type_blacklist_typecache = list(/mob/living/simple_animal/slime, /mob/living/brain)

/datum/emote/living/blush
	key = "blush"
	key_third_person = "blushes"
	message = "blushes."

/datum/emote/living/bow
	key = "bow"
	key_third_person = "bows"
	message = "klania sie."
	message_param = "klania sie do %t."
	restraint_check = TRUE

/datum/emote/living/burp
	key = "burp"
	key_third_person = "burps"
	message = "beka."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/choke
	key = "choke"
	key_third_person = "chokes"
	message = "krztusi sie!"
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/cross
	key = "cross"
	key_third_person = "crosses"
	message = "krzyzuje ramiona."
	restraint_check = TRUE

/datum/emote/living/chuckle
	key = "chuckle"
	key_third_person = "chuckles"
	message = "chichocze."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/collapse
	key = "collapse"
	key_third_person = "collapses"
	message = "upada!"
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/collapse/run_emote(mob/user, params)
	. = ..()
	if(. && isliving(user))
		var/mob/living/L = user
		L.Unconscious(40)

/datum/emote/living/cough
	key = "cough"
	key_third_person = "coughs"
	message = "kaszle!"
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/cough/can_run_emote(mob/user, status_check = TRUE)
	. = ..()
	if(user.reagents && (user.reagents.get_reagent("menthol") || user.reagents.get_reagent("peppermint_patty")))
		return FALSE

/datum/emote/living/dance
	key = "dance"
	key_third_person = "dances"
	message = "tanczy."
	restraint_check = TRUE

/datum/emote/living/deathgasp
	key = "deathgasp"
	key_third_person = "deathgasps"
	message = "sztywnieje, a w oczach nie ma jakichkolwiek oznak zycia..."
	message_robot = "szamocze sie wsciekle po czym sztywnieje, jego oczy gasna...."
	message_AI = "wypuszcza iskry, jego ekran migocze a system sie zawiesza."
	message_alien = "wydaje zduszony ryk, a z jego ust wyplywa zielona krew..."
	message_larva = "wydaje syk po czym upada na posadzke..."
	message_monkey = "skrzeczy, upadajac na ziemie po czym przestaje sie ruszac..."
	message_simple =  "przestaje sie ruszac..."
	stat_allowed = UNCONSCIOUS

/datum/emote/living/deathgasp/run_emote(mob/user, params)
	var/mob/living/simple_animal/S = user
	if(istype(S) && S.deathmessage)
		message_simple = S.deathmessage
	. = ..()
	message_simple = initial(message_simple)
	if(. && user.deathsound)
		if(isliving(user))
			var/mob/living/L = user
			if(!L.can_speak_vocal() || L.oxyloss >= 50)
				return //stop the sound if oxyloss too high/cant speak
		playsound(user, user.deathsound, 80, 1, 1)

/datum/emote/living/smrut
    key = "sra"
    key_third_person = "zesral"
    message = "zesral sie i smierdzi"
    emote_type = EMOTE_AUDIBLE

/datum/emote/living/smrut/run_emote(mob/user, params)
    . = ..()
    if(. && isliving(user))
        playsound(user.loc, 'sound/misc/smrut.ogg', 50, 1, -1)
        var/offset = prob(50) ? -3 : 3
        animate(user, pixel_x = offset, time = 0.3, loop = 125)
        sleep(9)
        animate(user, pixel_x = 0)

/datum/emote/living/scream
	key = "scream"
	key_third_person = "screams"
	message = "krzyczy"

/datum/emote/living/drool
	key = "drool"
	key_third_person = "drools"
	message = "slini sie."

/datum/emote/living/faint
	key = "faint"
	key_third_person = "faints"
	message = "mdleje."

/datum/emote/living/faint/run_emote(mob/user, params)
	. = ..()
	if(. && isliving(user))
		var/mob/living/L = user
		L.SetSleeping(200)

/datum/emote/living/flap
	key = "flap"
	key_third_person = "flaps"
	message = "macha skrzydlami."
	restraint_check = TRUE
	var/wing_time = 20

/datum/emote/living/flap/run_emote(mob/user, params)
	. = ..()
	if(. && ishuman(user))
		var/mob/living/carbon/human/H = user
		var/open = FALSE
		if(H.dna.features["wings"] != "None")
			if("wingsopen" in H.dna.species.mutant_bodyparts)
				open = TRUE
				H.CloseWings()
			else
				H.OpenWings()
			addtimer(CALLBACK(H, open ? /mob/living/carbon/human.proc/OpenWings : /mob/living/carbon/human.proc/CloseWings), wing_time)

/datum/emote/living/flap/aflap
	key = "aflap"
	key_third_person = "aflaps"
	message = "macha skrzydlami AGRESYWNIE!"
	restraint_check = TRUE
	wing_time = 10

/datum/emote/living/frown
	key = "frown"
	key_third_person = "frowns"
	message = "wyglada na zadowolonego."

/datum/emote/living/gag
	key = "gag"
	key_third_person = "gags"
	message = "zartuje."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/gasp
	key = "gasp"
	key_third_person = "gasps"
	message = "z trudem lapie powietrze!"
	emote_type = EMOTE_AUDIBLE
	stat_allowed = UNCONSCIOUS

/datum/emote/living/giggle
	key = "giggle"
	key_third_person = "giggles"
	message = "giggles."
	message_mime = "chichocze."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/glare
	key = "glare"
	key_third_person = "glares"
	message = "gapi sie."
	message_param = "gapi sie na %t."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/grin
	key = "grin"
	key_third_person = "grins"
	message = "usmiecha sie."

/datum/emote/living/groan
	key = "groan"
	key_third_person = "groans"
	message = "steka!"
	message_mime = "wyglada jakby stekal!"

/datum/emote/living/grimace
	key = "grimace"
	key_third_person = "grimaces"
	message = "wykrzywia twarz."

/datum/emote/living/jump
	key = "jump"
	key_third_person = "jumps"
	message = "skacze jak pojebany!"
	restraint_check = TRUE

/datum/emote/living/kiss
	key = "kiss"
	key_third_person = "kisses"
	message = "caluje."
	message_param = "caluje %t."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/laugh
	key = "laugh"
	key_third_person = "laughs"
	message = "smieje sie."
	message_mime = "smieje sie bezdzwiecznie!"
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/laugh/can_run_emote(mob/living/user, status_check = TRUE)
	. = ..()
	if(. && iscarbon(user))
		var/mob/living/carbon/C = user
		return !C.silent

/datum/emote/living/laugh/run_emote(mob/user, params)
	. = ..()
	if(. && ishuman(user))
		var/mob/living/carbon/human/H = user
		if(H.dna.species.id == "human" && (!H.mind || !H.mind.miming))
			if(user.gender == FEMALE)
				playsound(H, 'sound/voice/human/womanlaugh.ogg', 50, 1)
			else
				playsound(H, pick('sound/voice/human/manlaugh1.ogg', 'sound/voice/human/manlaugh2.ogg'), 50, 1)

/datum/emote/living/look
	key = "look"
	key_third_person = "looks"
	message = "patrzy."
	message_param = "patrzy na %t."

/datum/emote/living/nod
	key = "nod"
	key_third_person = "nods"
	message = "stwierdzajaco kiwa glowa."
	message_param = "stwierdzajaco kiwa glowa do %t."

/datum/emote/living/point
	key = "point"
	key_third_person = "points"
	message = "wskazuje."
	message_param = "wskazuje na %t."
	restraint_check = TRUE

/datum/emote/living/point/run_emote(mob/user, params)
	message_param = initial(message_param) // reset
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		if(H.get_num_arms() == 0)
			if(H.get_num_legs() != 0)
				message_param = "probuje wskazac na %t noga, <span class='userdanger'>falling down</span> in the process!"
				H.Paralyze(20)
			else
				message_param = "<span class='userdanger'>bumps [user.p_their()] head on the ground</span> trying to motion towards %t."
				H.adjustBrainLoss(5)
	..()

/datum/emote/living/pout
	key = "pout"
	key_third_person = "pouts"
	message = "dasa sie."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/scream
	key = "scream"
	key_third_person = "screams"
	message = "krzyczy."
	message_mime = "udaje krzyk!"
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/scowl
	key = "scowl"
	key_third_person = "scowls"
	message = "groznie patrzy."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/shake
	key = "shake"
	key_third_person = "shakes"
	message = "przeczaco kiwa glowa."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/shiver
	key = "shiver"
	key_third_person = "shiver"
	message = "drzy z zimna."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/sigh
	key = "sigh"
	key_third_person = "sighs"
	message = "wzdycha."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/sit
	key = "sit"
	key_third_person = "sits"
	message = "siada."

/datum/emote/living/smile
	key = "smile"
	key_third_person = "smiles"
	message = "usmiecha sie."

/datum/emote/living/sneeze
	key = "sneeze"
	key_third_person = "sneezes"
	message = "kicha."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/smug
	key = "smug"
	key_third_person = "smugs"
	message = "usmiecha sie, zadowolony z siebie."

/datum/emote/living/sniff
	key = "sniff"
	key_third_person = "sniffs"
	message = "smarka."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/snore
	key = "snore"
	key_third_person = "snores"
	message = "chrapie."
	//message_mime = "chrapie."
	emote_type = EMOTE_AUDIBLE
	stat_allowed = UNCONSCIOUS

/datum/emote/living/stare
	key = "stare"
	key_third_person = "stares"
	message = "gapi sie."
	message_param = "gapi sie na %t."

/datum/emote/living/strech
	key = "stretch"
	key_third_person = "stretches"
	message = "rozciaga ramiona."

/datum/emote/living/sulk
	key = "sulk"
	key_third_person = "sulks"
	message = "staje sie posepny."

/datum/emote/living/surrender
	key = "surrender"
	key_third_person = "surrenders"
	message = "bierze rece za glowe i kladzie sie na ziemi, on sie poddaje!"
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/surrender/run_emote(mob/user, params)
	. = ..()
	if(. && isliving(user))
		var/mob/living/L = user
		L.Paralyze(200)

/datum/emote/living/sway
	key = "sway"
	key_third_person = "sways"
	message = "kreci sie wokol."

/datum/emote/living/tremble
	key = "tremble"
	key_third_person = "trembles"
	message = "trzesie sie ze strachu!"

/datum/emote/living/twitch
	key = "twitch"
	key_third_person = "twitches"
	message = "trzesie sie gwaltownie."

/datum/emote/living/twitch_s
	key = "twitch_s"
	message = "trzesie sie."

/datum/emote/living/wave
	key = "wave"
	key_third_person = "waves"
	message = "macha."

/datum/emote/living/whimper
	key = "whimper"
	key_third_person = "whimpers"
	message = "chlipe."
	message_mime = "wyglada na zranionego."

/datum/emote/living/wsmile
	key = "wsmile"
	key_third_person = "wsmiles"
	message = "usmiecha sie lekko."

/datum/emote/living/yawn
	key = "yawn"
	key_third_person = "yawns"
	message = "ziewa."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/custom
	key = "me"
	key_third_person = "custom"
	message = null

/datum/emote/living/custom/proc/check_invalid(mob/user, input)
	. = TRUE
	if(copytext(input,1,5) == "says")
		to_chat(user, "<span class='danger'>Zla egzaltacja.</span>")
	else if(copytext(input,1,9) == "exclaims")
		to_chat(user, "<span class='danger'>Zla egzaltacja.</span>")
	else if(copytext(input,1,6) == "yells")
		to_chat(user, "<span class='danger'>Zla egzaltacja.</span>")
	else if(copytext(input,1,5) == "asks")
		to_chat(user, "<span class='danger'>Zla egzaltacja.</span>")
	else
		. = FALSE

/datum/emote/living/custom/run_emote(mob/user, params, type_override = null)
	if(is_banned_from(user.ckey, "Emote"))
		to_chat(user, "Nie mozesz wysylac wlasnych egzaltacji (banned).")
		return FALSE
	else if(QDELETED(user))
		return FALSE
	else if(user.client && user.client.prefs.muted & MUTE_IC)
		to_chat(user, "Nie mozesz wysylac wiadomosci IC (uciszony).")
		return FALSE
	else if(!params)
		var/custom_emote = copytext(sanitize(input("Wybierz egzaltacje do pokazania.") as text|null), 1, MAX_MESSAGE_LEN)
		if(custom_emote && !check_invalid(user, custom_emote))
			var/type = input("Jest to egzaltacja widzialna czy slyszalna?") as null|anything in list("Widzialna", "Slyszalna")
			switch(type)
				if("Widzialna")
					emote_type = EMOTE_VISIBLE
				if("Slyszalna")
					emote_type = EMOTE_AUDIBLE
				else
					alert("Musi byc widzialna albo slyszalna, dzbanie.")
					return
			message = custom_emote
	else
		message = params
		if(type_override)
			emote_type = type_override
	. = ..()
	message = null
	emote_type = EMOTE_VISIBLE

/datum/emote/living/custom/replace_pronoun(mob/user, message)
	return message

/datum/emote/living/help
	key = "help"

/datum/emote/living/help/run_emote(mob/user, params)
	var/list/keys = list()
	var/list/message = list("dostepne egzaltacje, mozesz je uzyc wpisujac \"*emote\": ")

	var/datum/emote/E
	var/list/emote_list = E.emote_list
	for(var/e in emote_list)
		if(e in keys)
			continue
		E = emote_list[e]
		if(E.can_run_emote(user, status_check = FALSE))
			keys += E.key

	keys = sortList(keys)

	for(var/emote in keys)
		if(LAZYLEN(message) > 1)
			message += ", [emote]"
		else
			message += "[emote]"

	message += "."

	message = jointext(message, "")

	to_chat(user, message)

/datum/emote/sound/beep
	key = "beep"
	key_third_person = "beeps"
	message = "piszczy."
	message_param = "piszczy na %t."
	sound = 'sound/machines/twobeep.ogg'

/datum/emote/living/circle
	key = "circle"
	key_third_person = "circles"
	restraint_check = TRUE

/datum/emote/living/circle/run_emote(mob/user, params)
	. = ..()
	var/obj/item/circlegame/N = new(user)
	if(user.put_in_hands(N))
		to_chat(user, "<span class='notice'>Kreslisz okrag reka .</span>")
	else
		qdel(N)
		to_chat(user, "<span class='warning'>Nie masz wolnej reki, przestan walic konia.</span>")

/datum/emote/living/slap
	key = "slap"
	key_third_person = "slaps"
	restraint_check = TRUE

/datum/emote/living/slap/run_emote(mob/user, params)
	. = ..()
	if(!.)
		return
	var/obj/item/slapper/N = new(user)
	if(user.put_in_hands(N))
		to_chat(user, "<span class='notice'>You ready your slapping hand.</span>")
	else
		to_chat(user, "<span class='warning'>You're incapable of slapping in your current state.</span>")

/datum/emote/living/skurwysynie
	key = "skurwysyn"
	key_third_person = "skurwysynie"
	message = "wrzeszczy"
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/skurwysynie/run_emote(mob/user, params)
	message_simple = initial(message_simple)
	playsound(user.loc, 'sound/misc/skurwysynie.ogg', 50, 1, -1)