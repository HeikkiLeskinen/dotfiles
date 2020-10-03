### FIND TO VIM 
# mnemonic: [F]ind [VIM]

export SKIM_DEFAULT_COMMAND="rg --files || find ."

loc=$(sk --bind "ctrl-p:toggle-preview" --ansi --preview="preview.sh {}" --preview-window=up:50%:hidden)

if [[ -n $loc ]]; then
	vim "${loc}"
fi
