#!/bin/bash
#
# #************************************************#
# #            Install Django with Git             #
# #           written by Arthur Koziel             #
# #                April 27, 2008                  #
# #************************************************#
#

E_BADARGS=1  # Wrong number of arguments passed to script.
E_BADDIR=2   # Target directory is invalid.
E_CMD=3      # Git is not installed.

REPO="git://spinlock.ch/pub/git/django/django.git"
CHECKOUT_DIR="django.git"

site_packages_dir=`python -c "from distutils.sysconfig import get_python_lib; \
print get_python_lib()"`

###############################################################

# Check for git.
if [ -z "$(which git-clone)" ]; then
	echo "You must have Git installed to use this script."
	exit $E_CMD;
fi

# Print usage.
if [ $# -ne 1 ]
then
    echo "Usage: `basename $0` target-directory"
    exit $E_BADARGS
fi

# Test if target directory exists.
if [ ! -d "$1" ]
then
    echo "$1 is not a directory."
    exit $E_BADDIR
fi

installdir=$1/$CHECKOUT_DIR

###############################################################

echo "> Cloning git repository to $installdir"
git-clone $REPO $installdir

echo "> Creating symbolic link from $site_packages_dir/django to \
$installdir/django"
ln -s $installdir/django $site_packages_dir/django

echo "> Creating symbolic link from /usr/bin/django-admin.py to \
$installdir/django/bin/django-admin.py"
ln -s $installdir/django/bin/django-admin.py /usr/bin

exit 0