$(document).on("click", "#point", function(e){
  e.preventDefault();
  $(this).parent().next().delay(500).fadeIn();
});

$(document).on("click", function(e){
  var target = $(e.target);
  if(target.hasClass('modal-back')) {
      target.fadeOut();
  }
});