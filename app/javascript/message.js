function message() {
  const submit = document.getElementById("submit");
  submit.addEventListener("click", (e) => {
    const formData = new FormData(document.getElementById("form"));
    const XHR = new XMLHttpRequest();
    XHR.open("POST", "/clients/rooms/:room_id/messages", true);
    XHR.responseType = "json";
    XHR.send(formData);
    XHR.onload = () => {
      if (XHR.status != 200) {
        alert(`Error ${XHR.status}: ${XHR.statusText}`);
        return null;
      }
      const message = XHR.response.message;
      const username = JSON.parse(document.getElementById("user-name").dataset.json);
      const put = document.getElementById("putin");
      const page = document.getElementById("messages");
      const formText = document.getElementById("content");
      const HTML = `
      <div class="cuser-one-wrap">
        <div class="upper-message">
          <div class="message-user">
            ${username}
          </div>
          <div class="message-date">
            ${message.created_at}
          </div> 
        </div>
        <div class="lower-message">
          <div class="message-text">
            ${message.content}
          </div>
          <div class="message-image">
            <script>
              if(message.picture.file.exist?){
              ${message.picture.thumb.url}
              }
            </script>  
          </div> 
        </div>
      </div>`;
      put.insertAdjacentHTML("beforebegin", HTML);
      formText.value = "";
      page.scrollTop = page.scrollHeight
    };
    e.preventDefault();
  });
 }
 window.addEventListener("load", message);