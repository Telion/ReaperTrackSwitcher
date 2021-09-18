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
      reaper.SetMediaTrackInfo_Value(track, "B_MUTE", 1);
      found = false;
      for j = 1, reaper.TrackFX_GetCount(track, 1) do
        buf = "_"
        retval, buf = reaper.TrackFX_GetFXName(track, j, buf);
        if retval and string.sub(buf, 1, 1) == "*" then
          reaper.TrackFX_Show(track, j, 2);
          found = true;
          break;
        end;
      end;
      if not found then
      	reaper.TrackFX_Show(track, 0, 2);
      end;
    else
      reaper.SetMediaTrackInfo_Value(track, "I_FXEN", 1);
      reaper.SetMediaTrackInfo_Value(track, "B_MUTE", 0);
      found = false;
      for j = 1, reaper.TrackFX_GetCount(track, 1) do
        buf = "_"
        retval, buf = reaper.TrackFX_GetFXName(track, j, buf);
        if retval and string.sub(buf, 1, 1) == "*" then
          reaper.TrackFX_Show(track, j, 3);
          found = true;
          break;
        end;
      end;
      if not found then
      	reaper.TrackFX_Show(track, 0, 3);
      end;
    end;
  end;
end;

return useConfig;
