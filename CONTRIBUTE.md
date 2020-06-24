# Contributing

## Dockerfiles

Dockerfiles are seperated into chunks like this:

```dockerfile
# Common packages
RUN apt install -y \
    curl \
    unzip \
    wget
# @assert apt-has curl unzip wget
```

All *.dockerfile files will be merged before building an image.

## Testing

The above example shows that the build container
will be tested for the packages curl, unzip and wget to be installed.
After `# @assert ` you can use these functions:

* `apt-has ... ... ...`
   to assert that a package is installed
* `php-module ... ... ...`
  to check assert that a PHP module has been installed
  
Instead of doing this within the dockerfile you may want to
have a test.sh within the config directory,
which allows even better testing even when a config is removed.
When there is a test.sh in the config-dir,
then this will be used instead.