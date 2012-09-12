BASE = "http://pennapps.com/apiv2/"

load = (path) ->
  url = BASE + path
  $.ajax
    type: "GET"
    url: url
    success: (data) =>
      console.log data
      $("#output").html "<pre>#{data}</pre>"
      hljs.highlightBlock($("pre")[0], null, false)


$ ->
  hljs.initHighlightingOnLoad()

  load location.hash.substring(1) if location.hash?
        
  $("#query-form").on "submit", (e) ->
    e.preventDefault()
    query = $("#query").val()
    location.hash = query
    console.log query
    load query
