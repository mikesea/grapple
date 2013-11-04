function UserViewModel() {
  var self = this;
  self.users = ko.observableArray([]);
  self.selectedUser = ko.observable();
  self.isPropertyFormVisible = ko.observable(false);

  self.showUser = function(user) {
    self.selectedUser(user);
  }

  self.showPropertyForm = function() {
    self.isPropertyFormVisible(true);
  }

  self.hidePropertyForm = function() {
    self.isPropertyFormVisible(false);
  }

  self.updateUser = function(form) {
    $.ajax({
      url: '/api/users/' + this.id,
      type: 'put',
      data: $(form).serialize()
    }).done( function(data) {
      self.notify("The user was saved successfully!")
    })
  }

  self.deleteUserProperty = function() {
    var property = this;

    $.ajax({
      url: '/api/properties/' + property.id,
      type: 'delete'
    }).done( function() {
      self.selectedUser().properties.remove(property);
      self.notify("The property was deleted successfully!")
    })
  }

  self.createUserProperty = function(form) {
    $.ajax({
      url: '/api/properties',
      type: 'post',
      data: $(form).serialize()
    }).done( function(data) {
      self.selectedUser().properties.push(data);
      self.isPropertyFormVisible(false);
      form.reset();
      self.notify("The property was created successfully!")
    }).fail( function(data) {
      self.notify("There was a problem creating the property. Please try again.")
    })
  }

  self.notify = function(message) {
    $("#notifications p").text(message);
  }
  
  $.getJSON("/api/users", function(users) {
    var mappedUsers = $.map(users, function(user) { return new User(user) });
    self.users(mappedUsers);
  });
}
