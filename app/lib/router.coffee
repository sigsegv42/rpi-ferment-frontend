application = require('application')
HomeLayout = require('views/HomeLayout')
ProfilesLayout = require('views/ProfilesLayout')

module.exports = class Router extends Backbone.Router

	routes:
		'': 'home'
		'profiles': 'profiles'

	home: =>
		home = new HomeLayout()
		application.layout.content.close()
		application.layout.content.show home
		if application.controller_.config_ isnt undefined
			home.createCollection application.controller_.config_

	profiles: =>
		options = 
			application: application
		profiles = new ProfilesLayout options
		application.layout.content.close()
		application.layout.content.show profiles
		profiles.showProfiles()
