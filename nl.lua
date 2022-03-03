local rnsvc = game:GetService("RunService")

local density = .3
local friction = .1
local elasticity = 1
local frictionWeight = 1
local elasticityWeight = 1
 
local physProperties = PhysicalProperties.new(density, friction, elasticity, frictionWeight, elasticityWeight)

local realfenv
realfenv = hookfunction(getgenv().getfenv,function(a)
    local num = tonumber(a)
    if num then
        if num > 10 or num < 1 then
            error("Bypassing the error XD")
        else
            return realfenv()
        end
    else
        return realfenv()
    end
end)
 
local maxSim = 1000
getgenv().setsimulationradius = newcclosure(function(i,v)
	local maxSim = 1000
    local plr = game:GetService("Players").LocalPlayer
    sethiddenproperty(plr,"MaxSimulationRadius",maxSim)
    sethiddenproperty(plr,"MaximumSimulationRadius",maxSim)
    sethiddenproperty(plr,"SimulationRadius",maxSim)
    spoof(plr,"MaxSimulationRadius",maxSim)
    spoof(plr,"SimulationRadius",maxSim)
    spoof(plr,"MaximumSimulationRadius",maxSim)
end)
 
local shp
shp = hookfunction(getgenv().sethiddenproperty,function(i,p,v)
	local maxSim = 1000
    local plr = game:GetService("Players").LocalPlayer
    if i == plr then
        if (p == "MaxSimulationRadius" or p == "MaximumSimulationRadius" or p == "SimulationRadius") then
            if v == maxSim then
                shp(i,p,v)
            end
        else
            shp(i,p,v)
        end
    else
        shp(i,p,v)
    end
end)


for i,v in next, game:GetService("Players").LocalPlayer.Character:GetDescendants() do
if v:IsA("BasePart") and v.Name ~="HumanoidRootPart" then
rnsvc.Heartbeat:Connect(function()
v.Velocity = Vector3.new(-30,0,0)
v.AssemblyLinearVelocity = Vector3.new(-30,0,0)
v.AssemblyAngularVelocity = Vector3.new(0,0,0)
v.RootPriority = 127
v.Massless = true
end)
end
end

for i,v in next, game:GetService("Players").LocalPlayer.Character:GetDescendants() do
if v:IsA("BasePart") and v.Name ~="HumanoidRootPart" then
rnsvc.Heartbeat:Connect(function()
v.AssemblyAngularVelocity = Vector3.new(0,0,0)
v.RootPriority = 127
v.Massless = true
v.CanCollide = false
v.CanQuery = false
v.CanTouch = false
end)
end
end

for i,v in next, game:GetService("Players").LocalPlayer.Character:GetDescendants() do
if v:IsA("BasePart") and v.Name ~="HumanoidRootPart" then
rnsvc.Stepped:Connect(function()
v.AssemblyAngularVelocity = Vector3.new(0,0,0)
v.RootPriority = 127
v.Massless = true
v.CanCollide = false
v.CanQuery = false
v.CanTouch = false
end)
end
end

for i,v in next, game:GetService("Players").LocalPlayer.Character:GetDescendants() do
if v:IsA("BasePart") and v.Name =="HumanoidRootPart" then
rnsvc.Heartbeat:Connect(function()
v.AssemblyAngularVelocity = Vector3.new(0,0,0)
v.RootPriority = 127
v.Massless = true
v.CanCollide = false
v.CanQuery = false
v.CanTouch = false
end)
end
end

for i,v in next, game:GetService("Players").LocalPlayer.Character:GetDescendants() do
if v:IsA("BasePart") and v.Name =="HumanoidRootPart" then
rnsvc.Stepped:Connect(function()
v.AssemblyAngularVelocity = Vector3.new(0,0,0)
v.RootPriority = 127
v.Massless = true
v.CanCollide = false
v.CanQuery = false
v.CanTouch = false
end)
end
end

for i,v in next, game:GetService("Players").LocalPlayer.Character:GetDescendants() do
if v:IsA("BasePart") then
rnsvc.Heartbeat:Connect(function()
sethiddenproperty(v, "NetworkIsSleeping", false)
end)
end
end

for i,v in next, game:GetService("Players").LocalPlayer.Character:GetDescendants() do
if v:IsA("BasePart") then
rnsvc.Stepped:Connect(function()
sethiddenproperty(v, "NetworkIsSleeping", false)
end)
end
end

setsimulationradius()
setsimulationradius(1000)
setsimulationradius(1000, 1000)

local Physics = settings().Physics
local Rendering = settings().Rendering

task.spawn(coroutine.create(function()
   while true do game:GetService("RunService").Heartbeat:wait()
       Physics.AllowSleep = false
       Physics.ThrottleAdjustTime = math.huge-math.huge
       Physics.PhysicsEnvironmentalThrottle = Enum.EnviromentalPhysicsThrottle.Disabled
       Physics.DisableCSGv2                 = true
       Physics.ForceCSGv2                   = false
       Physics.UseCSGv2                     = false
       Rendering.EagerBulkExecution = true
       workspace.InterpolationThrottling = Enum.InterpolationThrottlingMode.Disabled
       game:GetService("RunService").Stepped:wait()
   end
end))
