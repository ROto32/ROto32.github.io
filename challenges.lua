local Players = game:GetService("Players")
local player = Players.LocalPlayer

local tasksFolder = player.PlayerGui:WaitForChild("ScreenGui"):WaitForChild("Competitive"):WaitForChild("Frame"):WaitForChild("Content"):WaitForChild("Tasks")

-- Interface principale
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "TasksGui"
screenGui.Parent = player.PlayerGui

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 400, 0, 300)
mainFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = screenGui

local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 24, 0, 24)
closeButton.Position = UDim2.new(1, -28, 0, 4)
closeButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
closeButton.Text = "X"
closeButton.Parent = mainFrame
closeButton.MouseButton1Click:Connect(function()
	screenGui:Destroy()
end)

local scrollingFrame = Instance.new("ScrollingFrame")
scrollingFrame.Size = UDim2.new(1, -20, 1, -40)
scrollingFrame.Position = UDim2.new(0, 10, 0, 30)
scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 300)
scrollingFrame.ScrollBarThickness = 6
scrollingFrame.BackgroundTransparency = 1
scrollingFrame.Parent = mainFrame

local function createUIListLayout()
	local layout = Instance.new("UIListLayout")
	layout.Padding = UDim.new(0, 6)
	layout.Parent = scrollingFrame
end

createUIListLayout()

-- Fonction pour rafraîchir les quêtes
local function refreshTasks()
	-- Clear sans détruire tout
	for _, child in ipairs(scrollingFrame:GetChildren()) do
		if not child:IsA("UIListLayout") then
			child:Destroy()
		end
	end

	-- Parcours des tâches
	for _, frame in ipairs(tasksFolder:GetChildren()) do
		if frame:IsA("Frame") and frame.Name == "Template" then
			local content = frame:FindFirstChild("Content")
			if content then
				local label = content:FindFirstChild("Label")
				local rerollFrame = content:FindFirstChild("Reroll")
				local rerollButton = rerollFrame and rerollFrame:FindFirstChild("Button")

				if label and rerollButton then
					local container = Instance.new("Frame")
					container.Size = UDim2.new(1, 0, 0, 50)
					container.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
					container.Parent = scrollingFrame
					Instance.new("UICorner", container)

					-- Affichage du texte de la tâche
					local taskText = Instance.new("TextLabel")
					taskText.Size = UDim2.new(0.7, 0, 1, 0)
					taskText.Position = UDim2.new(0, 8, 0, 0)
					taskText.BackgroundTransparency = 1
					taskText.TextColor3 = Color3.new(1, 1, 1)
					taskText.Text = label.Text
					taskText.Font = Enum.Font.Gotham
					taskText.TextSize = 14
					taskText.TextXAlignment = Enum.TextXAlignment.Left
					taskText.Parent = container

					-- Bouton de reroll
					local rerollBtn = Instance.new("TextButton")
					rerollBtn.Size = UDim2.new(0.25, 0, 0.6, 0)
					rerollBtn.Position = UDim2.new(0.72, 0, 0.2, 0)
					rerollBtn.BackgroundColor3 = Color3.fromRGB(70, 130, 180)
					rerollBtn.Text = "🔄 Reroll"
					rerollBtn.TextColor3 = Color3.new(1, 1, 1)
					rerollBtn.Font = Enum.Font.GothamBold
					rerollBtn.TextSize = 14
					rerollBtn.Parent = container
					Instance.new("UICorner", rerollBtn)

					-- Connexion du bouton de reroll
					rerollBtn.MouseButton1Click:Connect(function()
						-- Appeler la logique du bouton de reroll, sans utiliser Fire()
						if rerollButton then
							-- Exécuter directement la logique associée à ce bouton
							local originalButtonFunction = rerollButton.MouseButton1Click
							if originalButtonFunction then
								-- Exécuter le clic du bouton
								originalButtonFunction:Connect(function() end)  -- Réexécuter l'action de reroll
							end
						end

						-- Rafraîchir la liste des quêtes après un reroll
						refreshTasks()
					end)
				end
			end
		end
	end
end

-- Premier rafraîchissement
refreshTasks()

-- Auto-refresh toutes les 10 secondes
task.spawn(function()
	while true do
		refreshTasks()
		task.wait(10)
	end
end)
