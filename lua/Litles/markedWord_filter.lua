-- file: markedWord_filter.lua
-- name: 标记词过滤脚本
-- author: Litles
---------------------------------------
-- 【功能】
-- 对于码表中有特殊标记的词，比如：
--    a) 以“[生僻字]”开头，比如“[生僻字]栞    aaa”
--    b) 用“[超集字]”和“[超]”包裹，比如“[超集字]𣓏[超]    aaa”
-- 当这类词出现在候选项中时，可以选择过滤而不显示。
-- 【使用方法】
-- (1) 需要將此 lua 文件放在 lua 文件夾下
-- (2) 需要在 rime.lua 中添加以下代碼激活本腳本:
-- Litles_markedWord_filter = require("Litles/markedWord_filter")
-- (3) 需要在 schema 文件中 engine/filters 下添加:
-- - lua_filter@Litles_markedWord_filter
-- (4) 最后在 schema 文件中 switches 下添加需要的控制开关，比如:
--  - name: super_set_chars
--    states: [ "⊘", "超" ]
--    reset: 0
---------------------

-- 超集字过滤
local function super_set_chars(input, env, flag)
    local str_pre = "[超集字]"
    local str_pat = "%[超集字%](.-)%[超%]"
    for cand in input:iter() do
        if ( not string.find(cand.text,str_pre,1,true) ) then
            if cand.text == "⊗" then
                --yield(Candidate("text", cand.start, cand._end, "⊗"))
            else
                yield(cand)
            end
        elseif ( string.find(cand.text,str_pre,1,true) and flag ) then
            yield(Candidate("text", cand.start, cand._end, string.gsub(cand.text,str_pat,"%1"), "[超]"))
        else
            --yield(Candidate("text", cand.start, cand._end, string.gsub(cand.text,str_pat,"")))
        end
    end
end

-- 生僻字过滤(不适用于连打模式)
local function rarely_used_chars(input, env, flag)
    local str_pre = "[生僻字]"
    for cand in input:iter() do
        if (string.sub(cand.text,1,string.len(str_pre)) ~= str_pre) then
            yield(cand)
        elseif (string.sub(cand.text,1,string.len(str_pre)) == str_pre and flag) then
            yield(Candidate("text", cand.start, cand._end, string.sub(cand.text,string.len(str_pre)+1), "[僻]"))
        else
        end
    end
end

-- 【主函数】对外接口
local function markedWord_filter(input, env)
    -- 第一类过滤函数
    local super_set_chars_flag = env.engine.context:get_option("super_set_chars")
    super_set_chars(input, env, super_set_chars_flag)
    -- 第二类过滤函数(不适用于连打模式)
    --local rarely_used_chars_flag = env.engine.context:get_option("rarely_used_chars")
    --rarely_used_chars(input, env, rarely_used_chars_flag)
end

return markedWord_filter
