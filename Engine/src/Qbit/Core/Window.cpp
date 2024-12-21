#include "qbpch.h"
#include "Qbit/Core/Window.h"

/* 
* WindowsWindow class is not actually for windows os.
* In the early development, Qbit only supported windows for fast integration.
* But naming stayed the same, it does not include any windows os specific code.
*/


#ifdef QB_PLATFORM_WINDOWS
#include "Platform/Windows/WindowsWindow.h"
#else
#include "Platform/Windows/WindowsWindow.h"
#endif



namespace Qbit
{
	Scope<Window> Window::Create(const WindowProps& props)
	{
#ifdef QB_PLATFORM_WINDOWS
		return CreateScope<WindowsWindow>(props);
#else
		return CreateScope<WindowsWindow>(props);
#endif
	}

}