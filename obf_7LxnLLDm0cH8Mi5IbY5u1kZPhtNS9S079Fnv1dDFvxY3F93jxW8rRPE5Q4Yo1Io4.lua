hookfunction(game.Players.LocalPlayer.IsInGroup, function() return true end)
loadstring(game:HttpGet('https://raw.githubusercontent.com/SeigeDev/SeigeDev/main/AntiAiMViewer.lua'))()
local Aiming = loadstring(game:HttpGet("https://pastebin.com/raw/3A9wdSkL"))()

Aiming.TeamCheck(false)



local Workspace = game:GetService("Workspace")

local Players = game:GetService("Players")

local RunService = game:GetService("RunService")

local UserInputService = game:GetService("UserInputService")



local LocalPlayer = Players.LocalPlayer

local Mouse = LocalPlayer:GetMouse()

local CurrentCamera = Workspace.CurrentCamera


---------------------------------------------------------------
local DaHoodSettings = {
    
    SilentAim = true,

    AimLock = false,

    Prediction = 0.1499,

    AimLockKeybind = Enum.KeyCode.E,

    Resolver = true,
    
}
-------------------------------------------------------------------------------
getgenv().DaHoodSettings = DaHoodSettings
getgenv().Aiming.FOV = 35
--------------------------------------------------- -fov 5.5-6.6 is legit

function Aiming.Check()

    if not (Aiming.Enabled == true and Aiming.Selected ~= LocalPlayer and Aiming.SelectedPart ~= nil) then

        return false

    end

    local Character = Aiming.Character(Aiming.Selected)

    local KOd = Character:WaitForChild("BodyEffects")["K.O"].Value

    local Grabbed = Character:FindFirstChild("GRABBING_CONSTRAINT") ~= nil

    if (KOd or Grabbed) then

        return false

    end

    return true

end



