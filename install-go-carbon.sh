#!/bin/bash

apt-get install wget

wget https://github.com/lomik/go-carbon/releases/download/v0.7-beta4/go-carbon_0.7-beta4_amd64.deb 

dpkg -i go-carbon_0.7-beta4_amd64.deb
