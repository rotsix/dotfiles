
source /usr/share/fzf/completion.zsh || true
source /usr/share/fzf/key-bindings.zsh || true

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh || true
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh || true
source /usr/share/autojump/autojump.zsh || true

for src in $(find $HOME/.zsh.d/plugins -name "*.zsh"); do
  source $src
done || true

source $HOME/.zsh.d/alias.zsh
source $HOME/.zsh.d/functions.zsh
source $HOME/.zsh.d/variables.zsh
source $HOME/.zsh.d/binds.zsh
source $HOME/.zsh.d/completion.zsh
source $HOME/.zsh.d/colors.zsh
source $HOME/.zsh.d/main.zsh
source $HOME/.zsh.d/prompt.zsh
source $HOME/.zsh.d/history.zsh
source $HOME/.opam/opam-init/init.zsh > /dev/null 2>&1 || true

