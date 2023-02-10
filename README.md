An experimental repo that uses cantaloupe as a standalone IIIF server ontop of Internet Archive files.

### The Demo

To run the containers:

```sh
docker-compose up -d
```

And now hit any image! For example, given a URL like: https://archive.org/download/goodytwoshoes00newyiala/goodytwoshoes00newyiala_jp2.zip/goodytwoshoes00newyiala_jp2/goodytwoshoes00newyiala_0001.jp2 , you can get it via cantaloupe using:

- At 390w: http://localhost:8182/iiif/2/goodytwoshoes00newyiala%2Fgoodytwoshoes00newyiala_jp2.zip%2Fgoodytwoshoes00newyiala_jp2%2Fgoodytwoshoes00newyiala_0001.jp2/full/390,/0/default.jpg

### How it works

In the settings, all we needed was to change the `HttpSource.BasicLookupStrategy.url_prefix` to point to the Internet Archive.

```properties
HttpSource.BasicLookupStrategy.url_prefix = http://archive.org/download/
```

Cantaloupe has a number of options for caching, but we are using the file system cache. Redis is also an option.

### References

This repo contains some Dockerfiles for setting up cantaloupe: https://github.com/MITLibraries/docker-cantaloupe
