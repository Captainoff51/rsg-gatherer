local RSGCore = exports['rsg-core']:GetCoreObject()
local chopping = false

-----------------------------------------------------
-- target models for interaction (trees)
-----------------------------------------------------
exports['rsg-target']:AddTargetModel(Config.Trees, {
    options = {
        {
            type = "client",
            event = 'rsg-gatherer:client:choptree',
            icon = "far fa-eye",
            label = 'Start Chopping Tree',
            distance = 2.0
        },
    }
})

-----------------------------------------------------
-- chop tree (animation) axe needed
-----------------------------------------------------
RegisterNetEvent('rsg-gatherer:client:choptree', function()

    if chopping then return end

    local hasItem = RSGCore.Functions.HasItem('axe', 1)
    
    -- check has item
    if not hasItem then
        lib.notify({ title = 'Axe Needed', description = 'you need a axe to be able to do this!', type = 'error' })
        return
    end

    chopping = true
    LocalPlayer.state:set("inv_busy", true, true)

    if lib.progressBar({
        duration = Config.ChopTreeTime,
        position = 'bottom',
        useWhileDead = false,
        canCancel = false,
        disableControl = true,
        label = 'Chopping Trees',
        anim = {
            dict = 'amb_work@world_human_tree_chop_new@working@pre_swing@male_a@trans',
            clip = 'pre_swing_trans_after_swing',
            flag = 15,
        },
        prop = {
            model = `p_axe02x`,
            bone = 7966,
            pos = vec3(0.03, 0.03, 0.02),
            rot = vec3(0.0, 0.0, -1.5)
        },
    }) then 
        TriggerServerEvent('rsg-gatherer:server:giveitem', 'wood', 1)
        chopping = false
        LocalPlayer.state:set("inv_busy", false, true)
    end
end)
