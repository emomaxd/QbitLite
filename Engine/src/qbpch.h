#pragma once

#define QB_PROFILE_FUNCTION()
#define QB_PROFILE_SCOPE(X)
#define QB_PROFILE_BEGIN_SESSION(X, Y)
#define QB_PROFILE_END_SESSION()

#include <iostream>
#include <memory>
#include <utility>
#include <algorithm>
#include <functional>

#include <string>
#include <sstream>
#include <array>
#include <vector>
#include <unordered_map>
#include <unordered_set>

#include "Qbit/Core/Base.h"
#include "Qbit/Core/Log.h"


#ifdef WIN32
#include <Windows.h>
#endif