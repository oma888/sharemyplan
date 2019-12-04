
const createNotification = () => {
  const notification = document.querySelector(".notifications")
  const circle = document.querySelector('.add')

  console.log (circle)
  console.log(notification.innerHTML)

  if (notification.innerHTML) {
   circle.classList.add("circle-notif");
   circle.innerHTML = "1";
  }else{
    circle.classList.remove("circle-notif");
  };
};




let click = 0
const menuNotification = document.getElementById("notif")
menuNotification.addEventListener("click", (event) => {

  console.log (click)
  click += 1
  if (click == 1) {
    Notification.unviewed = false;
    Notification.save


  };
})

 export { createNotification }
