
async function testJs(cardNumber, dueMonth, dueYear, ccv) {
    console.log('Huang testJs')
    console.log('Huang cardNumber='+cardNumber)
    console.log('Huang dueMonth='+dueMonth)
    console.log('Huang dueYear='+dueYear)
    console.log('Huang ccv='+ccv)

    TPDirect.setupSDK(128440, "app_zmKrS6E5uYovLqElf5AawqRJ9wFJ6rXXUdxDiad8A4OqyTXpsjdzTRtvs5aT", 'sandbox')
    const token = await new Promise((resolve, reject) => {

       TPDirect.plusPay.getPrime(function(error, result) {
            console.log('Huang result='+JSON.stringify(result, null, 4))
            let prime = result.prime.toString()
            resolve(prime)
        })
    });

    return token
}
const tappayModule = {
    testJs
};

export { tappayModule };