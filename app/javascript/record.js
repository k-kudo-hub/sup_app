//中項目の選択肢を定義
$(document).on("change", "#major-id", function() {
  let majorId = $('#major-id').val();
  if (majorId != 1){
    $('.main-default').val('');
    $('.main-default option').css('display', 'block');
    $('#main-item').css('display', 'block');
  
    if(majorId == 2) {
      $('.main-default option[value]').each(function(i) {
        if (i>=12 || i<=1) {
          $('.main-default option[value = ' +(i)+ ']').css('display', 'none');
        }
      });
    } else if(majorId == 3) {
      $('.main-default option[value]').each(function(i) {
        if (i<22 || 28<i) {
          $('.main-default option[value = ' +(i)+ ']').css('display', 'none');
        }
      });
    } else if(majorId == 4) {
      $('.main-default option[value]').each(function(i) {
        if (i<12 || 21<i) {
          $('.main-default option[value = ' +(i)+ ']').css('display', 'none');
        }
      });
    } else if(majorId == 5) {
      $('.main-default option[value]').each(function(i) {
        if (i<28 || 35<i) {
          $('.main-default option[value = ' +(i)+ ']').css('display', 'none');
        }
      });
    }
  }
});

//小項目の選択肢を定義
$(document).on("change", "#main-id", function() {
  let mainId = $('#main-id').val();
  if (mainId != 1){
    $('.sub-default').val('');
    $('.sub-default option').css('display', 'block');
    $('#sub-item').css('display', 'block');
  
    if(mainId == 2) {
      $('.sub-default option[value]').each(function(i) {
        if (i<2 || 10<i) {
          $('.sub-default option[value = ' +(i)+ ']').css('display', 'none');
        }
      });
    } else if(mainId == 3) {
      $('.sub-default option[value]').each(function(i) {
        if (i<11 || 16<i) {
          $('.sub-default option[value = ' +(i)+ ']').css('display', 'none');
        }
      });
    }  else if(mainId == 4) {
      $('.sub-default option[value]').each(function(i) {
        if (i<23 || 29<i) {
          $('.sub-default option[value = ' +(i)+ ']').css('display', 'none');
        }
      });
    } else if(mainId == 5) {
      $('.sub-default option[value]').each(function(i) {
        if (i<17 || 22<i) {
          $('.sub-default option[value = ' +(i)+ ']').css('display', 'none');
        }
      });
    }else if(mainId == 6) {
      $('.sub-default option[value]').each(function(i) {
        if (i<30 || 34<i) {
          $('.sub-default option[value = ' +(i)+ ']').css('display', 'none');
        }
      });
    } else if(mainId == 7) {
      $('.sub-default option[value]').each(function(i) {
        if (i<35 || 40<i) {
          $('.sub-default option[value = ' +(i)+ ']').css('display', 'none');
        }
      });
    } else if(mainId == 8) {
      $('.sub-default option[value]').each(function(i) {
        if (i<41 || 44<i) {
          $('.sub-default option[value = ' +(i)+ ']').css('display', 'none');
        }
      });
    } else if(mainId == 9) {
      $('.sub-default option[value]').each(function(i) {
        if (i<45 || 50<i) {
          $('.sub-default option[value = ' +(i)+ ']').css('display', 'none');
        }
      });
    } else if(mainId == 10) {
      $('.sub-default option[value]').each(function(i) {
        if (i<51 || 57<i) {
          $('.sub-default option[value = ' +(i)+ ']').css('display', 'none');
        }
      });
    } else if(mainId == 11) {
      $('.sub-default option[value]').each(function(i) {
        if (i<2 || 57<i) {
          $('.sub-default option[value = ' +(i)+ ']').css('display', 'none');
        }
      });
    } else if(mainId == 12) {
      $('.sub-default option[value]').each(function(i) {
        if (i<58 || 63<i) {
          $('.sub-default option[value = ' +(i)+ ']').css('display', 'none');
        }
      });
    } else if(mainId == 13) {
      $('.sub-default option[value]').each(function(i) {
        if (i<64 || 68<i) {
          $('.sub-default option[value = ' +(i)+ ']').css('display', 'none');
        }
      });
    } else if(mainId == 14) {
      $('.sub-default option[value]').each(function(i) {
        if (i<69 || 73<i) {
          $('.sub-default option[value = ' +(i)+ ']').css('display', 'none');
        }
      });
    } else if(mainId == 15) {
      $('.sub-default option[value]').each(function(i) {
        if (i<74 || 79<i) {
          $('.sub-default option[value = ' +(i)+ ']').css('display', 'none');
        }
      });
    } else if(mainId == 16) {
      $('.sub-default option[value]').each(function(i) {
        if (i<80 || 81<i) {
          $('.sub-default option[value = ' +(i)+ ']').css('display', 'none');
        }
      });
    } else if(mainId == 17) {
      $('.sub-default option[value]').each(function(i) {
        if (i<82 || 87<i) {
          $('.sub-default option[value = ' +(i)+ ']').css('display', 'none');
        }
      });
    } else if(mainId == 18) {
      $('.sub-default option[value]').each(function(i) {
        if (i<88 || 90<i) {
          $('.sub-default option[value = ' +(i)+ ']').css('display', 'none');
        }
      });
    } else if(mainId == 20) {
      $('.sub-default option[value]').each(function(i) {
        if (i<91 || 94<i) {
          $('.sub-default option[value = ' +(i)+ ']').css('display', 'none');
        }
      });
    } else if(mainId == 21) {
      $('.sub-default option[value]').each(function(i) {
        if (i<95 || 95<i) {
          $('.sub-default option[value = ' +(i)+ ']').css('display', 'none');
        }
      });
    } else if(mainId == 22) {
      $('.sub-default option[value]').each(function(i) {
        if (i<96 || 105<i) {
          $('.sub-default option[value = ' +(i)+ ']').css('display', 'none');
        }
      });
    } else if(mainId == 23) {
      $('.sub-default option[value]').each(function(i) {
        if (i<106 || 109<i) {
          $('.sub-default option[value = ' +(i)+ ']').css('display', 'none');
        }
      });
    } else if(mainId == 24) {
      $('.sub-default option[value]').each(function(i) {
        if (i<110 || 113<i) {
          $('.sub-default option[value = ' +(i)+ ']').css('display', 'none');
        }
      });
    } else if(mainId == 25) {
      $('.sub-default option[value]').each(function(i) {
        if (i<114 || 117<i) {
          $('.sub-default option[value = ' +(i)+ ']').css('display', 'none');
        }
      });
    } else if(mainId == 26) {
      $('.sub-default option[value]').each(function(i) {
        if (i<118 || 121<i) {
          $('.sub-default option[value = ' +(i)+ ']').css('display', 'none');
        }
      });
    } else if(mainId == 27) {
      $('.sub-default option[value]').each(function(i) {
        if (i<122 || 126<i) {
          $('.sub-default option[value = ' +(i)+ ']').css('display', 'none');
        }
      });
    } else if(mainId == 28) {
      $('.sub-default option[value]').each(function(i) {
        if (i<127 || 127<i) {
          $('.sub-default option[value = ' +(i)+ ']').css('display', 'none');
        }
      });
    } else if(mainId == 29) {
      $('.sub-default option[value]').each(function(i) {
        if (i<128 || 130<i) {
          $('.sub-default option[value = ' +(i)+ ']').css('display', 'none');
        }
      });
    } else if(mainId == 30) {
      $('.sub-default option[value]').each(function(i) {
        if (i<131 || 134<i) {
          $('.sub-default option[value = ' +(i)+ ']').css('display', 'none');
        }
      });
    } else if(mainId == 31) {
      $('.sub-default option[value]').each(function(i) {
        if (i<135 || 140<i) {
          $('.sub-default option[value = ' +(i)+ ']').css('display', 'none');
        }
      });
    } else if(mainId == 32) {
      $('.sub-default option[value]').each(function(i) {
        if (i<141 || 144<i) {
          $('.sub-default option[value = ' +(i)+ ']').css('display', 'none');
        }
      });
    } else if(mainId == 33) {
      $('.sub-default option[value]').each(function(i) {
        if (i<145 || 149<i) {
          $('.sub-default option[value = ' +(i)+ ']').css('display', 'none');
        }
      });
    } else if(mainId == 34) {
      $('.sub-default option[value]').each(function(i) {
        if (i<150 || 150<i) {
          $('.sub-default option[value = ' +(i)+ ']').css('display', 'none');
        }
      });
    } else if(mainId == 35) {
      $('.sub-default option[value]').each(function(i) {
        if (i<151 || 157<i) {
          $('.sub-default option[value = ' +(i)+ ']').css('display', 'none');
        }
      });
    }
  }
});
