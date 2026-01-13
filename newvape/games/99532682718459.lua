local function downloadFile(path, func)
	if not isfile(path) then
		local suc, res = pcall(function()
			return game:HttpGet('https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/'..readfile('newvape/profiles/commit.txt')..'/'..select(1, path:gsub('newvape/', '')), true)
		end)
		if not suc or res == '404: Not Found' then
			error(res)
		end
		if path:find('.lua') then
			res = '--This watermark is used to delete the file if its cached, remove it to make the file persist after vape updates.\n'..res
		end
		writefile(path, res)
	end
	return (func or readfile)(path)
end
local ReplicatedStorage = game:GetService('ReplicatedStorage')
local Remotes = ReplicatedStorage:WaitForChild('Remotes')
local Players = game:GetService('Players')
local LocalPlayer = Players.LocalPlayer
local vape = shared.vape
local targetinfo = vape.Libraries.targetinfo
local entitylib = loadstring(downloadFile('newvape/libraries/entity.lua'), 'entitylibrary')()
local Killaura
local KillauraTargets
local KillauraAttackRange
local KillauraMax

Killaura = vape.Categories.Blatant:CreateModule({
    Name = 'Killaura',
    Function = function(callback)
        repeat
            local plrs = entitylib.AllPosition({
                Range = KillauraAttackRange.Value,
                Wallcheck = KillauraTargets.Walls.Enabled or nil,
                Part = 'RootPart',
                Players = KillauraTargets.Players.Enabled,
                NPCs = KillauraTargets.NPCs.Enabled,
                Limit = 1,
            })
            
            if #plrs > 0 then
                for _, v in plrs do
                    if LocalPlayer.Character and LocalPlayer.Character:GetAttribute("monsterType") then
                        targetinfo.Targets[v] = tick() + 1
                        Remotes:WaitForChild('sendAttack'):FireServer(unpack({
                            {
                                v.Character
                            },
                            LocalPlayer.Character:GetAttribute('monsterType'),
                        }))
                    end
                end
            end
            task.wait(0.03)
        until (not Killaura.Enabled)
    end,
    Tooltip = 'Attacks every Guardian near You',
})

KillauraTargets = Killaura:CreateTargets({
    Players = true,
})

KillauraAttackRange = Killaura:CreateSlider({
    Name = 'Attack Range',
    Min = 1,
    Max = 30,
    Default = 6,
    Suffix = function(val)
        return val == 1 and 'stud' or 'studs'
    end,
})
