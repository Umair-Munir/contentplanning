$(document).ready ->

  $("#tags").select2({
    tags: ['Poetry','Story','Fiction', 'News', 'Research','Health','Sports','Education']
  })

  if $('#description').length > 0
    editor = new (wysihtml5.Editor)('description',
      toolbar: 'toolbar'
      parserRules: wysihtml5ParserRules)

  $('#fileupload').fileupload
    dataType: 'json'
    done: (e, data) ->
      $.each data.result.files, (index, file) ->
        $('').text(file.name).appendTo document.body
        return
      return
