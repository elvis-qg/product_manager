const type_option = document.getElementById("type_option")

type_option.addEventListener("change", async function() {
  await get_colors(type_option.value);
  await get_sizes(type_option.value);
});

async function get_colors(value) {
  const response = await fetch(`/products/get_colors?id=${value}`)
  const data = await response.json();
  console.log(data);
  const color_options = document.getElementById('color_option');
  while(color_options.firstChild) {
    color_options.removeChild(color_options.firstChild);
  }
  for(let i = 0; i < data.length; i++ ) {
    option = document.createElement("option")
    option.innerHTML = data[i]["name"];
    option.value = data[i]["id"]
    color_options.appendChild(option);
  }
}

async function get_sizes(value) {
  const response = await fetch(`/products/get_sizes?id=${value}`)
  const data = await response.json();
  const size_options = document.getElementById('size_option');
  while(size_options.firstChild) {
    size_options.removeChild(size_options.firstChild);
  }
  for(let i = 0; i < data.length; i++ ) {
    option = document.createElement("option")
    option.innerHTML = data[i]["name"];
    option.value = data[i]["id"]
    size_options.appendChild(option);
  }
}

const add_variant_button = document.getElementById("add_variant_button");
var variants = {};

add_variant_button.addEventListener("click", function() {
  generate_variant();
});

function generate_variant() {
  const color_selected = document.getElementById("color_option");
  const size_selected = document.getElementById("size_option");
  console.log(color_selected.value)
  if (color_selected.value in variants) {
    console.log(!variants[color_selected.value].includes(size_selected.value));
    if(!variants[color_selected.value].includes(size_selected.value)) {
      variants[color_selected.value].push(size_selected.value);
    }
  }
  else {
    variants[color_selected.value] = [size_selected.value];
  }
  const variant_row = document.createElement("div");
  variant_row.classList.add("row-item");
  const color = document.createElement("p");
  color.innerHTML = color_selected[color_selected.value - 1].text;
  const size = document.createElement("p");
  size.innerHTML = size_selected[size_selected.value - 1].text;
  variant_row.appendChild(color);
  variant_row.appendChild(size);
  const variant_list = document.getElementById("variants_list");
  variant_list.appendChild(variant_row);
}

const submit_button = document.getElementById("send_button");
submit_button.addEventListener("click", function() {
  send_data();
});


function send_data() {
  const product_name = document.getElementById("product_name").value;
  const product_brand = document.getElementById("product_brand").value;
  const product_type = document.getElementById("type_option").value;
  const data = {name: product_name, brand: product_brand, type: product_type, variants: variants}
  console.log(data);
  fetch("/products", {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json'
    }
  });
}

