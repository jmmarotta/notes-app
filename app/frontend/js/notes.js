document.addEventListener('turbolinks:load', function() {
  let editables = document.querySelectorAll('.make-editable');
  editables.forEach(editable => editable.addEventListener('click', e => {
    let index = e.target.getAttribute('index');
    let hide = document.getElementById(`collapseEditHide${index}`);
    hide.classList.toggle('d-none');
  }));
});


