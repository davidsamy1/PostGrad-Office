var nav = document.getElementById("nav");
var menu = document.getElementById("menu");
var content = document.querySelector(".main-content");
var navItems = document.querySelector(".nav-items");

menu.addEventListener("click", () => {
  if (nav.style.width == "85px") {
    nav.style.width = "300px";
    nav.style.minHeight = "600px";
    nav.style.height = "90vh";
    content.style.marginLeft = "3rem";
    navItems.style.display = "block";
  } else {
    nav.style.width = "85px";
    nav.style.minHeight = "0px";
    nav.style.height = "70px";
    content.style.marginLeft = "-180px";
    navItems.style.display = "none";
  }
});

// for (i = 0; i < a.length; i++) {
//   a[i].style.display = "block";
// }
// for (i = 0; i < icons.length; i++) {
//   icons[i].style.display = "block";
// }
// span[0].style.display = "block";
