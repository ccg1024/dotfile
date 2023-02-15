require('base')
require('plugins')
require('plugconf')
require('lsp')

-- TERM_PROGRAM have value in iterm and tmux, alacritty not have
-- so, export a special env val in alacritty config file
local term_app = os.getenv("IS_ALACRITTY")
if term_app == '1' then
  require('highlight.ccg')
else
  require('highlight.devaslife')
end
