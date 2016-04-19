---
-- src/actions/xcode/xcode.lua
-- Common support code for the Apple Xcode exporters.
-- Copyright (c) 2009-2015 Jason Perkins and the Premake project
---

	local p = premake

	p.xcode = {}

	local xcode = p.xcode
	xcode._VERSION = p._VERSION
	xcode.elements = {}

	include("xcode_common.lua")
	include("xcode_project.lua")
	include("xcode_workspace.lua")
