const updateName = () => {
  const displayName = document.getElementById('name-user');
  const formName = document.getElementById('user_first_name');
  if (displayName) {
    displayName.innerText = formName.value;
    formName.addEventListener('keyup', (e) => {
      displayName.innerText = e.currentTarget.value
    })
  }
}

export { updateName };
