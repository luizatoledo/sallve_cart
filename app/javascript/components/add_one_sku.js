const addOneSku = () => {
  const plusButtons = document.querySelectorAll(".add-one-sku-button > .btn");
  if (plusButtons){
    plusButtons.forEach( (button) => {
      button.addEventListener('click',(event) => {
        //const form = event.currentTarget.parentElement.nextElementSibling;
        const form = event.currentTarget.parentElement.previousElementSibling;
        let currentAmount = form.querySelector("#cart_sku_amount").value;
        // fetch the current inventory of the sku
        // get the cart_sku_id for the url /cart_skus/:id/inventory
        // with response, see if inventory === 0, if so the amount does not change
        // const skuId = form.parentElement.nextElementSibling.innerText;
        const skuId = form.parentElement.parentElement.querySelector('.cart-sku-id').innerText;
        const url = `${window.location.origin}/cart_skus/${skuId}/inventory`;
        fetch(url, {
          method: 'GET',
          headers: {
          "Accept": "application/json",
          "Content-Type": "application/json"
          }
        }).then(response => response.json())
        .then((data)=>{
          if (Number.parseInt(data.skuInventory) > 0) {
            currentAmount = Number.parseInt(currentAmount, 10) + 1;
            form.querySelector("#cart_sku_amount").value = currentAmount;
            const change = new Event('change');
            form.querySelector("#cart_sku_amount").dispatchEvent(change);
          };
        });
      });
    });
  };
}

export {addOneSku};