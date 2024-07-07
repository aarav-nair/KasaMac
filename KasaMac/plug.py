import asyncio
import sys
from power import *
import kasa
from kasa import SmartPlug
from kasa import Discover, Credentials



async def all_plugs():
   return await Discover.discover()
   

def findPlugs():
   all = asyncio.run(all_plugs())
   keys = list(all.keys())
   devices = list(all.values())
   names = list(map(lambda dev: dev.alias, devices))
   return names
   
   
def getPlugNames():
    plugs = findPlugs()
    keys = list(all.keys())
    devices = list(all.values())
    

def auto(address: str, lower: int, upper: int):
   plug = SmartPlug(str)
   percent = currPercent()
   isCharge = isCharging()

   if isCharge and percent >= upper:
      asyncio.run(plug.turn_off())

   elif not isCharge and percent <= lower:
      asyncio.run(plug.turn_on())
   

if __name__ == "__main__":
   # auto("127.0.0.1", 20, 80)
   print(kasa.__file__)
   findPlugs()
