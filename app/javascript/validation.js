function validation() {
  const btnSubmit = document.getElementById('btn_submit');
  const categoryName = document.getElementById('category_name')
  const errorMessageText = document.querySelector('.error-message-text')

  btnSubmit.addEventListener('click', function(e) {
    let message = [];
    if(categoryName.value == "") {
      message.push("カテゴリーが未入力です");
    }
    if(message.length > 0) {
      e.preventDefault();
      errorMessageText.innerHTML = `${message}`
      return;
    }
  })


}


window.addEventListener("load", validation)