import $ from 'jquery';

const submitUpdateAmount = () => {
  const amountInput = document.querySelectorAll(".cart_sku_amount > input");
  if (amountInput) {
    amountInput.forEach((input) => {
      input.addEventListener('change', (event) => {
        const form = event.currentTarget.parentElement.parentElement;
        form.submit((event) => {event.preventDefault();});
      });
    });
  };
};

export {submitUpdateAmount};
