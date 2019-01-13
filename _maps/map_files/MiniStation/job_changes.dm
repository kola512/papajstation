/*
	In this file we modify the job datums when the ministation.dm file is included/ticked.
	Since we will be overriden by the job datums, we have to modify the variables in the constructor.
*/
#define JOB_MODIFICATION_MAP_NAME "MiniStation"

/datum/job/New()
	..()
	supervisors = "the captain and the head of personnel"

/datum/job/assistant // Here so assistant appears on the top of the select job list.

// Command
/datum/job/ai/New()
	..()
	supervisors = "No ja nie wiem. Moze kapitan?"

/datum/job/captain/New()
	..()
	supervisors = "Nanotrasen and Central Command"

/datum/job/hop/New()
	..()
	supervisors = "the captain and Central Command"

/datum/job/hop/get_access()
	return get_all_accesses()

// Cargo

/datum/job/cargo_tech/New()
	..()
	MAP_JOB_CHECK
	total_positions = 3
	spawn_positions = 3
	access = list( ACCESS_MAINT_TUNNELS, ACCESS_MAILSORTING, ACCESS_CARGO, , ACCESS_QM, ACCESS_MINING, ACCESS_MINING_STATION)//ACCESS_CARGO_BOT, ACCESS_MINT
	minimal_access = list(ACCESS_MAINT_TUNNELS, ACCESS_CARGO, ACCESS_MINING, ACCESS_MINING_STATION, ACCESS_MAILSORTING)//ACCESS_CARGO_BOT, ACCESS_MINT

// ENGINEering

/datum/job/ENGINEer/New()
	..()
	total_positions = 4
	spawn_positions = 4
	access = list(ACCESS_EVA, ACCESS_ENGINE, ACCESS_ENGINE_EQUIP, ACCESS_TECH_STORAGE, ACCESS_MAINT_TUNNELS, ACCESS_EXTERNAL_AIRLOCKS, ACCESS_CONSTRUCTION, ACCESS_ATMOSPHERICS, ACCESS_TCOMSAT)
	minimal_access = list(ACCESS_ENGINE, ACCESS_ENGINE_EQUIP, ACCESS_TECH_STORAGE, ACCESS_MAINT_TUNNELS, ACCESS_EXTERNAL_AIRLOCKS, ACCESS_CONSTRUCTION, ACCESS_TCOMSAT, ACCESS_ATMOSPHERICS)

// Medical

/datum/job/doctor/New()
	..()
	total_positions = 4
	spawn_positions = 4
	access = list(ACCESS_MEDICAL, ACCESS_MORGUE, ACCESS_SURGERY, ACCESS_CHEMISTRY, ACCESS_VIROLOGY, ACCESS_GENETICS)
	minimal_access = list(ACCESS_MEDICAL, ACCESS_MORGUE, ACCESS_SURGERY)


/datum/job/chemist/New()
	..()
	total_positions = 1
	spawn_positions = 1
	access = list(ACCESS_MEDICAL, ACCESS_MORGUE, ACCESS_SURGERY, ACCESS_CHEMISTRY, ACCESS_VIROLOGY, ACCESS_GENETICS)
	minimal_access = list(ACCESS_MEDICAL, ACCESS_CHEMISTRY)

// Science

/datum/job/scientist/New()
	..()
	total_positions = 4
	spawn_positions = 4
	access = list(ACCESS_ROBOTICS, ACCESS_TOX, ACCESS_TOX_STORAGE, ACCESS_RESEARCH, ACCESS_XENOBIOLOGY)
	minimal_access = list(ACCESS_TOX, ACCESS_TOX_STORAGE, ACCESS_RESEARCH, ACCESS_XENOBIOLOGY, ACCESS_ROBOTICS)

// Security

/datum/job/detective/New()
	..()
	supervisors = "no one but yourself"
	access = list(ACCESS_SEC_DOORS, ACCESS_FORENSICS_LOCKERS, ACCESS_MORGUE, ACCESS_MAINT_TUNNELS, ACCESS_COURT, ACCESS_ENGINE)
	minimal_access = list(ACCESS_SEC_DOORS, ACCESS_FORENSICS_LOCKERS, ACCESS_MORGUE, ACCESS_MAINT_TUNNELS, ACCESS_COURT)

/datum/job/officer/New()
	..()
	total_positions = 4
	spawn_positions = 4
	access = list(ACCESS_SECURITY, ACCESS_SEC_DOORS, ACCESS_BRIG, ACCESS_COURT)
	minimal_access = list(ACCESS_SECURITY, ACCESS_SEC_DOORS, ACCESS_BRIG, ACCESS_COURT)

/*/obj/item/weapon/robot_module/miner/New()
	..()
	var/mining_type = MINETYPE
	if(mining_type == "mining")
		var/obj/item/stack/rods/cyborg/R = new /obj/item/stack/rods/cyborg(src)
		basic_modules += R
		add_module(R, FALSE, TRUE)*/