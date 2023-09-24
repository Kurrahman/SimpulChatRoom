import consumer from "channels/consumer"

consumer.subscriptions.create({
    channel: "RoomChannel",
    room: document.querySelector('.room-messages').dataset.roomId
}, {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    document.querySelector('.text-input').value = '';
    var messages = document.querySelector('.room-chat');
    var element = document.querySelectorAll('.chat');
    const content = `
    <div class='chat'>
        <small class='sender'>
            ${data.sender_name}
        </small>
        <p class='message'>
            ${data.message}
        </p>
    </div>
    `
    element[element.length - 1].insertAdjacentHTML("afterend", content);
    messages.scrollTop = messages.scrollHeight;
    // Called when there's incoming data on the websocket for this channel
  },

  send_message: (data) => {
    return this.perform('send_message', data);
  }
});
