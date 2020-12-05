# TastyConfig


## Edit current configuration

edit [Configuration.swift](Sources/TastyConfig/Configuration.swift)

## Generate config-feed using cli

#### Generate config

specify the desired config to produce

`swift run ConfigMaker production`

#### Specify output name
`swift run ConfigMaker -o my-config.json production`

#### Show help
`swift run ConfigMaker -h` or `--help`

## Generate and upload config-feed using Github Actions

- push a tag, e.g. `1.0.0`

This will take the config state at that tag, generate the feed and upload to s3, currently at https://s3.eu-central-1.amazonaws.com/lol.jonas.config/config-1.0.0.json

### Updating a feed

To update a published feed, push a new tag consisting of `existingTag` + `-something`.

As an example, to update `1.0.0`, push `1.0.0-updated`.

The Github Action is setup to truncate from `-` on and thus overwrite the previous file.


## TODO

- on overwrite, test encoding / decoding with previous tag, to make sure we don't break released apps.
