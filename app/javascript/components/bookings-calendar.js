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
      eventOverlap: false,
      eventStartEditable: true,
      //header: false,
      defaultView: 'agendaWeek',
      // Column header tryout
      columnHeaderFormat: 'ddd D',
      minTime: "08:00:00",
      maxTime: "21:00:00",
      height: "auto",
      locale: "en-gb",
      events: "/api/v1/bookings",
      eventClick: fillInfoBox,
      dayClick: function(selectionInfo) {
         let start_time = selectionInfo._i;
         let end_time = selectionInfo._d;
         swal({
              title: "Do you want to create a new availability?",
              buttons: ["Cancel", "Create"],

              }).then(function(isConfirm) {
           if (isConfirm){
           fetch(`${KOBLER_BASE_URL}bookings`, {
             method: "POST",
             headers: {
               "Content-Type": "application/json"
             },
             body: JSON.stringify( {start_time, end_time} )
           }); // Fetch closing
           location.reload()
          }
        })
       }, //closing DayClick
        eventDrop: function(info) {
        let start_time = info.start._d
        let end_time = info.end._d
        let id = info.id
        fetch(`${KOBLER_BASE_URL}/api/v1/bookings/${id}`, {
          method: "PATCH",
          headers: {
            "Content-Type": "application/json"
          }, //closing Fetch
          body: JSON.stringify( {start_time, end_time} )
        }); // Closing function
      } // Closing eventDrop
    }); //closing Calendar
    calendar.render();
  });
}


export { bookingsCalendar }


