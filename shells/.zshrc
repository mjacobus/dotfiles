# export DISABLE_OMZ=true

source ~/.profile.d/setup.sh

# opencode
export PATH=/home/mjacobus/.opencode/bin:$PATH

# libvips compilado por ~/Projects/os/libvips.sh
export LD_LIBRARY_PATH=$HOME/.local/vips/lib${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}
