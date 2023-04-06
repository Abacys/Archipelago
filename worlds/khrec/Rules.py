from typing import TYPE_CHECKING
from BaseClasses import CollectionState, MultiWorld

from ..generic.Rules import add_rule, set_rule

from .Locations import location_table

if TYPE_CHECKING:
    from . import KHRECWorld

from ..AutoWorld import LogicMixin

from .Options import khrec_options


class KHRECLogic(LogicMixin):

    def rec_is_accessible(self, state: CollectionState, progress: int, player: int):
        can_do = True
        return can_do

def set_rules(world: MultiWorld, player: int):
    for loc in location_table:
        if location_table[loc] is None:
            goal = 1
            set_rule(world.get_location(loc, player), lambda state, goal=goal: True)
        elif location_table[loc] >= 25000:
            item_string = "".join([i+" " for i in str(loc).split(" ")[:-1]])[:-1]
            item_count = int(str(loc).split(" ")[len(str(loc).split(" "))-1])
            set_rule(world.get_location(loc, player), lambda state, item_string=item_string, item_count=item_count: True)


def set_completion_rules(world: MultiWorld, player: int):
    world.completion_condition[player] = lambda state, world=world, player=player: state.rec_is_accessible(state, world.Goal[player].value, player)
