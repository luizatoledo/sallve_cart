import { csrfToken, formDisableSelector } from "@rails/ujs";

const removeOneSku = () => {
  const minusButtons = document.querySelectorAll(".remove-one-sku-button > .btn");
  if (minusButtons){
    minusButtons.forEach( (button) => {
      button.addEventListener('click',(event) => {
        const form = event.currentTarget.parentElement.previousElementSibling;
        let currentAmount = form.querySelector("#cart_sku_amount").value;
        const skuId = form.parentElement.parentElement.querySelector('.cart-sku-id').innerText;
        console.log(skuId);
        if (currentAmount > 1) {
          currentAmount = Number.parseInt(currentAmount, 10) - 1;
          form.querySelector("#cart_sku_amount").value = currentAmount;
          const change = new Event('change');
          form.querySelector("#cart_sku_amount").dispatchEvent(change);
        } else{
          const url = `${window.location.origin}/cart_skus/${skuId}`;
          fetch(url,{
            method: 'DELETE',
            headers:{
              "Accept": "application/json",
              "Content-Type": "application/json",
              "X-CSRF-Token": csrfToken()
            }
          }).then(response => response.json())
          .then((data)=>{
            const redirectUrl = data.redirect;
            window.location.replace(redirectUrl);
          });    
        };
      });
    });
  };
}

export {removeOneSku};