local Tile = require(game.ReplicatedStorage.Common.Tile)

local map = Instance.new("Model", workspace)
local tile = {}
local mapSize = Vector3.new(16, 1, 16)

function GenerateMap()
    map.Name = "Map"
    GenerateFloor()
end

function GenerateFloor()
    for x = 0, mapSize.X do
        tile[x] = {}
        for z = 0, mapSize.Z do
            tile[x][z] = Tile.new("Tile " .. x .. "," .. z, map)
            tile[x][z].position = Vector3.new(x * tile[x][z].size.X, 0, z * tile[x][z].size.Z)
            tile[x][z].instantiate()
            if (x == 1 and z == 1) then
                tile[x][z].fade()
            end
        end
    end
end

GenerateMap()
