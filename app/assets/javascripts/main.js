var ready;
ready = function () {
    $('form#new_user').on('submit',function(){
        alert('hello')
        if($('#user_email').val() == ""){
            $('#user_email').css('border','1px solid red')
            return false;
        }

        if($('#user_password').val() == ""){
            $('#user_password').css('border','1px solid red')
            return false;
        }
    });
};

$(document).ready(ready);
$(document).on('page:load', ready);
$(document).on('turbolinks:render', ready);