let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

augroup customVimWiki | au!
	autocmd BufNewFile ~/vimwiki/diary/*.md
				\ exe ".!date" |
				\ exe  ":normal i# " |
				\ exe ":normal 4whr\ro" |
				set nomodified
augroup end
