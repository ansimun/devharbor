FROM archlinux
RUN pacman -Syy --noconfirm
RUN pacman -S pacman-contrib ruby ruby-bundler freetds gcc make --noconfirm
RUN mkdir /usr/app
WORKDIR /usr/app
RUN paccache -rk0
