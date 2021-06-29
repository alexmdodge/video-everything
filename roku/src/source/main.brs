sub main()
  ' Create the Screen object and main message port
  screen = CreateObject("roSGScreen")
  port = CreateObject("roMessagePort")
  screen.setMessagePort(port)

  scene = screen.CreateScene("Main") ' Load "Main" scene
  screen.show() ' vscode_rale_tracker_entry

  while true
    msg = wait(0, port)
    msgType = type(msg)
    if msgType = "roSGScreenEvent"
      if msg.isScreenClosed() then return
    end if
  end while
end sub
