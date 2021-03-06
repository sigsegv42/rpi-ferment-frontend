# rpi-ferment-frontend
# Copyright(c) Joshua Farr <j.wgasa@gmail.com>

ProfileCollectionView 	= require 'views/collections/ProfileCollectionView'
ProfileModel 			= require 'models/profileModel'
template 				= require 'views/templates/layouts/profilesLayout'

module.exports = class ProfilesLayout extends Backbone.Marionette.Layout
	template: template

	regions:
		profiles: "#profiles-table"

	initialize: (options) =>
		@app = options.application

		@app.vent.on 'Profiles:Loaded', () =>
			@showProfiles()

	showProfiles: () =>
		options =
			application: @app
			collection: @app.controller_.profiles_
		view = new ProfileCollectionView options
		@profiles.close()
		@profiles.show view
