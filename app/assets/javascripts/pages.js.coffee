# Add active class to faq clicked questions
$("dd > a").bind "click", ->
  if $(this).hasClass "active"
    $(this).removeClass "active"
  else
    $("dd > a").removeClass "active" if $("dd > a").hasClass "active"
    $(this).addClass "active"
