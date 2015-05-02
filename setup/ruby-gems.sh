#!/bin/sh

gem install rubygems-update

update_rubygems
gem update
gem clean

# compass(sass)
gem install compass
