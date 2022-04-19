# dietpi-scripts

Installation scripts for DietPi.

Steps:

1. Use balenaEtcher to flash DietPi to SD card.

2. Boot and SSH to it as root with password dietpi.

3. Install Git and clone this repo
```bash
dietpi-software install 17 && cd $HOME && mkdir git && cd git && git clone ssh://git@github.com/sudoshmudo/dietpi-scripts.git
```

4. Run `_select` script:
```
cd $HOME/git/dietpi-scripts && chmod +x _select.sh && ./_select.sh
```
