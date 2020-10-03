### FIND TO VIM 
# mnemonic: [S]earh [VIM]

export SKIM_DEFAULT_COMMAND="rg --files || find ."

loc=$(sk --bind "ctrl-p:toggle-preview" --ansi -i -c "rg --color=always --line-number \"{}\"" --preview="preview.sh {}" --preview-window=up:50%:hidden)

if [[ -n $loc ]]; then
	vim "$(echo $loc|cut -d: -f1)" "+$(echo $loc|cut -d: -f2)"
fi
