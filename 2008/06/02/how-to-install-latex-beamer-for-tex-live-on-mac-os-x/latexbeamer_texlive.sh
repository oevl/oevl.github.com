#!/bin/bash
#
# Install LaTeX Beamer for TeX Live 
# 
# Arthur Koziel
# arthurkoziel.com

BEAMER_URL=http://surfnet.dl.sourceforge.net/sourceforge/latex-beamer/latex-beamer-3.07.tar.gz
XCOLOR_URL=http://mesh.dl.sourceforge.net/sourceforge/latex-beamer/xcolor-2.00.tar.gz
PGF_URL=http://switch.dl.sourceforge.net/sourceforge/latex-beamer/pgf-1.01.tar.gz

INSTALL_DIR=/opt/local/share/texmf/tex/latex

###############################################################################

echo "* Downloading files"
wget $BEAMER_URL $XCOLOR_URL $PGF_URL

echo "* Extracting files"
tar xvzf latex-beamer-3.07.tar.gz
tar xzvf xcolor-2.00.tar.gz
tar xvzf pgf-1.01.tar.gz

echo "* Creating directories in $INSTALL_DIR"
sudo mkdir -p /opt/local/share/texmf/tex/latex/{beamer,pgf,xcolor}

echo "* Moving files"
sudo mv latex-beamer-3.07/* /opt/local/share/texmf/tex/latex/beamer/
sudo mv pgf-1.01/* /opt/local/share/texmf/tex/latex/pgf/
sudo mv xcolor/* /opt/local/share/texmf/tex/latex/xcolor/

echo "* Cleaning up"
rm xcolor-2.00.tar.gz && rmdir xcolor
rm latex-beamer-3.07.tar.gz && rmdir latex-beamer-3.07
rm pgf-1.01.tar.gz && rmdir pgf-1.01

echo "* Rebuilding ls-R database"
sudo texhash