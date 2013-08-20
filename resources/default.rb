actions :create

attribute :admin_email, kind_of: String, name_attribute: true
attribute :region,      kind_of: String, default: "us-east-1"
attribute :user_name,   kind_of: String, required: true
attribute :password,    kind_of: String, required: true
attribute :port,        kind_of: Fixnum, default: 2525


def initialize(*args)
  super
  @action = :create
end