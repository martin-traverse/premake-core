---
-- xcode/xcode.lua
-- Common support code for the Apple Xcode exporters.
-- Copyright (c) 2009-2015 Jason Perkins and the Premake project
---

	local p = premake

	p.modules.xcode = {}

	local m = p.modules.xcode
	m.elements = {}

	include("_preload.lua")
	include("xcode_common.lua")
	include("xcode4_workspace.lua")
	include("xcode_project.lua")

	return m
