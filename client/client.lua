local QRCore = exports['qr-core']:GetCoreObject()
local cuttingstarted = false
local trees

---------------------------------------------------------------------------------------

-- woodcutter tree prompts
Citizen.CreateThread(function()
    for trees, v in pairs(Config.TreeLocations) do
        exports['qr-core']:createPrompt(v.treeType, v.coords, QRCore.Shared.Keybinds['J'], 'Start Choping ' .. v.name, {
            type = 'client',
            event = 'rsg-gatherer:clent:dowoodcutting',
            args = {},
        })
        if v.showblip == true then
            local TreeBlip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, v.coords)
            SetBlipSprite(TreeBlip, 1904459580, 1)
            SetBlipScale(TreeBlip, 0.2)
			Citizen.InvokeNative(0x9CB1A1623062F402, TreeBlip, v.name)
        end
    end
end)

-- do woodcutting need axe
RegisterNetEvent('rsg-gatherer:clent:dowoodcutting')
AddEventHandler('rsg-gatherer:clent:dowoodcutting', function()
	if cuttingstarted == false then
		local hasItem = QRCore.Functions.HasItem('axe', 1)
		if hasItem then
			cuttingstarted = true
			TaskStartScenarioInPlace(PlayerPedId(), GetHashKey('EA_WORLD_HUMAN_TREE_CHOP_NEW'), -1, true, false, false, false)
			Wait(30000)
			ClearPedTasksImmediately(PlayerPedId(-1))
			TriggerServerEvent('rsg-gatherer:server:giveWoodReward')
			cuttingstarted = false
		else
			QRCore.Functions.Notify('you don\'t have an axe!', 'error')
		end
	else
		QRCore.Functions.Notify('you are busy at the moment!', 'primary')
	end
end)

---------------------------------------------------------------------------------------
