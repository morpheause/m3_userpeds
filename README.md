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


`RegisterNetEvent('kashactersC:SpawnCharacter')  
AddEventHandler('kashactersC:SpawnCharacter', function(spawn, isnew)  
    TriggerServerEvent('es:firstJoinProper')  
    TriggerEvent('es:allowedToSpawn')  

    SetTimecycleModifier('default')  
    pos = spawn -- local  
    spawn = spawn  
    SetEntityCoords(GetPlayerPed(-1), pos.x, pos.y, pos.z)  
    DoScreenFadeIn(500)  
    Citizen.Wait(500)  
    cam2 = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", -1355.93,-1487.78,520.75, 300.00,0.00,0.00, 100.00, false, 0)  

    if isnew then  
        TriggerEvent('jsfour-register:open')  
    else  
        PointCamAtCoord(cam2, pos.x,pos.y,pos.z+200)  
        SetCamActiveWithInterp(cam2, cam, 900, true, true)  
        Citizen.Wait(900)  
        exports.spawnmanager:setAutoSpawn(false)  
        TriggerEvent('esx_ambulancejob:multicharacter', source)  
        cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", pos.x,pos.y,pos.z+200, 300.00,0.00,0.00, 100.00, false, 0)  
        PointCamAtCoord(cam, pos.x,pos.y,pos.z+2)  
        SetCamActiveWithInterp(cam, cam2, 3700, true, true)  
        Citizen.Wait(3700)  
        PlaySoundFrontend(-1, "Zoom_Out", "DLC_HEIST_PLANNING_BOARD_SOUNDS", 1)  
        RenderScriptCams(false, true, 500, true, true)  
        PlaySoundFrontend(-1, "CAR_BIKE_WHOOSH", "MP_LOBBY_SOUNDS", 1)  
        FreezeEntityPosition(GetPlayerPed(-1), false)  
       TriggerEvent('m3:userpeds:spawnPed') -- example that  
        Citizen.Wait(500)  
        SetCamActive(cam, false)  
        DestroyCam(cam, true)  
        -- IsChoosing = false  
        -- DisplayHud(true)  
        -- DisplayRadar(true)  
        TriggerEvent('m3:hudshow') --m3-hud open  
    end  
end)  

# Contact
you can pr for features that can be added or for errors.

- Discord: morpheause#7800
- nost roleplay: https://discordapp.com/invite/BbQUCTU
