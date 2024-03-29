set ERROR_FOUND false

if not command -q nvim
    print_error "Please install nvim!"
    print_url "https://neovim.io"
    set ERROR_FOUND true
end

if not command -q firefox
    print_error "Please install Firefox!"
    print_url "https://mozilla.org"
    set ERROR_FOUND true
end

if not command -q kitty
    print_error "Please install kitty!"
    print_url "https://sw.kovidgoyal.net/kitty"
    set ERROR_FOUND true
end

if not functions -q fisher
    print_error "Please install Fisher!"
    print_url "https://github.com/jorgebucaran/fisher"
    set ERROR_FOUND true
end

if not command -q exa
    print_error "Please install exa!"
    print_url "https://the.exa.website"
    set ERROR_FOUND true
end

if not ls ~/.local/share/fonts/ | grep Fira > /dev/null
    print_error "Please install Fira Nerd Font family!"
    print_url "https://www.nerdfonts.com"
    set ERROR_FOUND true
end

if not command -q starship
    print_error "Please install starship!"
    print_url "https://starship.rs"
    set ERROR_FOUND true
end

if not command -q neofetch
    print_error "Please install neofetch!"
    print_url "https://github.com/dylanaraps/neofetch"
    set ERROR_FOUND true
end

if $ERROR_FOUND
    exit -1
else
    set -gx IS_FISH_INSTALLATION_OK true
end
