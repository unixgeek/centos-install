#!/bin/sh
#
# Very primitive script to remove rpms not found in the manifest file.
#

WORK=$(mktemp -d)

rpm -q -a --qf '%{name}\n' | sort | uniq > ${WORK}/installed || exit 1

# determine what to remove and do a test uninstall
diff -u ${WORK}/installed manifest | grep '^-\w' | sed 's/^-//' > ${WORK}/to_delete
rpm -e --test --allmatches $(cat ${WORK}/to_delete) || exit 1

# do the uninstall and cleanup
rpm -e --noscripts --allmatches $(cat ${WORK}/to_delete)
find / -name "*.rpmsave" -print -exec rm -f {} \;
rm -fr ${WORK}

