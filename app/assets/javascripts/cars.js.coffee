#if .visible-img is display: block
# remove .small-block-grid-2.medium-block-grid-3
$(document).ready ->
  $("#gallery .carousel > ul a").click ->
    $("#gallery .carousel > ul").removeClass "small-block-grid-2 medium-block-grid-3"

  $("#gallery .clearing-close").click ->
    $("#gallery .carousel > ul").addClass "small-block-grid-2 medium-block-grid-3"
