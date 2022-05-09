local tweenService = game:GetService("TweenService")

Tile = {}
Tile.__index = Tile

local tileObject

function Tile.new(name, parent, object, position, size)
    local newTile = {}
    setmetatable(newTile, Tile)
    newTile.name = name
    newTile.object = object
    newTile.size = size or Vector3.new(10, 10, 10)
    newTile.position = position or Vector3.new(0, 0, 0)
    newTile.parent = parent or workspace
    return newTile
end

function Tile:instantiate()
    self.object = Instance.new("Part", self.parent)
    self.object.Name = self.name
    self.object.Size = self.size
    self.object.Position = self.position
    self.object.Parent = self.parent
    self.object.Anchored = true
end

function Tile:fade()
    local isFading = false
    local fadeOut = tweenService:Create(self.object, TweenInfo.new(), {
        Transparency = 1,
        CanCollide = false
    })
    local fadeIn = tweenService:Create(self.object, TweenInfo.new(), {
        Transparency = 0,
        CanCollide = true
    })
    self.object.Touched:Connect(function(hit)
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
