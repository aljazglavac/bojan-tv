xhost +SI:localuser:root >> '/home/pi/Documents/env.log' 2>&1
export XAUTHORITY=~/.Xauthority
export DISPLAY=:0.0
echo "envs set" >> '/home/pi/Documents/env.log' 2>&1
