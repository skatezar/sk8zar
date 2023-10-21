// import consumer from "./consumer"

// consumer.subscriptions.create("NotificationChannel", {
//   connected() {
//     // Called when the subscription is ready for use on the server
//   },

//   disconnected() {
//     // Called when the subscription has been terminated by the server
//   },

//   received(data) {
//     // Called when there's incoming data on the websocket for this channel
//   }
// });
import consumer from "./consumer";

const initNotificationCable = () => {
  const messagesContainer = document.getElementById('messages');
  // We are NOT on the messages page, so show notifications
  if (!messagesContainer) {
    const messagesNav = document.getElementById('nav-messages');
    const userId = messagesNav.dataset.userId;


    consumer.subscriptions.create({ channel: "NotificationChannel", id: userId }, {
      received(data) {
        const notificationDots = messagesNav.querySelectorAll('.notification-new-message');
        notificationDots.forEach((notificationDot) => {
          notificationDot.classList.add("d-block");
        });
      },
    });
  }
}

export { initNotificationCable };
