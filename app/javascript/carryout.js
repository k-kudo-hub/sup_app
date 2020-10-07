function record() {

  const points = document.querySelectorAll(".print");
  
  points.forEach(function (point) {
    if (point.getAttribute("data-load") != null) {
      return null;
      }
      point.setAttribute("data-load", "true");

      point.addEventListener("dblclick", () => {
        const pointId = point.getAttribute("data-id");
        const XHR = new XMLHttpRequest();
        XHR.open("PATCH", `/client/records/${pointId}`, true);
        XHR.responseType = "json";
        XHR.send();
        XHR.onload = () => {
          if (XHR.status != 200) {
            alert(`Error ${XHR.status}: ${XHR.statusText}`);
            return null;
          }
        const carry = XHR.response.record
        if (carry.carryout_id === 1) {
          point.setAttribute("data-carryout_id", "1");
        }else if (carry.carryout_id === 2) {
          point.setAttribute("data-carryout_id", "2");
        };
      };
    });
  });
};
setInterval(record, 1000);