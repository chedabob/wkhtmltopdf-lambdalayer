# wkhtmltopdf Lambda layer creator

Borrows from https://gist.github.com/InfeCtlll3/526bc5eee5b13046b2b2d37f40ccffaa and https://gist.github.com/paulsturgess/cfe1a59c7c03f1504c879d45787699f5

Since AmazonLinux2 became the OS of AWS Lambda, a large number of shared libraries were removed.

In order to get wkhtmltopdf to work, a layer needs to be assembled.

This Dockerfile starts with the `lambci/lambda:build-nodejs12.x` image which matches the AWS Lambda environment, installs all the shared libraries needed, and then copies them into a zip file with the wkhtmltopdf binary.

To assemble the layer, make sure you can execute docker commands, and then run `./run.sh`. This will build the docker image (and tag it as `wkhtmltopdf`), run it, and copy the layer zip file out of the running container via a volume.

It'll take a few minutes, and then leave a `wkhtmltopdf.zip` next to the Dockerfile.

This has only been tested on Mac OS, but should work on Linux. Windows (with and without WSL) may need  the `/tmp` path changing.