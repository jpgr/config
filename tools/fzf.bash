export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border"

fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m --preview 'ls {}') && cd "$dir"
}

fda() {
  local dir
  dir=$(find ${1:-.} -type d 2> /dev/null | fzf +m --preview 'ls {}') && cd "$dir"
}

f() {
  _f_prev=$(if type -P bat > /dev/null; then
    echo 'bat --color=always -n -H $(({n}+1)) -r $(if [ $(({n}-'${2:-5}'+1)) -lt 0 ]; then echo 0; else echo $(({n}-'${2:-5}'+1)); fi):+40 '$1;
  else echo 'cat '$1' | head -$(({n}+40)) | tail -40'; fi)
  cat $1 | fzf -e --no-sort --height 100% --preview-window down,70% --preview "$_f_prev"
}

