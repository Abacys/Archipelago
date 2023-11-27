console.clear()

local socket = require("socket")
local json = require('json')

itemIds = {}

itemIds["Potion"] = 0x1983F0
itemIds["Hi-Potion"] = 0x1983F1
itemIds["Ether"] = 0x1983F2
itemIds["Hi-Ether"] = 0x1983F3
itemIds["Panacea"] = 0x1983F4
itemIds["Elixir"] = 0x1983F5
itemIds["Megalixir"] = 0x1983F6

itemIds["Level Up"] = 0x198400
itemIds["Blank Chip"] = 0x198401
itemIds["HP +2"] = 0x198402
itemIds["HP +4"] = 0x198403
itemIds["HP +6"] = 0x198404
itemIds["HP +8"] = 0x198405
itemIds["Strength +1"] = 0x198406
itemIds["Strength +2"] = 0x198407
itemIds["Strength +3"] = 0x198408
itemIds["Strength +4"] = 0x198409
itemIds["Magic +1"] = 0x19840A
itemIds["Magic +2"] = 0x19840B
itemIds["Magic +3"] = 0x19840C
itemIds["Magic +4"] = 0x19840D
itemIds["Defense +1"] = 0x19840E
itemIds["Defense +2"] = 0x19840F
itemIds["Defense +3"] = 0x198410
itemIds["Defense +4"] = 0x198411
itemIds["Lucky Strike"] = 0x198412
itemIds["Fire +1"] = 0x198416
itemIds["Fire +2"] = 0x198417
itemIds["Fire +3"] = 0x198418
itemIds["Fire +4"] = 0x198419
itemIds["Blizzard +1"] = 0x19841A
itemIds["Blizzard +2"] = 0x19841B
itemIds["Blizzard +3"] = 0x19841C
itemIds["Blizzard +4"] = 0x19841D
itemIds["Thunder +1"] = 0x19841E
itemIds["Thunder +2"] = 0x19841F
itemIds["Thunder +3"] = 0x198420
itemIds["Thunder +4"] = 0x198421
itemIds["Aero +1"] = 0x198422
itemIds["Aero +2"] = 0x198423
itemIds["Aero +3"] = 0x198424
itemIds["Aero +4"] = 0x198425
itemIds["Cure +1"] = 0x198426
itemIds["Cure +2"] = 0x198427
itemIds["Cure +3"] = 0x198428
itemIds["Cure +4"] = 0x198429
itemIds["Fire Resistance +1"] = 0x19842A
itemIds["Fire Resistance +2"] = 0x19842B
itemIds["Fire Resistance +3"] = 0x19842C
itemIds["Fire Resistance +4"] = 0x19842D
itemIds["Blizzard Resistance +1"] = 0x19842E
itemIds["Blizzard Resistance +2"] = 0x19842F
itemIds["Blizzard Resistance +3"] = 0x198430
itemIds["Blizzard Resistance +4"] = 0x198431
itemIds["Thunder Resistance +1"] = 0x198432
itemIds["Thunder Resistance +2"] = 0x198433
itemIds["Thunder Resistance +3"] = 0x198434
itemIds["Thunder Resistance +4"] = 0x198435
itemIds["Aero Resistance +1"] = 0x198436
itemIds["Aero Resistance +2"] = 0x198437
itemIds["Aero Resistance +3"] = 0x198438
itemIds["Aero Resistance +4"] = 0x198439
itemIds["Trophy Chip"] = 0x19843A

