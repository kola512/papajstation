/datum/emote/living/carbon
	mob_type_allowed_typecache = list(/mob/living/carbon)

/datum/emote/living/carbon/airguitar
	key = "airguitar"
	message = "udaje ze gra na niewidzialnej gitarze."
	restraint_check = TRUE

/datum/emote/living/carbon/blink
	key = "blink"
	key_third_person = "blinks"
	message = "mruga."

/datum/emote/living/carbon/blink_r
	key = "blink_r"
	message = "bszybko mruga."

/datum/emote/living/carbon/clap
	key = "clap"
	key_third_person = "claps"
	message = "klaszcze."
	muzzle_ignore = TRUE
	restraint_check = TRUE
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/carbon/clap/run_emote(mob/living/user, params)
	. = ..()
	if (.)
		if (ishuman(user))
			// Need hands to clap
			if (!user.get_bodypart(BODY_ZONE_L_ARM) || !user.get_bodypart(BODY_ZONE_R_ARM))
				return
			var/clap = pick('sound/misc/clap1.ogg',
				            'sound/misc/clap2.ogg',
				            'sound/misc/clap3.ogg',
				            'sound/misc/clap4.ogg')
			playsound(user, clap, 50, 1, -1)

/datum/emote/living/carbon/gnarl
	key = "gnarl"
	key_third_person = "gnarls"
	message = "gnarls and shows its teeth..."
	mob_type_allowed_typecache = list(/mob/living/carbon/monkey, /mob/living/carbon/alien)

/datum/emote/living/carbon/moan
	key = "moan"
	key_third_person = "moans"
	message = "jeczy!"
	message_mime = "wyglada jakby jeczal!"
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/carbon/roll
	key = "roll"
	key_third_person = "rolls"
	message = "kreci sie."
	mob_type_allowed_typecache = list(/mob/living/carbon/monkey, /mob/living/carbon/alien)
	restraint_check = TRUE

/datum/emote/living/carbon/scratch
	key = "scratch"
	key_third_person = "scratches"
	message = "drapie."
	mob_type_allowed_typecache = list(/mob/living/carbon/monkey, /mob/living/carbon/alien)
	restraint_check = TRUE

/datum/emote/living/carbon/kraa
	key = "kraa"
	key_third_person = "kraaa"
	message = "KRAAAAAAAA"
	mob_type_allowed_typecache = list(/mob/living/carbon/monkey)

/datum/emote/living/carbon/kraa/run_emote(mob/user, params)
    . = ..()
    if(. && isliving(user))
        playsound(user.loc, 'sound/misc/kraaa.ogg', 50, 1, -1)
        var/offset = prob(50) ? -3 : 3
        animate(user, pixel_x = offset, time = 0.3, loop = 125)
        sleep(9)
        animate(user, pixel_x = 0)

/datum/emote/living/carbon/screech
	key = "screech"
	key_third_person = "screeches"
	message = "skrzeczy."
	mob_type_allowed_typecache = list(/mob/living/carbon/monkey, /mob/living/carbon/alien)

/datum/emote/living/carbon/sign
	key = "sign"
	key_third_person = "signs"
	message_param = "wskazuje na %t."
	mob_type_allowed_typecache = list(/mob/living/carbon/monkey, /mob/living/carbon/alien)
	restraint_check = TRUE

/datum/emote/living/carbon/sign/select_param(mob/user, params)
	. = ..()
	if(!isnum(text2num(params)))
		return message

/datum/emote/living/carbon/sign/signal
	key = "signal"
	key_third_person = "signals"
	message_param = "unosi %t palcow."
	mob_type_allowed_typecache = list(/mob/living/carbon/human)
	restraint_check = TRUE

/datum/emote/living/carbon/tail
	key = "tail"
	message = "macha ogonem."
	mob_type_allowed_typecache = list(/mob/living/carbon/monkey, /mob/living/carbon/alien)

/datum/emote/living/carbon/wink
	key = "wink"
	key_third_person = "winks"
	message = "mruga."
