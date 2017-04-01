" 在.vimrc中加上一行就好:
" source DealOperator.vim
"
function! DealOperator()
    let assign_op = '[-+*/%|&]\?=\@<!==\@!'
    let assign_line = '^\(.\{-}\)\s*\(' . assign_op . '\)'
    let indent = '^' .  matchstr(getline('.'), '^\s*') . '\S'

    let firstline = search('^\%(' . indent . '\)\@!', 'bnW') + 1
    let lastline  = search('^\%(' . indent . '\)\@!', 'nW') - 1
    if lastline < 0
        let lastline = line('$')
    endif

    let binary_operator = ' \@<![-+*/%|&]\@<!\([-+*/%|&]\)[-+*/%|&=]\@! \@!'
    for linenum in range(firstline, lastline)
        let oldline = getline(linenum)
        let newline = substitute(oldline, binary_operator, ' \1 ', 'g')
        let newline = substitute(newline, '\w\@<=&&\w\@=', ' \&\& ', 'g')
        let newline = substitute(newline, '\w\@<=||\w\@=', ' \|\| ', 'g')
        let newline = substitute(newline, ' \@<!\(' . assign_op . '\) \@!',
        \   ' \1 ', 'g')
        let newline = substitute(newline, ', \@!', ', ', 'g')
        call setline(linenum, newline)
    endfor

    let max_align_col = 0
    let max_op_width = 0
    for linetext in getline(firstline, lastline)
        let left_width = match(linetext, '\s*' . assign_op)
        if left_width >= 0
            let max_align_col = max([max_align_col, left_width])
            let op_width = strlen(matchstr(linetext, assign_op))
            let max_op_width = max([max_op_width, op_width+1])
        endif
    endfor

    let formatter = '\=printf("%-*s%*s", max_align_col, submatch(1),
    \                                    max_op_width,  submatch(2))'
    for linenum in range(firstline, lastline)
        let oldline = getline(linenum)
        let newline = substitute(oldline, assign_line, formatter, '')
        call setline(linenum, newline)
    endfor
    if (line('.') == lastline)
        call cursor(lastline, 0)
        call cursor(0, col('$')-1)
    else
        call cursor(0, col('$')-1)
    endif
endfunction

inoremap <silent> <CR> <C-O>:call DealOperator()<CR><CR>
