echo Compilation started...

# Create document version with disclaimer
pandoc ../FIXDisclaimerTechStd.md FIXML.md -o "FIXML Technical Standard V1.1.docx" --reference-doc=../FIX_TechStd_Style_MASTER.docx --metadata-file=FIXML.yaml --toc --toc-depth=4
echo FIXML document version created

# Create base online version without disclaimer
pandoc FIXML.md -o FIXMLONLINE.html
# Create separate online versions for production and test website by including appropriate link prefixes
sed s/'img src="media\/'/'img src="https:\/\/www.fixtrading.org\/wp-content\/uploads\/2020\/01\/'/ FIXMLONLINE.html > FIXMLONLINE_PROD.html
sed s/'img src="media\/'/'img src="https:\/\/www.technical-fixprotocol.org\/wp-content\/uploads\/2020\/01\/'/ FIXMLONLINE.html > FIXMLONLINE_TEST.html
# Change remaining links to production website in test version to test website
sed -i '.bak' s/www.fixtrading.org/www.technical-fixprotocol.org/ FIXMLONLINE_TEST.html
echo FIXML ONLINE version created for PROD and TEST

echo Compilation ended!
