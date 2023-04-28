
function testJs(cardNumber, dueMonth, dueYear, ccv) {
    console.log('Huang testJs')
    console.log('Huang cardNumber='+cardNumber)
    console.log('Huang dueMonth='+dueMonth)
    console.log('Huang dueYear='+dueYear)
    console.log('Huang ccv='+ccv)

    let token = cardNumber+dueMonth+dueYear+ccv

    return token
}

//async function testJs1() {
//    console.log('Huang testJs1')
//    TPDirect.setupSDK(128440, "app_zmKrS6E5uYovLqElf5AawqRJ9wFJ6rXXUdxDiad8A4OqyTXpsjdzTRtvs5aT", "sandbox")
//
//    return token
//}

const tappayModule = {
    testJs
};

export { tappayModule };