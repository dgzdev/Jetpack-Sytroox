local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local ZoneManager = {}

local ZonePlus = require(ReplicatedStorage:WaitForChild("Modules"):WaitForChild("Zone"))

local Player = Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local Root = Character:WaitForChild("HumanoidRootPart")

ZoneManager.ResetCharacter = function(self)
	Root.Anchored = true
	Character:PivotTo(CFrame.new(-26, 1.6, -91))
	Root.Anchored = false
end
ZoneManager.Init = function(self)
	local FallLimit = Workspace:WaitForChild("FallLimit")
	local Zone = ZonePlus.new(FallLimit)
	Zone.localPlayerEntered:Connect(function()
		print("falled")
		self:ResetCharacter()
	end)
end
ZoneManager.OnProfileReceive = function(Profile) end

ZoneManager:Init()
return ZoneManager
