window.onload = function(){const priceInput = document.getElementById('item-price')

priceInput.addEventListener('input', (i) => {
  const price = priceInput.value;
  const salesFee = Math.floor(price * 0.1);
  const feeYen = document.getElementById('add-tax-price');
  const FeeHtml = `
  ${salesFee}`;
  feeYen.innerHTML = FeeHtml

  const profit = price - salesFee
  const profitYen = document.getElementById("profit")
  const profitHtml = `
  ${profit}`
  profitYen.innerHTML = profitHtml
})
};
