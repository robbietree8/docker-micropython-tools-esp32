cd /root/micropython/mpy-cross
CROSS_COMPILE='' make

cd /root/micropython/ports/esp32
make submodules
make BOARD=GENERIC_C3 clean
make -j 8 BOARD=GENERIC_C3
