Template.notifications.helpers
	notifications: ->
		Notifications.find
			userId: Meteor.userId()
			read: false
	notificationCount: ->
		selector =
			userId: Meteor.userId()
			read: false
		counter = Notifications.find selector
		counter.count()

Template.notificationItem.helpers
	notificationPostPath: ->
		Router.routes.postPage.path
			_id: this.postId

Template.notificationItem.events
	'click a': ->
		Notifications.update this._id,
			$set:
				read: true
