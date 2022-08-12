local Players = game:GetService("Players")
local LocalPlayer=Players.LocalPlayer
local rs = game:GetService"RunService".RenderStepped
local UI,IreXion = loadstring(game:HttpGet"https://pastebin.com/raw/2Wiktqnm")(),loadstring(game:HttpGet"https://raw.githubusercontent.com/RegularVynixu/IreXion-UI-Library/main/IreXion%20UI%20Library")()
local Window=UI:CreateWindow("Ultra Chaos V3",true)
local Weapons,Misc,LocalPlayer_Page,Themes,Credits = 
    Window:CreatePage("Main"),
    Window:CreatePage("Misc"),Window:CreatePage("Local Player"),
    Window:CreatePage("Themes"),Window:CreatePage("Credits")
local function identifyexec()
    return
    (((syn and syn.request) and is_redirection_enabled) and not is_sirhurt_closure and not pebc_execute and not WrapGlobal and not jit and "Synapse X") or 
    ((fluxus and (fluxus.request and fluxus.queue_on_teleport)) and "Fluxus") or
    ((printuiconsole and import and getfpscap and runautoexec) and "Script-Ware") or
    (secure_load and "Sentinel") or
    (is_sirhurt_closure and "SirHurt V4") or
    (pebc_execute and "ProtoSmasher") or
    (KRNL_LOADED and "Krnl") or
    (WrapGlobal and "based on WRD-API") or
    (isvm and "Proxo") or
    (shadow_env and "Shadow") or
    (jit and "based on EasyExploit-API") or
    (getreg()['CalamariLuaEnv'] and "Calamari") or
    (unit and "Unit") or
    (identifyexecutor())
end
local ______Synapse
if identifyexec()=="Synapse X"then
    ______Synapse = {
        InternalUIEnabled = false -- // set to true if you has Internal ui enabled in S^X Settings
    }
