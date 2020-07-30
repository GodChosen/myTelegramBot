//Get Environment Variable and set your message
var token = process.env['telegrambot1_API_key'];
var chat_id = process.env['telegrambot1_chat_id'];
var message = "Hi, this is cloud_titan! You're welcome to my channel.";

//Export the output of the function
module.exports = async function(context, req) {
    context.log('JavaScript HTTP trigger function processed a request.');

    // Define Variables
    var XMLHttpRequest = require("xmlhttprequest").XMLHttpRequest;
    var xhr = new XMLHttpRequest();
    var url = 'https://api.telegram.org/bot' + token + '/sendMessage';
    var data = JSON.stringify({
        "chat_id": chat_id,
        "text": message
    })

    // Send message to telegram channel
    xhr.open("POST", url, true);
    xhr.setRequestHeader('Content-Type', 'application/json');

    xhr.send(data);
    // Call and await an async method here
    return {
        body: "Success"
    };
}

//Access property for Logic App
function convertToDateString(request, response) {
    var data = request.body;
    response = {
        body: data.date.ToDateString()
    }
}