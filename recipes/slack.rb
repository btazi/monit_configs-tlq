template "/etc/monit/slack.rb" do
  owner "root"
  group "root"
  mode "0700"
	source "slack.rb.erb"
  notifies :run, "execute[restart-monit]", :immediately
end

execute "restart-monit" do
  command "initctl reload-configuration"
  command "monit reload"
  action :nothing
end
