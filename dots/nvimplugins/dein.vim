set runtimepath+=$HOME/.config/nvim/dein/repos/github.com/Shougo/dein.vim

call dein#begin(expand('$HOME/.config/nvim/dein'))

call dein#add('Shougo/dein.vim')

" --- Style plugins ---
call dein#add('frankier/neovim-colors-solarized-truecolor-only')
call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')

 " --- Completion plugins ---
call dein#add('Shougo/deoplete.nvim')
call dein#add('tweekmonster/deoplete-clang2')
call dein#add('eagletmt/neco-ghc')
call dein#add('sebastianmarkow/deoplete-rust')
call dein#add('zchee/deoplete-zsh')
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')

" --- Syntax highlighting ---
call dein#add('fatih/vim-go')
call dein#add('burnettk/vim-angular')
call dein#add('pangloss/vim-javascript')
call dein#add('othree/javascript-libraries-syntax.vim')
call dein#add('othree/yajs')
call dein#add('othree/es.next.syntax.vim')
call dein#add('leafgarland/typescript-vim')
call dein#add('kchmck/vim-coffee-script')
call dein#add('mxw/vim-jsx')
call dein#add('avakhov/vim-yaml')
call dein#add('tmux-plugins/vim-tmux')
call dein#add('octol/vim-cpp-enhanced-highlight')
call dein#add('neovimhaskell/haskell-vim')
call dein#add('rust-lang/rust.vim')
call dein#add('jez/vim-c0')
call dein#add('jez/vim-ispc')
call dein#add('Firef0x/PKGBUILD.vim')
call dein#add('enomsg/vim-haskellConcealPlus')

" --- Functionality plugins ---
call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
call dein#add('scrooloose/syntastic')
call dein#add('kien/ctrlp.vim')
call dein#add('tpope/vim-surround')
call dein#add('tpope/vim-repeat')
call dein#add('lfilho/cosco.vim')
call dein#add('vim-scripts/closetag.vim')
call dein#add('tpope/vim-commentary.git')
call dein#add('eagletmt/ghcmod-vim')
call dein#add('Raimondi/delimitMate')
call dein#add('easymotion/vim-easymotion')
call dein#add('moll/vim-bbye')
call dein#add('Chiel92/vim-autoformat')
call dein#add('ntpeters/vim-better-whitespace')

" --- Git plugins ---
call dein#add('tmux-plugins/vim-tmux-focus-events')
call dein#add('airblade/vim-gitgutter')
call dein#add('tpope/vim-fugitive')


" --- Tmux plugins ---
call dein#add('christoomey/vim-tmux-navigator')
call dein#add('edkolev/tmuxline.vim')

call dein#end()

" install uninstalled plugins when starting
if dein#check_install()
  call dein#install()
endif
