#include "Application.h"

#include "Solar/Events/ApplicationEvent.h"
#include "Solar/Log.h"


namespace Solar
{

	Application::Application()
	{
	}


	Application::~Application()
	{
	}

	void Application::Run()
	{
		WindowResizeEvent e(1280, 720);
		if (e.IsInCategory(EventCategoryApplication))
		{
			SLR_TRACE(e);
		}
		if (e.IsInCategory(EventCategoryInput))
		{
			SLR_TRACE(e);
		}

		while( true );
	}

}