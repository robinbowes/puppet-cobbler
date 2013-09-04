#!/bin/bash 
 
# Assume this script runs from the root of the puppet dir 
puppetdir="$(pwd)" 
sudo puppet apply \
  --modulepath "$puppetdir"/modules \
  --hiera_config "$puppetdir"/hiera.yaml \
  "$puppetdir"/manifests/site.pp
