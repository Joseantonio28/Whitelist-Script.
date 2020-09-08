AddEventHandler('playerConnecting', function(name, setReason)
  local steamId = GetPlayerIdentifiers(source)[1]
  print('Checking ' .. mode .. ' entry for ' .. steamId)
  local check = inArray(steamId, steamIdsList)

  if mode ~= 'whitelist' then
    check = not check
  end

  if not check then
    setReason(errorMessage)
    CancelEvent()
  end
end)

-- Devuelve VERDADERO si el valor está en la matriz, FALSO en caso contrario

function inArray(value, array)
  for _,v in pairs(array) do
    v = getSteamId(v)
    if v == value then
      return true
    end
  end
  return false
end

-- Devuelve TRUE si steamId comienza con "steam:", FALSE en caso contrario
function isNativeSteamId(steamId)
  if string.sub(steamId, 0, 6) == "steam:" then
    return true
  end
  return false
end

function getSteamId(steamId)
  if not isNativeSteamId(steamId) then -- Conversión FiveM SteamID
    steamId = "steam:" .. string.format("%x", tonumber(steamId))
  else
    steamId = string.lower(steamId) -- Conversión a minúsculas final
  return steamId
end
