#!/bin/bash

# This script must be run in the directory where you want the generated output to be.
# This should not be the directory of the GitHub clone as the repository should not contain generated content.
TARGET="$PWD"

echo Compilation started...
LOCAL="<INSERT YOUR LOCAL PATH TO THE GITHUB CLONE DIRECTORY HERE>"
ROOT="$LOCAL/GitHub/FIXML/FIXML 1.1"
# There is only one disclaimer and style docx file for all FIX Technical Standards and it is stored with teh FIX Session Layer
DISCLAIMER="$LOCAL/GitHub/fix-session-layer-standards/FIXDisclaimerTechStd.md"
STYLE="$LOCAL/GitHub/fix-session-layer-standards/FIX_TechStd_Style_MASTER.docx"
SOURCE="$ROOT"
YAML="$SOURCE/FIXML.yaml"
FILES="FIXML.md"
WPFOLDER="wp-content\/uploads\/2020\/03"

cd "$SOURCE"

# Create document version with disclaimer
pandoc "$DISCLAIMER" $FILES -o "$TARGET/FIXML Technical Standard V1.1.docx" --reference-doc="$STYLE" --metadata-file="$YAML" --toc --toc-depth=4
echo FIXML document version created

# Create base online version without disclaimer
pandoc $FILES -o "$TARGET/FIXMLONLINE.html"

# Switch back to target directory for changing content of generated output with SED utility
cd "$TARGET"

# Create separate online versions for production and test website by including appropriate link prefixes
sed s/'img src="media\/'/'img src="https:\/\/www.fixtrading.org\/$WPFOLDER\/'/g FIXMLONLINE.html > FIXMLONLINE_PROD.html
sed s/'img src="media\/'/'img src="https:\/\/www.technical-fixprotocol.org\/$WPFOLDER\/'/g FIXMLONLINE.html > FIXMLONLINE_TEST.html

# Change remaining links to production website in test version to test website
sed -i '.bak' s/www.fixtrading.org/www.technical-fixprotocol.org/ FIXMLONLINE_TEST.html
echo FIXML ONLINE version created for PROD and TEST

echo Compilation ended!
