# Create the tun device path if required
if [ ! -d /dev/net ]; then mkdir /dev/net; fi
if [ ! -e /dev/net/tun ]; then  mknod /dev/net/tun c 10 200; fi

# Wait 5s for the daemon to start and then run tailscale up to configure
/bin/sh -c "sleep 5; tailscale up --authkey=${TAILSCALE_AUTH}" &
exec /usr/bin/tailscaled --state=/tailscale/tailscaled.state
