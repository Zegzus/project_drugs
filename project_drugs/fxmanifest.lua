fx_version 'adamant'

game 'gta5'

description 'METHLAB'

version 'PF 2.0'

author '!Hexus#2915'

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'@es_extended/locale.lua',
	'server/*.lua'
}

client_scripts {
	'@es_extended/locale.lua',
	'client/*.lua',
}

dependencies {
	'es_extended'
}
