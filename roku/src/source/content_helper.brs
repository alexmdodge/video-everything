' We are unable to package movie files directly to a Roku Channel
' On Build, assets/data/content.json is updated with the IP address of your computer
' Your computer must be accessible from whatever network the target Roku is on
function getContentIp() as string
  text = ReadAsciiFile("pkg:/assets/data/content.json")
  content_data = ParseJson(text)
  return content_data.ipAddress
end function