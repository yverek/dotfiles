from pathlib import Path


def rewrite_sources():
    sources_list_old = Path('/etc/apt/sources.list')
    sources_list_new = Path.cwd() / 'software' / 'debian' / 'sources.list'

    sources_list_old.write_text(sources_list_new.read_text())

# TODO: overwrite /etc/apt/sources.list with the following, then run sudo apt update && sudo apt upgrade

# TODO: Install aptitude & synaptic apt install aptitude synaptic

# TODO: Firmware & Drivers

# TODO: Audio


"""
# gedit /etc/pulse/daemon.conf

In questo file, dobbiamo cercare tre righe

; resample-method = speex-float-1
; default-sample-format = s16le
; default-sample-rate = 44100

Le ultime due righe sono vicine tra loro, mentre la prima è qualche riga sopra quest'ultime. Modificale affinché risultino così

resample-method = src-sinc-best-quality
default-sample-format = s24le
default-sample-rate = 96000

Dobbiamo essere sicuri che i ; siano rimossi da tutte le righe. Adesso possiamo salvare e riavviare PulseAudio con

$ pulseaudio -k
$ pulseaudio --start
"""

# TODO: Firewall

"""
Per installare UFW, lanciamo

# aptitude install gufw

Questo comando installerà sia la GUI che il software. Aggiungiamo le regole di negazione predefinite e siamo a posto con un firewall di base.

# ufw default deny

Il comando seguente è sufficiente ad abilitare il firewall e aggiungerlo all'avvio del sistema.

# ufw enable

Possiamo controllare lo stato del firewall, in qualsiasi momento, lanciando i seguenti comandi

# ufw status
# ufw status verbose
"""


def main():
    rewrite_sources()
