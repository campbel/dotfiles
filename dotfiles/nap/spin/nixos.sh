# Make sure you are on a cluster that supports it
spin login --mode=cluster

# Create a new VM
spin up --vm -m vm_disk_image=nixos-image-22-11 -m os=nixos empty
