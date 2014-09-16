--[[
LuCI - Lua Configuration Interface

Copyright 2008 Steven Barth <steven@midlink.org>
Copyright 2014 HackPascal <hackpascal@gmail.com>

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

	http://www.apache.org/licenses/LICENSE-2.0

$Id$
]]--

m = Map("goagent", translate("GoAgent - IPv4 Settings"))


sih4 = m:section(NamedSection, "ipv4http", "ipv4http", translate("IPv4 HTTP Settings"), translate("Use \"|\" to seperate each site."))

o = sih4:option(Value, "crlfsites", translate("Sites using CrLf"))
o.template = "goagent/ipv4http_crlfsites"

o = sih4:option(Value, "withgae", translate("Sites using GAE Address"))
o.template = "goagent/ipv4http_withgae"

o = sih4:option(Value, "forcehttps", translate("Sites forced to use HTTPS"))
o.template = "goagent/ipv4http_forcehttps"

o = sih4:option(Value, "noforcehttps", translate("Sites forced not to use HTTPS"))
o.template = "goagent/ipv4http_noforcehttps"

o = sih4:option(Value, "fakehttps", translate("Sites using fake certificate"))
o.template = "goagent/ipv4http_fakehttps"

o = sih4:option(Value, "nofakehttps", translate("Sites not using fake certificate"))
o.template = "goagent/ipv4http_nofakehttps"


sihl4 = m:section(TypedSection, "ipv4hosts", translate("IPv4 Host Lists"),
	translate("The matched hosts will use CrLf and will use direct connection. If IP is specified, it will be used to resolve IP of host remotely. The IP field can be set to a single IP address or a name of IP Lists."))
sihl4.template  = "cbi/tblsection"
sihl4.addremove = true
sihl4.anonymous = true

o = sihl4:option(Value, "host", translate("Host/RegExp"))
o.width    = "50%"
o.template = "goagent/ipv4hosts_host"

o = sihl4:option(Value, "ip", translate("IP"))
o.width    = "30%"
o.template = "goagent/ipv4hosts_ip"

return m
