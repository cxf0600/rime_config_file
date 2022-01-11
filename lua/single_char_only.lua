--[[
single_char_only_filter: 单字模式，只保留单字候选，"date"和"time"除外
--]]

local function filter(input)
   local l = {}
   for cand in input:iter() do
      if (utf8.len(cand.text) == 1) then
          yield(cand)
      else
        if (cand.type == "date" or cand.type == "time" ) then
          yield(cand)
        end
      end
   end
end

return filter
