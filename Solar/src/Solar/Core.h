#pragma once

#ifdef SLR_PLATFORM_WINDOWS
	#ifdef SLR_BUILD_DLL
		#define SOLAR_API __declspec(dllexport)
	#else
		#define SOLAR_API __declspec(dllimport)
	#endif
#else
	#error Solar only supports Windows!
#endif
