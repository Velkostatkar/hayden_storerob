fx_version 'cerulean'

game 'gta5'
author 'Hayden'
version '0.0.1'

shared_scripts {
	'shared/*.lua'
}

server_scripts {
	'server/*.lua',
}

client_scripts {
	'client/*.lua',
}

dependencies {
	'es_extended',
	'mythic_notify'
}