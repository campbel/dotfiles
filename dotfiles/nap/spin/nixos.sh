# Make sure you are on a cluster that supports it
spin login --mode=cluster

# Create a new VM
spin up empty --vm --metadata 'os=nixos'
