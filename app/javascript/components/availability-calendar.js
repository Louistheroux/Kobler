import { Calendar } from 'fullcalendar';

function availabilityCalendar(){
  document.addEventListener('DOMContentLoaded', function() { // page is now ready...
    var calendarEl = document.getElementById('availabilities-calendar'); // grab element reference
    var calendar = new Calendar(calendarEl, {
      defaultView: 'agendaWeek',
      locale: "en-gb",
      minTime: "08:00:00",
      maxTime: "21:00:00",
      height: "auto",
      allDaySlot: false,
      header: false,
      columnHeaderFormat: "dddd",
      slotLabelFormat: "H:mm"
    });
    calendar.render();
  });
}
export { availabilityCalendar }
