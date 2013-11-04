function User(data) {
  this.id = data.id;
  this.email = ko.observable(data.email);
  this.firstName = ko.observable(data.first_name);
  this.lastName = ko.observable(data.last_name);
  this.fullName = ko.computed(function() {
    return this.firstName() + " " + this.lastName();
  }, this);
  this.properties = ko.observableArray(data.properties);
}
