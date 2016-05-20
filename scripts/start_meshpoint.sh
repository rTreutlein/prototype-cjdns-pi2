#!/bin/sh

# Shut down the wlan0 interface
sudo ifconfig wlan0 down

# Create mesh0 802.11s Mesh Point interface
sudo iw dev wlan0 interface add mesh0 type mp

# Bring up the mesh0 interface
sudo ifconfig mesh0 up

# Optionally assign IPv4 address to the mesh0 interface
# sudo ifconfig mesh0 192.168.X.Y

# Join the mesh network with radio in HT40+ htmode to enable 802.11n rates
sudo iw dev mesh0 mesh join tomesh freq 2412 HT40+

# Disable forwarding since we rely on cjdns to do routing and only uses Mesh Point as a point-to-point link
sudo iw dev mesh0 set mesh_param mesh_fwding=0