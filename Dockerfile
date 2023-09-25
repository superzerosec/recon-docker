# Base image
FROM kalilinux/kali-rolling:latest
USER root


# Label
LABEL maintainer="superzerosec" \
	github="https://github.com/superzerosec/"


# Preparing image
ENV HOME /root
WORKDIR $HOME/app
ENV GOROOT $HOME/.go
ENV GOPATH $HOME/go
ENV PATH $PATH:$GOROOT/bin:$GOPATH/bin:$HOME/.pdtm/go/bin
ENV TOOLSPATH $HOME/tools
ENV TERM xterm-256color
ENV SHELL /bin/zsh
RUN mkdir -p $TOOLSPATH \
	&& mkdir -p $HOME/.gf


# Installing base tools
RUN apt-get update \
	&& apt-get install -y curl tcpdump host whois dnsutils iputils-ping jq htop wget libpcap-dev git python3-pip zsh tmux vim


# Configuring profile
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/superzerosec/profile/master/zsh-profile/oh-my-zsh-install-custom.sh)" "" --unattended \
	&& wget https://raw.githubusercontent.com/superzerosec/profile/master/tmux-profile/tmux.conf -O $HOME/.tmux.conf \
  && curl -sLf https://spacevim.org/install.sh | bash; mkdir ~/.SpaceVim.d; wget https://raw.githubusercontent.com/superzerosec/profile/master/spacevim-profile/init.toml -O ~/.SpaceVim.d/init.toml; mkdir -p ~/.vim/pack/tpope/start; cd ~/.vim/pack/tpope/start; git clone https://tpope.io/vim/commentary.git; vim -u NONE -c "helptags commentary/doc" -c q \
  && echo "export PATH=\$PATH:/root/.pdtm/go/bin" >> /root/.zshrc \
	&& touch $HOME/.hushlogin


# Installing recon tools via apt
RUN apt-get install -y amass theharvester \
	&& wget https://git.io/go-installer.sh -O /tmp/go-installer.sh && bash /tmp/go-installer.sh


# Removing unused tools
RUN apt-get remove -y python3-httpx \
	&& apt autoremove -y


# Installing projectdiscovery tools
RUN go install -v github.com/projectdiscovery/pdtm/cmd/pdtm@latest \
	&& pdtm -install-all


# Installing other tools
RUN go install github.com/tomnomnom/waybackurls@latest \
	&& go install github.com/tomnomnom/assetfinder@latest \
	&& go install github.com/tomnomnom/anew@latest\
	&& go install github.com/tomnomnom/gf@latest \
	&& go install github.com/tomnomnom/qsreplace@latest \
	&& go install github.com/hakluke/hakrawler@latest \
	&& go install github.com/lc/gau/v2/cmd/gau@latest \
	&& go install github.com/dwisiswant0/unew@latest


# Installing gf pattern
RUN git clone https://github.com/1ndianl33t/Gf-Patterns $TOOLSPATH/Gf-Patterns \
	&& git clone https://github.com/tomnomnom/gf $TOOLSPATH/gf \
	&& cp $TOOLSPATH/gf/examples/* ~/.gf \
	&& cp $TOOLSPATH/Gf-Patterns/*.json ~/.gf


# Clearing cache
RUN rm -rf /var/lib/apt/list/*


# Entry point
CMD ["/bin/zsh"]