itemIds["Kingdom Key"] = 0x198440
itemIds["Kingdom Key 1.5"] = 0x198441
itemIds["Kingdom Key 2.0"] = 0x198442
itemIds["Kingdom Key 2.5"] = 0x198443
itemIds["Kingdom Key 3.0"] = 0x198444
itemIds["Wishing Star"] = 0x198445
itemIds["Wishing Star #"] = 0x198446
itemIds["Wishing Star =#"] = 0x198447
itemIds["Wishing Star ==#"] = 0x198448
itemIds["Wishing Star ===#"] = 0x198449
itemIds["Lady Luck"] = 0x19844A
itemIds["Lady Luck 2"] = 0x19844B
itemIds["Lady Luck 3"] = 0x19844C
itemIds["Lady Luck 4"] = 0x19844D
itemIds["Lady Luck 5"] = 0x19844E
itemIds["Olympia"] = 0x19844F
itemIds["Olympia Alpha"] = 0x198450
itemIds["Olympia Beta"] = 0x198451
itemIds["Olympia Gamma"] = 0x198452
itemIds["Olympia Sigma"] = 0x198453
itemIds["Three Wishes"] = 0x198454
itemIds["Three Wishes II"] = 0x198455
itemIds["Three Wishes III"] = 0x198456
itemIds["Three Wishes IV"] = 0x198457
itemIds["Three Wishes V"] = 0x198458
itemIds["Oblivion"] = 0x198459
itemIds["Oblivion: Wind"] = 0x19845A
itemIds["Oblivion: Earth"] = 0x19845B
itemIds["Oblivion: Sea"] = 0x19845C
itemIds["Oblivion: Sky"] = 0x19845D
itemIds["Zero/One"] = 0x19845E
itemIds["Zero/One+"] = 0x19845F
itemIds["Zero/One++"] = 0x198460
itemIds["Zero/One+++"] = 0x198461
itemIds["Zero/One++++"] = 0x198462
itemIds["Oathkeeper"] = 0x198463
itemIds["Oathkeeper: Mind"] = 0x198464
itemIds["Oathkeeper: Love"] = 0x198465
itemIds["Oathkeeper: Light"] = 0x198466
itemIds["Oathkeeper: Heart"] = 0x198467
itemIds["Metal Chocobo"] = 0x198468
itemIds["Metal Chocobo: Fe"] = 0x198469
itemIds["Metal Chocobo: Ag"] = 0x19846A
itemIds["Metal Chocobo: Au"] = 0x19846B
itemIds["Metal Chocobo: Pt"] = 0x19846C
itemIds["Lionheart"] = 0x19846D
itemIds["Lionheart Second Degree"] = 0x19846E
itemIds["Lionheart Third Degree"] = 0x19846F
itemIds["Lionheart Fourth Degree"] = 0x198470
itemIds["Lionheart Fifth Degree"] = 0x198471
itemIds["Ultima Weapon"] = 0x198472
itemIds["Ultima Weapon >"] = 0x198473
itemIds["Ultima Weapon >>"] = 0x198474
itemIds["Ultima Weapon >>>"] = 0x198475
itemIds["Ultima Weapon >>>>"] = 0x198476

itemIds["Blade Rush"] = 0x198480
itemIds["Energy Bomb"] = 0x198481
itemIds["Faith"] = 0x198482
itemIds["Mega Flare"] = 0x198483
itemIds["Meteor Rain"] = 0x198484
itemIds["Zone of Ruin"] = 0x198485
itemIds["Speed Combo"] = 0x198486
itemIds["Star Rave"] = 0x198487
itemIds["Spinner Raw"] = 0x198488
itemIds["D-Fira"] = 0x198489
itemIds["D-Blizzara"] = 0x19848A
itemIds["D-Thundara"] = 0x19848B
itemIds["D-Firaga"] = 0x19848C
itemIds["D-Blizzaga"] = 0x19848D
itemIds["D-Thundaga"] = 0x19848E

itemIds["Armor Bangle"] = 0x198490 
itemIds["Counter Ring"] = 0x198491
itemIds["Command Ring"] = 0x198492
itemIds["Payback Ring"] = 0x198493
itemIds["Energy Earring"] = 0x198494
itemIds["Power Armlet"] = 0x198495
itemIds["Wizard's Armlet"] = 0x198496
itemIds["Safeguard Armlet"] = 0x198497
itemIds["Half-moon Armlet"] = 0x198498
itemIds["Strike Armlet"] = 0x198499
itemIds["CMOS Armlet"] = 0x19849A
itemIds["CMOS Necklace"] = 0x19849B
itemIds["Immortal Charm"] = 0x19849C
itemIds["Eternity Charm"] = 0x19849D
itemIds["Fire Charm"] = 0x19849E
itemIds["Blizzard Charm"] = 0x19849F
itemIds["Thunder Charm"] = 0x1984A0
itemIds["Heavy Chain"] = 0x1984A1
itemIds["Zip Watch"] = 0x1984A2
itemIds["Compass"] = 0x1984A3
itemIds["Feather Chain"] = 0x1984A4
itemIds["Night Lenses"] = 0x1984A5
itemIds["Adamant Belt"] = 0x1984A6
itemIds["Liberty Crown"] = 0x1984A7
itemIds["Heat Sink Belt"] = 0x1984A8

itemMax = {}

itemMax["Potion"] = 0
itemMax["Hi-Potion"] = 0
itemMax["Ether"] = 0
itemMax["Hi-Ether"] = 0
itemMax["Panacea"] = 0
itemMax["Elixir"] = 0
itemMax["Megalixir"] = 0

