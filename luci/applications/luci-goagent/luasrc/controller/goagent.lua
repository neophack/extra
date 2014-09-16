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

require("luci.sys")

module("luci.controller.goagent", package.seeall)

function index()
	if not nixio.fs.access("/etc/config/goagent") then
		return
	end

	entry({"admin", "proxy", "goagent"},
		alias("admin", "proxy", "goagent", "general"),
		_("GoAgent"))

	entry({"admin", "proxy", "goagent", "general"},
		cbi("goagent/general"),
		_("General Settings"), 10).leaf = true

	entry({"admin", "proxy", "goagent", "ipv4"},
		cbi("goagent/ipv4"),
		_("IPv4 Settings"), 20).leaf = true

	entry({"admin", "proxy", "goagent", "ipv6"},
		cbi("goagent/ipv6"),
		_("IPv6 Settings"), 30).leaf = true

	entry({"admin", "proxy", "goagent", "misc"},
		cbi("goagent/misc"),
		_("Miscellaneous Settings"), 40).leaf = true

	entry({"admin", "proxy", "goagent", "extern"},
		cbi("goagent/extern"),
		_("External Settings"), 50).leaf = true

	entry({"admin", "proxy", "goagent", "hosts"},
		cbi("goagent/hosts"),
		_("Hosts File"), 60).leaf = true

	entry({"admin", "proxy", "goagent", "certificate"},
		cbi("goagent/certificate"),
		_("Certificate Settings"), 70).leaf = true

	entry({"admin", "proxy", "goagent", "pac"},
		cbi("goagent/pac"),
		_("Custom PAC file"), 80).leaf = true
end
