jQuery ->
  $("#gallery .carousel > ul a").click ->
    $("#gallery .carousel > ul").removeClass "small-block-grid-2 medium-block-grid-3"
    $("#gallery .carousel").addClass "carousel-margin"

  $("#gallery .clearing-close").click ->
    $("#gallery .carousel > ul").addClass "small-block-grid-2 medium-block-grid-3"
    $("#gallery .carousel").removeClass "carousel-margin"
