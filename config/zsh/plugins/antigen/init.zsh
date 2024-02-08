#-- START ZCACHE GENERATED FILE
#-- GENERATED: ven. 31 mars 2023 14:41:55 CEST
#-- ANTIGEN v2.2.3
_antigen () {
	local -a _1st_arguments
	_1st_arguments=('apply:Load all bundle completions' 'bundle:Install and load the given plugin' 'bundles:Bulk define bundles' 'cleanup:Clean up the clones of repos which are not used by any bundles currently loaded' 'cache-gen:Generate cache' 'init:Load Antigen configuration from file' 'list:List out the currently loaded bundles' 'purge:Remove a cloned bundle from filesystem' 'reset:Clears cache' 'restore:Restore the bundles state as specified in the snapshot' 'revert:Revert the state of all bundles to how they were before the last antigen update' 'selfupdate:Update antigen itself' 'snapshot:Create a snapshot of all the active clones' 'theme:Switch the prompt theme' 'update:Update all bundles' 'use:Load any (supported) zsh pre-packaged framework') 
	_1st_arguments+=('help:Show this message' 'version:Display Antigen version') 
	__bundle () {
		_arguments '--loc[Path to the location <path-to/location>]' '--url[Path to the repository <github-account/repository>]' '--branch[Git branch name]' '--no-local-clone[Do not create a clone]'
	}
	__list () {
		_arguments '--simple[Show only bundle name]' '--short[Show only bundle name and branch]' '--long[Show bundle records]'
	}
	__cleanup () {
		_arguments '--force[Do not ask for confirmation]'
	}
	_arguments '*:: :->command'
	if (( CURRENT == 1 ))
	then
		_describe -t commands "antigen command" _1st_arguments
		return
	fi
	local -a _command_args
	case "$words[1]" in
		(bundle) __bundle ;;
		(use) compadd "$@" "oh-my-zsh" "prezto" ;;
		(cleanup) __cleanup ;;
		(update|purge) compadd $(type -f \-antigen-get-bundles &> /dev/null || antigen &> /dev/null; -antigen-get-bundles --simple 2> /dev/null) ;;
		(theme) compadd $(type -f \-antigen-get-themes &> /dev/null || antigen &> /dev/null; -antigen-get-themes 2> /dev/null) ;;
		(list) __list ;;
	esac
}
antigen () {
  local MATCH MBEGIN MEND
  [[ "$ZSH_EVAL_CONTEXT" =~ "toplevel:*" || "$ZSH_EVAL_CONTEXT" =~ "cmdarg:*" ]] && source "/usr/local/share/zsh-antigen/antigen.zsh" && eval antigen $@;
  return 0;
}
typeset -gaU fpath path
fpath+=(/home/lbartoletti/.config/zsh/plugins/antigen/bundles/zsh-users/zsh-autosuggestions /home/lbartoletti/.config/zsh/plugins/antigen/bundles/zsh-users/zsh-completions /home/lbartoletti/.config/zsh/plugins/antigen/bundles/zsh-users/zsh-history-substring-search /home/lbartoletti/.config/zsh/plugins/antigen/bundles/nviennot/zsh-vim-plugin /home/lbartoletti/.config/zsh/plugins/antigen/bundles/lbartoletti/gpg-crypt /home/lbartoletti/.config/zsh/plugins/antigen/bundles/romkatv/powerlevel10k) path+=(/home/lbartoletti/.config/zsh/plugins/antigen/bundles/zsh-users/zsh-autosuggestions /home/lbartoletti/.config/zsh/plugins/antigen/bundles/zsh-users/zsh-completions /home/lbartoletti/.config/zsh/plugins/antigen/bundles/zsh-users/zsh-history-substring-search /home/lbartoletti/.config/zsh/plugins/antigen/bundles/nviennot/zsh-vim-plugin /home/lbartoletti/.config/zsh/plugins/antigen/bundles/lbartoletti/gpg-crypt /home/lbartoletti/.config/zsh/plugins/antigen/bundles/romkatv/powerlevel10k)
_antigen_compinit () {
  autoload -Uz compinit; compinit -i -d "/home/lbartoletti/.config/zsh/plugins/antigen/.zcompdump"; compdef _antigen antigen
  add-zsh-hook -D precmd _antigen_compinit
}
autoload -Uz add-zsh-hook; add-zsh-hook precmd _antigen_compinit
compdef () {}

