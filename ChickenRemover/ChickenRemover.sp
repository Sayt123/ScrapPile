#include <sdkhooks>

#pragma semicolon 1

public Plugin myinfo =
{
	name = "ChickenRemover",
	author = "Sayt",
	description = "Removes chickens for deathmatch",
	version = "1.0.0",
	url = "http://thethunderdome.net"
};

// Chicken deleter
public Hook_OnChickenSpawned(entity)
{
    RemoveEntity(entity);
}

public OnEntityCreated(entity, const String:classname[])
{
    if ((entity > MaxClients) && IsValidEdict(entity))
    {
        if(StrEqual(classname, "chicken"))
            SDKHook(entity, SDKHook_Spawn, Hook_OnChickenSpawned);
    }
}