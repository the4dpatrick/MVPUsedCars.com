# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# Add active class to faq clicked questions
$("dd > a").bind "click", ->
  if $(this).hasClass "active"
    $(this).removeClass "active"
  else
    $("dd > a").removeClass "active" if $("dd > a").hasClass "active"
    $(this).addClass "active"
