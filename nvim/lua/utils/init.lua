local M = {}



function M:split_string(str, sep)
    local result = {}
    for token in string.gmatch(str, "[^" .. sep .. "]+") do
        table.insert(result, token)
    end
    return result
end


function M:split(string, delimiter)
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


function M:Dump(o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. M:Dump(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
   end
end

-- Print contents of `tbl`, with indentation.
-- `indent` sets the initial level of indentation.
function M:Tprint (tbl, indent)
  if not indent then indent = 0 end
  for k, v in pairs(tbl) do
    local formatting = string.rep("  ", indent) .. k .. ": "
    if type(v) == "table" then
      print(formatting)
      M:Tprint(v, indent+2)
    elseif type(v) == 'boolean' then
      print(formatting .. tostring(v))
    else
      print(formatting .. tostring(v))
    end
  end
end

function M:Tprint1 (tbl, indent)
  if not indent then indent = 0 end
  local formatting = ""
  for k, v in pairs(tbl) do
    formatting = string.rep("  ", indent) .. tostring(k) .. ": "
    if type(v) == "table" then
      formatting = formatting .. "\r\n"
      formatting = formatting .. M:Tprint1(v, indent+2)
    elseif type(v) == 'boolean' then
      formatting = formatting .. tostring(v)
    elseif v == nil then
      formatting = formatting .. "nil"
    else
      formatting = formatting .. v
    end
  end
  return formatting
end


function M:Table_contains(tbl, x)
    local found = false
    for _, v in pairs(tbl) do
        if v == x then
            found = true
        end
    end
    return found
end


function M:Tbl_print(tbl)
  local M = {}
  local indent = "  "
  for k,v in pairs(tbl) do
    if type(v)=="table" then
      M:Tbl_print(v)
    end
  end
end



return M
