import CountUp from 'countup.js';
let amount = document.getElementById("money").innerHTML
var numAnim = new CountUp("money", 0, amount);
if (!numAnim.error) {
   numAnim.start();
} else {
   console.error(numAnim.error);
}
export { NumAnim }
