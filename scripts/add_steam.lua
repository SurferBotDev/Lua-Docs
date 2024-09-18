-- Define account and proxy strings
local account_strings = {
    "email:password",            -- Without secretKey
    "email:password:secretKey"   -- With secretKey
}

local proxy_strings = {
    "ip:port:username:pass"
}

-- Table to store processed Steam accounts
local steam_accounts = {}

-- Function to parse account string and create account object
local function createAccount(account_string, proxy)
    local email, password, secretKey = account_string:match("([^:]+):([^:]+):?(.*)") -- secretKey is optional
    return {
        type = STEAM,
        mail = email,
        password = password,
        secretKey = secretKey or "",
        proxy = proxy,
        connect = true
    }
end

-- Populate steam_accounts with parsed account data
for i, account_string in ipairs(account_strings) do
    local proxy = proxy_strings[(i - 1) % #proxy_strings + 1]
    local account = createAccount(account_string, proxy)
    table.insert(steam_accounts, account)
end

-- Add bots using the processed accounts
for _, account in ipairs(steam_accounts) do
    addBot(account)
    sleep(10000)
end
