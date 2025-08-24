# dietpi-scripts

Installation scripts for DietPi.

Steps:

1. Use Raspberry Pi Imager to flash DietPi to SD card.

1. If you plan to use wi-fi:
    * edit `dietpi.txt` and set `AUTO_SETUP_NET_WIFI_ENABLED` to 1
    * edit `dietpi-wifi.txt` and set `aWIFI_SSID[0]` to network name
    * edit `dietpi-wifi.txt` and set `aWIFI_KEY[0]` to password

1. Boot and SSH to it as root with password dietpi.

1. Install Git and clone this repo:
    ```bash
    dietpi-software install 17 && mkdir git && cd git && git clone https://github.com/sudoshmudo/dietpi-scripts.git
    ```

1. Run `select` script:
    ```
    cd dietpi-scripts && chmod +x select.sh && ./select.sh
    ```

1. Audio settings (reboot needed)
    * dietpi-config > Audio Options > usb-dac

1. LED settings:
    * dietpi-config > Display Options > LED Control > set all to None
