ESX                           = nil
local antybug = 0

Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end
end)


exports.qtarget:AddBoxZone('first', vector3(1398.2797, 1156.2092, 107.1460), 1.2, 1.5, {
  name= 'first',
  heading=8,
  debugPoly=false,
  minZ=30.07834,
  maxZ=32.57834,
  }, {
      options = {
          {
              icon = "fas fa-sign-in-alt",
              label = "Weź składnik",
              event = 'pfdrugs:getf'
              
          },
      },
      distance = 1.5
})

exports.qtarget:AddBoxZone('second', vector3(1395.238, 1150.4047, 107.1459), 2.3, 2.3, {
  name= 'second',
  heading=8,
  debugPoly=false,
  minZ=30.07834,
  maxZ=33.07834,
  }, {
  options = {
      {
      icon = "fas fa-sign-in-alt",
      label = "Weź składnik",
      event = 'pfdrugs:gets'
      },          
  },
      distance = 3
})

exports.qtarget:AddBoxZone('third', vector3(1396.5605, 1155.8021, 107.2211), 1.8, 1.8, {
  name= 'third',
  heading=8,
  debugPoly=false,
  minZ=30.07834,
  maxZ=32.07834,
  }, {
  options = {
      {
      icon = "fas fa-sign-in-alt",
      label = "Gotuj mete",
      event = 'pfdrugs:gett'
      },          
  },
      distance = 3
})

exports.qtarget:AddBoxZone('fourth', vector3(1400.0076, 1146.9721, 107.1460), 4.4, 1.3, {
  name= 'fourth',
  heading=270,
  debugPoly=false,
  minZ=30.07834,
  maxZ=31.07834,
  }, {
  options = {
      {
      icon = "fas fa-sign-in-alt",
      label = "Porcjuj mete",
      event = 'pfdrugs:getfo'
      },          
  },
      distance = 3
})

RegisterNetEvent('pfdrugs:getf')
AddEventHandler('pfdrugs:getf', function()
  if antybug == 0 then
    antybug = 1
    ESX.Progressbar("Wyciąganie substratu", (60000),{
      FreezePlayer = true, 
      onFinish = function()
    end})
    TriggerServerEvent('pfdrugs:getfirst')
    antybug = 0
  else
  end
end)

RegisterNetEvent('pfdrugs:gets')
AddEventHandler('pfdrugs:gets', function()
  if antybug == 0 then
    antybug = 1
    ESX.Progressbar("Wyciąganie substratu", (60000),{
      FreezePlayer = true, 
      onFinish = function()
    end})
    TriggerServerEvent('pfdrugs:getsecond')
    antybug = 0
  else
  end
end)

RegisterNetEvent('pfdrugs:gett')
AddEventHandler('pfdrugs:gett', function()
  if antybug == 0 then 
    antybug = 1
    local anim_lib, anim_dict = "mini@repair", "fixing_a_ped"
    ESX.Streaming.RequestAnimDict(anim_lib, function()
      TaskPlayAnim(PlayerPedId(), anim_lib, anim_dict, 8.0, -8.0, -1, 0, 0, false, false, false)
    end)
    ESX.Progressbar("Gotowanie mety", (60000),{
      FreezePlayer = true, 
      onFinish = function()
    end})
    ClearPedTasksImmediately(player)
    TriggerServerEvent('pfdrugs:getthird')
    antybug = 0
  else
  end
end)

RegisterNetEvent('pfdrugs:getfo')
AddEventHandler('pfdrugs:getfo', function()
  if antybug == 0 then
    antybug = 1
    ESX.Progressbar("Porcjowanie mety", (60000),{
      FreezePlayer = true, 
      onFinish = function()
    end})
    TriggerServerEvent('pfdrugs:getfourth')
    antybug = 0
  else
  end
end)