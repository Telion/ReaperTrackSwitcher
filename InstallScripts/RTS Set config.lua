function setConfig(group)
  local numSelectedTracks = reaper.CountSelectedTracks(0);

  local displayString = "";
  local guidsString = "";

  for i = 0, numSelectedTracks - 1, 1 do
    local track = reaper.GetSelectedTrack(0, i);
    local unused, trackName = reaper.GetTrackName(track, "");
    displayString = displayString .. trackName .. "\n";
    local guid = reaper.GetTrackGUID(track);
    guidsString = guidsString .. guid .. ";";
  end;

  local unused3, currentConfig = reaper.GetProjExtState(0, "RTS", "current-" .. tostring(group));
  if currentConfig == nil or currentConfig == "" then
    currentConfig = "1";
  end;
  local messageBoxResult = reaper.ShowMessageBox("Setting this configuration to slot " .. tostring(group) .. "-" .. currentConfig .. ":\n" .. displayString, "Confirm", 1);

  if messageBoxResult == 1 then
    reaper.SetProjExtState(0, "RTS", tostring(group) .. "-" .. currentConfig, guidsString);
  end;
end;

return setConfig;