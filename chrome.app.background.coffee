miniPostAppWindow = undefined

start = (window) ->
  console.log('Opening miniLock Postcard Window', window)
  window.minipost.router.writePostcard()
  window.chrome.commands.onCommand.addListener (command) ->
    console.log('Command:', command)
    if command is "Write"
      window.minipost.router.writePostcard({})
    if command is "Unlock"
      window.minipost.router.unlockPostcard({})
    if command is "Index"
      window.minipost.router.showIndex({})
    if command is "Open"
      window.minipost.router.unlockPostcard({})

chrome.app.runtime.onLaunched.addListener ->
  if miniPostAppWindow
    miniPostAppWindow.focus()
  else
    chrome.app.window.create "window.html", {minWidth: 1220, minHeight: 660, height:960}, (appWindow) ->
      miniPostAppWindow = appWindow
      miniPostAppWindow.contentWindow.onload = (event) ->
        start(event.currentTarget, appWindow)
