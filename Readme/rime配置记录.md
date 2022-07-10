## rime中配置字符集开关的方法

**方法一：**

```yaml
switches:
  - name: gbk
    reset: 1
    states: [utf, gbk]
    
filters:
  - charset_filter@gbk
```

**方法二：**

```yaml
switches:
  - name: gb2312
    reset: 1
    states: [ CJK, GB2312 ]

filters:
  - charset_filter@gb2312

charset_filter:
  option_name: gb2312
```

**方法三：**

```yaml
switches:
  - options: [gbk, gb2312, utf8]
    reset: 1
    states:
      - GBK
      - GB2312
      - UTF-8

  filters:
    - charset_filter@gb2312
    - charset_filter@gbk
```

方法三中，第2行的`gbk, gb2312, utf8`，`gbk`对应第10行，`gb2312`对应第11行，必须严格对应一致，且不能修改为其它名字`utf8`没有与之对应的过滤器，可对随意更改名称；第`5-7`行的名称仅用于显示，可以随意修改。

## **single_char_filter**

配置方法不明__

```yaml
switches:
  - name: sichar
#  - name: single_char_filter
    reset: 1
    states: [s, m]
engine:
  filters:
    - single_char_filter@sichar
translator:
  enable_charset_filter: true
  enable_single_char_filter: true
sichar:
  option_name: sichar
#  tags: [ abc ] #abc對應abc_segmentor
#  tips: none
```

## 使用插件`librime-lua`

1. 将插件要用到的文件`rime.lua`及`lua`文件夹拷贝到用户文件夹下；

2. 在配置方案中如下引用：

    ```yaml
    translators:
      - lua_translator@date_translator
      - lua_translator@time_translator
      - lua_translator@number_translator
      - punct_translator
      - reverse_lookup_translator
      - table_translator
    filters:
      - simplifier  # 必要組件一
      - lua_filter@single_char_filter
  - lua_filter@charset_comment_filter
      - lua_filter@reverse_lookup_filter
      - uniquifier  # 必要組件二／去除重复候选项，应放在最后
    ```
    
    其中`date_translator`等在`rime.lua`中定义。

