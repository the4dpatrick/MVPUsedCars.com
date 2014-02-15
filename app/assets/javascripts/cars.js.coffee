$(document).on 'click', "#gallery .carousel > ul a", ->
  $("#gallery .carousel > ul").removeClass "small-block-grid-2 medium-block-grid-3"
  $("#gallery .carousel").addClass "carousel-margin"

$(document).on 'click', "#gallery .clearing-close", ->
  $("#gallery .carousel > ul").addClass "small-block-grid-2 medium-block-grid-3"
  $("#gallery .carousel").removeClass "carousel-margin"
