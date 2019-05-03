all: help

RESET   = "\x1b[39;49;00m"
RED     = "\x1b[31;01m"
GREEN   = "\x1b[32;01m"
YELLOW  = "\x1b[33;01m"
BLUE    = "\x1b[34;01m"

help:
	@printf "\\n\
	"${GREEN}"Yverek's dotfiles"${RESET}"\\n\
	\\n\
	This tool will install dotfiles for my "${BLUE}"Arch Linux"${RESET}" development environment.\\n\
	"${RED}"Do not forget to see README before installing packages!"${RESET}"\\n\
	\\n\
	"${GREEN}"USAGE: "${BLUE}"make "${YELLOW}"[target]"${RESET}"\\n\
	\\n\
	  "${BLUE}"make               "${GREEN}"Show this message"${RESET}"\\n\
	\\n\
	  "${BLUE}"make "${YELLOW}"install       "${GREEN}"Stow every package"${RESET}"\\n\
	\\n\
	  "${BLUE}"make "${YELLOW}"uninstall     "${GREEN}"Un-Stow every package"${RESET}"\\n\
	\\n\
	  "${BLUE}"make "${YELLOW}"clean_backup  "${GREEN}"Clean backup files"${RESET}"\\n\
	\\n\
	"

.PHONY: install uninstall clean_backup

install:
# Stow must be the first one!
	@printf "Installing "${BLUE}"Stow"${RESET}"... \\r"
	if [[ -f ~/.stowrc ]]; then \
		mv ~/.stowrc ~/.stowrc_bak \
	fi
	if [[ -f ~/.stow-global-ignore ]]; then \
		mv ~/.stow-global-ignore ~/.stow-global-ignore_bak; \
	fi
	@stow stow -t ~ &> /dev/null
	@printf "[ "${GREEN}"OK"${RESET}" ] Installing "${BLUE}"Stow"${RESET}"... \\n"

# Albert
	@printf "Installing "${BLUE}"Albert"${RESET}"... \\r"
	if [[ -f ~/.config/albert/albert.conf ]]; then \
		mv ~/.config/albert/albert.conf_bak; \
	fi
	@stow albert &> /dev/null
	@printf "[ "${GREEN}"OK"${RESET}" ] Installing "${BLUE}"Albert"${RESET}"... \\n"

# Git
	@printf "Installing "${BLUE}"Git"${RESET}"... \\r"
	if [[ -f ~/.gitconfig ]]; then \
		mv ~/.gitconfig ~/.gitconfig_bak \
	fi
	if [[ -f ~/.gitignore ]]; then \
		mv ~/.gitignore ~/.gitignore_bak; \
	fi
	@stow git &> /dev/null
	@printf "[ "${GREEN}"OK"${RESET}" ] Installing "${BLUE}"Git"${RESET}"... \\n"

# htop
	@printf "Installing "${BLUE}"htop"${RESET}"... \\r"
	if [[ -f ~/.config/htop/htoprc ]]; then \
		mv ~/.config/htop/htoprc ~/.config/htop/htoprc_bak; \
	fi
	@stow htop &> /dev/null
	@printf "[ "${GREEN}"OK"${RESET}" ] Installing "${BLUE}"htop"${RESET}"... \\n"

# kitty
	@printf "Installing "${BLUE}"kitty"${RESET}"... \\r"
	if [[ -f ~/.config/kitty/kitty.conf ]]; then \
		mv ~/.config/kitty/kitty.conf ~/.config/kitty/kitty.conf_bak; \
	fi
	@stow kitty &> /dev/null
	@printf "[ "${GREEN}"OK"${RESET}" ] Installing "${BLUE}"kitty"${RESET}"... \\n"

# Neofetch
	@printf "Installing "${BLUE}"Neofetch"${RESET}"... \\r"
	if [[ -f ~/.config/neofetch/config.conf ]]; then \
		mv ~/.config/neofetch/config.conf ~/.config/neofetch/config.conf_bak; \
	fi
	@stow neofetch &> /dev/null
	@printf "[ "${GREEN}"OK"${RESET}" ] Installing "${BLUE}"Neofetch"${RESET}"... \\n"

# Zsh
	@printf "Installing "${BLUE}"Zsh"${RESET}"... \\r"
	if [[ -f ~/.zshrc ]]; then \
		mv ~/.zshrc ~/.zshrc_bak; \
	fi
	if [[ -d ~/.zsh ]]; then \
		mv ~/.zsh ~/.zsh_bak \
	fi
	@stow zsh &> /dev/null
	@printf "[ "${GREEN}"OK"${RESET}" ] Installing "${BLUE}"Zsh"${RESET}"... \\n"

uninstall:
# Albert
	@printf "Uninstalling "${BLUE}"Albert"${RESET}"... \\r"
	@stow -D albert &> /dev/null
	@printf "[ "${GREEN}"OK"${RESET}" ] Uninstalling "${BLUE}"Albert"${RESET}"... \\n"

# Git
	@printf "Uninstalling "${BLUE}"Git"${RESET}"... \\r"
	@stow -D git &> /dev/null
	@printf "[ "${GREEN}"OK"${RESET}" ] Uninstalling "${BLUE}"Git"${RESET}"... \\n"

# htop
	@printf "Uninstalling "${BLUE}"htop"${RESET}"... \\r"
	@stow -D htop &> /dev/null
	@printf "[ "${GREEN}"OK"${RESET}" ] Uninstalling "${BLUE}"htop"${RESET}"... \\n"

# kitty
	@printf "Uninstalling "${BLUE}"kitty"${RESET}"... \\r"
	@stow -D kitty &> /dev/null
	@printf "[ "${GREEN}"OK"${RESET}" ] Uninstalling "${BLUE}"kitty"${RESET}"... \\n"

# Neofetch
	@printf "Uninstalling "${BLUE}"Neofetch"${RESET}"... \\r"
	@stow -D neofetch &> /dev/null
	@printf "[ "${GREEN}"OK"${RESET}" ] Uninstalling "${BLUE}"Neofetch"${RESET}"... \\n"

# Zsh
	@printf "Uninstalling "${BLUE}"Zsh"${RESET}"... \\r"
	@stow -D zsh &> /dev/null
	@printf "[ "${GREEN}"OK"${RESET}" ] Uninstalling "${BLUE}"Zsh"${RESET}"... \\n"

# Stow
	@printf "Uninstalling "${BLUE}"Stow"${RESET}"... \\r"
	@stow -D stow &> /dev/null
	@printf "[ "${GREEN}"OK"${RESET}" ] Uninstalling "${BLUE}"Stow"${RESET}"... \\n"

clean_backup:
	@printf "Cleaning backup files... \\r"
	@rm -f ~/.stowrc_bak ~/.stow-global-ignore_bak
	@rm -f ~/.config/albert/albert.conf_bak
	@rm -f ~/.gitconfig_bak ~/.gitignore_bak
	@rm -f ~/.config/htop/htoprc_bak
	@rm -f ~/.config/kitty/kitty.conf_bak
	@rm -f ~/.config/neofetch/config.conf_bak
	@rm -rf ~/.zshrc_bak ~/.zsh_bak
	@printf "[ "${GREEN}"OK"${RESET}" ] Cleaning backup files... \\n"
