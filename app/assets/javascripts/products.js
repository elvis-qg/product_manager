const type_option = document.getElementById("type_option")

type_option.addEventListener("change", async function() {
  await get_colors(type_option.value);
  await get_sizes(type_option.value);
});

async function get_colors(value) {
  const response = await fetch(`/products/get_colors?id=${value}`)
  const data = await response.json();
  const color_options = document.getElementById('color_option');
  while(color_options.firstChild) {
    color_options.removeChild(color_options.firstChild);
  }
  for(let i = 0; i < data.length; i++ ) {
    option = document.createElement("option")
    option.innerHTML = data[i]["name"];
    option.value = data[i]["color_id"]
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
    option.value = data[i]["color_id"]
    size_options.appendChild(option);
  }
}


