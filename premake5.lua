workspace "Solar"
	architecture "x64"

	configurations
	{
		"Debug",
		"Release",
		"Dist"
	}

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

project "Solar"
	location "Solar"
	kind "SharedLib"
	language "C++"

	targetdir("bin/" .. outputdir .. "/%{prj.name}")
	objdir("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}

	includedirs
	{
		"%{prj.name}/src",
		"%{prj.name}/vendor/spdlog/include"
	}

	filter "system:windows"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "latest"

		defines
		{
			"SLR_PLATFORM_WINDOWS",
			"SLR_BUILD_DLL"
		}

		postbuildcommands
		{
			("{COPY} %{cfg.buildtarget.relpath} ../bin/" .. outputdir .. "/SandBox")
		}

	filter "configurations:Debug"
		defines "SLR_DEBUG"
		symbols "On"

	filter "configurations:Release"
		defines "SLR_RELEASE"
		optimize "On"

	filter "configurations:Dist"
		defines "SLR_DIST"
		symbols "On"

project "SandBox"
	location "SandBox"
	kind"ConsoleApp"
	language "C++"

	targetdir("bin/" .. outputdir .. "/%{prj.name}")
	objdir("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}

	includedirs
	{
		"Solar/vendor/spdlog/include",
		"Solar/src"
	}

	links
	{
		"Solar"
	}

	filter "system:windows"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "latest"

		defines
		{
			"SLR_PLATFORM_WINDOWS"
		}

	filter "configurations:Debug"
		defines "SLR_DEBUG"
		symbols "On"

	filter "configurations:Release"
		defines "SLR_RELEASE"
		optimize "On"

	filter "configurations:Dist"
		defines "SLR_DIST"
		symbols "On"