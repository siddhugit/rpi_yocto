RPI_EXTRA_CONFIG:append = " \n dtparam=spi=on \n"
RPI_EXTRA_CONFIG:append = " \n dtoverlay=spi0-2cs,cs0_pin=8,cs1_pin=7 \n"
RPI_EXTRA_CONFIG:append = " \n dtoverlay=spi1-1cs \n"
 
ENABLE_UART = "1"