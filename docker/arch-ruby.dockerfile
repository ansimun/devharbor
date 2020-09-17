FROM archlinux
RUN pacman -Syu --noconfirm
RUN pacman -S pacman-contrib ruby ruby-bundler freetds gcc make --noconfirm
RUN mkdir /usr/app
WORKDIR /usr/app
RUN paccache -rk0
