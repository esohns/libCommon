/***************************************************************************
 *   Copyright (C) 2009 by Erik Sohns   *
 *   erik.sohns@web.de   *
 *                                                                         *
 *   This program is free software; you can redistribute it and/or modify  *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation; either version 2 of the License, or     *
 *   (at your option) any later version.                                   *
 *                                                                         *
 *   This program is distributed in the hope that it will be useful,       *
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of        *
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the         *
 *   GNU General Public License for more details.                          *
 *                                                                         *
 *   You should have received a copy of the GNU General Public License     *
 *   along with this program; if not, write to the                         *
 *   Free Software Foundation, Inc.,                                       *
 *   59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.             *
 ***************************************************************************/

#ifndef COMMON_TIMERHANDLER_H
#define COMMON_TIMERHANDLER_H

#include "ace/Global_Macros.h"
#include "ace/Event_Handler.h"
#include "ace/Time_Value.h"

#include "common_exports.h"

// forward declarations
class Common_ITimer;

class Common_Export Common_TimerHandler
 : public ACE_Event_Handler
{
 public:
  Common_TimerHandler (Common_ITimer*, // dispatch interface
                       bool = false);  // invoke only once ?
  virtual ~Common_TimerHandler ();

  // implement specific behaviour
  virtual int handle_timeout (const ACE_Time_Value&, // current time
                              const void*);          // asynchronous completion token

 private:
  typedef ACE_Event_Handler inherited;

  ACE_UNIMPLEMENTED_FUNC (Common_TimerHandler ())
  ACE_UNIMPLEMENTED_FUNC (Common_TimerHandler (const Common_TimerHandler&))
  ACE_UNIMPLEMENTED_FUNC (Common_TimerHandler& operator= (const Common_TimerHandler&))

  Common_ITimer* interfaceHandle_;
  bool           isOneShot_;
};

#endif