if [[ -n "" ]]; then
  ZSH=""; ZSH_CACHE_DIR=""
fi
#--- BUNDLES BEGIN
source '/home/lbartoletti/.config/zsh/plugins/antigen/bundles/zsh-users/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh';
source '/home/lbartoletti/.config/zsh/plugins/antigen/bundles/zsh-users/zsh-completions/zsh-completions.plugin.zsh';
source '/home/lbartoletti/.config/zsh/plugins/antigen/bundles/zsh-users/zsh-history-substring-search/zsh-history-substring-search.plugin.zsh';
source '/home/lbartoletti/.config/zsh/plugins/antigen/bundles/nviennot/zsh-vim-plugin/vim.plugin.zsh';
source '/home/lbartoletti/.config/zsh/plugins/antigen/bundles/lbartoletti/gpg-crypt/gpg-crypt.plugin.zsh';
source '/home/lbartoletti/.config/zsh/plugins/antigen/bundles/romkatv/powerlevel10k/powerlevel10k.zsh-theme.antigen-compat';

#--- BUNDLES END
typeset -gaU _ANTIGEN_BUNDLE_RECORD; _ANTIGEN_BUNDLE_RECORD=('https://github.com/zsh-users/zsh-autosuggestions.git / plugin true' 'https://github.com/zsh-users/zsh-completions.git / plugin true' 'https://github.com/zsh-users/zsh-history-substring-search.git / plugin true' 'https://github.com/nviennot/zsh-vim-plugin.git / plugin true' 'https://github.com/lbartoletti/gpg-crypt.git / plugin true' 'https://github.com/romkatv/powerlevel10k.git / theme true')
typeset -g _ANTIGEN_CACHE_LOADED; _ANTIGEN_CACHE_LOADED=true
typeset -ga _ZCACHE_BUNDLE_SOURCE; _ZCACHE_BUNDLE_SOURCE=('/home/lbartoletti/.config/zsh/plugins/antigen/bundles/zsh-users/zsh-autosuggestions//' '/home/lbartoletti/.config/zsh/plugins/antigen/bundles/zsh-users/zsh-autosuggestions///zsh-autosuggestions.plugin.zsh' '/home/lbartoletti/.config/zsh/plugins/antigen/bundles/zsh-users/zsh-completions//' '/home/lbartoletti/.config/zsh/plugins/antigen/bundles/zsh-users/zsh-completions///zsh-completions.plugin.zsh' '/home/lbartoletti/.config/zsh/plugins/antigen/bundles/zsh-users/zsh-history-substring-search//' '/home/lbartoletti/.config/zsh/plugins/antigen/bundles/zsh-users/zsh-history-substring-search///zsh-history-substring-search.plugin.zsh' '/home/lbartoletti/.config/zsh/plugins/antigen/bundles/nviennot/zsh-vim-plugin//' '/home/lbartoletti/.config/zsh/plugins/antigen/bundles/nviennot/zsh-vim-plugin///vim.plugin.zsh' '/home/lbartoletti/.config/zsh/plugins/antigen/bundles/lbartoletti/gpg-crypt//' '/home/lbartoletti/.config/zsh/plugins/antigen/bundles/lbartoletti/gpg-crypt///gpg-crypt.plugin.zsh' '/home/lbartoletti/.config/zsh/plugins/antigen/bundles/romkatv/powerlevel10k//' '/home/lbartoletti/.config/zsh/plugins/antigen/bundles/romkatv/powerlevel10k///powerlevel10k.zsh-theme')
typeset -g _ANTIGEN_CACHE_VERSION; _ANTIGEN_CACHE_VERSION='v2.2.3'

#-- END ZCACHE GENERATED FILE
