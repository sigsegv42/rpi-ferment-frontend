# rpi-ferment-frontend
# Copyright(c) Joshua Farr <j.wgasa@gmail.com>

ProfileView = require 'views/ProfileView'

module.exports = class ProfileCollectionView extends Backbone.Marionette.CollectionView
	tagName: 'div'
	itemView: ProfileView

	itemViewOptions: (model, index) ->
		options =
			application: @app
		options

	initialize: (options) =>
		@app = options.application
		@app.vent.on 'Profile:Modified', () =>
			@collection.fetch
				add: true
				success: () =>
					@render()