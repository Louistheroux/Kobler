import "bootstrap";
import { foo } from '../components/foo'
import 'fullcalendar/dist/fullcalendar.min.css';
foo()
import { availabilityCalendar } from '../components/availability-calendar.js';
availabilityCalendar()
import { bookingsCalendar } from '../components/bookings-calendar.js';
bookingsCalendar()

// For the month calendar in the left corner of the bookings view
import { monthlyCalendar } from '../components/monthly-calendar.js';
monthlyCalendar()

import swal from 'sweetalert';

import numAnim from '../components/countUp.js'
