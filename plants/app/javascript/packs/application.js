// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import 'bootstrap'
require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

window.jQuery = $;
window.$ = $;

let i = 0;
let txt = 'PlantsApp!';
let speed = 50;

function typeWriter() {
  let prgrph = document.getElementById("typing_text");

  if (prgrph && i < txt.length) {
    prgrph.innerHTML += txt.charAt(i);
    i++;
    setTimeout(typeWriter, speed);
  }
};

function over(event) {
  event.currentTarget.style.backgroundColor = "green";
};

function out(event) {
  event.currentTarget.style.backgroundColor = event.currentTarget.parentNode.style.backgroundColor;
};

function paintLinks() {
  const links = document.getElementsByTagName("a");

  for (let j = 0; j < links.length; ++j) {
    links[j].addEventListener("mouseover", over);
    links[j].addEventListener("mouseout", out);
  }
};

document.addEventListener("turbolinks:load", typeWriter)
document.addEventListener("turbolinks:load", paintLinks)
