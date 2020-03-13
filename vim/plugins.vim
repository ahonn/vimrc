if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  augroup PlugInstall
    autocmd VimEnter * PlugInstall | source $MYVIMRC
  augroup END
endif

call plug#begin('~/.vim/plugged')
  " Colorscheme
  Plug 'w0ng/vim-hybrid'
  Plug 'gruvbox-community/gruvbox'

  " Language/Fish
  Plug 'dag/vim-fish'

  " Language/JavaScript
  Plug 'pangloss/vim-javascript'
  Plug 'neoclide/vim-jsx-improve'
  Plug 'othree/javascript-libraries-syntax.vim', { 'for': ['javascript', 'typescript'] }
  Plug 'herringtondarkholme/yats.vim', { 'for': 'typescript' }
  Plug 'heavenshell/vim-jsdoc', { 'on': 'JsDoc' }
  Plug 'evanleck/vim-svelte', { 'for': 'svelte' }

  " Language/CSS
  Plug 'groenewege/vim-less'
  Plug 'ap/vim-css-color'
  Plug 'hail2u/vim-css3-syntax'

  " Language/Clojure
  Plug 'guns/vim-clojure-static', { 'for': ['clojure'] }
  Plug 'eraserhd/parinfer-rust', { 'do': 'cargo build --release', 'for': ['clojure'] }

  Plug 'leafo/moonscript-vim', { 'for': 'moon' }

  " UI
  Plug 'mhinz/vim-startify'
  Plug 'luochen1990/rainbow'
  Plug 'Yggdroot/indentLine'
  Plug 'airblade/vim-gitgutter'
  Plug 'ryanoasis/vim-devicons'
  Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  Plug 'bling/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'sjl/gundo.vim', { 'on': 'GundoToggle' }
  Plug 'ahonn/resize.vim'
  Plug 'Shougo/denite.nvim'
  Plug 'neoclide/denite-git', { 'on': 'Denite' }

  " Integration
  Plug 'dense-analysis/ale'
  Plug 'scrooloose/nerdcommenter'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-repeat'
  Plug 'easymotion/vim-easymotion'
  Plug 'jiangmiao/auto-pairs'
  Plug 'Valloric/MatchTagAlways'
  Plug 'alvan/vim-closetag'
  Plug 'ahonn/vim-fileheader'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'bronson/vim-trailing-whitespace'
  Plug 'wakatime/vim-wakatime'
  Plug 'ludovicchabant/vim-gutentags'
  Plug 'tpope/vim-fugitive'
  Plug 'rhysd/git-messenger.vim'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'hotoo/pangu.vim'
  Plug 'kana/vim-textobj-user'
  Plug 'sgur/vim-textobj-parameter'

  " Completion
  Plug 'ervandew/supertab'
  Plug 'mattn/emmet-vim'
  Plug 'neoclide/coc.nvim', { 'do': 'yarn install' }
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
  Plug 'VimSnippets/vim-web-snippets'
call plug#end()

nnoremap <silent> <Leader>pi :PlugInstall<Cr>
nnoremap <silent> <Leader>pc :PlugClean<Cr>
nnoremap <silent> <Leader>pu :PlugUpdate<Cr>

" ----------------------------------------------------------------------------
" Colorscheme
" ----------------------------------------------------------------------------

" hybrid
let g:hybrid_custom_term_colors = 1
" colorscheme hybrid

" gruvbox
let g:gruvbox_bold = 0
let g:gruvbox_sign_column = 'bg0'
let g:gruvbox_invert_selection = 0

colorscheme gruvbox

" ----------------------------------------------------------------------------
" Language/JavaScript
" ----------------------------------------------------------------------------

" vim-javascript
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 1
let g:javascript_enable_domhtmlcss = 1

" javascript-libraries-syntax.vim
let g:used_javascript_libs = 'underscore,jquery,react'

" vim-import-js
nnoremap <silent> <Leader>ji :ImportJSWord<Cr>
nnoremap <silent> <Leader>jf :ImportJSFix<Cr>
nnoremap <silent> <Leader>jg :ImportJSGoto<Cr>

