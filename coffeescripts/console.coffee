BASE = "http://api.penncoursereview.com/v1/"

load = (query) ->
  $("#query").val(query)
  $.ajax
    type: "GET"
    data:
      token: $("#token").val()
    url: BASE + query
    success: (data) =>
      console.log data
      $("#output").html "<pre>#{data}</pre>"
      hljs.highlightBlock($("pre")[0], null, false)

$ ->
  $("#domain").html BASE
  load location.hash.substring(1) if location.hash?
        
  $("#query-form").on "submit", (e) ->
    e.preventDefault()
    query = $("#query").val()
    location.hash = query
    console.log query
    load query
