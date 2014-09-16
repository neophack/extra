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

module("luci.controller.redsocks2", package.seeall)

function index()

	local page
	page = entry({"admin", "proxy", "redsocks2"}, cbi("redsocks2"), _("redsocks2"), 50)
	page.i18n = "redsocks2"
	page.dependent = true
end
