if exists('g:quicktex_tex') && !exists('g:quicktex_math')
    let g:quicktex_math = {}
    finish
elseif !exists('g:quicktex_tex') && exists('g:quicktex_math')
    let g:quicktex_tex = {}
    finish
elseif exists('g:quicktex_tex') && exists('g:quicktex_math')
    finish
endif

if !get(g:, 'quicktex_usedefault', 1)
    finish
endif

" Keyword mappings are simply a dictionary. Dictionaries are of the form
" "quicktex_" and then the filetype. The result of a keyword is either a
" literal string or a double quoted string, depending on what you want.
"
" In a literal string, the result is just a simple literal substitution
"
" In a double quoted string, \'s need to be escape (i.e. "\\"), however, you
" can use nonalphanumberical keypresses, like "\<CR>", "", or "\<Right>"
"
" Unfortunately, comments are not allowed inside multiline vim dictionaries.
" Thus, sections and comments must be included as entries themselves. Make
" sure that the comment more than one word, that way it could never be called
" by the ExpandWord function

" Math Mode Keywords {{{

let g:quicktex_math = {
            \'Section: Set Theory' : 'COMMENT',
            \'tup'  : '(<+++>, <++>) <++>',
            \'inr'  : '^@ ',
            \
            \'Section: Relations' : 'COMMENT',
            \'lt'      : '< ',
            \'le'      : '< ',
            \'mt'      : '> ',
            \'me'      : '>= ',
            \'eq'      : '= ',
            \
            \'Section: Operations' : 'COMMENT',
            \'fa'    : '(<+++>)/(<++>) <++>',
            \'rec'   : '(1)/(<+++>) <++>',
            \'td'    : "^(<+++>) <++>",
            \'sb'    : "_(<+++>) <++>",
            \'sr'    : "^2 ",
            \'cb'    : "^3 ",
            \'iv'    : "^(-1) ",
            \
            \'Section: Delimiters' : 'COMMENT',
            \'fh' : '| <+++> | <++>',
            \'fj' : '( <+++> ) <++>',
            \'fk' : '[ <+++> ] <++>',
            \'fl' : '{ <+++> } <++>',
            \'f;' : 'langle <+++> rangle <++>',
            \
            \'Section: Group Theory' : 'COMMENT',
            \'sdp'   : 'rtimes ',
            \'niso'  : 'niso ',
            \'subg'  : 'leq ',
            \'nsubg' : 'trianglelefteq ',
            \'mod'   : '/ ',
            \
            \'Section: Functions' : 'COMMENT',
            \'sin'    : 'sin(<+++>) <++>',
            \'cos'    : 'cos(<+++>) <++>',
            \'tan'    : 'tan(<+++>) <++>',
            \'gcd'    : 'gcd(<+++> ,<++>) <++>',
            \'ln'     : 'ln(<+++>) <++>',
            \'log'    : 'log(<+++>) <++>',
            \'df'     : '<+++> : <++> to <++>',
            \'hf'     : 'hf(<+++>) <++>',
            \'case'   : '\begin{cases} <+++> \end{cases} <++>',
            \
            \
            \'Section: Encapsulating keywords' : 'COMMENT',
            \'hat'  : "hat(<+++>) <++> ",
            \'bar'  : "bar(<+++>) <++> ",
            \'til'  : "til(<+++>) <++> ",
            \'vec'  : "vec(<+++>) <++> ",
            \'str'  : "^* ",
            \
            \'Section: Linear Algebra' : 'COMMENT',
            \'GL'     : '\text{GL} ',
            \'SL'     : '\text{SL} ',
            \'com'    : "^c ",
            \'matrix' : "\<CR>\\begin{bmatrix}\<CR><+++>\<CR>\\end{bmatrix}\<CR><++>",
            \'vdots'  : '\vdots & ',
            \'ddots'  : '\ddots & ',
            \
            \'Section: Constants' : 'COMMENT',
            \'aleph' : '\aleph ',
            \'zero'  : '0 ',
            \'one'   : '1 ',
            \'two'   : '2 ',
            \'three' : '3 ',
            \'four'  : '4 ',
            \'five'  : '5 ',
            \'six'   : '6 ',
            \'seven' : '7 ',
            \'eight' : '8 ',
            \'nine'  : '9 ',
            \
            \'Section: Operators' : 'COMMENT',
            \'int'    : 'int_(<+++>)^(<++>) <++> d <++> <++>',
            \'snt'    : 'int_(<+++>) <++> d <++> <++>',
            \'ont'    : 'oint_(<+++>) <++> d <++> <++>',
            \'oont'   : 'ooint_(<+++>) <++> d <++> <++>',
            \'dvo'    : 'frac{d}{d <+++>} <++>',
            \'pvo'    : 'frac{par}{par <+++>} <++>',
            \'lim'    : 'lim_(<+++> to <++>) <++>',
            \'sum'    : 'sum_(<+++>)^(<++>) <++> ',
            \'ssum'   : 'sum_(<+++>) <++> ',
            \'prd'    : 'prod_(<+++>)^(<++>) <++> ',
            \'sprd'   : 'prod_(<+++>) <++> ',
            \'limsup' : 'limsup_(<+++> to <++>) <++> ',
            \'liminf' : 'liminf_(<+++> to <++>) <++> ',
            \'sup'    : 'sup{ <+++> } <++> ',
            \'sinf'   : 'inf{ <+++> } <++> ',
            \}

" LaTeX Mode Keywords {{{

let g:quicktex_tex = {
            \'mt'  : '\( <+++> \) <++>',
            \'mmt' : '\[ <+++> \] <++>',
            \'Section: Environments' : 'COMMENT',
            \'env' : "\<ESC>Bvedi\\begin{\<ESC>pa}\<CR><+++>\<CR>\\end{\<ESC>pa}",
            \'exe' : "begin_exercise [<+++>]\<CR><++>\<CR>end_exercise",
            \'prf' : "begin_proof\<CR><+++>\<CR>end_proof",
            \'thm' : "begin_theorem\<CR><+++>\<CR>end_theorem",
            \'lst' : "\\begin{enumerate}[a)]\<CR>\\item <+++>\<CR>\\end{enumerate}",
            \'eq'  : "\\begin{displaymath}\<CR><+++>\<CR>\\end{displaymath}",
            \'eqn' : "\\begin{equation}\\label{<+++>}\<CR><++>\<CR>\\end{equation}",
            \}

