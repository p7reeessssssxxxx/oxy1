
do
    local genv = (getgenv and getgenv()) or _G
    if type(rawget(genv, "loadstring")) ~= "function" and type(load) == "function" then
        genv.loadstring = load
        _G.loadstring = _G.loadstring or load
    end
end

local MarketplaceService = game:GetService("MarketplaceService")
local TweenService        = game:GetService("TweenService")
local RunService          = game:GetService("RunService")
local CoreGui             = game:GetService("CoreGui")
local VERSION        = "1"
local LAST_UPDATED   = "2026-04-30"
local UPDATE_MESSAGE = "added AOT Revolution games"

local AOT_REVO       = "https://raw.githubusercontent.com/p7reeessssssxxxx/oxyfree/refs/heads/main/aotr%20oxy-obfuscated.lua"
local LUARMOR_BIZ    = "https://api.luarmor.net/files/v4/loaders/447580729d1c51c1eafa48045ac2eb02.lua"
local LUARMOR_BRIDGE = "https://api.luarmor.net/files/v4/loaders/92f99acda2ff5f0c6ff700f9f8c05fb9.lua"
local VV             = "https://api.luarmor.net/files/v4/loaders/f8d5888da72882996377c8e4f3625c1e.lua"
local REDLINER       = "https://raw.githubusercontent.com/p7reeessssssxxxx/oxyfree/refs/heads/main/oxy%20redliner-obfuscated.lua"
local PILGRAMMED     = "https://raw.githubusercontent.com/p7reeessssssxxxx/oxyfree/refs/heads/main/oxy%20pilgrammed-obfuscated.lua"
local GAG            = "https://raw.githubusercontent.com/p7reeessssssxxxx/oxyfree/refs/heads/main/oxy%20gag2-obfuscated.lua"
local GAK            = "https://raw.githubusercontent.com/p7reeessssssxxxx/oxyfree/refs/heads/main/oxy_gakuran_free-obfuscated.lua"
local BLOXSTRIKE     = "https://api.luarmor.net/files/v4/loaders/33045b7872e8144d95c00b7eb366be3b.lua"
local VD     = "https://raw.githubusercontent.com/p7reeessssssxxxx/oxyfree/refs/heads/main/violence%20district.lua" 
local OP1     = "https://raw.githubusercontent.com/p7reeessssssxxxx/oxyfree/refs/heads/main/oxy%20operation%20one%20FREE-obfuscated.lua" 
local SHINDO     = "https://raw.githubusercontent.com/p7reeessssssxxxx/oxyfree/refs/heads/main/oxy%20shindo%20free-obfuscated.lua" 



