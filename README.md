# m3_userpeds
simple spawn ped script for fivem

# Dependencies
- mythic_notify

# Installation

- Add to resource folder `[esx]`
- Execute the SQL file: `m3_userpeds.sql`
- Start using `m3_userpeds`

# Features

- allows you to add and delete ped for user with a single command

# Notes

- to change add or delete command go to server.lua line 24 and line 60
- If you use kashacters add this code to kashacters IdentifierTables `{table = "m3_user_peds", column = "identifier"}`
- for the ped models go to https://docs.fivem.net/docs/game-references/ped-models/

# Usage

- for add ped --> /pedver [id] [pedmodel]
- for delete ped --> /pedsil [id]
- if you want to be born with the given ped, example add this code to esx_kashacters client.lua

`TriggerEvent('m3:userpeds:spawnPed')`


# Contact
you can pr for features that can be added or for errors.

- Discord: morpheause#7800
- nost roleplay: https://discordapp.com/invite/BbQUCTU
