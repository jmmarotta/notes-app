document.addEventListener('turbolinks:load', function() {
  let editables = document.querySelectorAll('.make-editable');
  editables.forEach(editable => editable.addEventListener('click', e => {
    let index = e.target.getAttribute('index');
    hide(`collapseEditTitle${index}`);
    hide(`collapseEditBody${index}`);
  }));

  function hide(id) {
    let el = document.getElementById(id);
    el.classList.toggle('d-none');
  }
});



