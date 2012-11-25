preventDefault = (event) ->
  event.preventDefault()

srp.session = new srp.Session()
srp.signedUp = ->
  srp.login

srp.loggedIn = ->
  window.location = '/'

#// TODO: not sure this is what we want.
srp.updated = ->
  window.location = '/'

srp.error = (message) ->
  if $.isPlainObject(message) && message.errors
    for field, error of message.errors
      element = $('form input[name="session['+field+']"]')
      next unless element
      element.trigger('element:validate:fail.ClientSideValidations', error).data('valid', false)
  else
    alert(message)

$(document).ready ->
  $('#new_user').submit preventDefault
  $('#new_user').submit srp.signup
  $('#new_session').submit preventDefault
  $('#new_session').submit srp.login
  $('.user.form.edit').submit srp.update
  $('.user.form.edit').submit preventDefault

