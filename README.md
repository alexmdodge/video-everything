# Video Everything

Repository with minimal samples for playing HLS/DASH-CMAF video, across as many platforms as possible.

## Content and License

All test content in this repository was derived from the [Netflix Open Source Content Platform](https://opencontent.netflix.com/) and is license under the [Creative Commons Attribution 4.0 International Public License](https://www.google.com/url?q=https%3A%2F%2Fcreativecommons.org%2Flicenses%2Fby%2F4.0%2Flegalcode&sa=D&sntz=1&usg=AFQjCNFm6hmkXeNuPlc9AohLWBxgxp3BCw)

Currently the following titles exist as test media:
* [Sol Levante](https://opencontent.netflix.com/#h.yk08awhc210g)

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

* Native HTML5
* Hls.js
* Video.js

### Android, Android TV, FireTV
### iOS, tvOS, macOS
### Roku
### Tizen
### WebOS
### Chromecast
### PlayStation
### XBox
