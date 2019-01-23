USER_FOLDERS = bash git i3 pacman tmux top vim x11
SYSTEM_FOLDERS = conf

all: install $(shell hostname)-i

clean: uninstall $(shell hostname)-u

install:
	stow -d $(shell hostname) --ignore=.list -t ~ $(USER_FOLDERS)
	sudo stow -d $(shell hostname) -t / $(SYSTEM_FOLDERS)
	sudo systemctl enable suspend@$(shell whoami)

galileo-i: ;
kepler-i: ;

uninstall:
	stow -d $(shell hostname) -Dt ~ $(USER_FOLDERS)
	sudo stow -d $(shell hostname) -Dt / $(SYSTEM_FOLDERS)
	sudo systemctl disable suspend@$(shell whoami)

galileo-u: ;
kepler-u: ;

build:
	sudo pacman -Syu - < $(shell hostname)/pacman/PACKAGES.list
