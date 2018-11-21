import "bootstrap";
import { Calendar } from 'fullcalendar';
import { foo } from '../components/foo'
import 'fullcalendar/dist/fullcalendar.min.css';
// import $ from 'jquery'
foo()
document.addEventListener('DOMContentLoaded', function() { // page is now ready...
  var calendarEl = document.getElementById('calendar'); // grab element reference

  var calendar = new Calendar(calendarEl, {
    locale: "en-gb"
    // weekends: false
  });

  calendar.render();
});

// window.$ = $
