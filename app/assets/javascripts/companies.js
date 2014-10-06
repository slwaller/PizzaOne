$(document).ready(function() {

$(".get_companies").click( function() {
  $.ajax({
    url: "/ajax/companies",
    type: "GET",
    dataType: "script"
  })
})

$(".search_companies").click( function() {
  console.log("hi");
  console.log($('.company_search').val())
  $.ajax({
    url: "/companies",
    dataType: "script",
    type: "GET",
    data: {q: $('.company_search').val()}
  })
})
}