import struct

from BaseClasses import ItemClassification, Item, IntFlag
import typing
from typing import Dict

progression = ItemClassification.progression
filler = ItemClassification.filler
useful = ItemClassification.useful
trap = ItemClassification.trap


class KHRECItem(Item):
    game = 'Kingdom Hearts Re:Coded'


class ItemData(typing.NamedTuple):
    classification: ItemClassification
    khrecamount: int
    khrecaddress: int
    code: int = 0
    event: bool = False


item_table: Dict[str, ItemData] = {

    "Potion": ItemData(filler, 0, 0x1983F0),
    "Hi-Potion": ItemData(filler, 0, 0x1983F1),
    "Ether": ItemData(filler, 0, 0x1983F2),
    "Hi-Ether": ItemData(filler, 0, 0x1983F3),
    "Panacea": ItemData(filler, 0, 0x1983F4),
    "Elixir": ItemData(filler, 0, 0x1983F5),
    "Megalixir": ItemData(filler, 0, 0x1983F6),
    
    "Level Up": ItemData(progression, 49, 0x198400),
    "Blank Chip": ItemData(useful, 13, 0x198401),
    "HP +2": ItemData(useful, 14, 0x198402),
    "HP +4": ItemData(useful, 2, 0x198403),
    "HP +6": ItemData(useful, 1, 0x198404),
    "HP +8": ItemData(useful, 2, 0x198405),
    "Strength +1": ItemData(useful, 14, 0x198406),
    "Strength +2": ItemData(useful, 2, 0x198407),
    "Strength +3": ItemData(useful, 1, 0x198408),
    "Strength +4": ItemData(useful, 2, 0x198409),
    "Magic +1": ItemData(useful, 14, 0x19840A),
    "Magic +2": ItemData(useful, 2, 0x19840B),
    "Magic +3": ItemData(useful, 1, 0x19840C),
    "Magic +4": ItemData(useful, 2, 0x19840D),
    "Defense +1": ItemData(useful, 14, 0x19840E),
    "Defense +2": ItemData(useful, 1, 0x19840F),
    "Defense +3": ItemData(useful, 1, 0x198410),
    "Defense +4": ItemData(useful, 2, 0x198411),
    "Lucky Strike": ItemData(useful, 7, 0x198412),
    "Fire +1": ItemData(useful, 3, 0x198416),
    "Fire +2": ItemData(useful, 2, 0x198417),
    "Fire +3": ItemData(useful, 1, 0x198418),
    "Fire +4": ItemData(useful, 2, 0x198419),
    "Blizzard +1": ItemData(useful, 3, 0x19841A),
    "Blizzard +2": ItemData(useful, 2, 0x19841B),
    "Blizzard +3": ItemData(useful, 1, 0x19841C),
    "Blizzard +4": ItemData(useful, 2, 0x19841D),
    "Thunder +1": ItemData(useful, 3, 0x19841E),
    "Thunder +2": ItemData(useful, 1, 0x19841F),
    "Thunder +3": ItemData(useful, 1, 0x198420),
    "Thunder +4": ItemData(useful, 2, 0x198421),
    "Aero +1": ItemData(useful, 4, 0x198422),
    "Aero +2": ItemData(useful, 1, 0x198423),
    "Aero +3": ItemData(useful, 1, 0x198424),
    "Aero +4": ItemData(useful, 2, 0x198425),
    "Cure +1": ItemData(useful, 4, 0x198426),
    "Cure +2": ItemData(useful, 1, 0x198427),
    "Cure +3": ItemData(useful, 1, 0x198428),
    "Cure +4": ItemData(useful, 2, 0x198429),
    "Fire Resistance +1": ItemData(useful, 2, 0x19842A),
    "Fire Resistance +2": ItemData(useful, 2, 0x19842B),
    "Fire Resistance +3": ItemData(useful, 1, 0x19842C),
    "Fire Resistance +4": ItemData(useful, 2, 0x19842D),
    "Blizzard Resistance +1": ItemData(useful, 1, 0x19842E),
    "Blizzard Resistance +2": ItemData(useful, 2, 0x19842F),
    "Blizzard Resistance +3": ItemData(useful, 1, 0x198430),
    "Blizzard Resistance +4": ItemData(useful, 2, 0x198431),
    "Thunder Resistance +1": ItemData(useful, 1, 0x198432),
    "Thunder Resistance +2": ItemData(useful, 2, 0x198433),
    "Thunder Resistance +3": ItemData(useful, 1, 0x198434),
    "Thunder Resistance +4": ItemData(useful, 2, 0x198435),
    "Aero Resistance +1": ItemData(useful, 1, 0x198436),
    "Aero Resistance +2": ItemData(useful, 2, 0x198437),
    "Aero Resistance +3": ItemData(useful, 1, 0x198438),
    "Aero Resistance +4": ItemData(useful, 2, 0x198439),
    "Trophy Chip": ItemData(useful, 30, 0x198436),
    
    "Kingdom Key": ItemData(useful, 0, 0x198440),
    "Kingdom Key 1.5": ItemData(useful, 0, 0x198441),
    "Kingdom Key 2.0": ItemData(useful, 0, 0x198442),
    "Kingdom Key 2.5": ItemData(useful, 0, 0x198443),
    "Kingdom Key 3.0": ItemData(useful, 0, 0x198444),
    "Wishing Star": ItemData(useful, 1, 0x198445),
    "Wishing Star #": ItemData(useful, 0, 0x198446),
    "Wishing Star =#": ItemData(useful, 0, 0x198447),
    "Wishing Star ==#": ItemData(useful, 0, 0x198448),
    "Wishing Star ===#": ItemData(useful, 0, 0x198449),
    "Lady Luck": ItemData(useful, 1, 0x19844A),
    "Lady Luck 2": ItemData(useful, 0, 0x19844B),
    "Lady Luck 3": ItemData(useful, 0, 0x19844C),
    "Lady Luck 4": ItemData(useful, 0, 0x19844D),
    "Lady Luck 5": ItemData(useful, 0, 0x19844E),
    "Olympia": ItemData(useful, 1, 0x19844F),
    "Olympia Alpha": ItemData(useful, 0, 0x198450),
    "Olympia Beta": ItemData(useful, 0, 0x198451),
    "Olympia Gamma": ItemData(useful, 0, 0x198452),
    "Olympia Sigma": ItemData(useful, 0, 0x198453),
    "Three Wishes": ItemData(useful, 1, 0x198454),
    "Three Wishes II": ItemData(useful, 0, 0x198455),
    "Three Wishes III": ItemData(useful, 0, 0x198456),
    "Three Wishes IV": ItemData(useful, 0, 0x198457),
    "Three Wishes V": ItemData(useful, 0, 0x198458),
    "Oblivion": ItemData(useful, 1, 0x198459),
    "Oblivion: Wind": ItemData(useful, 0, 0x19845A),
    "Oblivion: Earth": ItemData(useful, 0, 0x19845B),
    "Oblivion: Sea": ItemData(useful, 0, 0x19845C),
    "Oblivion: Sky": ItemData(useful, 0, 0x19845D),
    "Zero/One": ItemData(useful, 1, 0x19845E),
    "Zero/One+": ItemData(useful, 0, 0x19845F),
    "Zero/One++": ItemData(useful, 0, 0x198460),
    "Zero/One+++": ItemData(useful, 0, 0x198461),
    "Zero/One++++": ItemData(useful, 0, 0x198462),
    "Oathkeeper": ItemData(useful, 1, 0x198463),
    "Oathkeeper: Mind": ItemData(useful, 0, 0x198464),
    "Oathkeeper: Love": ItemData(useful, 0, 0x198465),
    "Oathkeeper: Light": ItemData(useful, 0, 0x198466),
    "Oathkeeper: Heart": ItemData(useful, 0, 0x198467),
    "Metal Chocobo": ItemData(useful, 1, 0x198468),
    "Metal Chocobo: Fe": ItemData(useful, 0, 0x198469),
    "Metal Chocobo: Ag": ItemData(useful, 0, 0x19846A),
    "Metal Chocobo: Au": ItemData(useful, 0, 0x19846B),
    "Metal Chocobo: Pt": ItemData(useful, 0, 0x19846C),
    "Lionheart": ItemData(useful, 1, 0x19846D),
    "Lionheart Second Degree": ItemData(useful, 0, 0x19846E),
    "Lionheart Third Degree": ItemData(useful, 0, 0x19846F),
    "Lionheart Fourth Degree": ItemData(useful, 0, 0x198470),
    "Lionheart Fifth Degree": ItemData(useful, 0, 0x198471),
    "Ultima Weapon": ItemData(useful, 1, 0x198472),
    "Ultima Weapon >": ItemData(useful, 0, 0x198473),
    "Ultima Weapon >>": ItemData(useful, 0, 0x198474),
    "Ultima Weapon >>>": ItemData(useful, 0, 0x198475),
    "Ultima Weapon >>>>": ItemData(useful, 0, 0x198476),
    
    "Blade Rush": ItemData(useful, 1, 0x198480),
    "Energy Bomb": ItemData(useful, 1, 0x198481),
    "Faith": ItemData(useful, 1, 0x198482),
    "Mega Flare": ItemData(useful, 1, 0x198483),
    "Meteor Rain": ItemData(useful, 1, 0x198484),
    "Zone of Ruin": ItemData(useful, 1, 0x198485),
    "Speed Combo": ItemData(useful, 1, 0x198486),
    "Star Rave": ItemData(useful, 1, 0x198487),
    "Spinner Raw": ItemData(useful, 1, 0x198488),
    "D-Fira": ItemData(useful, 1, 0x198489),
    "D-Blizzara": ItemData(useful, 1, 0x19848A),
    "D-Thundara": ItemData(useful, 1, 0x19848B),
    "D-Firaga": ItemData(useful, 1, 0x19848C),
    "D-Blizzaga": ItemData(useful, 1, 0x19848D),
    "D-Thundaga": ItemData(useful, 1, 0x19848E),
    
    "Armor Badge": ItemData(useful, 1, 0x198490),
    "Counter Ring": ItemData(useful, 1, 0x198491),
    "Command Ring": ItemData(useful, 1, 0x198492),
    "Payback Ring": ItemData(useful, 1, 0x198493),
    "Energy Earring": ItemData(useful, 1, 0x198494),
    "Power Armlet": ItemData(useful, 1, 0x198495),
    "Wizard's Armlet": ItemData(useful, 1, 0x198496),
    "Safeguard Armlet": ItemData(useful, 1, 0x198497),
    "Half-moon Armlet": ItemData(useful, 1, 0x198498),
    "Strike Armlet": ItemData(useful, 1, 0x198499),
    "CMOS Armlet": ItemData(useful, 1, 0x19849A),
    "CMOS Necklace": ItemData(useful, 1, 0x19849B),
    "Immortal Charm": ItemData(useful, 1, 0x19849C),
    "Eternity Charm": ItemData(useful, 1, 0x19849D),
    "Fire Charm": ItemData(useful, 1, 0x19849E),
    "Blizzard Charm": ItemData(useful, 1, 0x19849F),
    "Thunder Charm": ItemData(useful, 1, 0x1984A0),
    "Heavy Charm": ItemData(useful, 1, 0x1984A1),
    "Zip Charm": ItemData(useful, 1, 0x1984A2),
    "Compass": ItemData(useful, 1, 0x1984A3),
    "Feather Chain": ItemData(useful, 1, 0x1984A4),
    "Night Lenses": ItemData(useful, 1, 0x1984A5),
    "Adamant Belt": ItemData(useful, 1, 0x1984A6),
    "Liberty Crown": ItemData(useful, 1, 0x1984A7),
    "Heat Sink Belt": ItemData(useful, 1, 0x1984A8),
    
}	

i = 0
for (name) in item_table:
    item_table[name] = ItemData(item_table[name].classification, item_table[name].khrecamount, item_table[name].khrecaddress, i+137000)
    i += 1

item_table["Game Finished"] = ItemData(progression, 0, 0, None, True)
