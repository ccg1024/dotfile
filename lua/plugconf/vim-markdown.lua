vim.opt.conceallevel = 0
vim.g.vim_markdown_math = 1
vim.g.vim_markdown_frontmatter = 1
vim.g.vim_markdown_strikethrough = 1
vim.g.vim_markdown_folding_disabled = 1
vim.cmd([[
highlight htmlBold gui=bold guifg=#fe8019
highlight htmlItalic gui=bold guifg=#458588
highlight htmlLink guifg=#83a598 cterm=underline gui=underline
]])
