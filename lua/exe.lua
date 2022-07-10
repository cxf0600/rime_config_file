--[[
Source:https://github.com/hchunhui/librime-lua/issues/35
通过特定命令启动外部程序。

※将"- lua_processor@exe_processor" 放在 engine/processors 里，并位于默认 selector 之前
※rime.lua中 增加"exe_processor = require("exe")"


--]]

local function exe(key, env)
--function exe(key, env)  
  local engine = env.engine
  local context = engine.context
  local kNoop = 2
  if (context.input == "bcd") then
     os.execute('start "" http://zhengma.plus')    --该句是可以生效的。
     --print('\a')
     --print("\a")
     --os.execute("")
     --os.execute("notepad")
     --os.execute("/map.exe")
     --cc.SimpleAudioEngine:getInstance():playMusic("Click.wav", true)
     --beep()
     --PlaySound()
     --context:clear()
  elseif context.input == "cde" then
    os.execute('start "" http://zhengma.plus')    --该句是可以生效的。
    context:clear()
  end
  return kNoop
end

return exe
--return { func = exe }    --与"return exe"等效。





