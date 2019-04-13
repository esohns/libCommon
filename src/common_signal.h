﻿/***************************************************************************
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

#ifndef COMMON_SIGNAL_H
#define COMMON_SIGNAL_H

#include <map>
#include <vector>

#include "ace/Global_Macros.h"
#include "ace/OS_NS_signal.h"
#include "ace/Signal.h"

enum Common_SignalDispatchType
{
  COMMON_SIGNAL_DISPATCH_PROACTOR = 0,
  COMMON_SIGNAL_DISPATCH_REACTOR,
  COMMON_SIGNAL_DISPATCH_SIGNAL, // inline (i.e. signal handler context restrictions apply)
  /////////////////////////////////////
  COMMON_SIGNAL_DISPATCH_MAX,
  COMMON_SIGNAL_DISPATCH_INVALID
};

struct Common_Signal
{
  Common_Signal ()
   : signal (-1)
#if defined (ACE_WIN32) || defined (ACE_WIN64)
  , siginfo (ACE_INVALID_HANDLE)
  , ucontext (-1)
#else
  , siginfo ()
  , ucontext ()
#endif // ACE_WIN32 || ACE_WIN64
  {}

  int               signal;
#if defined (ACE_WIN32) || defined (ACE_WIN64)
  struct siginfo_t  siginfo;
#else
  siginfo_t         siginfo;
#endif // ACE_WIN32 || ACE_WIN64
  struct ucontext_t ucontext;
};
typedef std::vector <struct Common_Signal> Common_Signals_t;
typedef Common_Signals_t::const_iterator Common_SignalsIterator_t;

typedef std::map<int, ACE_Sig_Action> Common_SignalActions_t;
typedef Common_SignalActions_t::const_iterator Common_SignalActionsIterator_t;

#endif
