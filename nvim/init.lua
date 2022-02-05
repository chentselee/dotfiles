vim.cmd("source base.vim")

require("./lua/plugins")
require("./lua/treesitter")
require("./lua/lsp")
require("./lua/theme")
require("./lua/telescope")

vim.cmd([[
let g:NERDCreateDefaultMappings = 0
let g:NERDSpaceDelims = 1

xnoremap <Leader>ci <cmd>call NERDComment('n', 'toggle')<CR>
nnoremap <Leader>ci <cmd>call NERDComment('n', 'toggle')<CR>

" camelCaseMotion
map <silent> \w <Plug>CamelCaseMotion_w
map <silent> \b <Plug>CamelCaseMotion_b
map <silent> \e <Plug>CamelCaseMotion_e
map <silent> \ge <Plug>CamelCaseMotion_ge

" emmet-vim
let g:user_emmet_mode='i'
]])
