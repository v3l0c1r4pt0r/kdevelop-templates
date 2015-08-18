# kdevelop-templates
Few useful templates for kdevelop IDE

Overview
--------
Currently here are templates for
```
C/
  ESP8266 - project for ESP8266 platform with ready-to-use build script
LaTeX/
  article - simple LaTeX article
```
Usage
-----
To make proper template archives, just type ``make`` in parent project
directory.

To make them installed in kdevelop directories, type ``make install``. By
default prefix of installation path equals '~/.kde4'. If you want to install
them elsewhere set PREFIX environment variable ie. by invoking
``PREFIX=/usr make`` to install system-wide.

Licensing
---------
Templates are licensed under LGPLv3. You do not have to provide source code of
application using it.

References
----------
C/ESP8266 template's origin is
[this repository](https://github.com/v3l0c1r4pt0r/esp8266-template).
