local animationtable = {
    Enum.HumanoidStateType.FallingDown,
    Enum.HumanoidStateType.Running,
    Enum.HumanoidStateType.RunningNoPhysics,
    Enum.HumanoidStateType.Climbing,
    Enum.HumanoidStateType.StrafingNoPhysics,
    Enum.HumanoidStateType.Ragdoll,
    Enum.HumanoidStateType.GettingUp,
    Enum.HumanoidStateType.Jumping,
    Enum.HumanoidStateType.Landed,
    Enum.HumanoidStateType.Flying,
    Enum.HumanoidStateType.Freefall,
    Enum.HumanoidStateType.PlatformStanding,
    Enum.HumanoidStateType.Dead,
    Enum.HumanoidStateType.Swimming,
}

for k, v in pairs(animationtable) do
    game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid"):SetStateEnabled(v, false)
end
