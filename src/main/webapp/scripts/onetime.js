const ACCENT_BACKGROUND = "#00ADB5";
const MAIN_BACKGROUND = "#EEEEEE";

const validator = new Validator();
window.onload = function () {
    const canvasPrinter = new CanvasPrinter();
    canvasPrinter.drawStartImage()
    document.querySelectorAll('input[class="X-button"]').forEach(button => {
        button.addEventListener('click', () => {
            document.querySelectorAll('input[class="X-button"]').forEach(button =>{
                button.style.backgroundColor = MAIN_BACKGROUND
            })
            button.style.backgroundColor = ACCENT_BACKGROUND
            validator.lastClickedX = button;
        })
    })

    document.querySelector("input[type=text]")
        .addEventListener("focusout", validator.validateY);

    document.querySelectorAll('input[name="R-radio-group"]').forEach(radio => {
        radio.addEventListener('click', () => {
            canvasPrinter.redrawAll(radio.value)
        })
        validator.lastClickedR = radio;
    })

    $.ajax({
        type: "POST",
        url: "controller-servlet",
        dataType: "json",
        async: false,
        data: {
            "X": 1,
            "Y": 1,
            "R": 1,
            "timezone": new Date().getTimezoneOffset()
        },
        success: function (serverAnswer) {
            const jsonObject = JSON.parse(JSON.stringify(serverAnswer));
            document.getElementById("result-container").innerHTML = jsonObject.html;
        }
    });

}