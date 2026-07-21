SUMMARY = "bitbake-layers recipe"
DESCRIPTION = "Recipe to modify the boundary image"
LICENSE = "MIT"

EXTRA_IMAGE_FEATURES += "debug-tweaks ssh-server-openssh"

IMAGE_FEATURES:append = " empty-root-password allow-empty-password"

# IMAGE_INSTALL:remove = "packagegroup-security-parsec"
# IMAGE_INSTALL:remove = "packagegroup-security-tpm2"
# IMAGE_INSTALL:remove = "docker"
# IMAGE_INSTALL:remove = "assimp imx-gpu-viv-demos packagegroup-fsl-tools-gpu"

MYPI_IMAGE_INSTALL = "\
  spitools \
  python3-spidev \
  cmake \
  python3-periphery \
  helloworld \
"

IMAGE_INSTALL += "\
  ${MYPI_IMAGE_INSTALL} \
"