const addOneSku = () => {
  const plusButtons = document.querySelectorAll(".add-one-sku-button > .btn");
  if (plusButtons){
    plusButtons.forEach( (button) => {
      button.addEventListener('click',(event) => {
        const form = event.currentTarget.parentElement.nextElementSibling;
        let currentAmount = form.querySelector("#cart_sku_amount").value;
        currentAmount = Number.parseInt(currentAmount, 10) + 1;
        form.querySelector("#cart_sku_amount").value = currentAmount;
        const change = new Event('change');
        form.querySelector("#cart_sku_amount").dispatchEvent(change);
      });
    });
  };
}

export {addOneSku};