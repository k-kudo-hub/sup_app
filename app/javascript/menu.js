$(document).on("click", ".header-right", function(e){
  e.preventDefault();
  $(this).next().delay().fadeIn();
  $(this).addClass("open")
});

$(document).on("click",".open", function(e){
  e.preventDefault();
  $(this).next().delay().fadeOut();
  $(this).removeClass("open");
  });