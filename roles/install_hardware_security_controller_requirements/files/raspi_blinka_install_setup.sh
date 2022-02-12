#!/bin/bash

# enable i2c
sudo raspi-config nonint do_i2c 0

# disable raspi-config at boot
sudo raspi-config nonint disable_raspi_config_at_boot 0