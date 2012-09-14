BASE = "http://api.penncoursereview.com/v1/"

linkify = (data) ->
  links = ["path", "url"]
  for link in links
    re = new RegExp("\"#{link}\": \"(.*?)\"", "g")
    data = data.replace(re, (all, query) ->
      "\"#{link}\": \"<a href='##{query}'>#{query}</a>\""
    )
  "<pre>#{data}</pre>"

load = (query = "") ->
  $("#query").val(query)
  $("#load").addClass("disabled").val("Loading...")
  $("#output").addClass("loading")
  $.ajax
    type: "GET"
    data:
      token: $("#token").val()
    url: BASE + query
    success: (data) =>
      $("#load").removeClass("disabled").val("Load")
      $("#output").removeClass("loading")
      $("#output").html linkify(data)
      hljs.highlightBlock($("pre")[0], null, false)

$ ->
  $("#domain").html BASE
  load location.hash.substring(1)
        
  $("#query-form").on "submit", (e) ->
    e.preventDefault()
    location.hash = query = $("#query").val()
    load query
  # fires every time the hash changes so whenever the user clicks a link
  $(window).on "hashchange", () -> load location.hash.substring(1)
