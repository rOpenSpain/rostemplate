var h1s = document.getElementsByTagName("h1");

console.log(h1s);
var myH1;
if (h1s.length > 0) {
  myH1 = h1s[0];
  myH1.setAttribute("style", "color: red;");
  
  
} else {
  // Trigger error
}