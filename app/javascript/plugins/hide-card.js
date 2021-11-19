
const hiddenCard = (item) => {
  const btn = document.querySelector("#validation-travel");
  btn.addEventListener("click", (event) => {
  item.status = true
  });
}

export { hiddenCard };
