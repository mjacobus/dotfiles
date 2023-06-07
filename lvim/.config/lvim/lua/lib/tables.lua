M = {}

M.dump = function(tbl, indent)
  indent = indent or ""

  for k, v in pairs(tbl) do
    if type(v) == "table" then
      print(indent .. tostring(k) .. ":")
      M.dump(v, indent .. "  ")
    else
      print(indent .. tostring(k) .. ": " .. tostring(v))
    end
  end
end

M.combine = function(...)
  local combined = {}

  for _, tableItems in ipairs({ ... }) do
    for _, item in ipairs(tableItems) do
      table.insert(combined, item)
    end
  end

  return combined;
end

return M
