cd /home/developer/Development/Android/packages/apps

rm -rf PellCorpEmail/src
rm -rf PellCorpEmail/emailcommon/src
rm -rf PellCorpEmail/res
rm -rf PellCorpExchange/src
rm -rf PellCorpExchange/res

cp -r Email/src PellCorpEmail
cp -r Email/res PellCorpEmail
cp -r Email/emailcommon/src PellCorpEmail/emailcommon
cp Email/* PellCorpEmail

cp -r Exchange/src PellCorpExchange
cp -r Exchange/res PellCorpExchange
cp Exchange/* PellCorpExchange

cp -r PellCorpEmail/patches/res PellCorpEmail
cp -r PellCorpExchange/patches/res PellCorpExchange

mv PellCorpEmail/src/com/android PellCorpEmail/src/com/pellcorp
mv PellCorpEmail/emailcommon/src/com/android PellCorpEmail/emailcommon/src/com/pellcorp
mv PellCorpExchange/src/com/android PellCorpExchange/src/com/pellcorp

find PellCorpEmail/ -name "*.java" -exec perl -pi -e 's/com\.android\.email/com\.pellcorp\.email/g' {} \;
find PellCorpEmail/ -name "*.aidl" -exec perl -pi -e 's/com\.android\.email/com\.pellcorp\.email/g' {} \;
find PellCorpEmail/ -name "*.java" -exec perl -pi -e 's/com\.android\.exchange/com\.pellcorp\.exchange/g' {} \;
find PellCorpEmail/ -name "*.aidl" -exec perl -pi -e 's/com\.android\.exchange/com\.pellcorp\.exchange/g' {} \;
find PellCorpEmail/ -name "*.xml" -exec perl -pi -e 's/com\.android\.email/com\.pellcorp\.email/g' {} \;
find PellCorpEmail/ -name "*.xml" -exec perl -pi -e 's/com\.android\.exchange/com\.pellcorp\.exchange/g' {} \;

find PellCorpEmail/ -name "*.mk" -exec perl -pi -e 's/com\.android\.email/com\.pellcorp\.email/g' {} \;
find PellCorpEmail/ -name "*.mk" -exec perl -pi -e 's/src\/com\/android\/email/src\/com\/pellcorp\/email/g' {} \;
find PellCorpEmail/ -name "*.mk" -exec perl -pi -e 's/\/Email_/\/PellCorpEmail_/g' {} \;
find PellCorpEmail/ -name "*.mk" -exec perl -pi -e 's/\/Email\*/\/PellCorpEmail\*/g' {} \;
find PellCorpEmail/ -name "*.mk" -exec perl -pi -e 's/= Email/= PellCorpEmail/g' {} \;
find PellCorpEmail/ -name "*.mk" -exec perl -pi -e 's/\/Exchange_/\/PellCorpExchange_/g' {} \;
find PellCorpEmail/ -name "*.mk" -exec perl -pi -e 's/\/Exchange\*/\/PellCorpExchange\*/g' {} \;
perl -pi -e 's/com\.android\.email/com\.pellcorp\.email/g' PellCorpEmail/proguard.flags
perl -pi -e 's/>Email</>PellCorp Email</g' PellCorpEmail/res/values/strings.xml

find PellCorpExchange/ -name "*.java" -exec perl -pi -e 's/com\.android\.exchange/com\.pellcorp\.exchange/g' {} \;
find PellCorpExchange/ -name "*.java" -exec perl -pi -e 's/com\.android\.email/com\.pellcorp\.email/g' {} \;
find PellCorpExchange/ -name "*.aidl" -exec perl -pi -e 's/com\.android\.exchange/com\.pellcorp\.exchange/g' {} \;
find PellCorpExchange/ -name "*.aidl" -exec perl -pi -e 's/com\.android\.email/com\.pellcorp\.email/g' {} \;
find PellCorpExchange/ -name "*.xml" -exec perl -pi -e 's/com\.android\.exchange/com\.pellcorp\.exchange/g' {} \;
find PellCorpExchange/ -name "*.xml" -exec perl -pi -e 's/com\.android\.email/com\.pellcorp\.email/g' {} \;
find PellCorpExchange/ -name "*.mk" -exec perl -pi -e 's/com\.android\.exchange/com\.pellcorp\.exchange/g' {} \;
find PellCorpExchange/ -name "*.mk" -exec perl -pi -e 's/src\/com\/android\/exchange/src\/com\/pellcorp\/exchange/g' {} \;
find PellCorpExchange/ -name "*.mk" -exec perl -pi -e 's/com\.android\.email/com\.pellcorp\.email/g' {} \;
find PellCorpExchange/ -name "*.mk" -exec perl -pi -e 's/src\/com\/android\/email/src\/com\/pellcorp\/email/g' {} \;
find PellCorpExchange/ -name "*.mk" -exec perl -pi -e 's/\/Exchange_/\/PellCorpExchange_/g' {} \;
find PellCorpExchange/ -name "*.mk" -exec perl -pi -e 's/\/Exchange\*/\/PellCorpExchange\*/g' {} \;
find PellCorpExchange/ -name "*.mk" -exec perl -pi -e 's/= Exchange/= PellCorpExchange/g' {} \;

perl -pi -e 's/com\.android\.exchange/com\.pellcorp\.exchange/g' PellCorpExchange/proguard.flags
perl -pi -e 's/>Exchange Services</>PellCorp Exchange Services</g' PellCorpExchange/res/values/strings.xml

# Now we need to patch the src/com/pellcorp/email/SecurityPolicy.java to remove the requirement to encrypt

# use our own cert
echo "LOCAL_CERTIFICATE := vendor/pellcorp/certs/pellcorpemail" >> PellCorpEmail/Android.mk
echo "LOCAL_CERTIFICATE := vendor/pellcorp/certs/pellcorpemail" >> PellCorpExchange/Android.mk

echo "Manually modify the PellCorpEmail/src/com/pellcorp/email/SecurityPolicy.java ..."
cat PellCorpEmail/patches/com_pellcorp_email_SecurityPolicy.java.patch