local Games = {
    [14890802310]     = { name = "biz biz biz",                        url = LUARMOR_BIZ },
    [74747090658891]  = { name = "biz",                                url = LUARMOR_BIZ },
    [99449877692519]  = { name = "bridge western",                     url = LUARMOR_BRIDGE },

    [6735572261]      = { name = "Pilgrammed",                              url = PILGRAMMED },
    
    [93978595733734]      = { name = "VD",                                              url = VD },

    [72920620366355]      = { name = "OP1",                                              url = OP1 },

    [135434213652028]      = { name = "Bloxstrike",                        url = BLOXSTRIKE },
    [114234929420007]      = { name = "Bloxstrike",                        url = BLOXSTRIKE },
    [108194354348181]      = { name = "Bloxstrike",                        url = BLOXSTRIKE },


    [128736949265057] = { name = "gakuran",                                   url = GAK },

    [97598239454123]  = { name = "gag2",                                      url = GAG },

    [115875349872417] = { name = "Redliner",                          url = REDLINER },
    [126691165749976] = { name = "Redliner",                          url = REDLINER },
    [94987506187454]  = { name = "Redliner",                          url = REDLINER },

    [13379349730]     = { name = "AOT Revolution — Shiganshina",       url = AOT_REVO },
    [13904207646]     = { name = "AOT Revolution — Outskirts",         url = AOT_REVO },
    [14012874501]     = { name = "AOT Revolution — Trost",             url = AOT_REVO },
    [14638336319]     = { name = "AOT Revolution — Forest",            url = AOT_REVO },
    [14916516914]     = { name = "AOT Revolution — Town Central",      url = AOT_REVO },
    [14932214603]     = { name = "AOT Revolution — Trade Central",     url = AOT_REVO },
    [15030367419]     = { name = "AOT Revolution — Outside Walls",     url = AOT_REVO },
    [15220308770]     = { name = "AOT Revolution — Utgard",            url = AOT_REVO },
    [15374465998]     = { name = "AOT Revolution — Outside the Walls 2", url = AOT_REVO },
    [15824912319]     = { name = "AOT Revolution — Stohess",           url = AOT_REVO },
    [17688739434]     = { name = "AOT Revolution — Docks",             url = AOT_REVO },
    [112374853034490] = { name = "AOT Revolution — Training Grounds",  url = AOT_REVO },
    [126678335159530] = { name = "AOT Revolution — Chapel",            url = AOT_REVO },

        [11910138955] = { name = "In-Game TS",                  url = SHINDO },
    [4616652839]  = { name = "Shindo Life [249]",           url = SHINDO },
    [5842796159]  = { name = "[CC] Dunes",                  url = SHINDO },
    [5842794915]  = { name = "[CC] Ember",                  url = SHINDO },
    [6834220153]  = { name = "[CC] Event Server",           url = SHINDO },
    [6792390620]  = { name = "[CC] Forest of Ember",        url = SHINDO },
    [5842799532]  = { name = "[CC] Haze",                   url = SHINDO },
    [4824219089]  = { name = "[CC] Mission Server",         url = SHINDO },
    [5842798556]  = { name = "[CC] Nimbus",                 url = SHINDO },
    [5842797437]  = { name = "[CC] Obelisk",                url = SHINDO },
    [6792392153]  = { name = "[CC] Storm",                  url = SHINDO },
    [5255110447]  = { name = "[CC] Story Selection",        url = SHINDO },
    [6792391835]  = { name = "[CC] Training Fields",        url = SHINDO },
    [5465404122]  = { name = "[CC] War Server",             url = SHINDO },
    [5084678830]  = { name = "[EVENT] Borumaki vs Kamaki",  url = SHINDO },
    [6984568732]  = { name = "[EVENT] Destroyed Ember",     url = SHINDO },
    [7214033433]  = { name = "[EVENT] Forged Rengoku",      url = SHINDO },
    [8472733618]  = { name = "[EVENT] Kagoku",              url = SHINDO },
    [9310522814]  = { name = "[EVENT] Last Fight",          url = SHINDO },
    [7534339269]  = { name = "[EVENT] Shindai Rengoku",     url = SHINDO },
    [5451410109]  = { name = "[MISC] Apartments",           url = SHINDO },
    [7524809704]  = { name = "[PvE] Dungeon Matchmaking",   url = SHINDO },
    [7524811367]  = { name = "[PvE] Dungeons",              url = SHINDO },
    [6505734854]  = { name = "[PvE] Great Shindo War",      url = SHINDO },
    [8184506020]  = { name = "[PvE] Mentor Training",       url = SHINDO },
    [5743370338]  = { name = "[PvP] ArenaX Unrated",        url = SHINDO },
    [6341670805]  = { name = "[PvP] Conquest",              url = SHINDO },
    [6602058266]  = { name = "[PvP] Tournament System",     url = SHINDO },
    [5664803952]  = { name = "[RPG] Competitive Pads",      url = SHINDO },
    [5664805984]  = { name = "[RPG] Competitive Queue",     url = SHINDO },
    [5431069982]  = { name = "[RPG] Dawn Hideout",          url = SHINDO },
    [6444873399]  = { name = "[RPG] Espada",                url = SHINDO },
    [5447073001]  = { name = "[RPG] Forest of Embers",      url = SHINDO },
    [5451398863]  = { name = "[RPG] Great Narumaki Bridge", url = SHINDO },
    [5255237254]  = { name = "[RPG] Mount Maki",            url = SHINDO },
    [5943872934]  = { name = "[RPG] Open World",            url = SHINDO },
    [5824792748]  = { name = "[RPG] Ryuji Cave",            url = SHINDO },
    [6602103757]  = { name = "[RPG] Shikai Forest",         url = SHINDO },
    [5451401540]  = { name = "[RPG] Shindai Valley",        url = SHINDO },
    [5431071837]  = { name = "[RPG] Training Field",        url = SHINDO },
    [6986372023]  = { name = "[RPG] Village: Blaze",        url = SHINDO },
    [4601350394]  = { name = "[RPG] Village: Dunes",        url = SHINDO },
    [4601350214]  = { name = "[RPG] Village: Ember",        url = SHINDO },
    [4601350760]  = { name = "[RPG] Village: Haze",         url = SHINDO },
    [7923764447]  = { name = "[RPG] Village: Jejunes",      url = SHINDO },
    [4601350656]  = { name = "[RPG] Village: Nimbus",       url = SHINDO },
    [4601350809]  = { name = "[RPG] Village: Obelisk",      url = SHINDO },
    [6901575446]  = { name = "[RPG] Village: Tempest",      url = SHINDO },
    [5451405681]  = { name = "[RPG] Village: Vinland",      url = SHINDO },
    [6593188260]  = { name = "[SS] Competitive",            url = SHINDO },
    [6593187011]  = { name = "[SS] Competitive Queue",      url = SHINDO },
    [5307141034]  = { name = "[SS] Shindo Storm",           url = SHINDO },
    

    [6270290407]      = { name = "VV: ULTIMATUM",            url = VV },
    [9854445386]      = { name = "[ Content Deleted ]",      url = VV },
    [9861495985]      = { name = "Inner World",              url = VV },
    [10626511620]     = { name = "Valley of Screams",        url = VV },
    [10627960269]     = { name = "OLD.",                     url = VV },
    [11127942816]     = { name = "Las Noches",               url = VV },
    [11131834995]     = { name = "Hueco Mundo",              url = VV },
    [11780443293]     = { name = "Wandenreich",              url = VV },
    [12337012844]     = { name = "Soul Society",             url = VV },
    [13229243486]     = { name = "Tournament",               url = VV },
    [14218523102]     = { name = "Soul Society Outskirts",   url = VV },
    [14219489601]     = { name = "Human World",              url = VV },
    [14321102147]     = { name = "Fort Adams",               url = VV },
    [14711269481]     = { name = "Arctic Plain(OLD)",        url = VV },
    [15079707729]     = { name = "Arctic Plains",            url = VV },
    [15645525857]     = { name = "Arctic Cave",              url = VV },
    [16914874220]     = { name = "Menos Forest",             url = VV },
    [17083682617]     = { name = "The Dangai",               url = VV },
    [18416507779]     = { name = "VV TEST ZONE",             url = VV },
    [18972283841]     = { name = "Snow Encampment",          url = VV },
    [95787471190312]  = { name = "The Marsh",                url = VV },
    [102123868363969] = { name = "Trade Realm",              url = VV },
    [121345602945775] = { name = "Matchmaking",              url = VV },
    [132224751888154] = { name = "UPDATE PLACE",             url = VV },
}


