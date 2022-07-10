--[[
time_translator: 将 `tim/kd/now` 翻译为当前时间
--]]

local function translator(input, seg)
   if (input == "tim" or input == "kd" or input == "now") then
      yield(Candidate("osj", seg.start, seg._end, os.date("%H:%M:%S"), ""))
      yield(Candidate("osj", seg.start, seg._end, os.date("%H:%M"), ""))
      yield(Candidate("ors", seg.start, seg._end, os.date("%Y年%m月%d日 %H:%M:%S"), ""))
      yield(Candidate("ors", seg.start, seg._end, os.date("%Y年%m月%d日 %H:%M"), ""))
      yield(Candidate("ors", seg.start, seg._end, os.date("%Y/%m/%d %H:%M:%S"), ""))
      yield(Candidate("ors", seg.start, seg._end, os.date("%Y-%m-%d %H:%M:%S"), ""))
   end
end

return translator
-- 如果Lua文本直接是写在rime.lua文件中，则不需要上面这句。