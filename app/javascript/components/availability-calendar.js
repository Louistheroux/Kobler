import { Calendar } from 'fullcalendar';

function availabilityCalendar(){
  document.addEventListener('DOMContentLoaded', function() { // page is now ready...
    var calendarEl = document.getElementById('availabilities-calendar'); // grab element reference
    var calendar = new Calendar(calendarEl, {
      defaultView: 'agendaWeek',
      locale: "en-gb"
    });
    calendar.render();
  });
}
export { availabilityCalendar }
