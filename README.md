# Build your own micropython firmware using docker


## Steps

1. Run the docker container

```sh
docker run -it --rm -v {your micropython repo dir}:/root/micropython robbietree/esp32-build-docker:0.0.1
```

2. build mpy-cross

```sh
cd /root/micropython/mpy-cross
CROSS_COMPILE='' make
```

3. build micropython

```sh
cd /root/micropython/ports/esp32
make submodules
make BOARD=GENERIC_C3 clean # clean if built before
make BOARD=GENERIC_C3
```

4. find the combined firmware bin

```sh
ls /root/micropython/ports/esp32/build-GENERIC_C3/firmware.bin
```

![build-success](https://raw.githubusercontent.com/unseel/docker-micropython-tools-esp32/master/build-success.png)

5. upload to board

```sh
esptool.py \
    --chip esp32c3 \
    --port /dev/cu.usbserial-1420 \
    --baud 460800 \
    write_flash --flash_size=detect -fm dio 0 firmware.bin
```

6. test board

## Others

You can refer readme from original [repo](https://github.com/tionebrr/docker-micropython-tools-esp32)