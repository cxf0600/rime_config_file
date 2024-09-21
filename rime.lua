-- rime.lua

--------- 1.translators ---------
Litles_customPhrase_translator = require("Litles/customPhrase_translator")

--------- 2.filters ---------
-- 标记词过滤
Litles_markedWord_filter = require("Litles/markedWord_filter")
-- 添加扩展(联想)词
dyy_phraseExt_Filter = require("dyy/phraseExt_Filter")
-- 添加词注释
dyy_phraseComment_Filter = require("dyy/phraseComment_Filter")
-- 替换其中的特殊符号(比如空格、换行)
dyy_laneChangeAndSpace_Filter = require("dyy/laneChangeAndSpace_Filter")
