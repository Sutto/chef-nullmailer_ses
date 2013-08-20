action :create do

  package "stunnel4" do
    action :install
  end

  package "nullmailer" do
    action :install
  end

  template "/etc/stunnel/stunnel-ses-tunnel.conf" do
    action    :create
    backup    false
    variables region: new_resource.region, port: new_resource.port
    source    "stunnel.conf.erb"
    owner     "root"
    group     "root"
    mode      "0644"
    cookbook  "nullmailer_ses"
  end

  file "/etc/nullmailer/adminaddr" do
    owner   "root"
    group   "root"
    mode    "0644"
    content new_resource.admin_email
    action  :create
  end

  template "/etc/nullmailer/remotes" do
    action    :create
    backup    false
    variables port: new_resource.port, user_name: new_resource.user_name, password: new_resource.password
    cookbook  "nullmailer_ses"
    source    "remotes.erb"
    owner     "root"
    group     "root"
    mode      "0644"
  end

  ruby_block "edit /etc/default/stunnel4" do
    block do
      rc = Chef::Util::FileEdit.new("/etc/default/stunnel4")
      rc.search_file_replace_line(/ENABLED=0/, "ENABLED=1")
      rc.write_file
    end
  end

  service "stunnel4" do
    provider Chef::Provider::Service::Init::Debian
    action   [:enable, :start]
  end

  new_resource.updated_by_last_action true
end