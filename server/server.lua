local QRCore = exports['qr-core']:GetCoreObject()

-- give wood reward
RegisterServerEvent('rsg-gatherer:server:giveWoodReward')
AddEventHandler('rsg-gatherer:server:giveWoodReward', function()
    local src = source
    local Player = QRCore.Functions.GetPlayer(src)
    local randomNumber = math.random(1,100)
    if randomNumber > 80 then
        Player.Functions.AddItem('axe', 1)
        TriggerEvent("inventory:client:ItemBox", QRCore.Shared.Items["axe"], "remove")
        TriggerClientEvent('QRCore:Notify', src, 'your axe is broken!', 'error')
    else
        local givewood = math.random(1,3)
        Player.Functions.AddItem('wood', givewood)
        TriggerClientEvent('inventory:client:ItemBox', src, QRCore.Shared.Items['wood'], "add")
        TriggerClientEvent('QRCore:Notify', src, 'you chopped '..givewood..' wood', 'success')
    end
end)
