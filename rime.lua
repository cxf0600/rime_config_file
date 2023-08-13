
-- 宇浩三码顶（小狼毫0.15.0及以上版本不需要显式调用）
-- smyh_core_processor = require("smyh.core_processor")
-- smyh_core_translator = require("smyh.core_translator")
-- smyh_embeded_cands = require("smyh.embeded_cands")

-- 宇浩输入法
yuhao_char_filter = require("yuhao/yuhao_char_filter")
yuhao_char_first = yuhao_char_filter.yuhao_char_first
yuhao_char_only = yuhao_char_filter.yuhao_char_only
yuhao_single_char_only_for_full_code = require("yuhao/yuhao_single_char_only_for_full_code")
yuhao_postpone_full_code = require("yuhao/yuhao_postpone_full_code")
yuhao_helper = require("yuhao/yuhao_helper")
local temp = require("yuhao/yuhao_chaifen")
yuhao_chaifen = temp.filter
yuhao_chaifen_processor = temp.processor
yuhao_embeded_cands = require("yuhao.yuhao_embeded_cands")
yuhao_switch_proc = require("yuhao.yuhao_switch").proc
yuhao_switch_tr = require("yuhao.yuhao_switch").tr
