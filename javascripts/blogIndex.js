(function() {
  $(function() {
    var loadMore;
    loadMore = $('<p>').css('textAlign', 'center').append('<a href="#" class="load-more-articles">Load more articles</a>');
    $('.article-summary-group').hide();
    $('#content').append(loadMore);
    $('.load-more-articles').click(function() {
      $('.article-summary-group:hidden').first().show();
      if ($('.article-summary-group:hidden').length === 0) {
        $(this).hide();
      }
      return false;
    });
    return $('.load-more-articles').trigger('click');
  });

}).call(this);
