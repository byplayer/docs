#!/bin/bash
GEM_VER=1.3.5

# install rubygems
RUBY_HOME=/usr/local/ruby
export PATH=${RUBY_HOME}/bin:$PATH

cd /usr/local/src

if [ ! -f rubygems-${GEM_VER}.tgz ];
then
  wget http://rubyforge.org/frs/download.php/60718/rubygems-${GEM_VER}.tgz
fi

tar xzf rubygems-${GEM_VER}.tgz
cd rubygems-${GEM_VER}
ruby setup.rb
