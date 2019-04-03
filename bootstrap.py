import sys

from software import debian, utils


if __name__ == "__main__":
    if not utils.check_root():
        sys.exit("This must be run as root!")

    debian.main()
