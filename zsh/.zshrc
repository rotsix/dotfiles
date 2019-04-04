plugins = ( \
  /usr/share/fzf/completion.zsh \
  /usr/share/fzf/key-bindings.zsh \
  /usr/share/autojump/autojump.zsh \
  /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh \
  /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh \
  )

for plugin in "${plugins[@]}"; do
  if [[ -f $plugin ]]; then
    source $plugin

    if [[ $plugin = "/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]]; then
      ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor line root)
      ZSH_HIGHLIGHT_STYLES[alias]='fg=blue'
      ZSH_HIGHLIGHT_STYLES[builtin]='fg=blue'
      ZSH_HIGHLIGHT_STYLES[function]='fg=blue'
      ZSH_HIGHLIGHT_STYLES[command]='fg=blue'
      ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=magenta'
      ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=red'
    fi
  fi
done

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

clear
