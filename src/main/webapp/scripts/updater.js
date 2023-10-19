function parseForm(){
    if(!validator.validateAll()) {
        console.log("Wrong data!")
        return
    }
    sendPoint(
        validator.lastClickedX,
        document.getElementById("Y-input").value,
        validator.lastClickedR
    )
}

function sendPoint(x, y, r){
    $.ajax({
        type: "POST",
        url: "controller-servlet",
        dataType: "json",
        async: false,
        data: {
            "X": parseInt(x),
            "Y": y,
            "R": r,
            "timezone": - new Date().getTimezoneOffset()
        }
    });
}