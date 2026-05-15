--[[
    💠 BOKA | Brookhaven
    Script Name: ByBokaArabic
]]

local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local Player = Players.LocalPlayer

-- Variables
local NotificationsEnabled = true

-- Main GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "BOKA_Brookhaven"
ScreenGui.Parent = game.CoreGui

-- Main Frame (المستطيل الصغير)
local MainFrame = Instance.new("ImageLabel")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 350, 0, 200)
MainFrame.Position = UDim2.new(0.5, -175, 0.5, -100)
MainFrame.Image = "rbxthumb://type=Asset&w=420&h=420&id=89906424339503" -- صورة الخلفية
MainFrame.BackgroundTransparency = 1
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

-- Home Page (الصفحة الرئيسية)
local HomePage = Instance.new("Frame")
HomePage.Name = "HomePage"
HomePage.Size = UDim2.new(1, 0, 1, 0)
HomePage.BackgroundTransparency = 1
HomePage.Parent = MainFrame

-- Menu Title
local MenuTitle = Instance.new("TextLabel")
MenuTitle.Text = "القائمة الرئيسية 🏠"
MenuTitle.Size = UDim2.new(0, 100, 0, 30)
MenuTitle.Position = UDim2.new(0, 10, 0, 5)
MenuTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
MenuTitle.BackgroundTransparency = 1
MenuTitle.Font = Enum.Font.GothamBold
MenuTitle.TextSize = 14
MenuTitle.Parent = HomePage

-- Player Image (صورة اللاعب)
local PlayerImg = Instance.new("ImageLabel")
PlayerImg.Size = UDim2.new(0, 50, 0, 50)
PlayerImg.Position = UDim2.new(0, 15, 0, 40)
PlayerImg.Image = Players:GetUserThumbnailAsync(Player.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size150x150)
PlayerImg.BackgroundTransparency = 1
PlayerImg.Parent = HomePage

-- Corner for Image
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(1, 0)
UICorner.Parent = PlayerImg

-- Welcome Message
local WelcomeTxt = Instance.new("TextLabel")
WelcomeTxt.Text = "مساء النور يا " .. Player.Name
WelcomeTxt.Size = UDim2.new(0, 150, 0, 20)
WelcomeTxt.Position = UDim2.new(1, -160, 0, 40)
WelcomeTxt.TextColor3 = Color3.fromRGB(255, 255, 255)
WelcomeTxt.TextXAlignment = Enum.TextXAlignment.Right
WelcomeTxt.BackgroundTransparency = 1
WelcomeTxt.Font = Enum.Font.GothamMedium
WelcomeTxt.Parent = HomePage

-- Discord Button
local DiscordBtn = Instance.new("TextButton")
DiscordBtn.Text = "نسخ الديسكورد 🌐"
DiscordBtn.Size = UDim2.new(0, 150, 0, 20)
DiscordBtn.Position = UDim2.new(1, -160, 0, 65)
DiscordBtn.TextColor3 = Color3.fromRGB(0, 170, 255) -- لون أزرق للنسخ
DiscordBtn.BackgroundTransparency = 1
DiscordBtn.Font = Enum.Font.GothamBold
DiscordBtn.TextSize = 14
DiscordBtn.TextXAlignment = Enum.TextXAlignment.Right
DiscordBtn.Parent = HomePage

-- Underline Effect
local Underline = Instance.new("Frame")
Underline.Size = UDim2.new(0, 100, 0, 1)
Underline.Position = UDim2.new(1, -105, 1, 0)
Underline.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
Underline.Parent = DiscordBtn

DiscordBtn.MouseButton1Click:Connect(function()
    setclipboard("https://discord.gg/AxGsHERVZ")
    print("تم نسخ رابط الديسكورد!")
end)

-- Settings Button (المفك)
local SettingsBtn = Instance.new("TextButton")
SettingsBtn.Text = "🔧"
SettingsBtn.Size = UDim2.new(0, 25, 0, 25)
SettingsBtn.Position = UDim2.new(0, 75, 0, 52)
SettingsBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
SettingsBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
SettingsBtn.Parent = HomePage

