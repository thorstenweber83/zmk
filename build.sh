#!/usr/bin/env sh

west init -l app
west update
west config --global zephyr.base-prefer configfile
west zephyr-export
west build -s app -p -b nice_nano -- -DSHIELD=kyria_left -DZMK_CONFIG=/workspaces/zmk-config/config
mv build/zephyr/zmk.uf2 kyria_left.uf2
west build -s app -p -b nice_nano -- -DSHIELD=kyria_right -DZMK_CONFIG=/workspaces/zmk-config/config
mv build/zephyr/zmk.uf2 kyria_right.uf2