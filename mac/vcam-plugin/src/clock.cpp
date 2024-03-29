/* Webcamoid, webcam capture application.
 * Copyright (C) 2017  Gonzalo Exequiel Pedone
 *
 * Webcamoid is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * Webcamoid is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with Webcamoid. If not, see <http://www.gnu.org/licenses/>.
 *
 * Web-Site: http://webcamoid.github.io/
 */

/******************************************************************************
Modifications Copyright (C) 2020 by Streamlabs (General Workings Inc)

04/20/2020: Rewrite partial and sometimes complete to fits the application needs

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.

******************************************************************************/

#include <CoreMediaIO/CMIOHardwareStream.h>

#include "clock.hpp"

Clock::Clock(const std::string &name, const CMTime getTimeCallMinimumInterval, UInt32 numberOfEventsForRateSmoothing, UInt32 numberOfAveragesForRateSmoothing,
	     void *parent)
	: m_parent(parent), m_clock(nullptr)
{
	auto nameRef = CFStringCreateWithCString(kCFAllocatorDefault, name.c_str(), kCFStringEncodingUTF8);

	auto status = CMIOStreamClockCreate(kCFAllocatorDefault, nameRef, this->m_parent, getTimeCallMinimumInterval, numberOfEventsForRateSmoothing,
					    numberOfAveragesForRateSmoothing, &this->m_clock);

	if (status != noErr)
		this->m_clock = nullptr;

	CFRelease(nameRef);
}

Clock::~Clock()
{
	if (this->m_clock) {
		CMIOStreamClockInvalidate(this->m_clock);
		CFRelease(this->m_clock);
	}
}

CFTypeRef Clock::ref() const
{
	return this->m_clock;
}
