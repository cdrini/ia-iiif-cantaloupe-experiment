- This repo contains some Dockerfiles: https://github.com/MITLibraries/docker-cantaloupe


To run the containers:

```sh
docker-compose up -d
```

In the settings we'll need something like

```properties
HttpSource.BasicLookupStrategy.url_prefix = http://archive.org/download/
```

See e.g. https://ia903103.us.archive.org/view_archive.php?archive=/14/items/goodytwoshoes00newyiala/goodytwoshoes00newyiala_jp2.zip


http://archive.org/download/goodytwoshoes00newyiala%2Fgoodytwoshoes00newyiala_jp2.zip%2Fgoodytwoshoes00newyiala_jp2%2Fgoodytwoshoes00newyiala_0001.jp2


https://archive.org/download/learning-patterns/learning-patterns_jp2.zip/learning-patterns_jp2%2Flearning-patterns_0002.jp2

StaffPhotos%2F181015JimShelton.jpg

http://localhost:8182/iiif/2/goodytwoshoes00newyiala%2Fgoodytwoshoes00newyiala_jp2.zip%2Fgoodytwoshoes00newyiala_jp2%2Fgoodytwoshoes00newyiala_0001.jp2/full/390,/0/default.jpg


### Standup demo

- http://localhost:8182/iiif/2/goodytwoshoes00newyiala%2Fgoodytwoshoes00newyiala_jp2.zip%2Fgoodytwoshoes00newyiala_jp2%2Fgoodytwoshoes00newyiala_0001.jp2/full/390,/0/default.jpg
    - Note `%2F` is allowed in identifier
    - Note file system caching
    - Note how basic the setup is
    - Where to live
    - jp2 accept-range: bytes
- StaffPhotos%2F181015JimShelton.jpg
