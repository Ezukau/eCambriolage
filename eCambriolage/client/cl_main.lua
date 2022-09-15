ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(10)
    end
    while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
    end
    if ESX.IsPlayerLoaded() then

		ESX.PlayerData = ESX.GetPlayerData()

    end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
end)

function getInventory()
    ESX.TriggerServerCallback('ePawnShop:playerinventory', function(inventory)
        all_items = inventory
    end)
end

function KeyboardInput(TextEntry, ExampleText, MaxStringLenght)

    AddTextEntry('FMMC_KEY_TIP1', TextEntry) 
    
    blockinput = true 
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "Somme", ExampleText, "", "", "", MaxStringLenght) 
    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do 
        Citizen.Wait(0)
    end 
         
    if UpdateOnscreenKeyboard() ~= 2 then
        local result = GetOnscreenKeyboardResult()
        Citizen.Wait(500) 
        blockinput = false
        return result 
    else
        Citizen.Wait(500) 
        blockinput = false 
        return nil 
    end
end

local appuyersure = true
local ipl = ""
local posCambriolage = vector3(0,0,0)
local posSortie = vector3(0,0,0)
local CambriolageEnCours = false

RegisterNetEvent("eCambriolage:canenter")
AddEventHandler("eCambriolage:canenter", function(posCambriolage)

    FreezeEntityPosition(PlayerPedId(), true)
    RequestAnimDict('missheistfbisetup1')
    while not HasAnimDictLoaded('missheistfbisetup1') do
        Wait(100)
    end
    TaskPlayAnim(PlayerPedId(), 'missheistfbisetup1', 'hassle_intro_loop_f', 8.0, -8, -1, 49, 0, 0, 0, 0)
    Wait(4000)
    DoScreenFadeOut(200)
    Wait(200)
    ClearPedTasks(PlayerPedId())
    FreezeEntityPosition(PlayerPedId(), false)
    SetEntityCoords(PlayerPedId(), json.decode(posCambriolage).x, json.decode(posCambriolage).y, json.decode(posCambriolage).z)
    Wait(300)
    DoScreenFadeIn(200)

    --EVENT POLICE
    CambriolageEnCours = true 
    appuyersure = true

    if ipl == "LowEndApartment" then
        tableItem = {
            {name = "livre", label = "Livre", Position = vector3(261.9751, -995.3293 , -99.00867), prit = false},
            {name = "boitedepreservatifs", label = "Boite de preservatifs", Position = vector3(256.6204 ,-1001.341, -99.009), prit = false},
            {name = "casqueaudio", label = "Casque Audio", Position = vector3(262.88 , -999.924 , -99.00), prit = false},
            {name = "string", label = "String", Position = vector3(260.29 , -1004.00, -99.00), prit = false},
            {name = "console", label = "Consoles de jeux", Position = vector3(257.066 , -995.7819 , -99.00), prit = false},
            {name = "enceinte", label = "Enceinte", Position = vector3(262.21, -1002.557 ,-99.00), prit = false},
            {name = "vieuxjean", label = "Vieux Jean", Position = vector3(260.78, -1004.148 ,-99.00), prit = false},
            {name = "dvd", label = "DVD", Position = vector3(256.57, -997.5346, -99.00), prit = false},

        }
    elseif ipl == "MediumEndApartment" then
        tableItem = {
            {name = "soincheveux", label = "Soin pour cheveux", Position = vector3(374.231, -994.2183 , -99.19615), prit = false},
            {name = "string", label = "String", Position = vector3(350.6423 ,-994.2072, -99.009), prit = false},
            {name = "maquillage", label = "Trousse de maquillage", Position = vector3(351.2741 , -999.2463 , -99.00), prit = false},
            {name = "radio", label = "Radio", Position = vector3(341.06 , -1001.171, -99.00), prit = false},
            {name = "dvd", label = "DVD", Position = vector3(338.2166 , -997.6248 , -99.00), prit = false},
            {name = "bougie", label = "Bougie", Position = vector3(338.9019, -1001.452 ,-99.16), prit = false},
            {name = "livre", label = "Livre", Position = vector3(345.3654, -995.8046 ,-99.16), prit = false},
            {name = "ecouteur", label = "Ecouteur", Position = vector3(341.3765, -995.1558 ,-99.16), prit = false},
            {name = "ordi", label = "Ordinateur portable", Position = vector3(338.1591, -995.0535 ,-99.16), prit = false},
            {name = "jouet", label = "Jouet pour enfant", Position = vector3(340.7043, -992.9647 ,-99.19), prit = false},

        }
    elseif ipl == "Villa_1" then
        tableItem = {
            {name = "enceinte", label = "Enceinte", Position = vector3(-170.8523, 483.4114 , 137.2443), prit = false},
            {name = "livre", label = "Livre", Position = vector3(-164.8642, 485.6222 , 137.2443), prit = false},
            {name = "livre", label = "Livre", Position = vector3(-173.1611, 500.5182 , 130.0393), prit = false},
            {name = "ordi", label = "Ordinateur portable", Position = vector3(-165.2465, 481.807 , 137.62), prit = false},
            {name = "boiteabijoux", label = "Boite a bijoux", Position = vector3(-162.6004, 482.0003 , 133.8695), prit = false},
            {name = "montre", label = "Montre", Position = vector3(-170.4445, 481.4209 , 133.8439), prit = false},
            {name = "vesteencuir", label = "Veste en Cuir", Position = vector3(-166.8054, 488.174 , 133.8439), prit = false},
            {name = "pullbleu", label = "Pull Bleu", Position = vector3(-167.9652, 488.0142 , 133.8439), prit = false},
            {name = "maquillage", label = "Trousse de maquillage", Position = vector3(-165.811, 495.6754 , 133.856), prit = false},
            {name = "chaine", label = "Chaine", Position = vector3(-171.5132, 487.2117 , 137.4433), prit = false},

        }
    end
end)

