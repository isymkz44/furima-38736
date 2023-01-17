const pay = () => {
  const payjp = Payjp(process.env.PAYJP_PUBLIC_KEY); // PAY.JPテスト公開鍵を環境変数に設定する。
  const elements = payjp.elements();

  const numberElement = elements.create('cardNumber')// 入力フォームを作成。この時、生成されたフォームはelementという種類のインスタンスになる
  const cvcElement    = elements.create('cardCvc')
  const expiryElement = elements.create('cardExpiry')

  numberElement.mount('#number')  //生成した各elmentインスタンスをビューに反映。すでにあるHTML要素を指定し、フォームに置き換える形になる。
  cvcElement.mount('#cvc') 
  expiryElement.mount('#exp-date')
  const form = document.getElementById("charge-form");

  form.addEventListener("submit", (e) => {
    e.preventDefault();
    payjp.createToken(expiryElement).then((response) => {
      if (response.error) {
      } else {
        const token = response.id;
        const renderDom = document.getElementById("charge-form"); 
        const tokenObj = `<input value=${token} name='token' type="hidden"> `;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }
      document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener("load", pay);

