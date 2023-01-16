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



//   const submit = document.getElementById("button");
//   submit.addEventListener("submit", (e) => {
//     e.preventDefault();               




//     const formResult = document.getElementById("charge-form");
//     const formData = new FormData(formResult);

//     const card = {
//       number: formData.get("order[number]"),
//       cvc: formData.get("order[cvc]"),
//       exp_month: formData.get("order[exp_month]"),
//       exp_year: `20${formData.get("order[exp_year]")}`,
//     };
// // ↓↓カード情報をPAY.JP側に送りトークン化するためには、pay.jsが提供するPayjp.createToken(card, callback)というオブジェクトとメソッドを使用
//     Payjp.createToken(card, (status, response) => {
//       if (status == 200) {
//         const token = response.id;
//         const renderDom = document.getElementById("charge-form");
//         const tokenObj = `<input value=${token} name='token' type="hidden">`;   //。JavaScriptでinput要素を生成しフォームに加え、その値としてトークンをセットvalueは実際に送られる値、nameはその値を示すプロパティ名（params[:name]のように取得できるようになる）を示す
//         renderDom.insertAdjacentHTML("beforeend", tokenObj);      //フォームの中に作成したinput要素を追加。
//       }

      
//       document.getElementById("order_number").removeAttribute("name");
//       document.getElementById("order_cvc").removeAttribute("name");
//       document.getElementById("order_exp_month").removeAttribute("name");
//       document.getElementById("order_exp_year").removeAttribute("name");

//       document.getElementById("charge-form").submit();  //5行目でRuby on Rails でのフォーム送信所rはキャンセルされている。ので、こちらで痩身処理をする。
//     });
//   });
// };

// window.addEventListener("load", pay);