end
--Settings
local Selected = "Blood Dagger" -- // values: see WeaponTable
local WeaponsOnRespawn = false
local Minigun_Enabled = false
local DupeItems = false
local SpamGrenade = false
local SpamSpike = false
local SpamC4 = false
local KillAll = false
local KillAura = false
local SilentKillAura=false
local EquipToolsOnKillAura=false
local KA_Range = 10
local ClearBackpackOnDeath=false
local IgnoreList = {}
local WeaponTable = {"Mace","Chainsaw","Knife","Pan","Pencil","Baseball Bat","Scythe","Blood Dagger","Emerald Greatsword"}
Misc:NewButton("Infinite Yield",loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source")))
local function _setclipboard(str)
	local setcb = setclipboard or toclipboard or set_clipboard or (Clipboard and Clipboard.set) or (syn and syn.write_clipboard)
	if setcb then
		setcb(str)
	else
		IreXion:Notify("Your executor is not supporting clipboard!")
	end
end
Misc:NewButton("JobId: "..game.JobId,function()
    _setclipboard('game:GetService("TeleportService"):TeleportToPlaceInstance('..game.PlaceId..',"'..game.JobId..'")')
end)
Misc:NewToggle("Prints error into Internal ui",function(b)
    if identifyexec()=="Synapse X"and (is_redirection_enabled and is_redirection_enabled())then
        UI.Log:Info("Setted InternalUIEnabled to "..tostring(b))
        ______Synapse.InternalUIEnabled = b
    end
end)
--Credits
Credits:NewTextFrame("Not anton#0004 | UI Lib and scripting")
Credits:NewTextFrame("N0ne#3101 | Fast shoot and spam grade")
Credits:NewTextFrame("HtB#1526 | V3,Silent Kill Aura, fork of lib and fixes")
Themes:NewColorPicker(Color3.fromRGB(35,35,35), "Topbar color", function(Color)
	Window:Theme(Color, "TopBar")
end)
Themes:NewColorPicker(Color3.fromRGB(30,30,30), "Tabs color", function(Color)
	Window:Theme(Color, "Tabs")
end)
Themes:NewColorPicker(Color3.fromRGB(25,25,25), "Background color", function(Color)
	Window:Theme(Color, "BackGround")
end)
Themes:NewColorPicker(Color3.fromRGB(255,255,255), "Text color", function(Color)
	Window:Theme(Color, "Text")
end)
Themes:NewColorPicker(Color3.fromRGB(0,0,0), "Shadow color", function(Color)
	Window:Theme(Color, "Shadow")
end)
Weapons:NewDropDown(WeaponTable, "Weapons", function(e)
	Selected = e
end)
Weapons:NewSlider("Kill aura range", 500, 4, function(v)
	KA_Range = v
end)
Themes:NewButton("Reset all", function()
	Window:Theme("", "Reset")
end)
Misc:NewToggle("Get weapons when respawn", function(a)
	WeaponsOnRespawn = a
end)
Weapons:NewToggle("Minigun [V]", function(a)
	Minigun_Enabled = a
end)
Weapons:NewToggle("Dupe Items", function(a)
	DupeItems = a
end)
Weapons:NewToggle("Spam Grenade [G]", function(a)
	SpamGrenade = a
end)
Weapons:NewToggle("Spam C4 [Z]", function(a)
	SpamC4 = a
end)
Weapons:NewToggle("Kill aura", function(a)
	KillAura = a
end)
Weapons:NewToggle("Silent kill aura", function(a)
	SilentKillAura = a
end)
Weapons:NewToggle("Spam Spike [H]", function(a)
	SpamSpike = a
end)
Weapons:NewToggle("Kill all", function(a)
	KillAll = a
end)
local function AddAsync(func)
    coroutine.wrap(function()
        local s,e = pcall(func)
        if e and not s then
            local t_t=os.date("*t")
            local sec,minute,h=tostring(t_t.sec),tostring(t_t.min),tostring(t_t.hour)
            if identifyexec()=="Synapse X"and (is_redirection_enabled and is_redirection_enabled()) and  ______Synapse.InternalUIEnabled then
                printconsole(h..":"..minute..":"..sec.." // Ultra Chaos V3 :: CATCHED ERROR!\n"..e.."\nIgnoring..",255, 255, 0)
            else
                UI.Log:Warn(e.."\nIgnoring..")
            end
        end
    end)()
end
local mouse = LocalPlayer:GetMouse()
mouse.KeyDown:Connect(function(key)
    AddAsync(function()
        if key == "v"and not Minigun_Enabled then
            Minigun_Enabled=true
        end
        if key == "g"and not SpamGrenade then
            SpamGrenade = true
        end
        if key == "z"and not SpamC4 then 
            SpamC4=true
        end
        if key == "h"and not SpamSpike then
            SpamSpike=true
        end
    end)
end)
mouse.KeyUp:Connect(function(key)
    AddAsync(function()
        if key == "v"and Minigun_Enabled then
            Minigun_Enabled=false
        end
        if key == "g"and SpamGrenade then
            SpamGrenade = false
        end
        if key =="z" and SpamC4 then 
            SpamC4=false
        end
        if key == "h"and SpamSpike then
            SpamSpike=false
        end
    end)
end)
local function ClearBackpack()
    AddAsync(function()
        IreXion:Notify("Clearning your Backpack...")
        for i,v in pairs(LocalPlayer.Backpack:GetChildren()) do
            v:Destroy()
            rs:Wait()
        end
        IreXion:Notify("Backpack cleared!")
    end)()
end
Misc:NewButton("Clear Backpack",ClearBackpack)
Misc:NewToggle("Clear Backpack on death",function(b)
    ClearBackpackOnDeath=b
end)
Misc:NewButton("Get weapon from Selected", function()
    AddAsync(function()
	    if LocalPlayer.Character:FindFirstChild("Loaded") then
	    	LocalPlayer.Character.Loaded:Destroy()
	    end
	    LocalPlayer.PlayerGui:FindFirstChild("Menu Screen").RemoteEvent:FireServer(Selected)
	    if LocalPlayer.PlayerGui:FindFirstChild"Menu Screen".Enabled then LocalPlayer.PlayerGui:FindFirstChild"Menu Screen".Enabled = false end
    end)
end)
LocalPlayer_Page:NewSlider("Speed", 200, 16, function(Speed)
	LocalPlayer.Character.Humanoid.WalkSpeed = Speed
end)
LocalPlayer_Page:NewSlider("Jump Power", 250, 48, function(JumpPower)
	LocalPlayer.Character.Humanoid.JumpPower = JumpPower
end)
LocalPlayer.Character.Humanoid.Died:Connect(function(_)
    AddAsync(function()
        if ClearBackpackOnDeath then ClearBackpack()end
	    wait(5.6)
	    if WeaponsOnRespawn then
	        LocalPlayer.PlayerGui:FindFirstChild"Menu Screen".RemoteEvent:FireServer(Selected)
	    	LocalPlayer.PlayerGui:FindFirstChild"Menu Screen".Enabled = false
	    end
    end)
end)
while wait(0.1) do
    AddAsync(function()
        if Minigun_Enabled then
            AddAsync(function()
                for i, v in pairs(LocalPlayer.Backpack:GetChildren()) do
                    if v.Name == "Kawaii Revolver" then
                        if Minigun_Enabled then
                            LocalPlayer.Character.Humanoid:EquipTool(v)
                            v:Activate()
                            rs:Wait()
                        end
                    end
                end
            end)
        elseif DupeItems then
            AddAsync(function()
                if LocalPlayer.Character:FindFirstChild"Loaded"then LocalPlayer.Character.Loaded:Destroy()end
                if LocalPlayer.PlayerGui:FindFirstChild"Menu Screen".Enabled then LocalPlayer.PlayerGui:FindFirstChild"Menu Screen".Enabled = false end
                LocalPlayer.PlayerGui:FindFirstChild("Menu Screen"):FindFirstChild("RemoteEvent"):FireServer(Selected)
            end)
        elseif SpamGrenade then
            AddAsync(function()
                for i, v in pairs(LocalPlayer.Backpack:GetChildren()) do
                    if v.Name == "Grenade" then
                        if SpamGrenade then
                           LocalPlayer.Character.Humanoid:EquipTool(v)
                            v:Activate()
                            rs:Wait()
                        end
                    end
                end
            end)
        elseif SpamSpike then
            AddAsync(function()
                for i, v in pairs(LocalPlayer.Backpack:GetChildren()) do
                    if v.Name == "Spiked Trap" then
                        if SpamSpike then
                            LocalPlayer.Character.Humanoid:EquipTool(v)
                           v:Activate()
                            rs:Wait()
                        end
                    end
                end
            end)
        elseif SpamC4 then
            AddAsync(function()
                for i, v in pairs(LocalPlayer.Backpack:GetChildren()) do
                    if v.Name == "C4" then
                        if SpamC4 then
                            LocalPlayer.Character.Humanoid:EquipTool(v)
                            v:Activate()
                           rs:Wait()
                        end
                    end
                end
            end)
        elseif KillAll then
            AddAsync(function()
                for i, v in pairs(LocalPlayer.Backpack:GetChildren()) do
                    if v:FindFirstChild("DamageRemote") then
                        LocalPlayer.Character.Humanoid:EquipTool(v)
                        local targ
                        local range = math.huge
                        for i, v in pairs(workspace:GetChildren()) do
                            if v ~= LocalPlayer.Character and not table.find(IgnoreList, v.Name:lower()) then
                                local vhum = v:FindFirstChild("Humanoid")
                                local vroot = v:FindFirstChild("HumanoidRootPart")
                                if vhum and vroot and LocalPlayer.Character.HumanoidRootPart then
                                    local dist = (vroot.Position - LocalPlayer.Character.HumanoidRootPart.Position).magnitude
                                    if vhum.Health > 0 and not v:FindFirstChild"ForceField"and tonumber(dist)<=range then
                                        targ = vhum
                                        range = dist
                                    end
                                end
                            end
                        end
                        rs:Wait()
                        if targ then
                            v.DamageRemote:FireServer(targ)
                        end
                    end
                end
            end)
        elseif KillAura then
            AddAsync(function()
                local targ
                local Range = KA_Range
                for i, v in pairs(workspace:GetChildren()) do
                    if v ~= LocalPlayer.Character and not table.find(IgnoreList, v.Name:lower()) then
                        local vhum = v:FindFirstChild("Humanoid")
                        local vroot = v:FindFirstChild("HumanoidRootPart")
                        if vhum and vroot and LocalPlayer.Character.HumanoidRootPart then
                            local dist =(vroot.Position - LocalPlayer.Character.HumanoidRootPart.Position).magnitude
                            if vhum.Health>0 and not v:FindFirstChild"ForceField"and tonumber(dist)<=tonumber(Range)then
                                targ = vhum
                                Range = dist
                            end
                        end
                    end
                end
                if targ then
                    for i, v in pairs(LocalPlayer.Backpack:GetChildren()) do
                        if table.find(WeaponTable,v.Name) then
                            LocalPlayer.Character.Humanoid:EquipTool(v)
                        if LocalPlayer.Character:FindFirstChild(v.Name)then break end
                        end
                    end
                    LocalPlayer.Character:FindFirstChildOfClass("Tool").DamageRemote:FireServer(targ)
                    if SilentKillAura then
                        LocalPlayer.Character.Humanoid:UnequipTools()
                    end
                end
                rs:Wait()
            end)
        end
    end)
end
