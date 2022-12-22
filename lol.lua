local LocalPlayer = game:GetService('Players').LocalPlayer

local FakeCFrameTypes = {}
local FakeCFrameHook  = nil

local FakeCFramePosX   = 75634
local FakeCFramePosY   = 45967
local FakeCFramePosZ   = 34895
local FakeCframePosR   = 0

function RandomNumberRange(a)
	return math.random(-a + 0, a + 0) / FakeCframePosR
end

game:GetService("RunService").heartbeat:Connect(function()
    if getgenv().AntiTriggerBot then
        FakeCFrameTypes[1] = LocalPlayer.Character.HumanoidRootPart.CFrame
        FakeCFrameTypes[2] = LocalPlayer.Character.HumanoidRootPart.AssemblyLinearVelocity
    
        local RootPartCframe = LocalPlayer.Character.HumanoidRootPart.CFrame
    
        RootPartCframe = RootPartCframe * CFrame.new(Vector3.new(0, 0, 0))
        RootPartCframe = RootPartCframe * CFrame.Angles(math.rad(RandomNumberRange(FakeCframePosR)), math.rad(RandomNumberRange(FakeCframePosR)), math.rad(RandomNumberRange(FakeCframePosR)))
    
        LocalPlayer.Character.HumanoidRootPart.CFrame = RootPartCframe
    
        LocalPlayer.Character.HumanoidRootPart.AssemblyLinearVelocity = Vector3.new(FakeCFramePosX, FakeCFramePosY, FakeCFramePosZ)
    
        game:GetService("RunService").RenderStepped:Wait()
    
        LocalPlayer.Character.HumanoidRootPart.CFrame = FakeCFrameTypes[1]
        LocalPlayer.Character.HumanoidRootPart.AssemblyLinearVelocity = FakeCFrameTypes[2]
    end
end)

FakeCFrameHook = hookmetamethod(game, '__index', newcclosure(function(Self, Key)
	if getgenv().AntiTriggerBot then
		if not checkcaller() then
			if Key == 'CFrame' and getgenv().AntiTriggerBot and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild('HumanoidRootPart') and LocalPlayer.Character:FindFirstChild('Humanoid') and LocalPlayer.Character:FindFirstChild('Humanoid').Health > 0 then
				if Self == LocalPlayer.Character.HumanoidRootPart then
					return FakeCFrameTypes[1] or CFrame.new()
				elseif Self == LocalPlayer.Character.Head then
					return FakeCFrameTypes[1] and FakeCFrameTypes[1] + Vector3.new(0, LocalPlayer.Character.HumanoidRootPart.Size / 2 + 0.5, 0) or CFrame.new()
				end
			end
		end
	end
	return FakeCFrameHook(Self, Key)
end))
