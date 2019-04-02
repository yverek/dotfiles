import os
import sys

from software.debian import debian


def _check_root():
    return os.getuid() == 0


if __name__ == "__main__":
    if not _check_root():
        sys.exit("This must be run as root!")

    debian.main()
