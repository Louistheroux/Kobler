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
      eventColor: '#D2D2D2',
      eventStartEditable: true,
      eventTextColor: "#222222",
      eventOverlap: false,
      defaultView: 'agendaWeek',
      nowIndicator: false,
      locale: "en-gb",
      minTime: "08:00:00",
      maxTime: "21:00:00",
      height: "auto",
      allDaySlot: false,
      header: false,
      columnHeaderFormat: "dddd",
      slotLabelFormat: "H:mm",
      selectable: true,
      dayClick: function(selectionInfo) {
        let start_time = selectionInfo._i
        let end_time = selectionInfo._d
        swal({
            title: "Create availability",
              text: "Do you want to create a new availability here?",
              buttons: ["Cancel", "Create"],


            }).then(function(isConfirm) {
              if (isConfirm) {
                fetch(`${KOBLER_BASE_URL}baseworkweek`, {
                  method: "POST",
                  headers: {
                    "Content-Type": "application/json"
                  },
                  body: JSON.stringify( {start_time, end_time} )
                });
                location.reload()
              }
            })
        },
      eventClick: function(info){
        swal({
          title: "Delete availability?",
          text: "This will delete the availability from your workweek.",
          buttons: ["Cancel","Delete"],
          dangerMode: true

        }).then(function(isConfirm) {
          if (isConfirm) {
          fetch(`${KOBLER_BASE_URL}/api/v1/availabilities/${info.id}`, {
            method: "DELETE"
          });
          location.reload()
        }
      })
      },
      eventDrop: function(info) {
        let start_time = info.start._d
        let end_time = info.end._d
        let id = info.id
        fetch(`${KOBLER_BASE_URL}/api/v1/availabilities/${id}`, {
          method: "PATCH",
          headers: {
            "Content-Type": "application/json"
          },
          body: JSON.stringify( {start_time, end_time} )
        });
      }
    });
    calendar.render();
  });
}
export { availabilityCalendar }