-- universal trigger disabled (no shared base url anymore - this was crashing on DKLN)
local UniversalTrigger = {
    enabled = false,
    words   = { "uni", "universal" },
    url     = "",
}

local POPUP_COUNTDOWN = 3

local function tween(obj, t, props, style, dir)
    local tw = TweenService:Create(obj,
        TweenInfo.new(t, style or Enum.EasingStyle.Quint, dir or Enum.EasingDirection.Out), props)
    tw:Play()
    return tw
end

local function notify(title, message)
    task.spawn(function()
        local BLUE1, BLUE2   = Color3.fromRGB(0, 27, 255),  Color3.fromRGB(0, 123, 255)
        local PURP1, PURP2   = Color3.fromRGB(217, 0, 255), Color3.fromRGB(42, 6, 42)
        local BTN_B1, BTN_B2 = Color3.fromRGB(38, 100, 236), Color3.fromRGB(7, 183, 213)
        local BTN_P1, BTN_P2 = Color3.fromRGB(131, 0, 212),  Color3.fromRGB(86, 0, 235)
        local STROKE_B, STROKE_P = Color3.fromRGB(0, 37, 86), Color3.fromRGB(52, 0, 84)
        local gui = Instance.new("ScreenGui")
        gui.Name = "OxyPopup"
        gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        gui.IgnoreGuiInset = true
        gui.ResetOnSpawn = false
        gui.DisplayOrder = 9999
        pcall(function() gui.Parent = CoreGui end)
        if not gui.Parent then gui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui") end
        local dim = Instance.new("Frame", gui)
        dim.Size = UDim2.fromScale(1, 1)
        dim.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        dim.BackgroundTransparency = 1
        dim.BorderSizePixel = 0
        dim.ZIndex = 1

        local box = Instance.new("Frame", gui)
        box.AnchorPoint = Vector2.new(0.5, 0.5)
        box.Position = UDim2.fromScale(0.5, 0.5)
        box.Size = UDim2.fromOffset(360, 190)
        box.BackgroundColor3 = Color3.fromRGB(31, 42, 60)
        box.BackgroundTransparency = 1
        box.BorderSizePixel = 0
        box.ZIndex = 2
        box.ClipsDescendants = true
        Instance.new("UICorner", box).CornerRadius = UDim.new(0, 12)

        local boxStroke = Instance.new("UIStroke", box)
        boxStroke.Thickness = 1.3
        boxStroke.Color = STROKE_B
        boxStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        boxStroke.Transparency = 1

        local gradLayer = Instance.new("Frame", box)
        gradLayer.Size = UDim2.fromScale(1, 1)
        gradLayer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        gradLayer.BackgroundTransparency = 1
        gradLayer.BorderSizePixel = 0
        gradLayer.ZIndex = 2
        Instance.new("UICorner", gradLayer).CornerRadius = UDim.new(0, 12)
        local boxGrad = Instance.new("UIGradient", gradLayer)

        local titleLbl = Instance.new("TextLabel", box)
        titleLbl.BackgroundTransparency = 1
        titleLbl.Position = UDim2.fromOffset(20, 18)
        titleLbl.Size = UDim2.fromOffset(200, 26)
        titleLbl.Font = Enum.Font.GothamBold
        titleLbl.TextSize = 22
        titleLbl.TextXAlignment = Enum.TextXAlignment.Left
        titleLbl.TextColor3 = Color3.fromRGB(255, 255, 255)
        titleLbl.Text = title or "Oxy"
        titleLbl.TextTransparency = 1
        titleLbl.ZIndex = 3
        local titleGrad = Instance.new("UIGradient", titleLbl)

        local liner = Instance.new("Frame", box)
        liner.BackgroundColor3 = Color3.fromRGB(100, 103, 128)
        liner.BorderSizePixel = 0
        liner.Position = UDim2.fromOffset(20, 50)
        liner.Size = UDim2.fromOffset(320, 1)
        liner.BackgroundTransparency = 1
        liner.ZIndex = 3

        local msgLbl = Instance.new("TextLabel", box)
        msgLbl.BackgroundTransparency = 1
        msgLbl.Position = UDim2.fromOffset(20, 62)
        msgLbl.Size = UDim2.fromOffset(320, 56)
        msgLbl.Font = Enum.Font.GothamMedium
        msgLbl.TextSize = 14
        msgLbl.TextWrapped = true
        msgLbl.TextXAlignment = Enum.TextXAlignment.Left
        msgLbl.TextYAlignment = Enum.TextYAlignment.Top
        msgLbl.TextColor3 = Color3.fromRGB(190, 200, 220)
        msgLbl.Text = message or ""
        msgLbl.TextTransparency = 1
        msgLbl.ZIndex = 3

        local btn = Instance.new("TextButton", box)
        btn.AnchorPoint = Vector2.new(0.5, 1)
        btn.Position = UDim2.new(0.5, 0, 1, -18)
        btn.Size = UDim2.fromOffset(320, 36)
        btn.AutoButtonColor = false
        btn.BackgroundTransparency = 1
        btn.Text = ""
        btn.BorderSizePixel = 0
        btn.Active = false
        btn.ZIndex = 3
        Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 8)

        local btnBg = Instance.new("Frame", btn)
        btnBg.Size = UDim2.fromScale(1, 1)
        btnBg.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        btnBg.BackgroundTransparency = 1
        btnBg.BorderSizePixel = 0
        btnBg.ZIndex = 3
        Instance.new("UICorner", btnBg).CornerRadius = UDim.new(0, 8)
        local btnGrad = Instance.new("UIGradient", btnBg)

        local btnText = Instance.new("TextLabel", btn)
        btnText.BackgroundTransparency = 1
        btnText.Size = UDim2.fromScale(1, 1)
        btnText.Font = Enum.Font.GothamBold
        btnText.TextSize = 14
        btnText.TextColor3 = Color3.fromRGB(255, 255, 255)
        btnText.Text = "Close UI (" .. POPUP_COUNTDOWN .. ")"
        btnText.TextTransparency = 1
        btnText.BorderSizePixel = 0
        btnText.ZIndex = 4

        local alive = true
        local conn
        conn = RunService.Heartbeat:Connect(function()
            if not alive then conn:Disconnect() return end
            local t = os.clock()
            local a = (math.sin(t * 0.6) + 1) / 2
            boxGrad.Color = ColorSequence.new{
                ColorSequenceKeypoint.new(0, BLUE1:Lerp(PURP1, a)),
                ColorSequenceKeypoint.new(1, BLUE2:Lerp(PURP2, a)),
            }
            boxGrad.Rotation = (t * 50) % 360
            titleGrad.Color = ColorSequence.new{
                ColorSequenceKeypoint.new(0, Color3.fromRGB(97, 166, 251):Lerp(Color3.fromRGB(175, 0, 250), a)),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(35, 212, 239):Lerp(Color3.fromRGB(0, 20, 149), a)),
            }
            btnGrad.Color = ColorSequence.new{
                ColorSequenceKeypoint.new(0, BTN_B1:Lerp(BTN_P1, a)),
                ColorSequenceKeypoint.new(1, BTN_B2:Lerp(BTN_P2, a)),
            }
            boxStroke.Color = STROKE_B:Lerp(STROKE_P, a)
        end)

        box.Size = UDim2.fromOffset(330, 175)
        tween(dim, 0.35, { BackgroundTransparency = 0.45 }, Enum.EasingStyle.Sine)
        tween(box, 0.45, { BackgroundTransparency = 0, Size = UDim2.fromOffset(360, 190) }, Enum.EasingStyle.Back)
        tween(boxStroke, 0.45, { Transparency = 0 })
        tween(gradLayer, 0.45, { BackgroundTransparency = 0.8 })
        task.wait(0.1)
        tween(titleLbl, 0.4, { TextTransparency = 0 })
        tween(liner, 0.4, { BackgroundTransparency = 0 })
        tween(msgLbl, 0.4, { TextTransparency = 0 })
        tween(btnBg, 0.4, { BackgroundTransparency = 0.55 })
        tween(btnText, 0.4, { TextTransparency = 0.4 })

        local clicked = false
        local function closePopup()
            if clicked then return end
            clicked = true
            tween(dim, 0.35, { BackgroundTransparency = 1 }, Enum.EasingStyle.Sine)
            tween(box, 0.35, { BackgroundTransparency = 1, Size = UDim2.fromOffset(330, 175) }, Enum.EasingStyle.Quint, Enum.EasingDirection.In)
            tween(boxStroke, 0.3, { Transparency = 1 })
            tween(gradLayer, 0.3, { BackgroundTransparency = 1 })
            tween(titleLbl, 0.25, { TextTransparency = 1 })
            tween(liner, 0.25, { BackgroundTransparency = 1 })
            tween(msgLbl, 0.25, { TextTransparency = 1 })
            tween(btnBg, 0.25, { BackgroundTransparency = 1 })
            tween(btnText, 0.25, { TextTransparency = 1 })
            task.wait(0.4)
            alive = false
            if conn then conn:Disconnect() end
            gui:Destroy()
        end

        btn.MouseButton1Click:Connect(function()
            if not btn.Active then return end
            closePopup()
        end)

        task.spawn(function()
            for remaining = POPUP_COUNTDOWN, 1, -1 do
                btnText.Text = "Close UI (" .. remaining .. ")"
                task.wait(1)
            end
            btn.Active = true
            btnText.Text = "Close UI"
            tween(btnBg, 0.3, { BackgroundTransparency = 0 })
            tween(btnText, 0.3, { TextTransparency = 0 })
            btn.Size = UDim2.fromOffset(300, 32)
            tween(btn, 0.4, { Size = UDim2.fromOffset(320, 36) }, Enum.EasingStyle.Back)
            task.delay(5, function()
                if not clicked then closePopup() end
            end)
        end)
    end)
