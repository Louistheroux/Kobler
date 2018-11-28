import CountUp from 'countup.js';

let amount = document.getElementById("money_dashboard").innerHTML
var numAnim = new CountUp("money_dashboard", 0, amount);
if (!numAnim.error) {
   numAnim.start();
} else {
   console.error(numAnim.error);
}

