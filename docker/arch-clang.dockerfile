FROM archlinux
RUN pacman -Syy --noconfirm
RUN pacman -S pacman-contrib glibc clang --noconfirm
RUN mkdir /usr/app
WORKDIR /usr/app
RUN paccache -rk0
