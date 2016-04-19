---
-- xcode/xcode.lua
-- Common support code for the Apple Xcode exporters.
-- Copyright (c) 2009-2015 Jason Perkins and the Premake project
---

	local p = premake

	p.modules.xcode = {}

	local m = p.modules.xcode
	m._VERSION = p._VERSION
	m.elements = {}

	include("xcode_common.lua")
	include("xcode_project.lua")
	include("xcode_workspace.lua")

	return m
