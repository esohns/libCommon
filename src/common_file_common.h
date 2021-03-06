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

#ifndef COMMON_FILE_COMMON_H
#define COMMON_FILE_COMMON_H

#include <list>
#include <string>

#include "ace/config-lite.h"
#include "ace/OS_NS_dirent.h"

// *** file ***
struct Common_File_Identifier
{
  Common_File_Identifier ()
   : identifier ()
   , identifierDiscriminator (Common_File_Identifier::FILE)
   , selector (NULL) // *NOTE*: NULL will select all (!) entries by default
  {}

  enum discriminatorType
  {
    FILE = 0,
    DIRECTORY,
    INVALID
  };

  std::string            identifier;
  enum discriminatorType identifierDiscriminator;
  ACE_SCANDIR_SELECTOR   selector;
};
typedef std::list<struct Common_File_Identifier> Common_File_IdentifierList_t;
typedef Common_File_IdentifierList_t::const_iterator Common_File_IdentifierListIterator_t;

#endif
