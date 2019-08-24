" Path to the IntelliJ formatter (the idea binary or format.sh script)
autocmd FileType java command! -nargs=0 Format silent exec "!idea format %"

let b:ale_fixers = [
\  'Format',
\  'remove_trailing_lines',
\  'trim_whitespace'
\]
