const updateEmail = () => {
  const displayEmail = document.getElementById('email-user');
  const formEmail = document.getElementById('user_email');
  if (displayEmail) {
    displayEmail.innerText = formEmail.value;
    formEmail.addEventListener('keyup', (e) => {
      displayEmail.innerText = e.currentTarget.value
    })
  }
}

export { updateEmail };
