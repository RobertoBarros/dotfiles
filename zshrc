##### 0) Oh My Zsh: núcleo e plugins  ##################################################
ZSH="$HOME/.oh-my-zsh"

plugins=(
  git gitfast last-working-dir common-aliases
  zsh-syntax-highlighting history-substring-search
  aliases
)

ZSH_THEME="robbyrussell"

ZSH_DISABLE_COMPFIX=true

source "$ZSH/oh-my-zsh.sh"


##### 1) Variáveis de ambiente gerais  #################################################
export HOMEBREW_NO_ANALYTICS=1
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export BUNDLER_EDITOR=code
export EDITOR=code
export THOR_MERGE="code --wait"

# Problema da gem blazer https://stackoverflow.com/a/53404317
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

##### 2) Gerenciadores de runtime  #####################################################
# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
type -a rbenv >/dev/null && eval "$(rbenv init -)"

# This loads nvm
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" #


##### 3) Caminhos (PATH)  ##############################################################
export PATH="\
$HOME/.rbenv/bin:\
./bin:\
./node_modules/.bin:\
/usr/local/sbin:\
$HOME/.yarn/bin:\
$HOME/.config/yarn/global/node_modules/.bin:\
/usr/local/postgresql@16/bin:\
/usr/local/opt/postgresql@16/bin:\
/opt/homebrew/opt/postgresql@16/bin:\
/Applications/Visual Studio Code.app/Contents/Resources/app/bin:\
/Applications/Docker.app/Contents/Resources/bin:\
$PATH"


##### 4) Aliases e utilidades do usuário  ##############################################
[[ -f "$HOME/.aliases" ]] && source "$HOME/.aliases"
source <(fzf --zsh)


##### 5) Complementos de terminal  #####################################################
if [[ -f /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
  source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
elif [[ -f /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
  source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi
