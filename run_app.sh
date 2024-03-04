#!/bin/sh
sudo apt-get update
sudo apt-get install git
sudo apt-get install ruby-full

git clone https://github.com/Jonathanbez/simple_translator.git

cd simple_translator

bundle install

ruby simple_translate_app.rb