" jsdoc
nmap <silent> <Leader>dc <Plug>(jsdoc)
let g:jsdoc_allow_input_prompt = 1
let g:jsdoc_custom_args_hook = {}
let g:jsdoc_tags = {
  \  'returns': 'return',
  \  'param': 'param',
  \ }
let g:jsdoc_enable_es6 = 1

" ----------------------------------------------------------------------------
" Language/Clojure
" ----------------------------------------------------------------------------

" vim-clojure-static
let g:clojure_syntax_keywords = {
  \ 'clojureMacro': ['deftest', 'is'],
  \ 'clojureFunc': ['run-tests']
  \ }

" ----------------------------------------------------------------------------
" UI
" ----------------------------------------------------------------------------

" vim-startify
let g:startify_lists = [
  \ { 'type': 'files',     'header': ['   MRU']            },
  \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
  \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
  \ { 'type': 'commands',  'header': ['   Commands']       },
  \ ]
let g:startify_change_to_dir = 0

" rainbow
let g:rainbow_active = 1
let g:rainbow_conf = {
\   'guifgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
\ }
let g:rainbow_conf = {
\    'separately': {
\       'nerdtree': 0
\    }
\}

" indentLine
nnoremap <silent> <Leader><Tab> :IndentLinesToggle<Cr>
let g:indentLine_enabled = 1
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#504945'
let g:indentLine_faster = 1
" let g:indentLine_char = '┊'

" vim-devicons
if exists('g:loaded_webdevicons')
  call webdevicons#refresh()
endif
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1

" nerdtree
noremap <silent> <C-b> :NERDTreeToggle<Cr>
" let NERDTreeIgnore=['_.*$[[dir]]']
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
augroup Nerdtree
  autocmd!
  autocmd FileType nerdtree setlocal nocursorcolumn
  autocmd bufenter * if (winnr('$') == 1 && exists('b:NERDTreeType') && b:NERDTreeType == 'primary') | q | endif
  if has('gui_running')
    autocmd FileType nerdtree setlocal nolist
  endif
augroup END

" vim-airline
let g:airline_theme='gruvbox'
let g:airline_powerline_fonts = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#show_tabs = 0
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#hunks#enabled = 0

" gundo
nnoremap <silent> <Leader>ud :GundoToggle<Cr>
let g:gundo_width = 50
let g:gundo_preview_height = 40
let g:gundo_right = 1
let g:gundo_prefer_python3 = 1

" denite
nnoremap <silent> <Leader><Leader> :Denite buffer<Cr>
nnoremap <silent> <C-f> :Denite -no-empty grep<Cr>
nnoremap <silent> <C-p> :Denite -start-filter `finddir('.git', ';') != '' ? 'file/rec/git' : 'file/rec'`<Cr>

autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <Cr> denite#do_map('do_action', 'open')
  nnoremap <silent><buffer><expr> <C-o> denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <C-v> denite#do_map('do_action', 'vsplit')
  nnoremap <silent><buffer><expr> <C-x> denite#do_map('do_action', 'split')
  nnoremap <silent><buffer><expr> <C-p> denite#do_map('quit')
endfunction

autocmd FileType denite-filter call s:denite_filter_my_settings()
function! s:denite_filter_my_settings() abort
  imap <silent><buffer> <C-o> <Plug>(denite_filter_quit)
  inoremap <silent><buffer><expr> <C-p> denite#do_map('quit')
endfunction

call denite#custom#option('default', 'unique', 1)
call denite#custom#option('default', 'reversed', 1)
call denite#custom#option('default', 'auto-resize', 1)
call denite#custom#option('default', 'highlight_matched_char', 'Underlined')

call denite#custom#alias('source', 'file/rec/git', 'file/rec')
call denite#custom#var('file/rec/git', 'command', ['git', 'ls-files', '-co', '--exclude-standard'])

" denite-git
nnoremap <silent> <C-g> :Denite gitlog:all<Cr>

" ----------------------------------------------------------------------------
" Integration
" ----------------------------------------------------------------------------

