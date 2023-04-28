
async function testJs() {
    console.log('Hello JS')

    TPDirect.setupSDK(128440, "app_zmKrS6E5uYovLqElf5AawqRJ9wFJ6rXXUdxDiad8A4OqyTXpsjdzTRtvs5aT", 'sandbox')
    const token = await new Promise((resolve, reject) => {

       TPDirect.plusPay.getPrime(function(error, result) {
            console.log('result='+JSON.stringify(result, null, 4))
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