RegisterNetEvent("eCambriolage:noenter")
AddEventHandler("eCambriolage:noenter", function()
    Citizen.Wait(3000)
    FreezeEntityPosition(PlayerPedId(), true)
    RequestAnimDict('missheistfbisetup1')
    while not HasAnimDictLoaded('missheistfbisetup1') do
        Wait(100)
    end
    TaskPlayAnim(PlayerPedId(), 'missheistfbisetup1', 'hassle_intro_loop_f', 8.0, -8, -1, 49, 0, 0, 0, 0)
    ClearPedTasks(PlayerPedId())
    FreezeEntityPosition(PlayerPedId(), false)
    ipl = ""
    appuyersure = true
end)

RegisterNetEvent("eCambriolage:noenter2")
AddEventHandler("eCambriolage:noenter2", function()
    ESX.ShowNotification("~r~Pas asser de policier en ville.")
    ipl = ""
    appuyersure = true
end)

local posItem = vector3(0,0,0)
local prit = ""
local canCambriolage = true

Citizen.CreateThread(function()
    while true do
        local wait = 750
        if canCambriolage == true then
            for k,v in pairs(Config.Cambriolage) do

                local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)

                if v.ipl == "LowEndApartment" then 
                    posCambriolage = vector3(266.06, -1007.568, -101.0087)
                    posCambriolage = json.encode(posCambriolage)
                    posSortie = json.encode(v.Position)


                elseif v.ipl == "MediumEndApartment" then 
                    posCambriolage = vector3(346.52, -1013.055, -99.1662)
                    posCambriolage = json.encode(posCambriolage)
                    posSortie = json.encode(v.Position)

                elseif v.ipl == "Villa_1" then 
                    posCambriolage = vector3(-174.26, 497.799, 137.6538)
                    posCambriolage = json.encode(posCambriolage)
                    posSortie = json.encode(v.Position)
                end

                local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, json.decode(posSortie).x, json.decode(posSortie).y, json.decode(posSortie).z)
                
                if dist <= 5 and not IsPedInAnyVehicle(GetPlayerPed(-1)) then
                wait = 0
                DrawMarker(Config.MarkerType, json.decode(posSortie).x, json.decode(posSortie).y, json.decode(posSortie).z - 0.20, 0.0, 0.0, 0.0, 0.0,0.0,0.0, Config.MarkerSizeLargeur, Config.MarkerSizeEpaisseur, Config.MarkerSizeHauteur, Config.MarkerColorR, Config.MarkerColorG, Config.MarkerColorB, Config.MarkerOpacite, Config.MarkerSaute, true, p19, Config.MarkerTourne)  
                end
            
                if dist <= 1.0 and not IsPedInAnyVehicle(GetPlayerPed(-1)) and appuyersure == true then
                    wait = 0
                    ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour cambrioler")
                    if IsControlJustPressed(1, 51) then
                        ipl = v.ipl
                        TriggerServerEvent("eCambriolage:enter", posCambriolage, posSortie)
                        appuyersure = false

                    end
                end

                if CambriolageEnCours == true then
                    local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
                    local dist2 = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, json.decode(posCambriolage).x, json.decode(posCambriolage).y, json.decode(posCambriolage).z)
                    if dist2 <= 5 and not IsPedInAnyVehicle(GetPlayerPed(-1)) then
                        wait = 0
                        DrawMarker(Config.MarkerType, json.decode(posCambriolage).x, json.decode(posCambriolage).y, json.decode(posCambriolage).z - 0.20, 0.0, 0.0, 0.0, 0.0,0.0,0.0, Config.MarkerSizeLargeur, Config.MarkerSizeEpaisseur, Config.MarkerSizeHauteur, Config.MarkerColorR, Config.MarkerColorG, Config.MarkerColorB, Config.MarkerOpacite, Config.MarkerSaute, true, p19, Config.MarkerTourne)  
                    end
                    if dist2 <= 1.0 and not IsPedInAnyVehicle(GetPlayerPed(-1)) then
                        wait = 0
                        ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour sortir")
                        if IsControlJustPressed(1, 51) then
                            DoScreenFadeOut(200)
                            Wait(200)
                            SetEntityCoords(PlayerPedId(), json.decode(posSortie).x, json.decode(posSortie).y, json.decode(posSortie).z)
                            TriggerServerEvent("eCambriolage:setbucket")
                            Wait(300)
                            DoScreenFadeIn(200)
                            CambriolageEnCours = false
                            ipl = ""
                            StartCooldown()
                        end
                    end
                end

            end
            
            if CambriolageEnCours == true then
                for k, v in pairs(tableItem) do 
                    posItem = json.encode(v.Position)

                    if v.prit == false then
                        local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)

                        local dist3 = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, json.decode(posItem).x, json.decode(posItem).y, json.decode(posItem).z)
                        if dist3 <= 2 and not IsPedInAnyVehicle(GetPlayerPed(-1)) then
                            wait = 0
                            DrawMarker(Config.MarkerType, json.decode(posItem).x, json.decode(posItem).y, json.decode(posItem).z - 0.20, 0.0, 0.0, 0.0, 0.0,0.0,0.0, Config.MarkerSizeLargeur, Config.MarkerSizeEpaisseur, Config.MarkerSizeHauteur, Config.MarkerColorR, Config.MarkerColorG, Config.MarkerColorB, Config.MarkerOpacite, Config.MarkerSaute, true, p19, Config.MarkerTourne)  
                        end

                        if dist3 <= 0.5 and not IsPedInAnyVehicle(GetPlayerPed(-1)) then
                            wait = 0
                            ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour dérober")
                            if IsControlJustPressed(1, 51) then
                                v.prit = true
                                FreezeEntityPosition(PlayerPedId(), true)
                                RequestAnimDict('random@domestic')
                                while not HasAnimDictLoaded('random@domestic') do
                                    Wait(100)
                                end
                                TaskPlayAnim(PlayerPedId(), 'random@domestic', 'pickup_low', 8.0, -8, -1, 49, 0, 0, 0, 0)
                                Wait(1800)
                                ClearPedTasks(PlayerPedId())
                                FreezeEntityPosition(PlayerPedId(), false)
                                TriggerServerEvent("eCambriolage:derob", v.name, v.label)

                            end
                        end
                    end 
                end
            end
        end

        Citizen.Wait(wait)
    end
