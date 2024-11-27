local access = require "kong.plugins.kong-oidc-auth.access"


local KongOidcAuth = {
    PRIORITY = 1000,
    VERSION = "0.1",
}

function KongOidcAuth:access(conf)
	access.run(conf)
end

return KongOidcAuth
