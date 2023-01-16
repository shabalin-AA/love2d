local function between_commas (line)
  local data = {}
  local begin = line:find(",", begin)
  local ending = 0
  while ending ~= nil do
    ending = line:find(",", begin + 1)
    if ending ~= nil then
      local d = line:sub(begin + 1, ending - 1)
      if tonumber(d) then
        table.insert(data, tonumber(d))
      else table.insert(data, 0) end
      begin = ending
    end
  end
  return data
end

local function swap_col_row (t)
  local swap = {}
  for i=1, #t do
    swap[i] = {}
    for j=1, #t[i] do
      swap[i][j] = t[j][i]
    end
  end
  return swap
end

function read_csv_file(fname)
  local file = io.open(fname)
  local result = {}
  for line in file:lines() do
    line = line .. ","
    table.insert(result, between_commas(line))
  end
  file:close()
  return result
  --return swap_col_row(result)
end


--t = swap_col_row(read_csv_file("visits.csv"))
--for i=1, #t do print(table.concat(t[i], " ") .. " " .. #t[i]) end
