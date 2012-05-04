In order to merge in any changes from the upstream Email and Exchange packages
there is a patch.sh which will do almost all this automatically.  There is one manual
step to update the SecurityPolicy.java to disable device encryption, but its very simple,
its just replacing two methods.

Copy to Android/packages/apps
$ cd PellCorpEmail
$ patches/patch.sh
$ cd ../../../
$ source build/envsetups.sh
tapas PellCorpEmail PellCorpExchange
make

The apks are located:

	out/target/product/generic/system/app/PellCorpEmail.apk
	out/target/product/generic/system/app/PellCorpExchange.apk

Both must be installed to use Exchange accounts


