from typing import TYPE_CHECKING
from BaseClasses import CollectionState, MultiWorld

from ..generic.Rules import add_rule, set_rule

from .Locations import location_table

if TYPE_CHECKING:
    from . import KHRECWorld

from ..AutoWorld import LogicMixin

from .Options import khrec_options


class KHRECLogic(LogicMixin):
    
    def rec_has_level(self, state:CollectionState, player: int):
        return state.has_any({"Level Up"}, player)
    
    def rec_has_world_access(self, state: CollectionState, check_number: int, player: int):
        can_do = True
        if check_number > 0:
            can_do = can_do and state.rec_has_level(state, player)
        return can_do
    
    def rec_is_accessible(self, state: CollectionState, item_string: str, item_count: int, player: int):
        can_do = True
        if (item_string == "Level Up" and item_count == 1):
            can_do = can_do
        else:
            can_do = can_do and state.rec_has_level(state, player)
        return can_do
        

def set_rules(world: MultiWorld, player: int):
    for loc in location_table:
        if location_table[loc] is None:
            goal = 1
            set_rule(world.get_location(loc, player), lambda state, goal=goal: True)
        elif location_table[loc] >= 137000:
            item_string = "".join([i+" " for i in str(loc).split(" ")[:-1]])[:-1]
            item_count = int(str(loc).split(" ")[len(str(loc).split(" "))-1])
            set_rule(world.get_location(loc, player), lambda state, item_string=item_string, item_count=item_count: state.rec_is_accessible(state, item_string, item_count, player))


def set_completion_rules(world: MultiWorld, player: int):
    world.completion_condition[player] = lambda state, world=world, player=player: state.rec_has_world_access(state, world.Goal[player].value, player)