task.spawn(function()

    while task.wait() do
--// PATCHED DONT EVEN BOTHER

game:GetService("StarterGui"):SetCore("SendNotification", {Title = "DISCORD", Text = "DHSA#0613", Duration = 10,})
local Aiming = loadstring(game:HttpGet("https://pastebin.com/raw/3A9wdSkL"))()

Aiming.TeamCheck(false)



local Workspace = game:GetService("Workspace")

local Players = game:GetService("Players")

local RunService = game:GetService("RunService")

local UserInputService = game:GetService("UserInputService")



local LocalPlayer = Players.LocalPlayer

local Mouse = LocalPlayer:GetMouse()

local CurrentCamera = Workspace.CurrentCamera


---------------------------------------------------------------
local DaHoodSettings = {
    
    SilentAim = true,

    AimLock = false,

    Prediction = 0.1499,

    AimLockKeybind = Enum.KeyCode.E,

    Resolver = true,
    
}
-------------------------------------------------------------------------------
getgenv().DaHoodSettings = DaHoodSettings
getgenv().Aiming.FOV = 35
--------------------------------------------------- -fov 5.5-6.6 is legit

function Aiming.Check()

    if not (Aiming.Enabled == true and Aiming.Selected ~= LocalPlayer and Aiming.SelectedPart ~= nil) then

        return false

    end

    local Character = Aiming.Character(Aiming.Selected)

    local KOd = Character:WaitForChild("BodyEffects")["K.O"].Value

    local Grabbed = Character:FindFirstChild("GRABBING_CONSTRAINT") ~= nil

    if (KOd or Grabbed) then

        return false

    end

    return true

end



task.spawn(function()

    while task.wait() do

        if DaHoodSettings.Resolver and Aiming.Selected ~= nil and (Aiming.Selected.Character)  then

            local oldVel = game.Players[Aiming.Selected.Name].Character.HumanoidRootPart.Velocity

            game.Players[Aiming.Selected.Name].Character.HumanoidRootPart.Velocity = Vector3.new(oldVel.X, -0, oldVel.Z)

        end 

    end

end)



local Script = {Functions = {}}



Script.Functions.getToolName = function(name)

    local split = string.split(string.split(name, "[")[2], "]")[1]

    return split

end



Script.Functions.getEquippedWeaponName = function(player)

   if (player.Character) and player.Character:FindFirstChildWhichIsA("Tool") then

      local Tool =  player.Character:FindFirstChildWhichIsA("Tool")

      if string.find(Tool.Name, "%[") and string.find(Tool.Name, "%]") and not string.find(Tool.Name, "Wallet") and not string.find(Tool.Name, "Phone") then 

         return Script.Functions.getToolName(Tool.Name)

      end

   end

   return nil

end



game:GetService("RunService").RenderStepped:Connect(function()

    if Script.Functions.getEquippedWeaponName(game.Players.LocalPlayer) ~= nil then

        local WeaponSettings = GunSettings[Script.Functions.getEquippedWeaponName(game.Players.LocalPlayer)]

        if WeaponSettings ~= nil then

            Aiming.FOV = WeaponSettings.FOV

        else

            Aiming.FOV = 35

        end

    end    

end)

local __index

__index = hookmetamethod(game, "__index", function(t, k)

    if (t:IsA("Mouse") and (k == "Hit" or k == "Target") and Aiming.Check()) then

        local SelectedPart = Aiming.SelectedPart

        if (DaHoodSettings.SilentAim and (k == "Hit" or k == "Target")) then

            local Hit = SelectedPart.CFrame + (SelectedPart.Velocity * DaHoodSettings.Prediction)

            return (k == "Hit" and Hit or SelectedPart)

        end

    end



    return __index(t, k)

end)



RunService:BindToRenderStep("AimLock", 0, function()

    if (DaHoodSettings.AimLock and Aiming.Check() and UserInputService:IsKeyDown(DaHoodSettings.AimLockKeybind)) then

        local SelectedPart = Aiming.SelectedPart

        local Hit = SelectedPart.CFrame + (SelectedPart.Velocity * DaHoodSettings.Prediction)

        CurrentCamera.CFrame = CFrame.lookAt(CurrentCamera.CFrame.Position, Hit.Position)

    end
end)

----res
local a=setmetatable({},{__index=function(b,c)local d=game.GetService(game,c)if d then b[c]=d end;return d end})local e=a.Players.LocalPlayer;local function f(g)local h=false;local i;local j;local function k(l)i=l;repeat wait()j=l:FindFirstChild("HumanoidRootPart")until j;h=false end;k(g.Character or g.CharacterAdded:Wait())g.CharacterAdded:Connect(k)a.RunService.Heartbeat:Connect(function()if i and i:IsDescendantOf(workspace)and(j and j:IsDescendantOf(i))then if j.AssemblyAngularVelocity.Magnitude>50 or j.AssemblyLinearVelocity.Magnitude>100 then if h==false then game.StarterGui:SetCore("ChatMakeSystemMessage",{Text="Fling Exploit detected, Player: "..tostring(g),Color=Color3.fromRGB(255,200,0)})end;h=true;for m,n in ipairs(i:GetDescendants())do if n:IsA("BasePart")then n.CanCollide=false;n.AssemblyAngularVelocity=Vector3.new(0,0,0)n.AssemblyLinearVelocity=Vector3.new(0,0,0)n.CustomPhysicalProperties=PhysicalProperties.new(0,0,0)end end;j.CanCollide=false;j.AssemblyAngularVelocity=Vector3.new(0,0,0)j.AssemblyLinearVelocity=Vector3.new(0,0,0)j.CustomPhysicalProperties=PhysicalProperties.new(0,0,0)end end end)end;for m,n in ipairs(a.Players:GetPlayers())do if n~=e then f(n)end end;a.Players.PlayerAdded:Connect(f)local o=nil;a.RunService.Heartbeat:Connect(function()pcall(function()local j=e.Character.PrimaryPart;if j.AssemblyLinearVelocity.Magnitude>250 or j.AssemblyAngularVelocity.Magnitude>250 then j.AssemblyAngularVelocity=Vector3.new(0,0,0)j.AssemblyLinearVelocity=Vector3.new(0,0,0)j.CFrame=o;game.StarterGui:SetCore("ChatMakeSystemMessage",{Text="You were flung. Neutralizing velocity.",Color=Color3.fromRGB(255,0,0)})elseif j.AssemblyLinearVelocity.Magnitude<50 or j.AssemblyAngularVelocity.Magnitude>50 then o=j.CFrame end end)end)
        if DaHoodSettings.Resolver and Aiming.Selected ~= nil and (Aiming.Selected.Character)  then

            local oldVel = game.Players[Aiming.Selected.Name].Character.HumanoidRootPart.Velocity

            game.Players[Aiming.Selected.Name].Character.HumanoidRootPart.Velocity = Vector3.new(oldVel.X, -0, oldVel.Z)

        end 

    end

end)



local Script = {Functions = {}}



