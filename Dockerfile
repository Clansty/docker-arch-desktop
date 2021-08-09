FROM archlinux:latest

RUN echo 'Server = https://mirrors.bfsu.edu.cn/archlinux/$repo/os/$arch' > /etc/pacman.d/mirrorlist
RUN pacman -Sy --noconfirm tigervnc xfce4 xfce4-goodies noto-fonts-cjk noto-fonts noto-fonts-emoji adobe-source-han-sans-otc-fonts adobe-source-han-serif-otc-fonts
RUN printf "en_US.UTF-8 UTF-8\nzh_CN.UTF-8 UTF-8" > /etc/locale.gen
RUN locale-gen
RUN echo "LANG=zh_CN.UTF-8" > /etc/locale.conf
COPY entrypoint.sh /

CMD ["/entrypoint.sh"]
EXPOSE 5900