end

local function execName()
    local ok, n = pcall(function()
        if type(identifyexecutor) == "function" then return (identifyexecutor()) end
        if type(getexecutorname) == "function" then return (getexecutorname()) end
        return nil
    end)
    return (ok and type(n) == "string") and string.lower(n) or ""
end

local function execTrusted()
    local n = execName()
    return n:find("volt", 1, true) ~= nil or n:find("potassium", 1, true) ~= nil or n:find("synapse z", 1, true) ~= nil
end

-- Blocking Yes/No warning. Returns true if the user accepts the risk, false if not.
local function confirmRisk()
    local BLUE1, BLUE2 = Color3.fromRGB(0, 27, 255),  Color3.fromRGB(0, 123, 255)
    local PURP1, PURP2 = Color3.fromRGB(217, 0, 255), Color3.fromRGB(42, 6, 42)
    local STROKE_B, STROKE_P = Color3.fromRGB(0, 37, 86), Color3.fromRGB(52, 0, 84)

    local gui = Instance.new("ScreenGui")
    gui.Name = "OxyRiskPopup"
    gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    gui.IgnoreGuiInset = true
    gui.ResetOnSpawn = false
    gui.DisplayOrder = 10000
    pcall(function() gui.Parent = CoreGui end)
    if not gui.Parent then gui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui") end

    local dim = Instance.new("Frame", gui)
    dim.Size = UDim2.fromScale(1, 1)
    dim.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    dim.BackgroundTransparency = 1
    dim.BorderSizePixel = 0
    dim.ZIndex = 1

    local box = Instance.new("Frame", gui)
    box.AnchorPoint = Vector2.new(0.5, 0.5)
    box.Position = UDim2.fromScale(0.5, 0.5)
    box.Size = UDim2.fromOffset(380, 215)
    box.BackgroundColor3 = Color3.fromRGB(31, 42, 60)
    box.BackgroundTransparency = 1
    box.BorderSizePixel = 0
    box.ZIndex = 2
    Instance.new("UICorner", box).CornerRadius = UDim.new(0, 12)
    local boxStroke = Instance.new("UIStroke", box)
    boxStroke.Thickness = 1.4
    boxStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    boxStroke.Transparency = 1

    local titleLbl = Instance.new("TextLabel", box)
    titleLbl.BackgroundTransparency = 1
    titleLbl.Position = UDim2.fromOffset(20, 16)
    titleLbl.Size = UDim2.fromOffset(340, 26)
    titleLbl.Font = Enum.Font.GothamBold
    titleLbl.TextSize = 20
    titleLbl.TextXAlignment = Enum.TextXAlignment.Left
    titleLbl.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLbl.Text = "Executor Warning"
    titleLbl.TextTransparency = 1
    titleLbl.ZIndex = 3

    local msgLbl = Instance.new("TextLabel", box)
    msgLbl.BackgroundTransparency = 1
    msgLbl.Position = UDim2.fromOffset(20, 54)
    msgLbl.Size = UDim2.fromOffset(340, 74)
    msgLbl.Font = Enum.Font.GothamMedium
    msgLbl.TextSize = 15
    msgLbl.TextWrapped = true
    msgLbl.TextXAlignment = Enum.TextXAlignment.Left
    msgLbl.TextYAlignment = Enum.TextYAlignment.Top
    msgLbl.TextColor3 = Color3.fromRGB(200, 210, 228)
    msgLbl.Text = "this executor isnt the best and can cause issues do you accept this risk?"
    msgLbl.TextTransparency = 1
    msgLbl.ZIndex = 3

    local function mkBtn(text, x, w, color)
        local b = Instance.new("TextButton", box)
        b.AnchorPoint = Vector2.new(0, 1)
        b.Position = UDim2.new(0, x, 1, -16)
        b.Size = UDim2.fromOffset(w, 38)
        b.AutoButtonColor = true
        b.BackgroundColor3 = color
        b.BackgroundTransparency = 1
        b.Text = text
        b.Font = Enum.Font.GothamBold
        b.TextSize = 15
        b.TextColor3 = Color3.fromRGB(255, 255, 255)
        b.TextTransparency = 1
        b.BorderSizePixel = 0
        b.ZIndex = 3
        Instance.new("UICorner", b).CornerRadius = UDim.new(0, 8)
        return b
    end
    local noBtn  = mkBtn("No",            20,  110, Color3.fromRGB(150, 45, 45))
    local yesBtn = mkBtn("Yes, continue", 140, 220, Color3.fromRGB(38, 100, 236))

    local alive = true
    local conn = RunService.Heartbeat:Connect(function()
        if not alive then conn:Disconnect() return end
        local a = (math.sin(os.clock() * 0.6) + 1) / 2
        boxStroke.Color = STROKE_B:Lerp(STROKE_P, a)
    end)

    -- fade in
    tween(dim, 0.3, { BackgroundTransparency = 0.45 }, Enum.EasingStyle.Sine)
    tween(box, 0.4, { BackgroundTransparency = 0 }, Enum.EasingStyle.Back)
    tween(boxStroke, 0.4, { Transparency = 0 })
    task.wait(0.08)
    tween(titleLbl, 0.35, { TextTransparency = 0 })
    tween(msgLbl, 0.35, { TextTransparency = 0 })
    tween(noBtn, 0.35, { BackgroundTransparency = 0, TextTransparency = 0 })
    tween(yesBtn, 0.35, { BackgroundTransparency = 0, TextTransparency = 0 })

    local accepted = nil
    noBtn.MouseButton1Click:Connect(function() if accepted == nil then accepted = false end end)
    yesBtn.MouseButton1Click:Connect(function() if accepted == nil then accepted = true end end)

    while accepted == nil do task.wait() end

    tween(dim, 0.3, { BackgroundTransparency = 1 }, Enum.EasingStyle.Sine)
    tween(box, 0.3, { BackgroundTransparency = 1 }, Enum.EasingStyle.Quint, Enum.EasingDirection.In)
    tween(boxStroke, 0.25, { Transparency = 1 })
    tween(titleLbl, 0.2, { TextTransparency = 1 })
    tween(msgLbl, 0.2, { TextTransparency = 1 })
    tween(noBtn, 0.2, { BackgroundTransparency = 1, TextTransparency = 1 })
    tween(yesBtn, 0.2, { BackgroundTransparency = 1, TextTransparency = 1 })
    task.wait(0.32)
    alive = false
    if conn then conn:Disconnect() end
    gui:Destroy()
    return accepted
