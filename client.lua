ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('m3:userpeds:spawnPed')
AddEventHandler('m3:userpeds:spawnPed', function()
	ESX.TriggerServerCallback('m3:userpeds:pedCheck', function(result)
		print(result)
		if result ~= nil then
			Model = GetHashKey(result)
			if IsModelValid(Model) then
				if not HasModelLoaded(Model) then
					RequestModel(Model)
					while not HasModelLoaded(Model) do
						Citizen.Wait(5)
					end
				end
				
				SetPlayerModel(PlayerId(), Model)
				
				SetModelAsNoLongerNeeded(Model)

				Citizen.Wait(100)

				TriggerEvent('esx_skin:getLastSkin', function(skin)
					TriggerEvent('skinchanger:loadSkin', skin)
				end)
			end
		end
	end)
end)

RegisterCommand('testped', function()
	TriggerEvent('m3:userpeds:spawnPed')
end)
