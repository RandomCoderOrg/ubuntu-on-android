#!/usr/bin/env bash

h_dir=/root

echo -e
echo -e "Installing gl4es.. (This may take some time)"
echo -e

git clone https://github.com/RandomCoderOrg/gl4es-port ${h_dir}/gl4es-port

cd ${h_dir}/gl4es-port

mkdir build;cd build; cmkae -S ../../gl4es-port

make install

echo "export LD-LIBRARY-PATH=/lib/gl4es" >> ${h_dir}/.bashrc

echo
echo -e "Installing Done ... "
echo