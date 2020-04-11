const axios = require('axios');
async function fetchAWSJokeApart(){
    const res = await axios.get("https://588b0wd7f6.execute-api.us-east-2.amazonaws.com/production", { params:{}, headers: { } });
    if(res){
        if(res.status === 200){
            return res.data
        }
        return "Failed to hit AWS"
    }
}
module.exports = {
    fetchAWSJokeApart
};