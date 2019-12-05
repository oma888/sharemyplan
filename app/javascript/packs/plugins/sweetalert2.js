const someDelete = () => {

  const tryToDeleteItem = document.getElementById('button-alert');

  console.log(tryToDeleteItem);

  tryToDeleteItem.addEventListener("click", (event) => {

  Swal.fire({
    title: 'Are you sure?',
    text: "You won't be able to revert this!",
    icon: 'warning',
    showCancelButton: true,
    confirmButtonColor: '#3085d6',
    cancelButtonColor: '#d33',
    confirmButtonText: 'Yes, delete it!'
  }).then((result) => {
    if (result.value) {
      Swal.fire(
        'Deleted!',
        'Your file has been deleted.',
        'success'
      )
    }
  });











});
};

export { someDelete }
