const openModal = () => {
  const modalSelectedElement = document.getElementById('modal-selected');
  if (modalSelectedElement) {
    const modalId = modalSelectedElement.dataset.id;
    const modalElement = document.getElementById(`button-modal${modalId}`)

    if (modalElement) {
      modalElement.click();
    }
  }
}

export { openModal }
