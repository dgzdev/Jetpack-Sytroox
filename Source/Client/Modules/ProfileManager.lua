local ReplicatedStorage = game:GetService("ReplicatedStorage")

local ProfileManager = {}

local Profiles = require(ReplicatedStorage.Modules.Profiles)

local MyProfile: Profiles.Profile = nil

function ProfileManager.OnProfileReceive(Profile: {})
	print(`[PROFILE] Client received profile!`)
	print(Profile)

	MyProfile = Profile
end

return ProfileManager
