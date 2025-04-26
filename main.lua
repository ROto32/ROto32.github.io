local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local autoBubbleEnabled = false
local autoCollectEnabled = false
local autoMysteryClaimEnabled = false
local autoMarketEnabled = false
local autoBuffEnabled = false
local AutoPetEnable = false
local AutoShopEnable = false

local Window = Rayfield:CreateWindow({
   Name = "oto.wtf",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "oto.wtf loading...",
   LoadingSubtitle = "by oto",
   Theme = "Amethyst", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   DisableRayfieldPrompts = true,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "oto"
   },

   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

Rayfield:Notify("oto.wtf is loading", "happy exploiting", 4483362458) -- Notfication -- Title, Content, Image

local Tab = Window:CreateTab("main", 4483362458) -- Title, Image

local Section = Tab:CreateSection("main")


local Toggle = Tab:CreateToggle({
	Name = "Auto Bubble",
	CurrentValue = false,
	Flag = "autobubble",
	Callback = function(autobubble)
		autoBubbleEnabled = autobubble

		if autobubble then
			task.spawn(function()
				while autoBubbleEnabled do
					local args = {
                        [1] = "BlowBubble"
                    }

                    game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Framework"):WaitForChild("Network"):WaitForChild("Remote"):WaitForChild("Event"):FireServer(unpack(args))
					task.wait(0.1)
				end
			end)
		end
	end,
})

local Toggle = Tab:CreateToggle({
	Name = "Auto Collect",
	CurrentValue = false,
	Flag = "autocollect",
	Callback = function(autocollect)
		autoCollectEnabled = autocollect

		if autocollect then
			task.spawn(function()
				while autoCollectEnabled do
					local renderedFolder = workspace:FindFirstChild("Rendered")
					if renderedFolder then
						for _, chunker in ipairs(renderedFolder:GetChildren()) do
							if chunker:IsA("Folder") and chunker.Name == "Chunker" then
								for _, model in ipairs(chunker:GetChildren()) do
									if model:IsA("Model") then
										local args = { model.Name }
										game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Pickups"):WaitForChild("CollectPickup"):FireServer(unpack(args))
									end
								end
							end
						end
					end
					task.wait(5)
				end
			end)
		end
	end,
})

local Toggle = Tab:CreateToggle({
	Name = "Auto Mystery Box",
	CurrentValue = false,
	Flag = "automysteryclaim",
	Callback = function(state)
		autoMysteryClaimEnabled = state
		if autoMysteryClaimEnabled then
			task.spawn(function()
				while autoMysteryClaimEnabled do
					-- 📦 Utiliser la Mystery Box
					local argsUseGift = {
						[1] = "UseGift",
						[2] = "Mystery Box",
						[3] = 5 -- Quantité, changeable
					}
					game:GetService("ReplicatedStorage")
						:WaitForChild("Shared")
						:WaitForChild("Framework")
						:WaitForChild("Network")
						:WaitForChild("Remote")
						:WaitForChild("Event")
						:FireServer(unpack(argsUseGift))

					-- 🎁 Claimer les Gifts dans workspace.Rendered.Gifts
					local giftsFolder = workspace:FindFirstChild("Rendered") and workspace.Rendered:FindFirstChild("Gifts")
					if giftsFolder then
						for _, gift in ipairs(giftsFolder:GetChildren()) do
							if gift:IsA("Model") then
								local argsClaimGift = {
									[1] = "ClaimGift",
									[2] = gift.Name -- IMPORTANT: gift.Name ici pour chaque modèle
								}
								game:GetService("ReplicatedStorage")
									:WaitForChild("Shared")
									:WaitForChild("Framework")
									:WaitForChild("Network")
									:WaitForChild("Remote")
									:WaitForChild("Event")
									:FireServer(unpack(argsClaimGift))
							end
						end
					end

					task.wait(2) -- Petit délai pour éviter le spam
				end
			end)
		end
	end,
})



local Toggle = Tab:CreateToggle({
	Name = "Auto Buy Black Market",
	CurrentValue = false,
	Flag = "automarket",
	Callback = function(automarket)
		autoMarketEnabled = automarket

		if automarket then
			task.spawn(function()
				while autoMarketEnabled do
                    local args = {
                        [1] = "BuyShopItem",
                        [2] = "shard-shop",
                        [3] = 1 
                    }
                    
                    game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Framework"):WaitForChild("Network"):WaitForChild("Remote"):WaitForChild("Event"):FireServer(unpack(args))
                    local args = {
                        [1] = "BuyShopItem",
                        [2] = "shard-shop",
                        [3] = 2
                    }
                    
                    game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Framework"):WaitForChild("Network"):WaitForChild("Remote"):WaitForChild("Event"):FireServer(unpack(args))
                    local args = {
                        [1] = "BuyShopItem",
                        [2] = "shard-shop",
                        [3] = 3
                    }
                    
                    game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Framework"):WaitForChild("Network"):WaitForChild("Remote"):WaitForChild("Event"):FireServer(unpack(args))
                    local args = {
                        [1] = "BuyShopItem",
                        [2] = "shard-shop",
                        [3] = 1 
                    }
                    
                    game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Framework"):WaitForChild("Network"):WaitForChild("Remote"):WaitForChild("Event"):FireServer(unpack(args))
                    local args = {
                        [1] = "BuyShopItem",
                        [2] = "shard-shop",
                        [3] = 2
                    }
                    
                    game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Framework"):WaitForChild("Network"):WaitForChild("Remote"):WaitForChild("Event"):FireServer(unpack(args))
                    local args = {
                        [1] = "BuyShopItem",
                        [2] = "shard-shop",
                        [3] = 3
                    }
                    
                    game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Framework"):WaitForChild("Network"):WaitForChild("Remote"):WaitForChild("Event"):FireServer(unpack(args))
                    local args = {
                        [1] = "BuyShopItem",
                        [2] = "shard-shop",
                        [3] = 1 
                    }
                    
                    game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Framework"):WaitForChild("Network"):WaitForChild("Remote"):WaitForChild("Event"):FireServer(unpack(args))
                    local args = {
                        [1] = "BuyShopItem",
                        [2] = "shard-shop",
                        [3] = 2
                    }
                    
                    game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Framework"):WaitForChild("Network"):WaitForChild("Remote"):WaitForChild("Event"):FireServer(unpack(args))
                    local args = {
                        [1] = "BuyShopItem",
                        [2] = "shard-shop",
                        [3] = 3
                    }
                    
                    game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Framework"):WaitForChild("Network"):WaitForChild("Remote"):WaitForChild("Event"):FireServer(unpack(args))
                    local args = {
                        [1] = "BuyShopItem",
                        [2] = "shard-shop",
                        [3] = 1 
                    }
                    
                    game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Framework"):WaitForChild("Network"):WaitForChild("Remote"):WaitForChild("Event"):FireServer(unpack(args))
                    local args = {
                        [1] = "BuyShopItem",
                        [2] = "shard-shop",
                        [3] = 2
                    }
                    
                    game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Framework"):WaitForChild("Network"):WaitForChild("Remote"):WaitForChild("Event"):FireServer(unpack(args))
                    local args = {
                        [1] = "BuyShopItem",
                        [2] = "shard-shop",
                        [3] = 3
                    }
                    
                    game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Framework"):WaitForChild("Network"):WaitForChild("Remote"):WaitForChild("Event"):FireServer(unpack(args))
                    local args = {
                        [1] = "ShopFreeReroll",
                        [2] = "shard-shop"
                    }

                    game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Framework"):WaitForChild("Network"):WaitForChild("Remote"):WaitForChild("Event"):FireServer(unpack(args))

					task.wait(10)
				end
			end)
		end
	end,
})

local Toggle = Tab:CreateToggle({
	Name = "Auto Upgrade Buffs Mastery",
	CurrentValue = false,
	Flag = "autoBuff",
	Callback = function(autobuff)
		autoBuffEnabled = autobuff

		if autobuff then
			task.spawn(function()
				while autoBuffEnabled do
                    local args = {
                        [1] = "UpgradeMastery",
                        [2] = "Buffs"
                    }

                    game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Framework"):WaitForChild("Network"):WaitForChild("Remote"):WaitForChild("Event"):FireServer(unpack(args))
                    wait(1)
				end
			end)
		end
	end,
})

local Toggle = Tab:CreateToggle({
	Name = "Auto Upgrade Pets Mastery",
	CurrentValue = false,
	Flag = "autoPet",
	Callback = function(autopet)
		autopetEnabled = autopet

		if autopet then
			task.spawn(function()
				while autoPetEnabled do
                    local args = {
                        [1] = "UpgradeMastery",
                        [2] = "Pets"
                    }

                    game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Framework"):WaitForChild("Network"):WaitForChild("Remote"):WaitForChild("Event"):FireServer(unpack(args))
                    wait(1)
				end
			end)
		end
	end,
})

local Toggle = Tab:CreateToggle({
	Name = "Auto Upgrade Shops Mastery",
	CurrentValue = false,
	Flag = "autoShop",
	Callback = function(autoshop)
		autoShopEnabled = autoshop

		if autoshop then
			task.spawn(function()
				while autoShopEnabled do
                    local args = {
                        [1] = "UpgradeMastery",
                        [2] = "Shops"
                    }

                    game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Framework"):WaitForChild("Network"):WaitForChild("Remote"):WaitForChild("Event"):FireServer(unpack(args))
                    wait(1)
				end
			end)
		end
	end,
})

local Tab = Window:CreateTab("Hatch", 4483362458) 
-- getgenv().SecureMode = true -- Only Set To True If Games Are Detecting/Crashing The UI

-- Rayfield:Destroy() -- Destroys UI

-- Rayfield:LoadConfiguration() -- Enables Configuration Saving

-- Section:Set("Section Example") -- Use To Update Section Text

-- Button:Set("Button Example") -- Use To Update Button Text

-- Toggle:Set(false) -- Use To Update Toggle

-- Slider:Set(10) -- Use To Update Slider Value

-- Label:Set("Label Example") -- Use To Update Label Text

-- Paragraph:Set({Title = "Paragraph Example", Content = "Paragraph Example"}) -- Use To Update Paragraph Text

-- Keybind:Set("RightCtrl") -- Keybind (string) -- Use To Update Keybind

-- Dropdown:Set("Option 2") -- The new option value -- Use To Update/Set New Dropdowns
