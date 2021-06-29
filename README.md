# Video Everything

Repository with minimal samples for playing HLS/DASH-CMAF video, across as many platforms as possible.

## Content and License

All test content in this repository was derived from the [Netflix Open Source Content Platform](https://opencontent.netflix.com/) which is licensed under the [Creative Commons Attribution 4.0 International Public License](https://www.google.com/url?q=https%3A%2F%2Fcreativecommons.org%2Flicenses%2Fby%2F4.0%2Flegalcode&sa=D&sntz=1&usg=AFQjCNFm6hmkXeNuPlc9AohLWBxgxp3BCw)

Currently the following titles exist as test media:
* [Sol Levante](https://opencontent.netflix.com/#h.yk08awhc210g)

If you would like to follow along and encode your own piece of test content, refer to the [Content Preparation](#content-preparation) section below.

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

### OTT

> TODO

## Content Preparation

If you would like to prepare and use your own piece of media, the following section will walk you through the steps to properly encode and package sample content which can be played using the samples configured in this repo. Once packaged the content can be placed in the `.content/public` directory.

For the sample content included in this repo the following transmuxing, transcoding, and packaging steps were performed.

### Content Download

To start, download the full Sol Levante 35GB HDR10 2020 ST2084 UHD source media file from the Netflix Open Source Content Platform above.

### Content Re-Mux for Size Reduction

To work with a file of this size it's easier if we trim it down right from the start. We'll use a combination of `ffmpeg` and `bento4` throughout this process, but any media tools with sufficient spec compliance and codec support will do.

First we'll trim the video down to a 15 second section:

```sh
ffmpeg -i SolLevante_HDR10_r2020_ST2084_UHD_24fps_1000nit.mov \
  -ss 00:00:30 -to 00:00:45 \
  -c:v copy -c:a copy \
  sollevante.mov
```

### Content Transcode/Transmux

Now we'll transcode/transmux the `.mov` QuickTime file to h.264 AAC:

```sh
ffmpeg -i sollevante.mov \
  -vcodec h264 -acodec aac \
  sollevante.mp4
```

### Content Renditions

Next we'll generate a 360p and 480p rendition of the new source content, using the [Shaka Media Packager demo settings](https://google.github.io/shaka-packager/html/tutorials/encoding.html#h264-encoding). These account for the correct GOP (Group of Pictures) alignment and bitrate settings.

```sh
# 360p

ffmpeg -i sollevante-main.mp4 -c:a copy \
  -vf "scale=-2:360" \
  -c:v libx264 -profile:v baseline -level:v 3.0 \
  -x264-params scenecut=0:open_gop=0:min-keyint=72:keyint=72 \
  -minrate 600k -maxrate 600k -bufsize 600k -b:v 600k \
  -y sollevante_360p_600.mp4

# 480p

ffmpeg -i sollevante-main.mp4 -c:a copy \
  -vf "scale=-2:480" \
  -c:v libx264 -profile:v main -level:v 3.1 \
  -x264-params scenecut=0:open_gop=0:min-keyint=72:keyint=72 \
  -minrate 1000k -maxrate 1000k -bufsize 1000k -b:v 1000k \
  -y sollevante_480p_1000.mp4
```

### Content to Fragmented MP4s (fMP4s)

At this point we have two renditions of h.264 AAC mp4 content. In order to package this as CMAF we'll need to first transcode the content so it's fragmented. Internally this is just converting the actual sections of media data (`mdata`) into consistently sized boxes, which in this case we'll make 6s to align with CMAF spec recommendations for compatibility between HLS and DASH.

To do the final steps we'll use [`bento4`](https://www.bento4.com/downloads/#downloads). This packaging libraries requires the input renditions to be packaged are first fragmented:

```sh
bento4/bin/mp4fragment ./sollevante_360p_600.mp4 sollevante_360p_600_fragment.mp4
bbento4/bin/mp4fragment ./sollevante_480p_1000.mp4 sollevante_480p_1000_fragment.mp4
```

### Content Packaging

At this point we can wrap up our two fragmented renditions and host them under our `.content` directory:

```sh
./bento4/bin/mp4dash --hls \
  sollevante_360p_600_fragment.mp4 \
  sollevante_480p_1000_fragment.mp4
```

This produces a `content` directory in the same structure as provided under the `.content/sol-levante` section.

### Content Profile Downgrade

Right now the content profile is encoded as `High`, and ffmpeg was complaining about the inability to transcode the source media which already encoded with a high profile. If you need to tweak the profile you can use the following snippet:

```sh
ffmpeg -i sollevante.mp4 \
  -vf "scale=2*trunc(iw/2):-2,setsar=1" \
  -profile:v main -pix_fmt yuv420p \
  sollevante-main.mp4
```
