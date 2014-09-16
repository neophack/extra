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

module("luci.controller.shadowsocks", package.seeall)

function index()
	
	if not nixio.fs.access("/etc/config/shadowsocks") then
		return
	end

	local page
	page = entry({"admin", "proxy", "shadowsocks"}, cbi("shadowsocks"), _("shadowsocks"), 45)
	page.i18n = "shadowsocks"
	page.dependent = true
end
