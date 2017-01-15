FROM ubuntu:16.04
MAINTAINER ChingChang Li <xu354cjo1008@gmail.com>
# Set the locale
RUN locale-gen en_US.UTF-8
# packages
RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get install -y build-essential autoconf libtool pkg-config python-opengl python-imaging python-pyrex python-pyside.qtopengl idle-python2.7 qt4-dev-tools qt4-designer libqtgui4 libqtcore4 libqt4-xml libqt4-test libqt4-script libqt4-network libqt4-dbus python-qt4 python-qt4-gl libgle3 python-dev libpcre3-dev zlib1g-dev
RUN apt-get install -y git wget curl python cmake clang
# Setup develop editor
RUN apt-get install -y vim-gnome cscope exuberant-ctags
# Use zsh and oh-my-zsh
RUN apt-get install -y zsh
# Install go
RUN wget https://storage.googleapis.com/golang/go1.7.3.linux-amd64.tar.gz && tar -C /usr/local -xzf go1.7.3.linux-amd64.tar.gz

RUN useradd -ms /bin/zsh chingchangli
USER chingchangli
WORKDIR /home/chingchangli
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true
ENV PATH $PATH:/usr/local/go/bin
RUN git clone https://github.com/xu354cjo1008/vim-env.git && cd vim-env && sh setup.sh

RUN echo "alias ls='ls --color=auto'" >> ~/.zshrc
RUN echo "alias grep='grep --color=auto'" >> ~/.zshrc
RUN echo "alias fgrep='fgrep --color=auto'" >> ~/.zshrc
RUN echo "alias egrep='egrep --color=auto'" >> ~/.zshrc
RUN echo "alias ll='ls -alF'" >> ~/.zshrc
RUN echo "alias la='ls -A'" >> ~/.zshrc
RUN echo "alias l='ls -CF'" >> ~/.zshrc
