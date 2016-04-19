---
-- src/actions/xcode/xcode_workspace.lua
-- Generate an Xcode workspace.
-- Author Mihai Sebea
-- Modified by Jason Perkins
-- Copyright (c) 2014-2015 Jason Perkins and the Premake project
---

	local p = premake
	local xcode = p.xcode



---
-- Generate an Xcode contents.xcworkspacedata file.
---

	xcode.elements.workspace = function(wks)
		return {
			xcode.xmlDeclaration,
			xcode.workspace,
			xcode.workspaceFileRefs,
			xcode.workspaceTail,
		}
	end

	function xcode.generateWorkspace(wks)
		xcode.prepareWorkspace(wks)
		p.callArray(xcode.elements.workspace, wks)
	end


	function xcode.workspace()
		p.push('<Workspace')
		p.w('version = "1.0">')
	end


	function xcode.workspaceTail()
		-- Don't output final newline.  Xcode doesn't.
		premake.out('</Workspace>')
	end


---
-- Generate the list of project references.
---

	xcode.elements.workspaceFileRef = function(prj)
		return {
			xcode.workspaceLocation,
		}
	end

	function xcode.workspaceFileRefs(wks)
		for prj in p.workspace.eachproject(wks) do
			p.push('<FileRef')
			local contents = p.capture(function()
				p.callArray(xcode.elements.workspaceFileRef, prj)
			end)
			p.outln(contents .. ">")
			p.pop('</FileRef>')
		end
	end



---------------------------------------------------------------------------
--
-- Handlers for individual project elements
--
---------------------------------------------------------------------------


	function xcode.workspaceLocation(prj)
		local fname = p.filename(prj, ".xcodeproj")
		fname = path.getrelative(prj.workspace.location, fname)
		p.w('location = "group:%s"', fname)
	end


	function xcode.xmlDeclaration()
		p.xmlUtf8(true)
	end
