import logging
import os
import threading
import pkgutil
from typing import NamedTuple, Union, Dict, Any

import bsdiff4

import Utils
from BaseClasses import Item, Location, Region, Entrance, MultiWorld, ItemClassification, Tutorial
from .Items import item_table, KHRECItem
from .Locations import location_table, KHRECLocation
from .Options import khrec_options
from .Rules import set_rules, set_completion_rules
from worlds.AutoWorld import World, WebWorld
from worlds.generic.Rules import add_rule


class KHRECWeb(WebWorld):
    theme = "stone"
    setup = Tutorial(
        "Multiworld Setup Tutorial",
        "A guide to setting up Kingdom Hearts Re:Coded for Archipelago on your computer.",
        "English",
        "multiworld_en.md",
        "multiworld/en",
        ["Abacys"]
    )

    tutorials = [setup]


class KHRECWorld(World):
    """
    Kingdom Hearts Re:Coded is a game for the Nintendo DS! Play through the story of Kingdom Hearts 1 but slightly to the left!
    Your objective is to beat Sora's Heartless and complete the story!
    """
    option_definitions = khrec_options
    game = "Kingdom Hearts Re:Coded"
    topology_present = False
    data_version = 0
    web = KHRECWeb()

    item_name_to_id = {name: data.code for name, data in item_table.items()}
    location_name_to_id = location_table
    
    def __init__(self, world: MultiWorld, player: int):
        super().__init__(world, player)
        self.generator_in_use = threading.Event()
        self.rom_name_available_event = threading.Event()
        self.levels = None
        self.filler_items = None

    def create_item(self, name: str):
        return KHRECItem(name, item_table[name].classification, self.item_name_to_id[name], self.player)

    def create_event(self, event: str):
        return KHRECItem(event, ItemClassification.progression, None, self.player)

    def create_regions(self):
        menu = Region("Menu", self.player, self.multiworld)
        missions = Region("Missions", self.player, self.multiworld)

        missions.locations = [KHRECLocation(self.player, loc_name, loc_data, missions)
                           for loc_name, loc_data in location_table.items()]
        for item in missions.locations:
            if "Elixir" in item.name:
                item.progress_type = Location.progress_type.EXCLUDED
            if "Megalixir" in item.name:
                item.progress_type = Location.progress_type.EXCLUDED
            if "Panacea" in item.name:
                item.progress_type = Location.progress_type.EXCLUDED
            if "Limit Recharge" in item.name:
                item.progress_type = Location.progress_type.EXCLUDED
        begin_game = Entrance(self.player, "Begin Game", menu)
        menu.exits.append(begin_game)
        begin_game.connect(missions)
        self.multiworld.regions.append(menu)
        self.multiworld.regions.append(missions)

    def generate_basic(self):
        item_pool = []
        for (name) in item_table:
            for i in range(item_table[name].khrecamount):
                item_pool += [self.create_item(name)]
                    
        for (name) in location_table:
            if location_table[name] is None:
                event_item = self.create_event(name)
                self.multiworld.get_location(name, self.player).place_locked_item(event_item)

        for i in range(len(location_table) - len(item_pool) - len(self.multiworld.precollected_items[self.player])):
            item_pool += [self.create_item("Potion")]
        self.multiworld.itempool += item_pool

    def set_rules(self):
        set_rules(self.multiworld, self.player)
        set_completion_rules(self.multiworld, self.player)

    def get_filler_item_name(self) -> str:
        if self.filler_items is None:
            self.filler_items = [item for item in item_table if item_table[item].classification == ItemClassification.filler]
        return self.multiworld.random.choice(self.filler_items)

    def fill_slot_data(self) -> Dict[str, Any]:
        return {
            "goal": self.multiworld.Goal[self.player].value,
        }
