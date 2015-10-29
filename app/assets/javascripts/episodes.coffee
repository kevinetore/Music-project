$uploadField = $('#upload-field')

$('.upload-btn').click (e) ->
  e.preventDefault()
  $form = $(@).parents('.file-upload-form')

  data = {}
  $form.find('input[name]').each (index, element) ->
    data[$(element).attr('name')] = $(element).val()

  console.log data

  $('.progress').show()

  $.ajax
    type: "POST"
    url: $form.data('action')
    data: data

    complete: () ->
      $('.progress').hide()

    success: (data, textStatus, jqXHR) ->
      $form.parent().find('.alert-success').show();

      filename = $('<input>').attr
        type: 'hidden'
        name: 'episode[filename]'
        value: data

      filename.appendTo $('form')

      $form.hide()

    error: (jqXHR, textStatus, errorThrown) ->
      $form.parent().find('.alert-danger').show();
