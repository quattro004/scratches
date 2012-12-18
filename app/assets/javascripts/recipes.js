$(document).ready(function() {
  $('a#add-ingredient').click(function() {
    $('#ingredient-fields').clone().find('input').val('').end().appendTo('#ingredient-list');
  });

  $('.delete-ingredient').live('click', function() {
    if ($('#ingredient-list div').length > 1) {
      $(this).parent().remove();
    }
    else {
      alert ('You must have at least one ingredient.');
    }
  });
});
