$('.form-check-input').each(
    function() {
        $(this).closest('form').submit(function() {
            var valuesToSubmit = $(this).serialize();
            $.ajax({
                type: "PATCH",
                url: $(this).attr('action'), //sumbits it to the given url of the form
                data: valuesToSubmit,
                dataType: "JSON" // you want a difference between normal and ajax-calls, and json is standard
            }).success(function(json){
                console.log("success", json);
            });
            return false; // prevents normal behaviour
        });
        $(this).on('click', function () {
            console.log("test");
            $(this).closest('form').submit();
        });
    }
);
