BASE = "http://api.penncoursereview.com/v1/"

load = (query) ->
  $("#query").val(query)
  $("#load").addClass("disabled").val("Loading...")
  $.ajax
    type: "GET"
    data:
      token: $("#token").val()
    url: BASE + query
    success: (data) =>
      $("#load").removeClass("disabled").val("Load")
      $("#output").html "<pre>#{data}</pre>"
      hljs.highlightBlock($("pre")[0], null, false)

$ ->
  $("#domain").html BASE
  load location.hash.substring(1) if location.hash?
        
  $("#query-form").on "submit", (e) ->
    e.preventDefault()
    location.hash = query = $("#query").val()
    load query
