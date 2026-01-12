local vape = shared.vape
local Killaura

Killaura = vape.Categories.Combat:CreateModule({
    Name = "Killaura",
    Function = function(callback)
        repeat task.wait()
            task.spawn(function()
                for _, Player in ipairs(workspace:WaitForChild("game"):WaitForChild("Players"):GetChildren()) do
                    if Player:GetAttribute("isChar") and game:GetService("Players").LocalPlayer.Character:GetAttribute("monsterType") and (Player:WaitForChild("HumanoidRootPart").Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).Magnitude <= 12 then
                        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("sendAttack"):FireServer(unpack({
                            {
                                Player
                            },
                            game:GetService("Players").LocalPlayer.Character:GetAttribute("monsterType"),
                        }))
                    end
                end
            end)
        until (not Killaura.Enabled)
    end,
    Tooltip = "Hits Every Guardian Near You.",
})
