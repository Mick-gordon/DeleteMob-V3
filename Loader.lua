getgenv().DeleteMob = { 
    Executed = false,
    ChangedFFLag = false,
    Drawings = { },
    Instances = { }
};

repeat task.wait() until game:IsLoaded();

local LocalPlayer = game:GetService("Players").LocalPlayer;
local Executor = identifyexecutor and string.lower(identifyexecutor()) or "unkown";

local PhantomFocresFllag = [[
        -- TODO: FFlag Anti Detection.
]];

if game.GameId == 113491250 and not getgenv().DeleteMob.Executed then

    if not setstack or not getstack or not getupvalue or not getgc then
        LocalPlayer:Kick("Executor Is Not Suppoted.");
    end;

    if string.match(Executor, "awp") then

        for _, Actor in getactors() do
            run_on_actor(Actor, [[
                for _, Shared in getgc(true) do
                    if typeof(Shared) == "table" and rawget(Shared, "require") and not rawget(Shared, "rawget") then ]] ..
                        game:HttpGet("https://raw.githubusercontent.com/Mick-gordon/DeleteMob-V3/refs/heads/main/Phantom%20Forces.lua") .. [[
                    end;
                end;
            ]]);
        end;

    elseif setfflag and queue_on_teleport then
        queue_on_teleport(PhantomFocresFllag .. game:HttpGet("https://raw.githubusercontent.com/Mick-gordon/DeleteMob-V3/refs/heads/main/Phantom%20Forces.lua")); -- Remember To Change The FFlag To False.
        
        xpcall(function()
            setfflag("DebugRunParallelLuaOnMainThread", "True"); 
        end, function() 
            LocalPlayer:Kick(`Please Add The FFlag "DebugRunParallelLuaOnMainThread", "True" On Bloxtrap. This Will Make You Detected!!`);
        end);
        
        getgenv().Deletemob.ChangedFFLag = true;

        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId);

    else
        LocalPlayer:Kick(`Please Add The FFlag "DebugRunParallelLuaOnMainThread", "True" On Bloxtrap. This Will Make You Detected!!`);
    end;

end;

getgenv().DeleteMob.Executed = true;
