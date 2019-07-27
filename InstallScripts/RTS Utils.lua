local utils = {};

utils.MAX_CONFIGS = 128
utils.MAX_GROUPS = 32

function utils.split(str, sep)
   local result = {};
   local regex = ("([^%s]+)"):format(sep);
   for each in str:gmatch(regex) do
      table.insert(result, each);
   end;
   return result;
end;

function utils.contains(array, value)
  for i, v in ipairs(array) do
    if v == value then
      return true;
    end;
  end;

  return false;
end;

function utils.getTrackByGuid(guid)
  local i = 0;
  while (true) do
    local track = reaper.GetTrack(0, i);
    if (track == nil) then
      return nil, -1;
    end;
    local currentGuid = reaper.GetTrackGUID(track);
    if currentGuid == guid then
      return track, i;
    end;
    i = i + 1;
  end;
end;

return utils;