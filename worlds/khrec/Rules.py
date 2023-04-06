from typing import TYPE_CHECKING
from BaseClasses import CollectionState, MultiWorld

from ..generic.Rules import add_rule, set_rule

from .Locations import location_table

if TYPE_CHECKING:
    from . import KHRECWorld

from ..AutoWorld import LogicMixin

from .Options import khrec_options


#class KHRECLogic(LogicMixin):

def set_rules(world: MultiWorld, player: int):
    for loc in location_table:
#        if location_table[loc] is None:
#            goal = int(str(loc).split(" ")[len(str(loc).split(" "))-1])
#            set_rule(world.get_location(loc, player), lambda state, goal=goal: state.days_has_day_access(state, day_number, player))
        if location_table[loc] >= 25000:
            item_string = "".join([i+" " for i in str(loc).split(" ")[:-1]])[:-1]
            item_count = int(str(loc).split(" ")[len(str(loc).split(" "))-1])
            set_rule(world.get_location(loc, player), lambda state, item_string=item_string, item_count=item_count: True)


def set_completion_rules(world: MultiWorld, player: int):
    world.completion_condition[player] = lambda state, world=world, player=player: state.days_has_day_access(state, world.DayRequirement[player].value, player)
