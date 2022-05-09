local tweenService = game:GetService("TweenService")

Tile = {}
Tile.__index = Tile

local newTile = {}
local tileObject

function Tile.new(name, parent, position, size)
    setmetatable(newTile, Tile)
    newTile.name = name
    newTile.size = size or Vector3.new(10, 10, 10)
    newTile.position = position or Vector3.new(0, 0, 0)
    newTile.parent = parent or workspace
    return newTile
end

function Tile.instantiate()
    tileObject = Instance.new("Part", newTile.parent)
    tileObject.Name = newTile.name
    tileObject.Size = newTile.size
    tileObject.Position = newTile.position
    tileObject.Parent = newTile.parent
    tileObject.Anchored = true
end

function Tile.fade()
    local isFading = false
    local fadeOut = tweenService:Create(tileObject, TweenInfo.new(), {
        Transparency = 1,
        CanCollide = false
    })
    local fadeIn = tweenService:Create(tileObject, TweenInfo.new(), {
        Transparency = 0,
        CanCollide = true
    })
    tileObject.Touched:Connect(function(hit)
        local humanoid = hit.Parent:FindFirstChildWhichIsA("Humanoid")
        if humanoid then
            if isFading == false then
                isFading = true
                fadeOut:Play()
                task.wait(2)
                fadeIn:Play()
                isFading = false
            end

        end
    end)
end

return Tile
