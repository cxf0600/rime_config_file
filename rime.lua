--[[
librime-lua 样例

调用方法：
在配方文件中作如下修改：
```
  engine:
    ...
    translators:
      ...
      - lua_translator@lua_function3
      - lua_translator@lua_function4
      ...
    filters:
      ...
      - lua_filter@lua_function1
      - lua_filter@lua_function2
      ...
```

其中各 `lua_function` 为在本文件所定义变量名。
--]]

--[[
本文件的后面是若干个例子，按照由简单到复杂的顺序示例了 librime-lua 的用法。
每个例子都被组织在 `lua` 目录下的单独文件中，打开对应文件可看到实现和注解。

各例可使用 `require` 引入。
如：
```
  foo = require("bar")
```
可认为是载入 `lua/bar.lua` 中的例子，并起名为 `foo`。
配方文件中的引用方法为：`...@foo`。

--]]
-- I. translators:

-- date_translator: 将 `dat`(date) 翻译为当前日期
-- 增加- lua_translator@date_translator
-- 详见 `lua/date.lua`:
date_translator = require("date")

-- time_translator: 将 `tim`(time) 翻译为当前时间
-- 增加- lua_translator@time_translator
-- 详见 `lua/time.lua`
time_translator = require("time")

-- week_translator: 将 `wee`(week) 翻译为当前星期
-- 增加- lua_translator@week_translator
-- 详见 `lua/week.lua`
week_translator = require("week")

-- number_translator: 将 `N` + 8888 （大写字母N+数字）翻译为大写中文金额
-- 增加- lua_translator@number_translator
-- 详见 `lua/number.lua`
number_translator = require("number")

-- helper_translator: 将 `N` + 8888 （大写字母N+数字）翻译为大写中文金额
-- 增加- lua_translator@helper_translator
-- 详见 `lua/helper.lua`
helper_translator = require("helper")


-- II. filters:

-- smzmcore: 自定义字集过滤
-- 增加- lua_filter@smzmcore
-- 详见 `lua/smzmcore_filter.lua`
smzmcore = require("smzmcore_filter")


-- III. processors:

-- switch_processor: 通过选择自定义的候选项来切换开关（以简繁切换和下一方案为例）
-- 增加- lua_processor@switch_processor 并位于默认 selector 之前
-- 详见 `lua/switch.lua`
switch_processor = require("switch")

exemore_processor = require("exemore")

--写成"exe = require("exe")" 一定不会成功。
exe_processor = require("exe")

--abcdefghijklmn = require("exe")


