App.visibility = App.cable.subscriptions.create "VisibilityChannel",
  connected: ->

  disconnected: ->

  received: (data) ->
    App.visibility.printOnline(data.users)

  printOnline: (users) ->
    if (users.length > 0)
      text = ''
      text += users.map((user) -> user.nickname).join(' ')

      $('.users-online').text(text)
