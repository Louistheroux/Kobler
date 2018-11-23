import { Calendar } from 'fullcalendar';

function availabilityCalendar(){
  document.addEventListener('DOMContentLoaded', function() { // page is now ready...
    var calendarEl = document.getElementById('availabilities-calendar'); // grab element reference
    var calendar = new Calendar(calendarEl, {
      events: "/api/v1/availabilities",
      // eventClick: function(info) {
      //   // change the border color just for fun
      //   info.el.style.borderColor = 'red';
      // },
      eventStartEditable: true,
      eventOverlap: false,
      defaultView: 'agendaWeek',
      locale: "en-gb",
      minTime: "08:00:00",
      maxTime: "21:00:00",
      height: "auto",
      allDaySlot: false,
      header: false,
      columnHeaderFormat: "dddd",
      slotLabelFormat: "H:mm",
      eventDrop: function(info) {
        console.log()
      }
    });
    calendar.render();
  });
}
export { availabilityCalendar }
