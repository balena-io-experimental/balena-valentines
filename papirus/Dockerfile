FROM balenalib/raspberry-pi-debian-python:3.7-buster-build

RUN install_packages \
      bc \
      fonts-freefont-ttf \
      libfuse-dev \
      libraspberrypi-dev \
      python3-dateutil \
      python3-pil \
      python3-rpi.gpio \
      python3-smbus
      
WORKDIR /usr/app

RUN git clone https://github.com/PiSupply/PaPiRus.git
WORKDIR /usr/app/PaPiRus

RUN python setup.py install
COPY *.png /usr/app/
COPY start.sh /usr/app/

RUN mkdir /tmp/papirus
WORKDIR /tmp/papirus
RUN git clone https://github.com/repaper/gratis.git
WORKDIR /tmp/papirus/gratis
RUN make rpi EPD_IO=epd_io.h PANEL_VERSION='V231_G2'
RUN make rpi-install EPD_IO=epd_io.h PANEL_VERSION='V231_G2'

CMD ["/bin/bash","/usr/app/start.sh"]