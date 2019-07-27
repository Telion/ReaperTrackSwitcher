utils = require "RTS utils";

function useConfig(group, config)
  reaper.SetProjExtState(0, "RTS", "current-" .. tostring(group), tostring(config));

  local allGuids = {};
  local currentGuids = {};

  for i = 1, utils.MAX_CONFIGS, 1 do
    local key = tostring(group) .. "-" .. tostring(i);
    local unused, guidsString = reaper.GetProjExtState(0, "RTS", key);
    if guidsString ~= "" then
      local guids = utils.split(guidsString, ";");
      for j, v in ipairs(guids) do
        allGuids[#allGuids + 1] = v;
      end;
      if i == config then
        for j, v in ipairs(guids) do
          currentGuids[#currentGuids + 1] = v;
        end;
      end;
    end;
  end;

  for i, guid in ipairs(allGuids) do
    local track = utils.getTrackByGuid(guid);
    if not utils.contains(currentGuids, guid) then
      reaper.SetMediaTrackInfo_Value(track, "I_FXEN", 0);
    else
      reaper.SetMediaTrackInfo_Value(track, "I_FXEN", 1);
    end;
  end;
end;

return useConfig;
