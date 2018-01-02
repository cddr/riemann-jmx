# riemann-jmx-clj

A Clojure clone of riemann-jmx.

## Building

Use `docker build -t cddr/riemann-jmx .` to build the standalone docker image

## Usage

By default, we read jmx configs from the directory `riemann-jmx` but you can
override this by overriding the docker `cmd`.

```
docker run --rm cddr/riemann-jmx
```

Supports composite mbeans as well, unlike the current riemann-jmx.

See riemann-jmx.yaml.example for an example of how to write a configuration file.

## Provision with Marathon

```
{
  "id": "basic-1",
  "cmd": "java -jar riemann-jmx.jar riemann-jmx/*.yaml",
  "cpus": 0.1,
  "mem": 10.0,
  "instances": 1,
  "uris": [
    "https://example.com/riemann-jmx.tar.gz"
  ]
}
```

## License

Copyright © 2018 Andy Chambers
Copyright © 2013-2015 Two Sigma

Distributed under the Eclipse Public License version 1.0
