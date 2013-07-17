$(document).ready ->
  $('body > main').on 'click tap','.alert, .notice', ->
    $(this).fadeOut 150, ->
      $(this).remove()