const logChatInput = () => {

  const submitBtn = document.querySelector('.submit-btn');
  const chatInput = document.querySelector('.form-control');

  submitBtn.addEventListener('click', e => {
    // console.log("clicked");
    // e.preventDefault();
    // console.log(chatInput.value);
    // // chatInput.value
    // document.getElementById("new_message").submit();


  });
}

export { logChatInput };
