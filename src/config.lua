--- Parse a config file into table variables for configuration
-- @module config
-- @author Moltin Ltd

local config = {}
local params = {}

--- Parse a file for some config variables
-- @param path string The path of the conifg file to parse
-- @return table connection parameters
function config.parse(path)
    -- Open file
    fp = io.open(path, "r" )

    -- Drop comments
    for line in fp:lines() do
        line = line:match( "%s*(.+)" )
        if line and line:sub( 1, 1 ) ~= "#" and line:sub( 1, 1 ) ~= ";" then
            option = line:match( "%S+" ):lower()
            value  = line:match( "%S*%s*(.*)" )

            if not value then
                params[option] = true
            else
                if not value:find( "," ) then
                    params[option] = value
                else
                    value = value .. ","
                    params[option] = {}
                    for entry in value:gmatch( "%s*(.-)," ) do
                        params[option][#params[option]+1] = entry
                    end
                end
            end
        end
    end
    fp:close()
    return params
end

--- Load environment variables
-- @return table connection parameters
function config.loadEnvironmentVariables()
    params['oauth2_ip'] = os.getenv("OAUTH2_IP")
    params['oauth2_port'] = os.getenv("OAUTH2_PORT")
    params['postgres_ip'] = os.getenv("POSTGRES_IP")
    params['postgres_port'] = os.getenv("POSTGRES_PORT")
    params['postgres_database'] = os.getenv("POSTGRES_DATABASE")
    params['postgres_user'] = os.getenv("POSTGRES_USER")
    params['postgres_password'] = os.getenv("POSTGRES_PASSWORD")
    return params
end

return config
