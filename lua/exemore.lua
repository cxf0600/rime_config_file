--[[
Source:https://github.com/hchunhui/librime-lua/issues/35
通过特定候选启动外部程序。

※将"- lua_processor@exemore_processor" 放在 engine/processors 里，并位于默认 selector 之前
※rime.lua中 增加"executor_processor = require("exemore")"

--]]


-- 帮助函数，返回被选中的候选的索引
local function select_index(key, env)
  local ch = key.keycode
  local index = -1
  local select_keys = env.engine.schema.select_keys
  if select_keys ~= nil and select_keys ~= "" and not key.ctrl() and ch >= 0x20 and ch < 0x7f then
    local pos = string.find(select_keys, string.char(ch))
    if pos ~= nil then index = pos end
  elseif ch >= 0x30 and ch <= 0x39 then
    index = (ch - 0x30 + 9) % 10
  elseif ch >= 0xffb0 and ch < 0xffb9 then
    index = (ch - 0xffb0 + 9) % 10
  elseif ch == 0x20 then
    index = 0
  end
  return index
end

--local kRejected = 0
local kAccepted = 1
local kNoop = 2

local function selector(key, env)
  if env.switcher == nil then return kNoop end
  if key:release() or key:alt() then return kNoop end
  local idx = select_index(key,env)
  if idx < 0 then return kNoop end
  local ctx = env.engine.context
  if (ctx.input == "abc" ) then -- 当输入为 "sim/tra/mt;/mzz" 时响应选择       
    if idx == 1 then   --如果选中第二候选位置。   
      os.execute('start "" http://zhengma.plus')      
      ctx:clear() -- 切换完成后清空，避免上屏
    -- elseif idx == 1 then
    elseif idx == 2 then  --如果选中第三候选位置。
      os.execute('start "" https://www.yuque.com/smzm/zhengma/bykl0k')
      ctx:clear() -- 切换完成后清空，避免上屏      
    elseif idx == 3 then  --如果选中第四候选位置。
      os.execute('start "" https://smzm.xhup.club/')
      ctx:clear() -- 切换完成后清空，避免上屏 
    elseif idx == 4 then   --如果选中第五候选位置。
      os.execute('start "" https://smzm.xhup.club/pages/zi-gen/index')
      ctx:clear() -- 切换完成后清空，避免上屏   
    elseif idx == 0 then  --仅用数字键上屏可以生效，空格上屏不会生效。因空格上屏机制是一个空字符顶上屏。
      os.execute('start "" https://www.163.com')
      ctx:clear() -- 切换完成后清空，避免上屏      
    end
      
  end

  return kNoop
end

 -- 初始化 switcher
local function init(env)
  -- 若当前 librime-lua 版本未集成 Switcher 则无事发生
  if Switcher == nil then return end
  env.switcher = Switcher(env.engine)
end

return { init = init, func = selector }
--return selector     无效
--return {  func = selector }     无效




