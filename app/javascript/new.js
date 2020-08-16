document.addEventListener("turbolinks:load", function (){
  const prices = document.getElementById("item-price");
  const fee = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit")
  fee.textContent = "0";
  profit.textContent = "0";

  prices.addEventListener('input', e => {
    const price = prices.value;
    const feeTax = price * 0.1
    const profitTax = price * 0.9
    fee.textContent = Math.floor(feeTax).toLocaleString();
    profit.textContent = Math.floor(profitTax).toLocaleString();
    
  })
});
