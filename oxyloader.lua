
local MarketplaceService = game:GetService("MarketplaceService")
local StarterGui = game:GetService("StarterGui")
local VERSION        = "4.0.8"
local LAST_UPDATED   = "2026-04-30"
local UPDATE_MESSAGE = "added AOT Revolution games"

-- SHARED BASE URLS
local P7_IDK = "https://raw.githubusercontent.com/p7reeessssssxxxx/idk/refs/heads/main/"
local P7_V3 = "https://raw.githubusercontent.com/p7reeessssssxxxx/script-v3/refs/heads/main/"
local P7_HELLO = "https://raw.githubusercontent.com/p7reeessssssxxxx/hello/refs/heads/main/"
local P7_IDK2 = "https://raw.githubusercontent.com/p7reeessssxxxx/idk/refs/heads/main/"
local P7_V3B = "https://raw.githubusercontent.com/p7reeessssxxxx/script-v3/refs/heads/main/"
local DIDDY = "https://raw.githubusercontent.com/diddybludsigma/vb34/refs/heads/main/"
local MARKUS = "https://raw.githubusercontent.com/markusmakegu-wq/us1/refs/heads/main/"
local DKLN = "https://raw.githubusercontent.com/dfgkl5kubnfik5gchlindfg45/DKLNBVJKKKWEJKHCVUUCIVBUNOIUADSRT/refs/heads/main/"
local SAILRP = DKLN .. "SAILRP.lua"
local AOT_REVO  = "https://api.luarmor.net/files/v4/loaders/6b07049fd40cb17cbc1b698fcf5d7e8e.lua"
local LUARMOR_BIZ = "https://api.luarmor.net/files/v4/loaders/447580729d1c51c1eafa48045ac2eb02.lua"
local LUARMOR_BRIDGE = "https://api.luarmor.net/files/v4/loaders/92f99acda2ff5f0c6ff700f9f8c05fb9.lua"


-- GAME DATABASE  [PlaceId] = { name = ..., url = ... }
local Games = {
    [79546208627805] = { name = "99 Nights", url = P7_IDK   .. "kills.lua" },
    [75992362647444] = { name = "Tap Simulator", url = P7_V3    .. "api.lua" },
    [130247632398296] = { name = "Anime Fighting Simulator Endless", url = P7_HELLO .. "AFSEBOI.lua" },
    [142823291] = { name = "Murder Mystery 2", url = P7_IDK   .. "mm2fent.lua" },
    [109983668079237] = { name = "Steal a Brainrot", url = P7_IDK2  .. "sabFENTV5.lua" },
    [76558904092080]  = { name = "The Forge", url = P7_V3B   .. "forge.lua" },
    [10449761463] = { name = "The Strongest Battle Ground", url = P7_V3B   .. "423.lua" },
    [131623223084840] = { name = "Escape Tsunami For Brainrots!", url = DIDDY    .. "unlocvipsdalk.lua" },
    [118637423917462] = { name = "Case Paradise", url = DIDDY    .. "caseparadise.lua" },
    [130594398886540] = { name = "Garden Horizons", url = DIDDY    .. "gardenorzione.lua" },
    [114234929420007] = { name = "Bloxstrike (Default)", url = MARKUS   .. "ui" },
    [108194354348181] = { name = "Bloxstrike (Unranked)", url = MARKUS   .. "ui" },
    [135434213652028] = { name = "Bloxstrike (Deathmatch)", url = MARKUS   .. "ui" },
    [301549746] = { name = "Counter Blox", url = DKLN     .. "DFGJKBHJKJ435GBVC.lua" },
    [70845479499574] = { name = "[BETA] Bite By Night", url = DKLN     .. "antienv.lua" },
    [127794225497302] = { name = "Abyss", url = DKLN     .. "456hfgnvbvbctrd45e3gfhcvbbne56cbhxvvbcxndsftvxghbxvcersdt.lua" },
    [77747658251236] = { name = "Sailor Piece", url = SAILRP },
    [75159314259063] = { name = "shadow dungeon", url = SAILRP },
    [96767841099256] = { name = "boss rush dih", url = SAILRP },
    [99684056491472] = { name = "rune dungeon dih", url = SAILRP },
    [123955125827131] = { name = "double dungeon dih", url = SAILRP },
    [138368689293913] = { name = "inf tower dih", url = SAILRP },
    [14890802310] = { name = "biz biz biz", url = LUARMOR_BIZ },
    [74747090658891] = { name = "biz", url = LUARMOR_BIZ },
    [99449877692519] = { name = "bridge western", url = LUARMOR_BRIDGE },

    -- AOTR
    [13379349730] = { name = "AOTr — Shiganshina", url = AOT_REVO },
    [13904207646] = { name = "AOTr — Outskirts", url = AOT_REVO },
    [14012874501] = { name = "AOTr — Trost", url = AOT_REVO },
    [14638336319] = { name = "AOTr — Forest", url = AOT_REVO },
    [14916516914] = { name = "AOTr — Town Central", url = AOT_REVO },
    [14932214603] = { name = "AOTr — Trade Central", url = AOT_REVO },
    [15030367419]  = { name = "AOTr — Outside Walls", url = AOT_REVO },
    [15220308770] = { name = "AOTr — Utgard", url = AOT_REVO },
    [15374465998] = { name = "AOTr — Outside the Walls 2", url = AOT_REVO },
    [15824912319] = { name = "AOTr — Stohess", url = AOT_REVO },
    [17688739434] = { name = "AOTr — Docks", url = AOT_REVO },
    [112374853034490] = { name = "AOTr — Training Grounds", url = AOT_REVO },
    [126678335159530] = { name = "AOTr — Chapel", url = AOT_REVO },
}
local UniversalTrigger = {
    enabled = true,
    words  = { "uni", "universal"},
    url = DKLN .. "universal.lua",
}

-- HELPERS
local function notify(title, text, duration)
    pcall(function()
        StarterGui:SetCore("SendNotification", {
            Title = title,
            Text = text,
            Duration = duration or 5,
        })
    end)
end

local function runScript(url)
    local ok, err = pcall(function()
        local source = game:HttpGet(url)
        loadstring(source)()
    end)
    if not ok then
        notify("Oxy", "Failed to load script: " .. tostring(err), 6)
        warn("[Oxy] Failed to load script from " .. tostring(url) .. " -> " .. tostring(err))
    end
    return ok
end

-- MAIN
local placeId = game.PlaceId

local entry = Games[placeId]
if entry then
    notify("Oxy", "Loading " .. entry.name .. "...", 4)
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
                notify("Oxy", "Loading universal script...", 4)
                runScript(UniversalTrigger.url)
                return
            end
        end
    end
end

--Not supported
notify("Oxy", "This game isn't supported yet.", 6)
warn(string.format("[Oxy] Unsupported game. PlaceId = %s (loader v%s)", tostring(placeId), VERSION))
