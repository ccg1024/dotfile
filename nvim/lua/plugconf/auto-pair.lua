require("nvim-autopairs").setup {}

-- add rule
-- local Rule = require('nvim-autopairs.rule')
-- local npairs = require('nvim-autopairs')
-- npairs.add_rule(Rule("<", ">", {"java", "html"}))

-- If you want insert `(` after select function or method item
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)

