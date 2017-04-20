$(document).on 'ajax:error', '#createSpeak', (xhr, data, status) ->
 form = $('#new_speack .modal-body')
 div = $('<div id="createSpeakErrors" class="alert alert-danger"></div>')
 ul = $('<ul></ul>')
 data.responseJSON.messages.forEach(message, i) ->
 li = $('<li></li>').text(message)
 ul.append(li)

 if $('#createSpeackErrors')[0]
  $('#createSpeackErrors').html(ul)
 else
   div.append(ul)
   form.prepend(div)