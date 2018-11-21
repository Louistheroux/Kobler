import { Calendar } from 'fullcalendar';

function bookingsCalendar(){
  document.addEventListener('DOMContentLoaded', function() { // page is now ready...
    var calendarEl = document.getElementById('bookings-calendar'); // grab element reference
    var calendar = new Calendar(calendarEl, {
      defaultView: 'agendaWeek',
      locale: "en-gb"
    });
    calendar.render();
  });
}
export { bookingsCalendar }
