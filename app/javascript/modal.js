$(document).on("click", "#point", function(e){
  e.preventDefault();
  $(this).siblings().fadeIn();
});

$(document).click(function(event){
  var target = $(event.target);
  if(target.hasClass('modal-back')) {
      target.fadeOut();
  }
});
