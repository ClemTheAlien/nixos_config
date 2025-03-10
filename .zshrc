nitrogen --restore
wal -R
clear
fastfetch
PS1="%B%{$fg%}[%{$fg%}%n%{$fg%}@%{$fg%}%M %{$fg%}%~%{$fg%}]%{$reset_color%}$%b "

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
