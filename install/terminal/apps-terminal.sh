sudo apt install -y \
	fzf \
	ripgrep \
	bat \
	eza \
	zoxide \
	plocate \
	btop \
	apache2-utils \
	fd-find \
	tldr \
	xsel \
	xclip \
	htop \
	build-essential \
	make \
	libssl-dev \
	zlib1g-dev \
	libbz2-dev \
	libreadline-dev \
	libsqlite3-dev \
	libffi-dev \
	libncursesw5-dev \
	libgdbm-dev \
	liblzma-dev \
	tk-dev \
	uuid-dev
sudo apt autoremove

# List of snaps to install (name → extra snap options)
declare -A snaps=(
	[slack]="--classic"
	[discord]=""
)

if ! command -v snap &>/dev/null; then
	echo "snap not found. Installing snapd…"
	sudo apt update
	sudo apt install -y snapd
	# enable the snapd socket (required on systemd systems)
	sudo systemctl enable --now snapd.socket
else
	echo "snap is already installed."
fi

for pkg in "${!snaps[@]}"; do
	if ! snap list "$pkg" &>/dev/null; then
		echo "Installing snap package: $pkg"
		sudo snap install "$pkg" ${snaps[$pkg]}
	else
		echo "snap package '$pkg' is already installed."
	fi
done

echo "Done."
