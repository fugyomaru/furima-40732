const price = () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(priceInput.value * 0.1)
    const profit = document.getElementById("profit");
    profit.innerHTML = priceInput.value - Math.floor(priceInput.value * 0.1)
  })
};

window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);

