import argparse

functions = {
    "npc": {
        "onTrade": ("player, npc, trade",),
        "onTrigger": ("player, npc",),
        "onEventUpdate": ("player, csid, option, npc",),
        "onEventFinish": ("player, csid, option, npc",)
    },
    "mob": {
        "onMobInitialize": ("mob",),
        "onMobSpawn": ("mob",),
        "onMobRoam": ("mob, target",),
        "onMobEngage": ("mob, target",),
        "onMobFight": ("mob, target",),
        "onMagicCastingCheck": ("mob, target, spell",),
        "onSpellPrecast": ("mob, spell",),
        "onMagicHit": ("caster, target, spell",),
        "onCriticalHit": ("mob, attacker",),
        "onMobWeaponSkillPrepare": ("mob, target",),
        "onMobWeaponSkill": ("target, mob, skill",),
        "onMobDisengage": ("mob, target",),
        "onMobDeath": ("mob",),
        "onMobDespawn": ("mob",)
    },
    "zone": {
        "onInitialize": ("zone",),
        "onZoneIn": ("player, prevZone",),
        "onTriggerAreaEnter": ("player, triggerArea",),
        "onTriggerAreaLeave": ("player, triggerArea",),
        "onEventUpdate": ("player, csid, option, npc",),
        "onEventFinish": ("player, csid, option, npc",)
    },
    "item": {
        "onItemCheck": ("target",),
        "onItemUse": ("target",),
        "onEffectGain": ("target, effect",),
        "onEffectLose": ("target, effect",)
    }
}

module_path_formats = {
    "npc": "xi.zones.{zone_name}.npcs.{entity_name}",
    "mob": "xi.zones.{zone_name}.mobs.{entity_name}",
    "zone": "xi.zones.{entity_name}",
    "item": "xi.item.{entity_name}"
}

def gen_module(module_type, zone_name, zone_upper, entity_name, ensure_table):
    module_path = module_path_formats[module_type].format(zone_name=zone_name, entity_name=entity_name)
    print("-----------------------------------")
    print(f"-- {module_type.upper()}: {entity_name}")
    print("-----------------------------------")
    print("require('modules/module_utils')")
    print("-----------------------------------")
    if module_type == "zone":
        print(f"local ID = zones[xi.zone.{entity_name.upper()}]")
    elif module_type != "item":
        print(f"local ID = zones[xi.zone.{zone_upper}]")

    print("-----------------------------------")
    print(f"local m = Module:new('{entity_name}')\n")
    print(f"local modulePath = '{module_path}'\n")
    if ensure_table:
        print(f"ensureTable('{module_path}')\n")

    functions_to_generate = functions.get(module_type, {})
    for func, args in functions_to_generate.items():
        print(f"m:addOverride(modulePath .. '.{func}', function({', '.join(args)})\nend)\n")

    print("return m")

def main():
    parser = argparse.ArgumentParser(description='Generate override modules for various objects.')
    parser.add_argument('module_type', nargs='?', type=str, choices=['npc', 'mob', 'zone', 'item'], help='Type of object')
    parser.add_argument('--zone_name', type=str, help='LSB zone name')
    parser.add_argument('--entity_name', type=str, help='Entity name')
    parser.add_argument('--ensure_table', action='store_true', help='Use ensureTable')
    args = parser.parse_args()

    if not any(vars(args).values()):
        print("No arguments provided. Switching to interactive mode.")
        args.module_type = input("Select override type (npc/mob/zone/item): ").lower()
        if args.module_type != "item":
            args.zone_name = input("Enter LSB zone name (eg. Riverne-Site_A01): ")
        if args.module_type == "zone":
            args.entity_name = args.zone_name
        else:
            args.entity_name = input("Enter the object name: ")
        args.ensure_table = input("Would you like to use ensureTable? (y/n): ") == "y"

    if args.module_type == "item":
        zone_name = None
        zone_upper = None
        entity_name = args.entity_name
    elif args.module_type == "zone":
        zone_name = None
        zone_upper = None
        entity_name = args.zone_name
    else:
        zone_name = args.zone_name
        zone_upper = zone_name.upper()
        entity_name = args.entity_name

    print(f"Generating module for type: {args.module_type.upper()} in {args.zone_name}\n\n\n")
    gen_module(args.module_type, zone_name, zone_upper, entity_name, args.ensure_table)

if __name__ == "__main__":
    main()
