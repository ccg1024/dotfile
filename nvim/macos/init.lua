require('base')
require('plugins')
require('plugconf')
require('lsp')

-- NOTE: note comment
-- The Value of TERM_PROGRAM is on iterm and tmux, but not on alacritty
-- so, export a special env val ('IS_ALACRITTY') in alacritty config file
local term_app = os.getenv("IS_ALACRITTY")
if term_app == '1' then
  require('highlight.ccg')
else
  require('highlight.devaslife')
end
