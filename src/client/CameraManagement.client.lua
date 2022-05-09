local tweenService = game:GetService("TweenService")
local camera = workspace.CurrentCamera
local player = game.Players.LocalPlayer

local tweenInfo = TweenInfo.new(10, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0)

function tweenCamera(character)

    task.wait(5)
    local target = character:WaitForChild("HumanoidRootPart")
    local cam1 = CFrame.new(target.Position + Vector3.new(20, 10, 20), target.Position)
    local cam2 = CFrame.new(target.Position - Vector3.new(20, -10, 20), target.Position)

    camera.CameraType = Enum.CameraType.Scriptable
    camera.CFrame = cam1

    local tween = tweenService:Create(camera, tweenInfo, {
        CFrame = cam2
    })
    tween:Play()
    camera.CameraType = Enum.CameraType.Custom
end

player.CharacterAdded:Connect(tweenCamera)

