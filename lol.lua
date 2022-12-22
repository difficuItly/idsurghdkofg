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
