$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them
  $('#submit_new').on("submit", function(e){
    e.preventDefault()

    formData = $(this).serialize()
    $.ajax({
      url: this.action,
      type: this.method,
      data: formData
    }).done(function(serverData){
      console.log("GREAT SUCCESS!!!")
      console.log(serverData);
      $('#question_list').append(serverData)
    })
  })
  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
});
