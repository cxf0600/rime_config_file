--lua语言中的注释用“--” 
local customPhrase_dictEnable, customPhrase_dict = pcall(require, 'Litles/customPhrase_dict')

local logEnable, log = pcall(require, "Litles/runLog")
if logEnable then
	log.writeLog('')
	log.writeLog('log from customPhrase_translator.lua')
	log.writeLog('customPhrase_dictEnable:'..tostring(customPhrase_dictEnable))
end

local getPhraseList = customPhrase_dict.getPhraseList

function translator(input, seg)
	if (string.sub(input,1,1) == "/") then
		--log.writeLog('log from customPhrase_translator.lua: enter if')
		-- 1.特殊候选(调用系统接口)
		if (input == "/date") then
			--- Candidate(type, start, end, text, comment)
			yield(Candidate("date", seg.start, seg._end, os.date("%Y%m%d"), "[日期]"))
			yield(Candidate("date", seg.start, seg._end, os.date("%Y年%m月%d日"), "[日期]"))
			yield(Candidate("date", seg.start, seg._end, os.date("%Y-%m-%d"), "[日期]"))
		end
		-- 2.普通候选(从txt文件里出)
		local phraseList = getPhraseList(input)
		if #phraseList > 0 then
			local idx
			for idx=1,#phraseList do
				yield(Candidate("custom", seg.start, seg._end, phraseList[idx], " "))
			end
		end
	elseif (string.len(input) == 3 and string.sub(input,3,3) == "_") then
		-- 3.普通候选(从txt文件里出)
		local phraseList = getPhraseList(input)
		if #phraseList > 0 then
			local idx
			for idx=1,#phraseList do
				yield(Candidate("custom", seg.start, seg._end, phraseList[idx], " "))
			end
		end
	end
end

return translator