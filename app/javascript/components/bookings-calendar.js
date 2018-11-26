import { Calendar } from 'fullcalendar';

function fillInfoBox(info) {
  const infoBox = document.querySelector(".user-information");
  console.log(infoBox);
  infoBox.innerHTML = `${info.title} ${info.start_point} ${info.end_point}`;
}

function bookingsCalendar(){
  document.addEventListener('DOMContentLoaded', function() { // page is now ready...
    var calendarEl = document.getElementById('bookings-calendar'); // grab element reference
    var calendar = new Calendar(calendarEl, {
      defaultView: 'agendaWeek',
      minTime: "08:00:00",
      maxTime: "21:00:00",
      height: "auto",
      locale: "en-gb",
      events: "/api/v1/bookings",
      eventClick: fillInfoBox,
    });
    calendar.render();
  });
}
export { bookingsCalendar }
