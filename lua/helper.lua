  
-- helper.lua

-- List features and usage of the schema.
local function translator(input, seg)
  if (input == "hel" or input == "cml") then
  -- if input:find('^hel$') then
    local table = {        
        { 'F4 | Ctrl + ~', ' 输入法设置' }
        , { 'Ctrl + Shift + D', ' 拆分显示开关' }
        , { '`符号引导全拼编码', ' 拼音反查' }
        , { '~符号引导郑码编码', ' 查读音' }
        , { 'Ctrl + Shift + U', ' 生僻字开关' }
        , { 'Ctrl + Shift + F', ' 简入繁出开关    ' }      --微调显示效果。
        , { 'time | date | week', ' 当前时间' }
        , { 'N(大写) + 8888', ' 中文金额转换' }   
        , { 'hel | cml', ' 帮助说明' }
        , { 'ahe | afh | acm', ' 符号A模式帮助 ' }
        , { 'ihe | ifh | icm', ' 符号I模式帮助' }
        , { 'http://zhengma.plus', ' 三码郑码官网' }
        , { 'http://zzzm.ys168.com', ' 三郑官方网盘' }
    }
    for k, v in ipairs(table) do
      local cand = Candidate('abc', seg.start, seg._end, v[2], ' ' .. v[1])
      cand.preedit = input .. '\t    输入法简要说明'
      yield(cand)
    end
  elseif (input == "ahe" or input == "afh" or input == "acm") then
    local table = {
        { '', '|圆圈数-ajj |黑底白数-anu       |括号数-auw  |' }
        , { '', '|数字点-aui |中文数字-ajs       |罗马-alx    |' }
        , { '', '|上标-aif   |标点-afi |货币-anm |' }
        , { '', '|数学-auv   |几何-aqn |分数-aou |单位-aun    |' }
        , { '', '|音标-asf   |音调-ass |箭头-amt |星号-akj    |' }
        , { '', '|制表符-amc |方块-asb |日期-ake |数月份-auq  |' }
        , { '', '|希腊-aoq   |俄文-ans |韩文-aes |日文-aks    |' }
        , { '', '|音乐-asr   |麻将-att |色子-ary |象棋-arf    |' }
        , { '', '|八卦-aob   |星座-akt |行星-aok |曜日-akk    |' }
        , { '', '|两性-afu   |扑克花色-aer       |手指-amd    |' }
        , { '', '|字结构-azf |交通标志-asw       |苏州码-aev  |' }
        , { '', '|括字母-awz |圈字母-ajw         |其它-aew    |' }
        , { '', '详表可参见官网帮助文档。' }                       
    }
    for k, v in ipairs(table) do
      local cand = Candidate('abc', seg.start, seg._end, v[2], ' ' .. v[1])
      cand.preedit = input .. '\t    A模式类别'
      yield(cand)
    end
  elseif (input == "ihe" or input == "ifh" or input == "icm") then
    local table = {
        { '', '、？：三符号为镜像位置。原本都是右手小指击键，现均为左手小指击键。' }
        , { '', '（）“”《》三对符号保持原本的上中下排关系。' }
        , { '', '“%……”两个符号原本用食指，现在亦用食指。但移动位置进入左手字母区。' }
        , { '', '“！”为i键按两下，意即强调。“！”在右手位置相对特殊。' }
        , { '', '英文点“.”左手食指击打，中文点/分隔符“·”右手食指击打。两者位置对称。' }
        , { '', '分号输出的第二重的位置可能是“输出成对符号”。' }
        , { '', '分号输出的第二重的位置也可能是“重复输出相同符号表示强调”。' }
        , { '', '详表可参见官网帮助文档。' }  
    }
    for k, v in ipairs(table) do
      local cand = Candidate('abc', seg.start, seg._end, v[2], ' ' .. v[1])
      cand.preedit = input .. '\t    i模式规律助记'
      yield(cand)
    end
  end
end

return translator