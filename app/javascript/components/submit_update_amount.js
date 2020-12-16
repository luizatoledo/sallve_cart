import { csrfToken, formDisableSelector } from "@rails/ujs";

const submitUpdateAmount = () => {
  const amountInput = document.querySelectorAll(".cart_sku_amount > input");
  if (amountInput) {
    amountInput.forEach((input) => {
      input.addEventListener('change', (event) => {
        const value = event.currentTarget.value;
        const skuId = event.currentTarget.parentElement.parentElement.parentElement.nextElementSibling.innerText;
        const totalPrice = event.currentTarget.parentElement.parentElement.parentElement.nextElementSibling.nextElementSibling.nextElementSibling;
        const totalCartPriceElement = document.querySelector('.cart-total-price');
        const totalCartAmountElement = document.querySelector('.cart-total-amount-sku');
        const url = `${window.location.origin}/cart_skus/${skuId}`;
        fetch(url, {
          method: "PATCH",
          headers:{
            "Accept": "application/json",
            "Content-Type": "application/json",
            "X-CSRF-Token": csrfToken()
          },
          body: JSON.stringify({ amount: value })
        }).then(response => response.json())
        .then((data) => {
          totalPrice.innerText = `R$ ${data.items_price}`;
          totalCartPriceElement.innerText = `R$ ${data.cart_price}`;
          totalCartAmountElement.innerText = `(${data.cart_amount})`;
        });
      });
    });
  };
};

export {submitUpdateAmount};
