#
# Cookbook Name:: worthit-opsworks
# Recipe:: default
#
# Copyright (C) 2014 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#
cron_env = {"PATH" => "/usr/local/bin:$PATH"}

cron "update_product_prices" do
  minute '0'
  hour '4,12,20'
  user "deploy"
  #mailto "development@worthit.co"
  command "cd /srv/www/worthit_web/current && bundle exec rake update_product_prices"
end

cron "send_manually_added_price_report" do
  minute '10'
  hour '7'
  user "deploy"
  #mailto "development@worthit.co"
  command command "cd /srv/www/worthit_web/current && bundle exec rake send_manually_added_price_report"
end

cron "send_flagged_prices_report" do
  minute '15'
  hour '7'
  user "deploy"
  #mailto "development@worthit.co"
  command command "cd /srv/www/worthit_web/current && bundle exec rake send_flagged_prices_report"
end

cron "create_daily_metrics" do
  minute '00'
  hour '6'
  user "deploy"
  #mailto "development@worthit.co"
  command command "cd /srv/www/worthit_web/current && bundle exec rake create_daily_metrics"
end

cron "remove_old_site_product_prices" do
  minute '22'
  user "deploy"
  #mailto "development@worthit.co"
  command command "cd /srv/www/worthit_web/current && bundle exec rake remove_old_site_product_prices"
end