itemMax["Level Up"] = 49
itemMax["Blank Chip"] = 13
itemMax["HP +2"] = 14
itemMax["HP +4"] = 2
itemMax["HP +6"] = 1
itemMax["HP +8"] = 2
itemMax["Strength +1"] = 14
itemMax["Strength +2"] = 2
itemMax["Strength +3"] = 1
itemMax["Strength +4"] = 2
itemMax["Magic +1"] = 14
itemMax["Magic +2"] = 2
itemMax["Magic +3"] = 1
itemMax["Magic +4"] = 2
itemMax["Defense +1"] = 14
itemMax["Defense +2"] = 1
itemMax["Defense +3"] = 1
itemMax["Defense +4"] = 2
itemMax["Lucky Strike"] = 7
itemMax["Fire +1"] = 3
itemMax["Fire +2"] = 2
itemMax["Fire +3"] = 1
itemMax["Fire +4"] = 2
itemMax["Blizzard +1"] = 3
itemMax["Blizzard +2"] = 2
itemMax["Blizzard +3"] = 1
itemMax["Blizzard +4"] = 2
itemMax["Thunder +1"] = 3
itemMax["Thunder +2"] = 1
itemMax["Thunder +3"] = 1
itemMax["Thunder +4"] = 2
itemMax["Aero +1"] = 4
itemMax["Aero +2"] = 1
itemMax["Aero +3"] = 1
itemMax["Aero +4"] = 2
itemMax["Cure +1"] = 4
itemMax["Cure +2"] = 1
itemMax["Cure +3"] = 1
itemMax["Cure +4"] = 2
itemMax["Fire Resistance +1"] = 2
itemMax["Fire Resistance +2"] = 2
itemMax["Fire Resistance +3"] = 1
itemMax["Fire Resistance +4"] = 2
itemMax["Blizzard Resistance +1"] = 1
itemMax["Blizzard Resistance +2"] = 2
itemMax["Blizzard Resistance +3"] = 1
itemMax["Blizzard Resistance +4"] = 2
itemMax["Thunder Resistance +1"] = 1
itemMax["Thunder Resistance +2"] = 2
itemMax["Thunder Resistance +3"] = 1
itemMax["Thunder Resistance +4"] = 2
itemMax["Aero Resistance +1"] = 1
itemMax["Aero Resistance +2"] = 2
itemMax["Aero Resistance +3"] = 1
itemMax["Aero Resistance +4"] = 2
itemMax["Trophy Chip"] = 30

itemMax["Kingdom Key"] = 0
itemMax["Kingdom Key 1.5"] = 0
itemMax["Kingdom Key 2.0"] = 0
itemMax["Kingdom Key 2.5"] = 0
itemMax["Kingdom Key 3.0"] = 0
itemMax["Wishing Star"] = 1
itemMax["Wishing Star #"] = 0
itemMax["Wishing Star =#"] = 0
itemMax["Wishing Star ==#"] = 0
itemMax["Wishing Star ===#"] = 0
itemMax["Lady Luck"] = 1
itemMax["Lady Luck 2"] = 0
itemMax["Lady Luck 3"] = 0
itemMax["Lady Luck 4"] = 0
itemMax["Lady Luck 5"] = 0
itemMax["Olympia"] = 1
itemMax["Olympia Alpha"] = 0
itemMax["Olympia Beta"] = 0
itemMax["Olympia Gamma"] = 0
itemMax["Olympia Sigma"] = 0
itemMax["Three Wishes"] = 1
itemMax["Three Wishes II"] = 0
itemMax["Three Wishes III"] = 0
itemMax["Three Wishes IV"] = 0
itemMax["Three Wishes V"] = 0
itemMax["Oblivion"] = 1
itemMax["Oblivion: Wind"] = 0
itemMax["Oblivion: Earth"] = 0
itemMax["Oblivion: Sea"] = 0
itemMax["Oblivion: Sky"] = 0
itemMax["Zero/One"] = 1
itemMax["Zero/One+"] = 0
itemMax["Zero/One++"] = 0
itemMax["Zero/One+++"] = 0
itemMax["Zero/One++++"] = 0
itemMax["Oathkeeper"] = 1
itemMax["Oathkeeper: Mind"] = 0
itemMax["Oathkeeper: Love"] = 0
itemMax["Oathkeeper: Light"] = 0
itemMax["Oathkeeper: Heart"] = 0
itemMax["Metal Chocobo"] = 1
itemMax["Metal Chocobo: Fe"] = 0
itemMax["Metal Chocobo: Ag"] = 0
itemMax["Metal Chocobo: Au"] = 0
itemMax["Metal Chocobo: Pt"] = 0
itemMax["Lionheart"] = 1
itemMax["Lionheart Second Degree"] = 0
itemMax["Lionheart Third Degree"] = 0
itemMax["Lionheart Fourth Degree"] = 0
itemMax["Lionheart Fifth Degree"] = 0
itemMax["Ultima Weapon"] = 1
itemMax["Ultima Weapon >"] = 0
itemMax["Ultima Weapon >>"] = 0
itemMax["Ultima Weapon >>>"] = 0
itemMax["Ultima Weapon >>>>"] = 0

