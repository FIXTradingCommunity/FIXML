echo Compilation started...

pandoc ../FIXDisclaimerTechStdFINAL.md FIXML.md -o "FIXML Technical Standard V1.1.docx" --reference-doc=../FIX_TechStd_Style.docx --metadata-file=FIXML.yaml --toc --toc-depth=4

echo Compilation ended!
