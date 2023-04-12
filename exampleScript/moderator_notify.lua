bot = getBot()

local webHookURL = "";

function sendWebhook(text, WebHook)
    RequestINFO = {}
    RequestINFO.url = WebHook
    RequestINFO.method = POST
    RequestINFO.postData = "content=" .. text
    x = httpReq(RequestINFO)
    if x.success then
        log("Response Body : ", x.body)
        log("Response Http Status Code : ", x.httpCode)
    else
        log("Request Failed Error Msg : ", x.failInfo)
    end
end

function modDetector(guardian)
    if guardian then
        local text = "A Guardian has joined the world";
        sendWebhook(text, webHookURL);
        msgBox("Detector", text)
    else
        local text = "A Moderator has joined the world";
        sendWebhook(text, webHookURL);
        msgBox("Detector", text)
    end
end

bot:addHook(modDetector, moderatorJoined)
