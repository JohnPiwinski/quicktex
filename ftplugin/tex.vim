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
" can use nonalphanumberical keypresses, like "\<CR>", "\<BS>", or "\<Right>"
"
" Unfortunately, comments are not allowed inside multiline vim dictionaries.
" Thus, sections and comments must be included as entries themselves. Make
" sure that the comment more than one word, that way it could never be called
" by the ExpandWord function

" Math Mode Keywords {{{

let g:quicktex_math = {
\' ' : "\<ESC>:call search('<+.*+>')\<CR>\"_c/+>/e\<CR>",
\'Section: Set Theory' : 'COMMENT',
    \'subs'  : 'subseteq ',
    \'nin'   : '\not\in ',
    \'cup'   : 'cup ',
    \'cap'   : 'cap ',
    \'union' : 'cup ',
    \'sect'  : 'cap ',
    \'smin'  : 'setminus ',
    \'set'   : '{<+++>} <++>',
    \'pair'  : '(<+++>, <++>) <++>',
    \
\'Section: Logic' : 'COMMENT',
    \'frl'  : 'forall ',
    \'imp'  : 'implies ',
    \
\'Section: Relations' : 'COMMENT',
    \'lt'      : '< ',
    \'gt'      : '> ',
    \'eq'      : '= ',
    \
\'Section: Operations' : 'COMMENT',
    \'add'   : '+ ',
    \'min'   : '- ',
    \'fa'    : '(<+++>)/(<++>) <++>',
    \'rec'   : '(1)/(<+++>) <++>',
    \'dp'    : 'cdot ',
    \'cp'    : 'times ',
    \'td'    : "<BS>^{<+++>} <++>",
    \'sb'    : "<BS>_{<+++>} <++>",
    \'sq'    : "<BS>^2 ",
    \'cb'    : "<BS>^3 ",
    \'inv'   : "<BS>^(-1) ",
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
    \'mapsto' : 'mapsto ',
    \'of'     : "<BS>(<+++>) <++>",
    \'sin'    : 'sin(<+++>) <++>',
    \'cos'    : 'cos(<+++>) <++>',
    \'tan'    : 'tan(<+++>) <++>',
    \'gcd'    : 'gcd(<+++>) ,<++>) <++>',
    \'ln'     : 'ln(<+++>) <++>',
    \'log'    : 'log(<+++>) <++>',
    \'df'     : '<+++> : <++> to <++>',
    \'sqrt'   : 'sqrt(<+++>) <++>',
    \'case'   : '\begin{cases} <+++> \end{cases} <++>',
    \
   \
\'Section: Encapsulating keywords' : 'COMMENT',
    \'hat'  : "\<ESC>Bi\\hat{\<ESC>Els} ",
    \'bar'  : "\<ESC>Bi\\overline{\<ESC>Els} ",
    \'tild'  : "\<ESC>Bi\\tild{\<ESC>Els} ",
    \'vec'  : "\<ESC>Bi\\vec{\<ESC>Els} ",
    \'star'  : "\<BS>^* ",
    \
\'Section: Linear Algebra' : 'COMMENT',
    \'GL'     : '\text{GL} ',
    \'SL'     : '\text{SL} ',
    \'com'    : "\<BS>^c ",
    \'matrix' : "\<CR>\\begin{bmatrix}\<CR><+++>\<CR>\\end{bmatrix}\<CR><++>",
    \'vdots'  : '\vdots & ',
    \'ddots'  : '\ddots & ',
    \
\'Section: Constants' : 'COMMENT',
    \'aleph' : '\aleph ',
    \'inf'   : '\infty ',
    \'one'   : '1 ',
    \'zero'  : '0 ',
    \'two'   : '2 ',
    \'three' : '3 ',
    \'four'  : '4 ',
    \
\'Section: Operators' : 'COMMENT',
    \'int'    : '\int <+++> \mathop{d <++>} <++>',
    \'dev'    : '\frac{d}{d <+++>} <++>',
    \'lim'    : '\lim_{<+++>} <++>',
    \'sum'    : '\sum ',
    \'prod'   : '\prod ',
    \'limsup' : '\limsup ',
    \'liminf' : '\liminf ',
    \'sup'    : '\sup ',
    \'sinf'   : '\inf ',
\}

" LaTeX Mode Keywords {{{

let g:quicktex_tex = {
    \' '   : "\<ESC>:call search('<+.*+>')\<CR>\"_c/+>/e\<CR>",
    \'mt'  : '\( <+++> \) <++>',
    \'mmt' : '\[ <+++> \] <++>',
\'Section: Environments' : 'COMMENT',
    \'env' : "\<ESC>Bvedi\\begin{\<ESC>pa}\<CR><+++>\<CR>\\end{\<ESC>pa}",
    \'exe' : "\\begin{exercise}{<+++>}\<CR><++>\<CR>\\end{exercise}",
    \'prf' : "\\begin{proof}\<CR><+++>\<CR>\\end{proof}",
    \'thm' : "\\begin{theorem}\<CR><+++>\<CR>\\end{theorem}",
    \'lst' : "\\begin{enumerate}[a)]\<CR>\\item <+++>\<CR>\\end{enumerate}",
    \'eq'  : "\\begin{displaymath}\<CR><+++>\<CR>\\end{displaymath}",
    \'eqn' : "\\begin{equation}\\label{<+++>}\<CR><++>\<CR>\\end{equation}",
    \
\'Section: Other Commands' : 'COMMENT',
    \'itm'  : '\item ',
    \'sect' : "\\section*{<+++>}\<CR><++>",
    \'para' : '(<+++>) <++>',
    \'qt'   : "``<+++>'' <++>",
    \
\}

