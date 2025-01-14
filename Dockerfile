FROM fedora:42 AS build

ENV TERM=xterm

RUN set -ex \
	&& dnf update -y \
	&& dnf install -y \
	docker \
	dumb-init \
	fd \
	fzf \
	gcc \
	make \
	patch \
	zlib-devel \
	bzip2 \
	bzip2-devel \
	readline-devel \
	sqlite \
	sqlite-devel \
	openssl-devel \
	tk-devel \
	libffi-devel \
	xz-devel \
	git \
	neovim \
	procps-ng \
	python \
	python-pip \
	ripgrep \
	socat \
	tmux \
	zsh \
	&& curl -LO https://github.com/starship/starship/releases/download/v1.22.1/starship-aarch64-unknown-linux-musl.tar.gz \
	&& tar xzf *.tar.gz \
	&& mv starship /usr/bin \
	&& rm -rf *.tar.gz \
	&& echo "%wheel  ALL=(ALL)       NOPASSWD: ALL" > /etc/sudoers.d/0-wheel

RUN set -ex \
	&& groupadd -g 501 tiemo \
	&& useradd -u 501 -g 501 -s /bin/zsh -G wheel,docker tiemo \
	&& ln -sf /home /Users

WORKDIR /home/tiemo

ADD --chown=tiemo:tiemo .config .config
ADD --chown=tiemo:tiemo .git .git
ADD --chown=tiemo:tiemo .local .local
ADD --chown=tiemo:tiemo .ssh .ssh
ADD --chown=tiemo:tiemo .zshenv .zshenv

ADD docker-entrypoint.sh /



FROM build AS run

USER tiemo

RUN set -ex \
	&& nvim --headless +q

ENTRYPOINT ["dumb-init"]
CMD ["/docker-entrypoint.sh"]
