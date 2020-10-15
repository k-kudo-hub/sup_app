import consumer from "./consumer"

consumer.subscriptions.create("MessageChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const username = JSON.parse(document.getElementById("user-name").dataset.json);
    const html = `
    <div class="one-message-wrap current">
      <div class="upper-message">
        <div class="message-user">
          ${username}
        </div>
        <div class="message-date">
          ${data.content.created_at}
        </div> 
      </div>
      <div class="lower-message">
        <div class="message-text">
          ${data.content.content}
        </div>
        <div class="message-image">
          <script>
            if(message.picture.file.exist?){
            ${data.content.picture.thumb.url}
            }
          </script>  
        </div> 
      </div>
     </div>`;
    const messages = document.getElementById('messages');
    const newMessage = document.getElementById('content');
    messages.insertAdjacentHTML("beforeend", html); 
    newMessage.value='';
    $(".messages").scrollTop($("#messages")[0].scrollHeight);
  }
});
