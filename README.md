# Build your own micropython firmware using docker


## Steps

1. 

```sh
docker run -it --rm -v {your micropython repo dir}:/root/micropython robbietree/esp32-build-docker:v0.0.1
```

2. Activating idf env

```sh
cd /root/esp-idf
source export.sh
```

3. build mpy-cross

```sh
cd /root/micropython/mpy-cross
CROSS_COMPILE='' make
```

4. build micropython

```sh
cd /root/micropython/ports/esp32
make submodule
make BOARD=GENERIC_C3
```

5. find the combined firmware bin

```sh
ls /root/micropython/ports/esp32/build-GENERIC_C3/firmware.bin
```

6. upload to board

```sh
esptool.py \
    --chip esp32c3 \
    --port /dev/cu.usbserial-1420 \
    --baud 460800 \
    write_flash --flash_size=detect -fm dio 0 firmware.bin
```

7. test board

## Others

you can refer readme from original [repo](https://github.com/tionebrr/docker-micropython-tools-esp32)