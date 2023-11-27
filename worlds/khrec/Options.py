import typing
from Options import Option, Range, Choice


class Goal(Range):
    """What do you want the goal of the game to be? 01-for Heartless"""
    range_start = 1
    range_end = 1
    default = 1


khrec_options: typing.Dict[str, type(Option)] = {
    "Goal": Goal,
}