-- Settings Page (صفحة الإعدادات)
local SettingsPage = Instance.new("Frame")
SettingsPage.Name = "SettingsPage"
SettingsPage.Size = UDim2.new(1, 0, 1, 0)
SettingsPage.BackgroundTransparency = 1
SettingsPage.Visible = false
SettingsPage.Parent = MainFrame

-- Back Button (رجوع)
local BackBtn = Instance.new("TextButton")
BackBtn.Text = "رجوع"
BackBtn.Size = UDim2.new(0, 60, 0, 25)
BackBtn.Position = UDim2.new(0, 10, 0, 10)
BackBtn.BackgroundColor3 = Color3.fromRGB(80, 0, 0)
BackBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
BackBtn.Parent = SettingsPage

-- Mute Toggle Button
local MuteContainer = Instance.new("Frame")
MuteContainer.Size = UDim2.new(0, 200, 0, 40)
MuteContainer.Position = UDim2.new(0.5, -100, 0.5, -20)
MuteContainer.BackgroundTransparency = 1
MuteContainer.Parent = SettingsPage

local MuteLabel = Instance.new("TextLabel")
MuteLabel.Text = "ميوت إشعارات"
MuteLabel.Size = UDim2.new(0, 100, 1, 0)
MuteLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
MuteLabel.BackgroundTransparency = 1
MuteLabel.Font = Enum.Font.GothamMedium
MuteLabel.Parent = MuteContainer

local ToggleBg = Instance.new("Frame")
ToggleBg.Size = UDim2.new(0, 50, 0, 25)
ToggleBg.Position = UDim2.new(1, -55, 0.5, -12)
ToggleBg.BackgroundColor3 = Color3.fromRGB(150, 160, 255) -- لون يشبه الصورة
ToggleBg.Parent = MuteContainer
local ToggleCorner = Instance.new("UICorner")
ToggleCorner.CornerRadius = UDim.new(1, 0)
ToggleCorner.Parent = ToggleBg

local ToggleDot = Instance.new("Frame")
ToggleDot.Size = UDim2.new(0, 21, 0, 21)
ToggleDot.Position = UDim2.new(0, 2, 0.5, -10)
ToggleDot.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ToggleDot.Parent = ToggleBg
local DotCorner = Instance.new("UICorner")
DotCorner.CornerRadius = UDim.new(1, 0)
DotCorner.Parent = ToggleDot

local ToggleBtn = Instance.new("TextButton")
ToggleBtn.Size = UDim2.new(1, 0, 1, 0)
ToggleBtn.BackgroundTransparency = 1
ToggleBtn.Text = ""
ToggleBtn.Parent = ToggleBg

-- Logic
SettingsBtn.MouseButton1Click:Connect(function()
    HomePage.Visible = false
    SettingsPage.Visible = true
end)

BackBtn.MouseButton1Click:Connect(function()
    SettingsPage.Visible = false
    HomePage.Visible = true
end)

ToggleBtn.MouseButton1Click:Connect(function()
    NotificationsEnabled = not NotificationsEnabled
    if NotificationsEnabled then
        TweenService:Create(ToggleDot, TweenInfo.new(0.2), {Position = UDim2.new(0, 2, 0.5, -10)}):Play()
        ToggleBg.BackgroundColor3 = Color3.fromRGB(150, 160, 255)
    else
        TweenService:Create(ToggleDot, TweenInfo.new(0.2), {Position = UDim2.new(1, -23, 0.5, -10)}):Play()
        ToggleBg.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
    end
end)

-- نظام كتم الإشعارات
game:GetService("StarterGui").ChildAdded:Connect(function(child)
    if not NotificationsEnabled and child:IsA("Frame") then -- تخصيص حسب نوع إشعارات الماب
        child.Visible = false
    end
end)

print("💠 BOKA | Brookhaven Loaded!")
