var ACCENT_BACKGROUND = "#00ADB5"
var MAIN_BACKGROUND = "#EEEEEE"

window.onload = function () {
    let validator = new Validator();
    let canvasPrinter = new CanvasPrinter();
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



}