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
      allDaySlot: false,
      eventTextColor: '#222222',
      defaultView: 'agendaWeek',
      minTime: "08:00:00",
      maxTime: "21:00:00",
      height: "auto",
      locale: "en-gb",
      events: "/api/v1/bookings",
      eventClick: fillInfoBox,
      dayClick: function(selectionInfo) {
         console.log(selectionInfo);
         let start_time = selectionInfo._i;
         let end_time = selectionInfo._d;
         fetch(`${KOBLER_BASE_URL}bookings`, {
           method: "POST",
           headers: {
             "Content-Type": "application/json"
           },
           body: JSON.stringify( {start_time, end_time} )
         }); // Fetch closing
         location.reload()
       } //closing DayClick
    }); //closing Calendar
    calendar.render();
});
}
export { bookingsCalendar }


