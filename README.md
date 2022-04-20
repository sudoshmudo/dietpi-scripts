# dietpi-scripts

Installation scripts for DietPi.

Steps:

1. Use balenaEtcher to flash DietPi to SD card.

2. Boot and SSH to it as root with password dietpi.

3. Install Git and clone this repo
```bash
dietpi-software install 17 && mkdir git && cd git && git clone https://github.com/sudoshmudo/dietpi-scripts.git
```

4. Run `select` script:
```
cd dietpi-scripts && chmod +x select.sh && ./select.sh
```

5. Audio settings (reboot needed)
* dietpi-config > Audio Options > usb-dac

6. LED settings:
* dietpi-config > Display Options > LED Control > set all to None
