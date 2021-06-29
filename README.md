# Video Everything

Repository with minimal samples for playing HLS/DASH-CMAF video, across as many platforms as possible.

## Content and License

All test content in this repository was derived from the [Netflix Open Source Content Platform](https://opencontent.netflix.com/) which is licensed under the [Creative Commons Attribution 4.0 International Public License](https://www.google.com/url?q=https%3A%2F%2Fcreativecommons.org%2Flicenses%2Fby%2F4.0%2Flegalcode&sa=D&sntz=1&usg=AFQjCNFm6hmkXeNuPlc9AohLWBxgxp3BCw)

Currently the following titles exist as test media:
* [Sol Levante](https://opencontent.netflix.com/#h.yk08awhc210g)

## Content Preparation

If you would like to prepare and use your own piece of media, the following section will walk you through the steps to properly encode and package sample content which can be played using the samples configured in this repo. Once packaged the content can be placed in the `.content/public` directory.

> TODO

## Setup

Ensure you have:
* Node/NPM
* Web Browsers
* Android Studio
* Xcode

Optional things:
* Physical devices

## Hosting Content

You can point the samples at any content, but to get things off the ground this repo contains a sample encoded HLS/DASH-CMAF playlist with a single bitrate variation located in the `.content` directory.

Before moving on to each platform, pop into that directory and run:

```sh
npm install
npm start
```

## Samples

### Web, Mobile Web

Inside of the `/web` directory:

```sh
npm install
npm start
```

Then navigate to the individual pages. Note that the `html5` sample will only work in Safari, or any browser that natively supports HLS and fMP4 (Fragmented MP4).

Samples available:

* [Native HTML5](https://developer.apple.com/library/archive/documentation/AudioVideo/Conceptual/Using_HTML5_Audio_Video/AudioandVideoTagBasics/AudioandVideoTagBasics.html#//apple_ref/doc/uid/TP40009523-CH2-SW1)
* [Hls.js](https://github.com/video-dev/hls.js)
* [Video.js](https://videojs.com/getting-started/)

### Android, Android TV, FireTV

Inside of the `/android` and `/androidtv-firetv` directories respectively, open Android Studio to the root `build.gradle` files. Build and run the apps on your device of choice.

Samples available:

* [ExoPlayer](https://exoplayer.dev/hello-world.html)
### iOS, tvOS, macOS

Inside of the `/ios-tvos-macos` directory, open Xcode to the project files. Build and run the apps on your device of choice, across the build targets.

Samples available:
* [AVPlayer](https://developer.apple.com/library/archive/documentation/AudioVideo/Conceptual/MediaPlaybackGuide/Contents/Resources/en.lproj/GettingStarted/GettingStarted.html)

### Roku

> TODO

### Tizen

> TODO

### WebOS

> TODO

### Chromecast

> TODO

### PlayStation

> TODO

### XBox

> TODO
