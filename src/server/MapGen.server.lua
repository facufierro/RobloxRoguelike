local map = Instance.new("Model", workspace)
local tile = {}
local tileSize = Vector3.new(10, 1, 10)
local mapSize = Vector3.new(16, 1, 16)

function GenerateMap()
    map.Name = "Map"
    GenerateFloor()
end

function GenerateFloor()
    for x = 0, mapSize.X do
        tile[x] = {}
        for z = 0, mapSize.Z do
            tile[x][z] = Instance.new("Part", map)
            tile[x][z].Anchored = true
            tile[x][z].Name = "Tile" .. " " .. x .. "," .. z
            tile[x][z].Size = tileSize
            tile[x][z].Position = Vector3.new(x * tileSize.X, 0, z * tileSize.Z)
        end
    end
end
GenerateMap()