" ale
nnoremap <leader>al :ALEToggle<Cr>
let g:ale_sign_warning = '●'
let g:ale_sign_error = '●'
highlight! ALEErrorSign ctermfg=9 guifg=#C30500
highlight! ALEWarningSign ctermfg=11 guifg=#F0C674
" let g:ale_javascript_eslint_use_global = 1
let g:ale_linter_aliases = {
  \ 'javascript.jsx': 'javascript',
  \ 'jsx': 'javascript'
  \ }
let g:ale_linters = {
  \ 'typescript': ['tslint'],
  \ 'typescriptreact': ['tslint'],
  \ 'javascript': ['eslint'],
  \ 'clojure': ['clj-kondo'],
  \ }
let g:ale_fixers = {
  \ 'javascript': 'eslint',
  \ 'typescript': 'tslint',
  \ 'typescriptreact': 'tslint',
  \ 'vue': 'eslint',
  \ }
nmap <silent> <Leader>af <Plug>(ale_fix)

" nerdcommenter
let g:NERDSpaceDelims = 1
let g:NERDDefaultNesting = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCustomDelimiters = {
  \   'clojure': { 'left': ';;' },
  \ }

" vim-surround
nmap <silent> , ysiw
let g:surround_35 = "#{\r}"
let g:surround_36 = "${\r}"

" vim-easymotion
map <silent> <Leader>h <Plug>(easymotion-linebackward)
map <silent> <Leader>j <Plug>(easymotion-w)
map <silent> <Leader>k <Plug>(easymotion-b)
map <silent> <Leader>l <Plug>(easymotion-lineforward)
let g:EasyMotion_keys = 'asdhjkl;qwer'
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_grouping = 2
let g:EasyMotion_smartcase = 1

" MatchTagAlways
let g:mta_filetypes = {
  \  'javascript': 1,
  \  'javascript.jsx': 1,
  \  'typescript': 1,
  \ }

" vim-closetag
let g:closetag_filenames = '*.html,*.xhtml,*.xml,*.js,*.jsx,*.html.erb,*.md'

" vim-fileheader
let g:fileheader_auto_add = 1
let g:fileheader_show_email = 0

" vim-trailing-whitespace
let g:extra_whitespace_ignored_filetypes = ['denite', 'help', 'grep', 'search']
augroup TrailingSpace
  autocmd!
  autocmd BufWritePre * FixWhitespace
augroup END

" gutentags
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
let g:gutentags_ctags_tagfile = '.tags'
let g:gutentags_exclude_filetypes = ['gitcommit']
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
if !isdirectory(s:vim_tags)
    silent! call mkdir(s:vim_tags, 'p')
endif

" git-messenger.vim
nnoremap gm :GitMessenger<Cr>

" vim-textobj-parameter
let g:vim_textobj_parameter_mapping = 'a'

" ----------------------------------------------------------------------------
" Completion
"----------------------------------------------------------------------------

" SuperTab
let g:SuperTabDefaultCompletionType = '<C-n>'
let g:SuperTabClosePreviewOnPopupClose = 1

" Emmet.vim
imap <silent> <C-e> <Space><BS><plug>(emmet-expand-abbr)
let g:user_emmet_install_global = 1
let g:user_emmet_settings = {
  \ 'javascript.jsx' : {
  \   'extends' : 'jsx',
  \  },
  \ 'javascript' : {
  \   'extends' : 'jsx',
  \  },
  \ }

" coc.nvim
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <silent> <Leader>r <Plug>(coc-rename)
nmap <silent> <Leader>f <Plug>(coc-format)
nmap <silent> <leader>p <Plug>(coc-format-selected)
vmap <silent> <leader>p <Plug>(coc-format-selected)

nnoremap <silent> gh :call CocAction('doHover')<CR>

call coc#add_extension(
  \ 'coc-tsserver',
  \ 'coc-tslint-plugin',
  \ 'coc-json',
  \ 'coc-css',
  \ 'coc-snippets',
  \ 'coc-word',
  \ 'coc-prettier',
  \ 'coc-vimlsp',
  \ )

" UltiSnips
let g:UltiSnipsExpandTrigger = '<Tab>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'
let g:UltiSnipsJumpForwardTrigger = '<C-j>'

