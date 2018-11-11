#pragma once

#ifdef SLR_PLATFORM_WINDOWS

extern Solar::Application* Solar::CreateApplication();

int main(int argc, char** argv)
{
	auto app = Solar::CreateApplication();
	app->Run();
	delete app;
}

#endif
