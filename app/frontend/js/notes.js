document.addEventListener('turbolinks:load', function() {
  // Find all edit button
  let editables = document.querySelectorAll('.make-editable');
  // If edit button is clicked then hide the corresponding title and body
  // showing the form for editing is handled by bootstrap
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



