import { Calendar } from 'fullcalendar';

function monthlyCalendar(){
  document.addEventListener('DOMContentLoaded', function() { // page is now ready...
    var calendarEl = document.getElementById('monthly-calendar'); // grab element reference
    var calendar = new Calendar(calendarEl, {
      defaultView: 'month',
      columnHeaderFormat: 'dd',
      locale: "en-gb",
      header: { right: '' }
    });
    calendar.render();
  });
}
export { monthlyCalendar }
