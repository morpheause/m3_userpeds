ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


ESX.RegisterServerCallback('m3:userpeds:pedCheck', function(source, cb)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	if xPlayer ~= nil then
		MySQL.Async.fetchAll('SELECT * FROM m3_user_peds WHERE identifier = @identifier', {
			['@identifier'] = xPlayer.identifier,
		}, function(result)
			if result[1] ~= nil then
				cb(result[1].pedmodel)
			else
				cb(nil)
			end
		end)
	else
		cb(nil)
	end
end)

TriggerEvent('es:addGroupCommand', 'pedver', 'superadmin', function(source, args, user)
	local _source = source
	local xTarget = ESX.GetPlayerFromId(tonumber(args[1]))
	local pedModel   = args[2]

	if xTarget ~= nil then
		if pedModel ~= nil then
			MySQL.Async.fetchAll('SELECT * FROM m3_user_peds WHERE pedmodel = @pedmodel', {
				['@pedmodel'] = pedModel,
			}, function(result)
				if result[1] == nil then
					MySQL.Async.fetchAll('SELECT * FROM m3_user_peds WHERE identifier = @identifier', {
						['@identifier'] = xTarget.identifier,
					}, function(result2)
						if result2[1] == nil then
							MySQL.Async.execute('INSERT INTO m3_user_peds (identifier, pedmodel) VALUES (@identifier, @pedmodel)',{
								['@identifier'] = xTarget.identifier, ['@pedmodel'] = pedModel})
							TriggerClientEvent('mythic_notify:client:SendAlert', xTarget.source, { type = 'inform', text = 'Ped onaylandı. Tekrar giriş yapınız!'})
						else
							TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'error', text = 'This people already have a pedmodel!'})
						end
					end)
				else
					TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'error', text = 'This model is already in use!'})
				end
			end)
		else
			TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'error', text = 'empty_pedmodel'})
		end
	else
		TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'error', text = 'empty_id'})
	end
end,  function(source, args, user)
	TriggerClientEvent('chat:addMessage', _source, { args = { '^1SYSTEM', 'Insufficient Permissions.' } })
end)

TriggerEvent('es:addGroupCommand', 'pedsil', 'superadmin', function(source, args, user)
	local _source = source
	local xTarget = ESX.GetPlayerFromId(tonumber(args[1]))

	if xTarget ~= nil then
		MySQL.Async.fetchAll('SELECT * FROM m3_user_peds WHERE identifier = @identifier', {
			['@identifier'] = xTarget.identifier,
		}, function(result)
			if result[1] ~= nil then
				MySQL.Async.fetchAll('DELETE FROM m3_user_peds WHERE identifier = @identifier',{['@identifier'] = xTarget.identifier})
				TriggerClientEvent('mythic_notify:client:SendAlert', xTarget.source, { type = 'error', text = 'Ped izniniz alındı. Tekrar giriş yapınız!'})
			else
				TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'error', text = 'This people don\'t already have a model!'})
			end
		end)
	else
		TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'error', text = 'empty_id'})
	end
end,  function(source, args, user)
	TriggerClientEvent('chat:addMessage', _source, { args = { '^1SYSTEM', 'Insufficient Permissions.' } })
end)


