fx_version 'adamant'

game 'gta5'
author 'Hayden'
version '0.0.1'

server_scripts {
	'@async/async.lua',
	'@mysql-async/lib/MySQL.lua',
	'server/*.lua',
	'shared/*.lua'
}

client_scripts {
	'client/*.lua',
	'shared/*.lua'
}