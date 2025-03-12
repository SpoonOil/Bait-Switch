/// @description Insert description here
// You can write your code in this editor


function checkCodeValidity(code) {
    var validCodes = ["IVANKOBE", "DEBUG", "IMGAY", "BEEG", "RORY", "BADZOO", "GHOOL", "SHANNONR", "ZOEZAP", "SHRIMP12", "DOH", "GOED", "11101969", "EVYN", "JON", "EMORY", "IANBROWN", "MOUSE", "RISKYSPR", "JACKCRAW", "CRASH", "CANTSPEL", "BADCOST", "WALNUTS", "KASEM", "BIXBY", "YOGI"]
    for (var _i = 0; _i < array_length(validCodes); _i++) {
        if (validCodes[_i] == code) {
            return true
        }
    }
    return false
}

valid = checkCodeValidity(codeText)

if (valid) {
    if (!array_contains(global.usedCodes, codeText)) {
        array_push(global.usedCodes, codeText)
    }
    activateCode(codeText)
    markSuccess();
} else {
    codeText = "INVALID!"
    alarm[0] = 45
}