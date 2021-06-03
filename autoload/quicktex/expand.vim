function! quicktex#expand#ExpandWord(ft)
    echo "Attempting Expand"
    " Get the current line up to the cursor position
    let line = strpart(getline('.'), 0, col('.')-1)

    " If the last character was a space, then return a space as the keyword.
    " The colon is necessary when indexing with negative numbers. Otherwise,
    " part the string at the last space. This will be the last word typed.
    " Note that if there is no space, strridx returns -1, which all works out.
    let word = (line[-1:] == ' ') ? ' ' : split(line, '\s', 1)[-1]

    " Cuts the word so that it only contains valid keyword characters.
    " Non-valid keyword characters are defined by g:quicktex_excludechar.
    " Default value: ['(','{','[']
    let word = split(word, join(g:quicktex_excludechar, '\|'), 1)[-1]

    " If the filetype is tex and you're in mathmode, then use that dictionary.
    " Otherwise, use the filetype dictionary. If there is no entry, just set
    " result to ''.
    if (a:ft == 'tex' || a:ft == 'pandoc') && quicktex#mathmode#InMathMode()
        let result = get(g:quicktex_math, word, '')
    else
        execute('let result = get(g:quicktex_'.a:ft.', word, "")')
    endif

    " If there is no result found in the dictionary, then return the original
    " trigger key.
    if result == ''
        call feedkeys("\<ESC>:call search('<+.*+>', 'b')\<CR>\"_c/+>/e\<CR>")
        return get(g:, 'quicktex_trigger', '')
    endif

    " Create a string of backspaces to delete the last word, and also create a
    " string for jumping back to the identifier "<+++>" if it exists.
    let delword  = repeat("\<BS>", strlen(word))
    let jumpBack = stridx(result,'<+++>')+1 ? "\<ESC>:call search('<+++>', 'b')\<CR>\"_cf>" : ''

    " Delete the original word, replace it with the result of the dictionary,
    " and jump back if needed.
    echom("\<C-g>u".delword.result.jumpBack)
    return "\<C-g>u".delword.result.jumpBack
endfunction

let g:char_counter = 0

function! quicktex#expand#AutoExpand()
    echom "Expanding Math"
    g:char_counter ++
    if g:char_counter % 5 == 0
        write
    endif
    if quicktex#mathmode#InMathMode()
        let line = strpart(getline('.'), 0, col('.')-1)
        let word = (line[-1:] == ' ') ? ' ' : split(line, '\s', 1)[-1]
        let word = split(word, join(g:quicktex_excludechar, '\|'), 1)[-1]
        let result = get(g:quicktex_math, word, '')
        echom word." ".result
        if result == ''
            echom "Empty result"
            return ""
        endif
        let delword  = repeat("\<BS>", strlen(word))
        let jumpBack = stridx(result,'<+++>')+1 ? "\<ESC>:call search('<+++>', 'b')\<CR>\"_cf>" : ''
        echom "Auto Expand: \<C-g>u".delword.result.jumpBack
        call feedkeys("\<C-g>u".delword.result.jumpBack)
    endif
    redraw
    return ""
endfunction
