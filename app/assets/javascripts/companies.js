$(document).ready(function() {

$(".search_companies").click( function() {
  console.log("WORK YOU POS");
  console.log($('.company_search').val())
  $.ajax({
    url: "/companies_search",
    dataType: "script",
    type: "GET",
    data: {q: $('.company_search').val()}
  })
})
})