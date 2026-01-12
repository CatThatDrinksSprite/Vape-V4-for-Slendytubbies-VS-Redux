local vape = shared.vape
local Killaura
local AttackRange

Killaura = vape.Categories.Combat:CreateModule({
    Name = "Killaura",
    Function = function(callback)
        repeat wait()
            spawn(function()
                for _, Player in ipairs(game:GetService("Players"):GetPlayers()) do
                    if Player.Character and Player.Character:GetAttribute("Player") and game:GetService("Players").LocalPlayer.Character and game:GetService("Players").LocalPlayer.Character:GetAttribute("monsterType") and (Player.Character:WaitForChild("HumanoidRootPart").Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).Magnitude <= AttackRange.Value then
                        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("sendAttack"):FireServer(unpack({
                            {
                                Player.Character
                            },
                            game:GetService("Players").LocalPlayer.Character:GetAttribute("monsterType"),
                        }))
                    end
                end
            end)
        until (not Killaura.Enabled)
    end,
    Tooltip = "Attacks every Guardian near You",
})

AttackRange = Killaura:CreateSlider({
    Name = "Attack Range",
    Min = 1,
    Max = 30,
    Default = 13,
    Suffix = function(val)
        return val == 1 and 'stud' or 'studs'
    end,
})
