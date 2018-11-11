#pragma once

#ifdef SLR_PLATFORM_WINDOWS

extern Solar::Application* Solar::CreateApplication();

int main(int argc, char** argv)
{
	Solar::Log::Init();
	SLR_CORE_WARN( "Initialized Log!" );
	int a = 5;
	SLR_INFO( "Hello! Var={0}", a );

	auto app = Solar::CreateApplication();
	app->Run();
	delete app;
}

#endif