end


-- some shit made by ai
local function httpGet(url)
    if type(url) ~= "string" or url == "" then return nil, "empty url" end
    local ok, res = pcall(function() return game:HttpGet(url, true) end)
    if ok and type(res) == "string" and res ~= "" then return res end
    local synr   = rawget(_G, "syn")
    local httpns = rawget(_G, "http")
    local fluxus = rawget(_G, "fluxus")
    local candidates = {}
    local function add(fn) if type(fn) == "function" then candidates[#candidates + 1] = fn end end
    if type(synr)   == "table" then add(synr.request)   end
    if type(httpns) == "table" then add(httpns.request) end
    if type(fluxus) == "table" then add(fluxus.request) end
    add(rawget(_G, "request"))
    add(rawget(_G, "http_request"))
    for _, req in ipairs(candidates) do
        local okN, r = pcall(req, { Url = url, Method = "GET" })
        if okN and type(r) == "table" then
            local body = r.Body or r.body
            if type(body) == "string" and body ~= "" then return body end
        end
    end
    return nil, (ok and "empty response" or tostring(res))
end

local function scrub(s)
    return (tostring(s):gsub("https?://[%w%.%-_/]+", "<hidden>"))
end

local function runScript(url)
    local source, ferr = httpGet(url)
    if not source then
        notify("Oxy", "Couldn't fetch the script — check your connection and try again.")
        warn("[Oxy] fetch failed -> " .. scrub(ferr))
        return false
    end
    local chunk, cerr = (loadstring or load)(source, "OxyScript")
    if not chunk then
        notify("Oxy", "Script wouldn't compile. Try again later.")
        warn("[Oxy] compile failed -> " .. scrub(cerr))
        return false
    end
    local ok, rerr = pcall(chunk)
    if not ok then
        notify("Oxy", "Script errored while loading. Try again later.")
        warn("[Oxy] run error -> " .. scrub(rerr))
        return false
    end
    return true
end


local placeId = game.PlaceId
warn("[Oxy] PlaceId = " .. tostring(placeId))

local entry = Games[placeId]
if entry then
    warn("[Oxy] matched: " .. tostring(entry.name))
    if not execTrusted() then
        if not confirmRisk() then
            notify("Oxy", "Load cancelled — you declined the executor warning.")
            warn("[Oxy] user declined the executor risk warning — not loading")
            return
        end
    end
    notify("Oxy", "Loading " .. entry.name .. " — enjoy! Your script is running in the background.")
    runScript(entry.url)
    return
end

if UniversalTrigger.enabled then
    local ok, info = pcall(function()
        return MarketplaceService:GetProductInfo(placeId)
    end)
    if ok and info and info.Name then
        local lowerName = string.lower(info.Name)
        for _, word in ipairs(UniversalTrigger.words) do
            if string.find(lowerName, word, 1, true) then
                if not execTrusted() then
                    if not confirmRisk() then warn("[Oxy] declined executor risk — not loading") return end
                end
                notify("Oxy", "Loading the universal script for this game.")
                runScript(UniversalTrigger.url)
                return
            end
        end
    end
end

notify("Oxy", "This game isn't supported yet. Check back after a future update.")
warn(string.format("[Oxy] Unsupported game. PlaceId = %s (loader v%s)", tostring(placeId), VERSION))
