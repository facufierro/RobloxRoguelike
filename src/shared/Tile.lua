Tile = {}
Tile.__index = Tile

local newTile = {}

function Tile.new(name, parent, position, size)
    setmetatable(newTile, Tile)
    newTile.name = name
    newTile.size = size or Vector3.new(10, 10, 10)
    newTile.position = position or Vector3.new(0, 0, 0)
    newTile.parent = parent or workspace
    return newTile
end

function Tile.instantiate()
    local tileObject = Instance.new("Part", newTile.parent)
    tileObject.Name = newTile.name
    tileObject.Size = newTile.size
    tileObject.Position = newTile.position
    tileObject.Parent = newTile.parent
    tileObject.Anchored = true
end

return Tile
