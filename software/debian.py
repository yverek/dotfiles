from pathlib import Path

import subprocess

from .utils import print_info, print_success, print_error
from .utils import read_status_from_file, write_status_to_file


def rewrite_sources():
    print_info('Rewriting /etc/apt/source.list... ')
    sources_list_old = Path('/etc/apt/sources.list')
    sources_list_new = Path.cwd() / 'software' / 'files' / 'sources.list'

    sources_list_old.write_text(sources_list_new.read_text())
    print_success()

    print_info('Updating system... ')
    try:
        # Note that quiet level 2 (-qq) implies -y
        subprocess.run('apt-get update -qq && apt-get upgrade -qq', check=True, shell=True)
    except subprocess.CalledProcessError as e:
        print_error()
        print(e.output)
    print_success()


def install_firmware_and_drivers():
    print_info('Installing firmwares and drivers... ')

    file = Path.cwd() / 'software' / 'files' / 'drivers.txt'

    # -2 because last one is empty line, -2 is the line we need, the second from last
    packages = file.read_text().split('\n')[-2]
    command = "apt-get install {packages}".format(packages=packages)

    try:
        subprocess.run(command, check=True, shell=True)
    except subprocess.CalledProcessError as e:
        print_error()
        print(e.output)
    print_success()
    print('Please reboot your system!')
    input("Press Enter to continue...")


def edit_audio_config():
    print_info('Editing audio configuration files... ')
    file = Path('/etc/pulse/daemon.conf')

    with file.open() as f:
        content = f.read()

    content = content.replace('; resample-method = speex-float-1\n', 'resample-method = src-sinc-best-quality\n')
    content = content.replace('; default-sample-format = s16le\n', 'default-sample-format = s24le\n')
    content = content.replace('; default-sample-rate = 44100\n', 'default-sample-rate = 96000\n')

    with file.open(mode='w') as f:
        f.write(content)

    print_success()
    print_info('Rebooting PulseAudio... ')
    try:
        # kill the process and start a new one
        subprocess.run('pulseaudio -k && pulseaudio --start', check=True, shell=True)
    except subprocess.CalledProcessError as e:
        print_error()
        print(e.output)

    print_success()


def install_and_configure_firewall():
    print_info('Installing UFW... ')
    try:
        subprocess.run('apt-get install gufw', check=True, shell=True)
    except subprocess.CalledProcessError as e:
        print_error()
        print(e.output)
    print_success()

    print_info('Configuring UFW... ')
    try:
        subprocess.run('ufw default deny && ufw enable', check=True, shell=True)
    except subprocess.CalledProcessError as e:
        print_error()
        print(e.output)
    print_success()


def install_and_configure_fonts():
    print_info('Installing fonts... ')

    command = 'apt-get install font-manager fonts-freefont-ttf fonts-freefont-otf fonts-robo'

    try:
        subprocess.run(command, check=True, shell=True)
    except subprocess.CalledProcessError as e:
        print_error()
        print(e.output)

    print_success()
    print_info('Configuring fonts... ')

    try:
        subprocess.run('mk', check=True, shell=True)
    except subprocess.CalledProcessError as e:
        print_error()
        print(e.output)
    print_success()

"""

Apriamo font-manager e andiamo nelle impostazioni.

    Nella scheda Rendering, metti una spunta su Antialias e Hinting. Imposta su Slight la barra di Hinting Style;
    Nella scheda Display, imposta Default la barra di LCD Filter;

Adesso andiamo nel repository Nerd Fonts su GitHub, scarichiamo ed installiamo RobotoMono Nerd Font Regular.
Apriamo gnome-tweak-tool, andiamo nella scheda Fonts e selezioniamo:

    Roboto Regular 12 per le prime tre opzioni;
    RobotoMono Nerd Font Regular 12 per l'ultima opzione;
    Rgba per l'opzione Antialiasing;

2.10 Gedit
Gedit è l'editor di testo che viene installato automaticamente insieme a GNOME. È estensibile con vari plugin mantenendo, al tempo stesso, semplicità e facilità d'uso. Andiamo in Preferences > View e mettiamo la spunta a:

    Display line numbers;
    Display right margin at column: 150;
    Display status bar;
    Display overview map;
    Highlight current line;
    Highlight matching brackets;

Andiamo nella scheda Editor e mettiamo la spunta a:

    Tab width: 2;
    Insert spaces instead of tabs;
    Enable automatic indentation;

Andiamo nella scheda Font & Colors e selezioniamo:

    Use the system fixed width font;
    Colour Scheme: Solarized Dark; (seguite le istruzioni)

. Per finire, andiamo nella scheda Plugins e mettiamo la spunta a:

    Bracket Completion
    Code Comment
    Document Statistics
    Draw Spaces
    File Browser Panel
    Insert Date/Time
    Snippets
    Spell Checker
    SyncTeX

Se non troviamo questi plugin significa che non è presente il pacchetto nel nostro sistema. Lanciamo 
"""

def main():
    status = read_status_from_file()

    if status == 'First run':
        rewrite_sources()
        install_firmware_and_drivers()
        write_status_to_file('Drivers installed')

    elif status == 'Drivers installed':
        edit_audio_config()
        install_and_configure_firewall()

