$ ->
  room_id = $('#room').data('id')

  App.room = App.cable.subscriptions.create({
    channel: 'RoomChannel'
    room_id: room_id
  },
    connected: ->
      console.log "Connected to room #{room_id}!"
    disconnected: ->
    received: (data) ->
      $('#messages').append data['message']
    speak: (message, room_id) ->
      @perform 'speak',
        message: message
        room_id: room_id
  )

  $(document).on 'keypress', '[data-behavior~=send-message]', (event) ->
    if event.keyCode == 13
      App.room.speak event.target.value, room_id
      event.target.value = ''
      event.preventDefault()
    $('#messages').animate { scrollTop: $('#messages')[0].scrollHeight }, 100
  return