utils = require "RTS utils";

local showedMessage = false

for group = 1, utils.MAX_GROUPS, 1 do
  local displayString = ""

  for i = 1, utils.MAX_CONFIGS, 1 do
    local key = tostring(group) .. "-" .. tostring(i);
    local unused, guidsString = reaper.GetProjExtState(0, "RTS", key);
    if guidsString ~= "" then
      local guids = utils.split(guidsString, ";");

      displayString = displayString .. key .. ": ";
  
      for unusedIndex, guid in ipairs(guids) do
        local track, trackIndex = utils.getTrackByGuid(guid);
        local unused2, trackName = reaper.GetTrackName(track, "");
        if track ~= nil then
          displayString = displayString .. trackName .. "[" .. trackIndex .. "],";
        end;
      end;

      displayString = displayString .. "\n";
    end;
  end;

  if displayString ~= "" then
    reaper.ShowMessageBox(displayString, "All current configurations for group " .. group, 0);
    showedMessage = true;
  end;
end;

if not showedMessage then
  reaper.ShowMessageBox("No configurations are set for any group.", "Current configurations", 0);
end;
