# Description:
#   Hubot script to call chat bot API.

module.exports = (robot) ->

  robot.hear /(.*)/i, (msg) ->
    statement = msg.match[1]
    uid = msg.message.user.id
    user_name = msg.message.user.real_name
    email = msg.message.user.email_address
    date = new Date
    url = process.env.CHAT_SERVER_URL

    robot.logger.info "uid: #{uid}"
    robot.logger.info "user_name: #{user_name}"
    robot.logger.info "email: #{email}"

    request = require('request')
    request.post
      url: url
      json:
        statement: statement 
        uid: uid
        situations:
          frameMalwareInfectionReport:
            slotDetectedTimestamp: date
            slotRepoterName: user_name
            slotRepoterEmailAddress: email
            slotMailTo: "security.leader@lab.ntt.co.jp" 
            slotMailCC: "jocho@lab.ntt.co.jp"
      , (err, res, body) ->
        bot_resp = body["response"].join("\n")
        if body["chips"]
          chips = body["chips"].join(", ")
          bot_resp = bot_resp + "\n" + "例：" + chips
        msg.send bot_resp 
