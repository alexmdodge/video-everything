function init()
  m.videoPlayer = m.top.findNode("videoPlayer")
  initializeVideoPlayer()
end function

sub initializeVideoPlayer()
  ' Set up video content object
  videoContent = createObject("RoSGNode", "ContentNode")
  videoContent.title = "Roku Sample"
  videoContent.streamformat = "hls" ' Also supports "dash"
  videoContent.url = "http://" + getContentIp() + ":9000/sol-levante/master.m3u8"

  ' Set Up player
  m.videoPlayer.EnableCookies()
  m.videoPlayer.setCertificatesFile("common:/certs/ca-bundle.crt")
  m.videoPlayer.InitClientCertificates()

  ' Set the content to the video node
  m.videoPlayer.content = videoContent


  ' Start it playing
  m.videoPlayer.setFocus(true)
  m.videoPlayer.control = "play"
end sub
