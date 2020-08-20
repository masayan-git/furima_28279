const pay = () => {
  Payjp.setPublicKey("pk_test_549e9696da3c1c4aef2cf8fd");
  const form = document.getElementById("charge-form");
  console.log(form)
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);
    console.log(formResult)
    console.log(formData)
    const card = {
      number: formData.get("transaction_orderer[number]"),
      cvc: formData.get("transaction_orderer[cvc]"),
      exp_month: formData.get("transaction_orderer[exe_month]"),
      exp_year: `20${formData.get("transaction_orderer[exp_year]")}`,
    };
    console.log(card)
    Payjp.createToken(card, (status, response) => {
      console.log(response)
      console.log(status)
      if (status === 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} type="hidden" name='token'>`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
        console.log(tokenObj)

        document.getElementById("card-number").removeAttribute("name");
        document.getElementById("card-cvc").removeAttribute("name");
        document.getElementById("card-exp-month").removeAttribute("name");
        document.getElementById("card-exp-year").removeAttribute("name");

        document.getElementById("charge-form").submit();
        document.getElementById("charge-form").reset();

      } else {
        console.log("hoge3")

      }
    });
  });
};

window.addEventListener("load", pay);