import typing

from BaseClasses import Location
from .Items import item_table, ItemData


class KHRECLocation(Location):
    game: str = "Kingdom Hearts Re:Coded"
    code: int = 0

location_table = {}

for (name) in item_table:
    for i in range(item_table[name].khrecamount):
        if item_table[name].code is not None:
            location_table[name+" "+str(i+1)] = 137000+i+(item_table[name].khrecaddress*100)-167219200

for (name) in item_table:
    if item_table[name].code is None:
        location_table[name] = None

lookup_id_to_Location: typing.Dict[int, str] = {data: item_name for item_name, data in location_table.items() if
                                                data}
