import asyncio
import sys
from power import *
import kasa
from kasa import SmartPlug
from kasa import Discover


async def all_plugs():
   return await Discover.discover()
   
   
def findPlugs():
    all = asyncio.run(all_plugs())
    devices = list(all.values())
    
    names = list(map(lambda dev: dev.alias, devices))
    addresses = list(all.keys())
    isOn = list(map(lambda dev: dev.is_on, devices))
    
    return [names, addresses, isOn]


def turn_on(address: str):
    async def helper():
        plug = await Discover.discover_single(str)
        await plug.turn_on()
    asyncio.run(helper())
    
    
def turn_off(address: str):
    async def helper():
        plug = await Discover.discover_single(str)
        await plug.turn_off()
    asyncio.run(helper())


def auto(address: str, lower: int, upper: int):
    plug = SmartPlug(str)
    percent = currPercent()
    isCharge = isCharging()
    
    async def helper():
        if isCharge and percent >= upper:
          await plug.turn_off()

        elif not isCharge and percent <= lower:
          await plug.turn_on()
    
    asyncio.run(helper())
   

if __name__ == "__main__":
    # auto("127.0.0.1", 20, 80)
    print(kasa.__file__)
    findPlugs()