Script.Functions.getToolName = function(name)

    local split = string.split(string.split(name, "[")[2], "]")[1]

    return split

end



Script.Functions.getEquippedWeaponName = function(player)

   if (player.Character) and player.Character:FindFirstChildWhichIsA("Tool") then

      local Tool =  player.Character:FindFirstChildWhichIsA("Tool")

      if string.find(Tool.Name, "%[") and string.find(Tool.Name, "%]") and not string.find(Tool.Name, "Wallet") and not string.find(Tool.Name, "Phone") then 

         return Script.Functions.getToolName(Tool.Name)

      end

   end

   return nil

end



game:GetService("RunService").RenderStepped:Connect(function()

    if Script.Functions.getEquippedWeaponName(game.Players.LocalPlayer) ~= nil then

        local WeaponSettings = GunSettings[Script.Functions.getEquippedWeaponName(game.Players.LocalPlayer)]

        if WeaponSettings ~= nil then

            Aiming.FOV = WeaponSettings.FOV

        else

            Aiming.FOV = 35

        end

    end    

end)

local __index

__index = hookmetamethod(game, "__index", function(t, k)

    if (t:IsA("Mouse") and (k == "Hit" or k == "Target") and Aiming.Check()) then

        local SelectedPart = Aiming.SelectedPart

        if (DaHoodSettings.SilentAim and (k == "Hit" or k == "Target")) then

            local Hit = SelectedPart.CFrame + (SelectedPart.Velocity * DaHoodSettings.Prediction)

            return (k == "Hit" and Hit or SelectedPart)

        end

    end



    return __index(t, k)

end)



RunService:BindToRenderStep("AimLock", 0, function()

    if (DaHoodSettings.AimLock and Aiming.Check() and UserInputService:IsKeyDown(DaHoodSettings.AimLockKeybind)) then

        local SelectedPart = Aiming.SelectedPart

        local Hit = SelectedPart.CFrame + (SelectedPart.Velocity * DaHoodSettings.Prediction)

        CurrentCamera.CFrame = CFrame.lookAt(CurrentCamera.CFrame.Position, Hit.Position)

    end
end)

----res
local a=setmetatable({},{__index=function(b,c)local d=game.GetService(game,c)if d then b[c]=d end;return d end})local e=a.Players.LocalPlayer;local function f(g)local h=false;local i;local j;local function k(l)i=l;repeat wait()j=l:FindFirstChild("HumanoidRootPart")until j;h=false end;k(g.Character or g.CharacterAdded:Wait())g.CharacterAdded:Connect(k)a.RunService.Heartbeat:Connect(function()if i and i:IsDescendantOf(workspace)and(j and j:IsDescendantOf(i))then if j.AssemblyAngularVelocity.Magnitude>50 or j.AssemblyLinearVelocity.Magnitude>100 then if h==false then game.StarterGui:SetCore("ChatMakeSystemMessage",{Text="Fling Exploit detected, Player: "..tostring(g),Color=Color3.fromRGB(255,200,0)})end;h=true;for m,n in ipairs(i:GetDescendants())do if n:IsA("BasePart")then n.CanCollide=false;n.AssemblyAngularVelocity=Vector3.new(0,0,0)n.AssemblyLinearVelocity=Vector3.new(0,0,0)n.CustomPhysicalProperties=PhysicalProperties.new(0,0,0)end end;j.CanCollide=false;j.AssemblyAngularVelocity=Vector3.new(0,0,0)j.AssemblyLinearVelocity=Vector3.new(0,0,0)j.CustomPhysicalProperties=PhysicalProperties.new(0,0,0)end end end)end;for m,n in ipairs(a.Players:GetPlayers())do if n~=e then f(n)end end;a.Players.PlayerAdded:Connect(f)local o=nil;a.RunService.Heartbeat:Connect(function()pcall(function()local j=e.Character.PrimaryPart;if j.AssemblyLinearVelocity.Magnitude>250 or j.AssemblyAngularVelocity.Magnitude>250 then j.AssemblyAngularVelocity=Vector3.new(0,0,0)j.AssemblyLinearVelocity=Vector3.new(0,0,0)j.CFrame=o;game.StarterGui:SetCore("ChatMakeSystemMessage",{Text="You were flung. Neutralizing velocity.",Color=Color3.fromRGB(255,0,0)})elseif j.AssemblyLinearVelocity.Magnitude<50 or j.AssemblyAngularVelocity.Magnitude>50 then o=j.CFrame end end)end)