end)

function StartCooldown()
    canCambriolage = false
    Citizen.Wait(Config.CoolDown * 1000)
    canCambriolage = true
end

Citizen.CreateThread(function()
    while true do
    local wait = 750
    for k in pairs(Config.Position) do
        local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
        local pos = Config.Position
        local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, pos[k].x, pos[k].y, pos[k].z)

        if dist <= 3 and not IsPedInAnyVehicle(GetPlayerPed(-1)) then
            wait = 0
            DrawMarker(Config.MarkerType, pos[k].x, pos[k].y, pos[k].z - 0.20, 0.0, 0.0, 0.0, 0.0,0.0,0.0, Config.MarkerSizeLargeur, Config.MarkerSizeEpaisseur, Config.MarkerSizeHauteur, Config.MarkerColorR, Config.MarkerColorG, Config.MarkerColorB, Config.MarkerOpacite, Config.MarkerSaute, true, p19, Config.MarkerTourne)  
        end

        if dist <= 1.0 and not IsPedInAnyVehicle(GetPlayerPed(-1)) then
            wait = 0
            ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour vendre")
            if IsControlJustPressed(1, 51) then
                TriggerServerEvent("eCambriolage:recell")
            end
        end
    end
    Citizen.Wait(wait)
    end
end)

RegisterNetEvent('eCambriolage:blips')
AddEventHandler('eCambriolage:blips', function(posSortie)
    PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
    PlaySoundFrontend(-1, "OOB_Start", "GTAO_FM_Events_Soundset", 1)
    PlaySoundFrontend(-1, "FocusIn", "HintCamSounds", 1)
    local blipId = AddBlipForCoord(json.decode(posSortie).x, json.decode(posSortie).y, json.decode(posSortie).z)
    SetBlipSprite(blipId, 161)
    SetBlipScale(blipId, 1.2)
    SetBlipColour(blipId, 1)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString('Cambriolage')
    EndTextCommandSetBlipName(blipId)
    Wait(25 * 1000)
    RemoveBlip(blipId)
    PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
    PlaySoundFrontend(-1, "FocusOut", "HintCamSounds", 1)
end)