itemMax["Blade Rush"] = 0
itemMax["Energy Bomb"] = 1
itemMax["Faith"] = 1
itemMax["Mega Flare"] = 1
itemMax["Meteor Rain"] = 1
itemMax["Zone of Ruin"] = 1
itemMax["Speed Combo"] = 1
itemMax["Star Rave"] = 1
itemMax["Spinner Raw"] = 1
itemMax["D-Fira"] = 1
itemMax["D-Blizzara"] = 1
itemMax["D-Thundara"] = 1
itemMax["D-Firaga"] = 1
itemMax["D-Blizzaga"] = 1
itemMax["D-Thundaga"] = 1

itemMax["Armor Bangle"] = 1 
itemMax["Counter Ring"] = 1
itemMax["Command Ring"] = 1
itemMax["Payback Ring"] = 1
itemMax["Energy Earring"] = 1
itemMax["Power Armlet"] = 1
itemMax["Wizard's Armlet"] = 1
itemMax["Safeguard Armlet"] = 1
itemMax["Half-moon Armlet"] = 1
itemMax["Strike Armlet"] = 1
itemMax["CMOS Armlet"] = 1
itemMax["CMOS Necklace"] = 1
itemMax["Immortal Charm"] = 1
itemMax["Eternity Charm"] = 1
itemMax["Fire Charm"] = 1
itemMax["Blizzard Charm"] = 1
itemMax["Thunder Charm"] = 1
itemMax["Heavy Chain"] = 1
itemMax["Zip Watch"] = 1
itemMax["Compass"] = 1
itemMax["Feather Chain"] = 1
itemMax["Night Lenses"] = 1
itemMax["Adamant Belt"] = 1
itemMax["Liberty Crown"] = 1
itemMax["Heat Sink Belt"] = 1

obtainedCount = {}
hasCount = {}
sentCount = {}
for k, v in pairs(itemIds) do
    obtainedCount[k] = mainmemory.read_u8(v)
    hasCount[k] = mainmemory.read_u8(v)
    sentCount[k] = 0
end

already_obtained = {}

function handle_items(itemName)
    local item_count = mainmemory.read_u8(itemIds[itemName])
    local got_checks = {}
    if hasCount[itemName] < item_count then
        if hasCount[itemName] < itemMax[itemName] then
            local i = 0
            local sent_item_count = -sentCount[itemName]
            local toSend = item_count-hasCount[itemName] + sentCount[itemName]
            while i < toSend do 
                local temp = toSend-i
                if temp <= itemMax[itemName] then
                    got_checks[tostring(i)] = 137000+temp-1+(itemIds[itemName]*100)-167219200
                    sent_item_count = sent_item_count + 1
                end
                i = i + 1
            end
            mainmemory.write_u8(itemIds[itemName], mainmemory.read_u8(itemIds[itemName])-(sent_item_count))
        end
    end
    if already_obtained ~= nil then
        local merged = {}
        local i = 0
        for k, v in pairs(already_obtained) do
            if countEntries(merged)[v] == nil then
                merged[tostring(i)] = v
                i = i + 1
            else
                if countEntries(merged)[v] <= 0 then
                    merged[tostring(i)] = v
                    i = i + 1
                end
            end
        end
        for k, v in pairs(got_checks) do
            if countEntries(merged)[v] == nil then
                merged[tostring(i)] = v
                i = i + 1
            else
                if countEntries(merged)[v] <= 0 then
                    merged[tostring(i)] = v
                    i = i + 1
                end
            end
        end
        return merged
    else
        return got_checks
    end
end

function receive_item(itemName)
    mainmemory.write_u8(itemIds[itemName], mainmemory.read_u8(itemIds[itemName])+1)
end

local STATE_OK = "Ok"
local STATE_TENTATIVELY_CONNECTED = "Tentatively Connected"
local STATE_INITIAL_CONNECTION_MADE = "Initial Connection Made"
local STATE_UNINITIALIZED = "Uninitialized"

local itemMessages = {}
local prevstate = ""
local curstate =  STATE_UNINITIALIZED
local zeldaSocket = nil
local frame = 0

