#!/bin/bash

set -e

echo " "
echo " ************************************************************ "
echo " ***                                                      *** "
echo " ***                INSTALLING GEM TOOLS                  *** "
echo " ***                                                      *** "
echo " ************************************************************ "
echo " "

echo " * Installing compass..."
gem install compass --pre
echo " "

echo " * Installing UI packages..."
gem install \
  susy \
  addressable \
  css_parser \
  hpricot \
  htmlentities \
  premailer \
  bundler \
  hologram

echo " "
echo " ************************************************************ "
echo " ***                                                      *** "
echo " ***          GEM TOOLS INSTALLATION COMPLETE             *** "
echo " ***                                                      *** "
echo " ************************************************************ "
echo " "
