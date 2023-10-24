function split_string(str, sep)
    local result = {}
    for token in string.gmatch(str, "[^" .. sep .. "]+") do
        table.insert(result, token)
    end
    return result
end


function split(string, delimiter)
  -- Create a table to store the split strings.
  local table = {}

  -- Iterate over the string, splitting it at each delimiter.
  for match in string.gmatch(string, "(.-)" .. delimiter) do
    -- Add the split string to the table.
    table[#table + 1] = match
  end

  -- Return the table.
  return table
end


function Dump(o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. Dump(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
   end
end

-- Print contents of `tbl`, with indentation.
-- `indent` sets the initial level of indentation.
function Tprint (tbl, indent)
  if not indent then indent = 0 end
  for k, v in pairs(tbl) do
    local formatting = string.rep("  ", indent) .. k .. ": "
    if type(v) == "table" then
      print(formatting)
      Tprint(v, indent+1)
    elseif type(v) == 'boolean' then
      print(formatting .. tostring(v))
    else
      print(formatting .. v)
    end
  end
end

function Table_contains(tbl, x)
    local found = false
    for _, v in pairs(tbl) do
        if v == x then
            found = true
        end
    end
    return found
end

