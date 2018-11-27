import { Calendar } from 'fullcalendar';

function fillInfoBox(info) {
  console.log(info.id)
  console.log(info.event)
  // DETERMINES WHETHER OR NOT TO SHOW PICKUP OR DROPOFF
  let pick_up_point_v;
  let drop_off_point_v;
  if (info.start_point === "TBD") {
    pick_up_point_v = "";
    drop_off_point_v = "";
  }
  else {
    pick_up_point_v = `<div class="pick_up"><i class="fas fa-map-marker-alt"></i>${info.start_point}</div>`;
    drop_off_point_v = `<div class="drop_off"><i class="fas fa-map-marker-alt"></i>${info.end_point}</div>`;
  }
  const infoBox = document.querySelector(".user-information");
  const options = {weekday: 'short', month: 'short', day: 'numeric', hour: 'numeric', minute: 'numeric'   }
  infoBox.innerHTML = `<div class="infobox">
  <div class="title_infobox"><span><strong>${info.title}</strong></span></div>
  <h4 class="start_header"><span>Start</span></h4>
  <div class="start_time"><i class="fas fa-hourglass-start"></i>${new Date(info.start._d).toLocaleString("en-us", options)}</div>
  ${pick_up_point_v}
  <h4 class="start_header">End</h4>
  <div class="end_time"><i class="fas fa-hourglass-end"></i>${new Date(info.end._d).toLocaleString("en-us", options)}</div>
  ${drop_off_point_v}
  <div class="button_container"><a type="button" href="${KOBLER_BASE_URL}/api/v1/bookings/${info.id}" data-method="delete" class="button-delete">Delete booking</a></div>
  </div>`;
  }


function bookingsCalendar(){
  document.addEventListener('DOMContentLoaded', function() { // page is now ready...
    var calendarEl = document.getElementById('bookings-calendar'); // grab element reference
    var calendar = new Calendar(calendarEl, {
      allDaySlot: false,
      eventTextColor: '#222222',
      //header: false,
      defaultView: 'agendaWeek',
      minTime: "08:00:00",
      maxTime: "21:00:00",
      height: "auto",
      locale: "en-gb",
      events: "/api/v1/bookings",
      eventClick: fillInfoBox
    });
    calendar.render();
  });
}


export { bookingsCalendar }
