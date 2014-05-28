(function() {
  $(function() {
    return $('#contact-form').on('valid', function(e) {
      var failureHandler, field, formData, successHandler, _i, _len, _ref;
      e.preventDefault();
      formData = {};
      _ref = $(this).serializeArray();
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        field = _ref[_i];
        formData[field['name']] = field['value'];
      }
      successHandler = (function(_this) {
        return function(response) {
          var successAlert;
          window.response = response;
          console.log(response);
          if (response === 200) {
            successAlert = $('<div data-alert class="alert-box success radius"> Message sent! We will be in touch with you shortly. <a href="#" class="close">&times;</a> </div>');
            $(_this).append(successAlert).foundation();
            $(_this).unbind('submit');
            return $(_this).submit(function() {
              return false;
            });
          } else {
            return failureHandler();
          }
        };
      })(this);
      failureHandler = (function(_this) {
        return function(response) {
          var failureAlert;
          console.log(response);
          failureAlert = $('<div data-alert class="alert-box alert radius"> Something went wrong. Please try again. <a href="#" class="close">&times;</a> </div>');
          return $(_this).append(failureAlert).foundation();
        };
      })(this);
      $.ajax({
        method: 'POST',
        data: formData,
        url: 'http://matthewjesuele.com/kdj/mailer.php',
        success: successHandler,
        error: failureHandler
      });
      return false;
    });
  });

}).call(this);
