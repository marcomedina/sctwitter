(function(document, window) {
  $( document ).ready(function() {
    $('#search-form').on('submit', function(f) {
      window.location.href = "/" + $('#twitter-username-input').val();
      return false;
    });
  });
})(document, window);