function countEntries(inputTable)
    result = {} 
    for i, v in ipairs(inputTable) do
        if result[v] ~= nil then
            result[v] = result[v]+1
        else
            result[v] = 1
        end
    end
    return result
end

function processBlock(block)
    if block ~= nil then
        local locBlock = block["received_items"]
        if locBlock ~= nil then
            for y, u in pairs(locBlock) do
                obtainedCount[y] = tonumber(u)
            end
        end
        local itemsBlock = block["items"]
        isInGame = StateOKForMainLoop()
        if itemsBlock ~= nil and isInGame then
            tempCount = {}
            for k, v in pairs(itemIds) do
                tempCount[k] = 0
            end
            for i, item in pairs(itemsBlock) do
                tempCount[item] = tempCount[item] + 1
            end
            for k, v in pairs(tempCount) do
                while v > obtainedCount[k] do
                    receive_item(k)
                    obtainedCount[k] = obtainedCount[k] + 1
                    hasCount[k] = mainmemory.read_u8(itemIds[k])
                end
            end
        end
        if itemsBlock ~= nil and isInGame then
            tempCount = {}
            for k, v in pairs(itemIds) do
                tempCount[k] = 0
            end
            for i, item in pairs(itemsBlock) do
                tempCount[item] = tempCount[item] + 1
            end
            for k, v in pairs(tempCount) do
                obtainedCount[k] = v
            end
        end
        local locBlock = block["checked_locs"]
        if locBlock ~= nil and isInGame then
            sentCount = {}
            for k, v in pairs(itemIds) do
                sentCount[k] = 0
            end
            locBlockCount = countEntries(locBlock)
            for y, u in pairs(locBlockCount) do
                sentCount[y] = u
            end
        end
    end
end

function StateOKForMainLoop()
    return (mainmemory.read_u8(0x056f50) == 0x0f and mainmemory.read_u8(0x192017) ~= 0x40)
end

function receive()
    l, e = zeldaSocket:receive()
    if e == 'closed' then
        if curstate == STATE_OK then
            print("Connection closed")
        end
        curstate = STATE_UNINITIALIZED
        return
    elseif e == 'timeout' then
        print("timeout")
        return
    elseif e ~= nil then
        print(e)
        curstate = STATE_UNINITIALIZED
        return
    end

    -- Determine Message to send back
    local retTable = {}
    if StateOKForMainLoop() then
        for k, v in pairs(itemIds) do
            already_obtained = handle_items(k)
        end
        retTable["checked_locs"] = already_obtained
        local temp = {}
        for k, v in pairs(obtainedCount) do
            temp[k] = tostring(v)
        end
        retTable["received_items"] = temp
    end
    processBlock(json.decode(l))
    if mainmemory.read_u8(0x195bb1) > 0x20 and StateOKForMainLoop() then
        retTable["Victory"] = tostring(0x195bb1)--tostring(mainmemory.read_u8(0x25DDEB))
    end
    if StateOKForMainLoop() then
        for k, v in pairs(itemIds) do
            hasCount[k] = mainmemory.read_u8(v)
        end
    end
    
    msg = json.encode(retTable).."\n"
    local ret, error = zeldaSocket:send(msg)
    if ret == nil then
        print(error)
    elseif curstate == STATE_INITIAL_CONNECTION_MADE then
        curstate = STATE_TENTATIVELY_CONNECTED
    elseif curstate == STATE_TENTATIVELY_CONNECTED then
        print("Connected!")
        itemMessages["(0,0)"] = {TTL=240, message="Connected", color="green"}
        curstate = STATE_OK
    end
end

function table.empty (self)
    for _, _ in pairs(self) do
        return false
    end
    return true
end

function main()
    server, error = socket.bind('localhost', 12462)

    while true do
        frame = frame + 1
        if not (curstate == prevstate) then
            prevstate = curstate
        end
        if (curstate == STATE_OK) or (curstate == STATE_INITIAL_CONNECTION_MADE) or (curstate == STATE_TENTATIVELY_CONNECTED) then
            if (frame % 60 == 0) then
                receive()
                frame = 0
            end
        elseif (curstate == STATE_UNINITIALIZED) then
            if  (frame % 60 == 0) then
                server:settimeout(2)
                print("Attempting to connect")
                local client, timeout = server:accept()
                if timeout == nil then
                    print('Initial Connection Made')
                    curstate = STATE_INITIAL_CONNECTION_MADE
                    zeldaSocket = client
                    zeldaSocket:settimeout(0)
                end
            end
        end
        emu.frameadvance()
    end
end

main()