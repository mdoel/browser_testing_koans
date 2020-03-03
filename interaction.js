$().ready(function () {
    setTimeout(function () {
        $("#delayed-text").html("Text added by jQuery.");
    }, 3000);

    $("#testform").submit(function(event) {
        option1Checked = $('#option-1').prop("checked");
        option2Checked = $('#option-2').prop("checked");
        if(option1Checked && option2Checked) {
            result = "Both options are chosen";
        } else if(option1Checked) {
            result = "Option 1 chosen";
        } else if(option2Checked) {
            result = "Option 2 chosen";
        } else {
            result = "No options chosen"
        }
        $("#result-checkboxes").html(result);
        $("#result-text").html($('#textentry').val());
        event.preventDefault();
    });
});

function loadItDynamically() {
    $("#load-me-dynamically").html("You loaded it.")
}