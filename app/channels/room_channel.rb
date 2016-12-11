# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_#{params[:room_id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    message = Message.create! content: data["message"], room_id: params[:room_id]

    ActionCable.server.broadcast(
      "room_#{params[:room_id]}",
      message: MessagesController.render(partial: 'messages/message', locals: { message: message })
    )
  end
end
