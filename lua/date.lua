--[[
date_translator: 将 `dat` 翻译为当前日期
--]]
local function translator(input, seg)
   if (input == "dat" or input == "ka&") then
	  yield(Candidate("dat", seg.start, seg._end, os.date("%Y年%m月%d日"), ""))
      yield(Candidate("dat", seg.start, seg._end, os.date("%Y%m%d"), ""))
      yield(Candidate("dat", seg.start, seg._end, os.date("%Y-%m-%d"), ""))
      yield(Candidate("dat", seg.start, seg._end, os.date("%Y/%m/%d"), ""))
   end
end

return translator
-- 如果Lua文本直接是写在rime.lua文件中，则不需要上面这句。


