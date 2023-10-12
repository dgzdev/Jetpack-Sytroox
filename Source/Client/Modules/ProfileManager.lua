local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- * Modules
local Profiles = require(ReplicatedStorage.Modules.Profiles)

local ProfileManager = {}
local MyProfile: Profiles.Profile = nil
ProfileManager.MyProfile = MyProfile

function ProfileManager.OnProfileReceive(self, Profile: {})
	print(`[PROFILE] Client received profile!`)
	print(Profile)
	self.Profile = Profile
end

return ProfileManager
