FROM ubuntu:16.04
MAINTAINER ChingChang Li <xu354cjo1008@gmail.com>
#RUN useradd -m chingchangli
#USER chingchangli
WORKDIR root/working
RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get install -y build-essential autoconf libtool pkg-config python-opengl python-imaging python-pyrex python-pyside.qtopengl idle-python2.7 qt4-dev-tools qt4-designer libqtgui4 libqtcore4 libqt4-xml libqt4-test libqt4-script libqt4-network libqt4-dbus python-qt4 python-qt4-gl libgle3 python-dev libpcre3-dev zlib1g-dev
RUN apt-get install -y git wget curl python cmake clang
RUN apt-get install -y vim-gnome cscope
RUN git clone https://github.com/xu354cjo1008/vim-env.git && cd vim-env && sh setup.sh
RUN apt-get install -y zsh && chsh -s /bin/zsh && wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true
RUN wget https://storage.googleapis.com/golang/go1.7.3.linux-amd64.tar.gz && tar -C /usr/local -xzf go1.7.3.linux-amd64.tar.gz
ENV PATH $PATH:/usr/local/go/bin
