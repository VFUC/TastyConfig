# TastyConfig

### What is this?
This is a template repository for a "Swift package based app configuration feed". 
It contains
    - a Swift Package declaring a configuration struct, which an app can include as dependency
    - a Swift CLI which can generate a JSON-feed from the current configuration
    - GitHub Actions configured so that new feeds are generated when a tagged configuration is pushed, tests to ensure we don't publish incompatible feed updates

### Why would I want this?
By using the same Codable struct for encoding and decoding, we try to avoid accidentally publishing a feed our app can't parse.

### What do the Github Actions do?
- When pushing a tagged version of the configuration, it generates and uploads a JSON-encoded feed
- If an updated version of a tag is pushed (e.g. `1.0.0-updated`), it checks out the original tag (e.g. `1.0.0`) and runs its unit tests against the new feed. Since the client app should be using the original tag, this ensures that the new feed is still decodable by the app.
- Currenly uploads the configuration to S3, which can of course be replaced by any file handling of choice

## How to use this approach

The idea is that this configuration repository is maintained **alongside the app release**, so a tagged version of this package should resemble the state of the app during this release.

So `MyApp Version 1.0.0` would tell SwiftPM to use this package in the version `1.0.0`, the next release might then be `1.1.0` and the configuration package would be tagged and updated to match. 

Further updates to the configuration are tagged with the app version as a prefix (e.g. `1.0.0-updated`) and are always checked against the original tag.

## How to edit the current configuration
edit [Configuration.swift](Sources/TastyConfig/Configuration.swift)

## How to generate a config feed using the CLI

#### Generate config

specify the desired config to produce, as defined in `Configuration.swift`:

`swift run ConfigMaker production`

#### Specify output name
`swift run ConfigMaker -o my-config.json production`

#### Show help
`swift run ConfigMaker -h` or `--help`

## How to generate and upload config feed using Github Actions

- push a tag, e.g. `1.0.0`

This will take the config state at that tag, generate the feed and upload to s3, currently at https://s3.eu-central-1.amazonaws.com/lol.jonas.config/config-1.0.0.json

### Updating an existing feed

#### App is not released yet
If the app is not released yet and the configuration is changed, we want the app to fetch this new configuration.

- delete the existing tag (e.g. `1.0.0`)
- add new tag (`1.0.0`) for current configuration
- in app's Xcode project: Reset package caches, so that the package is fetched again.

#### App is already released

To update a published feed, edit the configuration and push a new tag consisting of `existingTag` + `-something` to indicate this is an updated version of a previously published feed.

As an example, to update `1.0.0`, push `1.0.0-updated`.

The Github Action is setup to truncate the tag from `-` on and thus overwrite the previous file.
