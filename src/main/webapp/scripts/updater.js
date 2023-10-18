function sendPoint(){
    if(!validator.validateAll()) console.log("Wrong data!")
    $.ajax({
        type: "POST",
        url: "controller-servlet",
        dataType: "json",
        async: false,
        data: {
            "X": validator.lastClickedX,
            "Y": document.getElementById("Y-input").value,
            "R": validator.lastClickedR,
            "timezone": new Date().getTimezoneOffset()
        },
        success: function (serverAnswer) {
            const jsonObject = JSON.parse(JSON.stringify(serverAnswer));
            document.getElementById("result-container").innerHTML = jsonObject.html;
        }
    });
}