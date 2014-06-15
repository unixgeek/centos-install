#!/bin/sh
#
# Very primitive script to install rpms in the manifest file.
#

WORK=$(mktemp -d)

rpm -q -a --qf '%{name}\n' | sort | uniq > ${WORK}/installed || exit 1

# determine what to install
diff -u ${WORK}/installed manifest | grep '^+\w' | sed 's/^+//' > ${WORK}/to_install
yum install -y $(cat ${WORK}/to_install) || exit 1

rm -fr ${WORK}
