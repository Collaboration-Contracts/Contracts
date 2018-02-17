$(document).on('turbolinks:load', function() {
  var modals = ['#login-modal', '#registration-modal'];

  modals.forEach(function(modalID) {
    $(modalID).modal();
    handleModalClick(modalID);
  })

  function handleModalClick(modalId) {
    var $modal = $(modalId);

    $modal.find('.submit-btn').on('click', function (e) {
      e.preventDefault();
      var $form = $(this).parent();
      var data = $form.serialize();
      var action = $form.attr("action");

      $.ajax({url: action, data: data, method: 'POST', dataType: 'json'}).done(function (resp) {
        if (resp.status === 204) {
          $form.find('input').val('');
          $modal.modal('close');
          $('.user-links').hide();
        } else if (resp.status === 422) {
          $('.json-flash-container').html(resp.attachmentPartial);
        }
      }).fail(function (err) {
        console.log(err);
      })
    })
  }
});
