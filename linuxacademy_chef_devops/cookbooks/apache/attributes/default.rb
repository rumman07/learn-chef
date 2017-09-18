default["apache"]["sites"]["rumman3"] = { "site_title" => "Rumman3s website is coming soon", "port" => 80, "domain" => "rumman3.mylabserver.com" }
default["apache"]["sites"]["rumman3b"] = { "site_title" => "Rumman2b website is coming soon", "port" => 80, "domain" => "rumman3b.mylabserver.com" }
default["apache"]["sites"]["rumman4"] = { "site_title" => "rumman4 website", "port" => 80, "domain" => "rumman4.mylabserver.com" }

case node["platform"]
when "centos"
  default["apache"]["package"] = "httpd"
when "ubuntu"
  default["apache"]["package"] = "apache2"
end 
