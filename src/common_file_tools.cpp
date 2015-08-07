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
#include "stdafx.h"

#include "ace/OS.h"

#if defined (ACE_WIN32) || defined (ACE_WIN64)
#include "Shlobj.h"
#include "Userenv.h"
#endif

#include "ace/ACE.h"
#include "ace/Dirent_Selector.h"
#include "ace/FILE_Connector.h"
#include "ace/FILE_IO.h"
#include "ace/OS_NS_sys_sendfile.h"

#include "common_defines.h"
#include "common_file_tools.h"
#include "common_macros.h"
#include "common_tools.h"

#if defined (HAVE_CONFIG_H)
#include "libCommon_config.h"
#endif

bool
Common_File_Tools::isReadable (const std::string& filename_in)
{
  COMMON_TRACE (ACE_TEXT ("Common_File_Tools::isReadable"));

  int result = -1;
  ACE_stat stat;
  ACE_OS::memset (&stat, 0, sizeof (stat));
  result = ACE_OS::stat (filename_in.c_str (),
                         &stat);
  if (result == -1)
  {
    //ACE_DEBUG ((LM_DEBUG,
    //            ACE_TEXT ("failed to ACE_OS::stat(\"%s\"): \"%m\", aborting\n"),
    //            ACE_TEXT (filename_in.c_str ())));
    return false;
  } // end IF

  return (((stat.st_mode & S_IFMT) == S_IFREG) && // regular file ?
          (stat.st_mode & S_IREAD));              // readable ?
}

bool
Common_File_Tools::isEmpty (const std::string& filename_in)
{
  COMMON_TRACE (ACE_TEXT ("Common_File_Tools::isEmpty"));

  int result = -1;
  ACE_stat stat;
  ACE_OS::memset (&stat, 0, sizeof(stat));
  result = ACE_OS::stat (filename_in.c_str (),
                         &stat);
  if (result == -1)
  {
//    ACE_DEBUG ((LM_DEBUG,
//                ACE_TEXT ("failed to ACE_OS::stat(\"%s\"): \"%m\", aborting\n"),
//                ACE_TEXT (filename_in.c_str ())));
    return false;
  } // end IF

  return (stat.st_size == 0);
}

bool
Common_File_Tools::isDirectory (const std::string& directory_in)
{
  COMMON_TRACE (ACE_TEXT ("Common_File_Tools::isDirectory"));

  int result = -1;
  ACE_stat stat;
  ACE_OS::memset (&stat, 0, sizeof (stat));
  result = ACE_OS::stat (directory_in.c_str (),
                         &stat);
  if (result == -1)
  {
    switch (errno)
    {
      case ENOENT:
      {
        //ACE_DEBUG ((LM_DEBUG,
        //            ACE_TEXT ("\"%s\": \"%m\", aborting\n"),
        //            ACE_TEXT (directory_in.c_str ())));

        // URI doesn't even exist --> NOT a directory !
        return false;
      }
      default:
      {
        ACE_DEBUG ((LM_ERROR,
                    ACE_TEXT ("failed to ACE_OS::stat(\"%s\"): \"%m\", aborting\n"),
                    ACE_TEXT (directory_in.c_str ())));
        return false;
      }
    } // end SWITCH
  } // end IF

  return ((stat.st_mode & S_IFMT) == S_IFDIR);
}

//int
//Common_File_Tools::selector(const dirent* dirEntry_in)
//{
//COMMON_TRACE (ACE_TEXT ("Common_File_Tools::selector"));

//  // *IMPORTANT NOTE*: select all files

//  // sanity check --> ignore dot/double-dot
//  if (ACE_OS::strncmp (dirEntry_in->d_name,
//                       ACE_TEXT_ALWAYS_CHAR (Net_SERVER_LOG_FILENAME_PREFIX),
//                       ACE_OS::strlen (ACE_TEXT_ALWAYS_CHAR (Net_SERVER_LOG_FILENAME_PREFIX))) != 0)
//  {
////     ACE_DEBUG ((LM_DEBUG,
////                 ACE_TEXT ("ignoring \"%s\"...\n"),
////                 ACE_TEXT (dirEntry_in->d_name)));

//    return 0;
//  } // end IF

//  return 1;
//}

//int
//Common_File_Tools::comparator(const dirent** d1,
//                              const dirent** d2)
//{
//COMMON_TRACE (ACE_TEXT ("Common_File_Tools::comparator"));

//  return ACE_OS::strcmp ((*d1)->d_name,
//                         (*d2)->d_name);
//}

bool
Common_File_Tools::isEmptyDirectory (const std::string& directory_in)
{
  COMMON_TRACE (ACE_TEXT ("Common_File_Tools::isEmptyDirectory"));

  // initialize return value
  bool return_value = false;

  int result = -1;
  ACE_Dirent_Selector entries;
  result = entries.open (ACE_TEXT (directory_in.c_str ()),
//                    &Common_File_Tools::dirent_selector,
//                    &Common_File_Tools::dirent_comparator) == -1)
                         NULL,
                         NULL);
  if (result == -1)
  {
    ACE_DEBUG ((LM_DEBUG,
                ACE_TEXT ("failed to ACE_Dirent_Selector::open(\"%s\"): \"%m\", aborting\n"),
                ACE_TEXT (directory_in.c_str ())));
    return false;
  } // end IF
  return_value = (entries.length () == 0);

  // clean up
  result = entries.close ();
  if (result == -1)
    ACE_DEBUG ((LM_ERROR,
                ACE_TEXT ("failed to ACE_Dirent_Selector::close(\"%s\"): \"%m\", continuing\n"),
                ACE_TEXT (directory_in.c_str ())));

  return return_value;
}

bool
Common_File_Tools::isValid (const std::string& filename_in)
{
  COMMON_TRACE (ACE_TEXT ("Common_File_Tools::isValid"));

  std::string directory = ACE::dirname (filename_in.c_str ());
  return Common_File_Tools::isDirectory (directory);
}

bool
Common_File_Tools::createDirectory (const std::string& directory_in)
{
  COMMON_TRACE (ACE_TEXT ("Common_File_Tools::createDirectory"));

  int result = -1;

  result = ACE_OS::mkdir (directory_in.c_str (),
                          ACE_DEFAULT_DIR_PERMS);
  if (result == -1)
  {
    switch (errno)
    {
      case ENOENT:
      {
        // OK: some base sub-directory doesn't seem to exist...
        // --> try to recurse
        const ACE_TCHAR* directory_p =
          ACE::dirname (directory_in.c_str (),
                        ACE_DIRECTORY_SEPARATOR_CHAR);
        if (!directory_p)
        {
          ACE_DEBUG ((LM_ERROR,
                      ACE_TEXT ("failed to ACE::dirname(\"%s\"): \"%m\", aborting\n"),
                      ACE_TEXT (directory_in.c_str ())));
          return false;
        } // end IF
        std::string base_directory = ACE_TEXT_ALWAYS_CHAR (directory_p);
        // sanity check: don't recurse for "." !
        if (base_directory != ACE_TEXT_ALWAYS_CHAR ("."))
        {
          if (createDirectory (base_directory))
            return createDirectory (directory_in);
          else
            ACE_DEBUG ((LM_ERROR,
                        ACE_TEXT ("failed to Common_File_Tools::createDirectory(\"%s\"): \"%m\", aborting\n"),
                        ACE_TEXT (base_directory.c_str ())));
        } // end IF

        return false;
      }
      case EEXIST:
      {
        // entry already exists...
        ACE_DEBUG ((LM_DEBUG,
                    ACE_TEXT ("\"%s\" already exists, leaving\n"),
                    ACE_TEXT (directory_in.c_str ())));
        return true;
      }
      default:
      {
        ACE_DEBUG ((LM_ERROR,
                    ACE_TEXT ("failed to ACE_OS::mkdir(\"%s\"): \"%m\", aborting\n"),
                    ACE_TEXT (directory_in.c_str ())));
        return false;
      }
    } // end SWITCH
  } // end IF
  ACE_DEBUG ((LM_DEBUG,
              ACE_TEXT ("created: \"%s\"...\n"),
              ACE_TEXT (directory_in.c_str ())));

  return true;
}

bool
Common_File_Tools::copyFile (const std::string& filename_in,
                             const std::string& directory_in)
{
  COMMON_TRACE (ACE_TEXT ("Common_File_Tools::createDirectory"));

  int result = -1;

  // connect to the file...
  ACE_FILE_Addr source_address, target_address;
  result = source_address.set (ACE_TEXT_CHAR_TO_TCHAR (filename_in.c_str ()));
  if (result == -1)
  {
    ACE_DEBUG ((LM_ERROR,
                ACE_TEXT ("failed to ACE_FILE_Addr::set() file \"%s\": \"%m\", aborting\n"),
                ACE_TEXT (filename_in.c_str ())));
    return false;
  } // end IF
  const ACE_TCHAR* filename_p =
    ACE::basename (ACE_TEXT_CHAR_TO_TCHAR (filename_in.c_str ()),
                   ACE_DIRECTORY_SEPARATOR_CHAR);
  if (!filename_p)
  {
    ACE_DEBUG ((LM_ERROR,
                ACE_TEXT ("failed to ACE::basename(\"%s\"): \"%m\", aborting\n"),
                ACE_TEXT (filename_in.c_str ())));
    return false;
  } // end IF
  std::string target_filename = directory_in;
  target_filename += ACE_DIRECTORY_SEPARATOR_CHAR_A;
  target_filename += ACE_TEXT_ALWAYS_CHAR (filename_p);
  result =
    target_address.set (ACE_TEXT_CHAR_TO_TCHAR (target_filename.c_str ()));
  if (result == -1)
  {
    ACE_DEBUG ((LM_ERROR,
                ACE_TEXT ("failed to ACE_FILE_Addr::set() file \"%s\": \"%m\", aborting\n"),
                ACE_TEXT (target_filename.c_str ())));
    return false;
  } // end IF

  // don't block on file opening (see ACE doc)...
  ACE_FILE_Connector connector, receptor;
  ACE_FILE_IO source_file, target_file;
  result =
    connector.connect (source_file,                                         // file
                       source_address,                                      // remote SAP
                       const_cast<ACE_Time_Value*> (&ACE_Time_Value::zero), // timeout
                       ACE_Addr::sap_any,                                   // local SAP
                       0,                                                   // reuse address ?
                       (O_RDONLY | O_BINARY | O_EXCL),                      // flags
                       ACE_DEFAULT_FILE_PERMS);                             // permissions
  if (result == -1)
  {
    ACE_DEBUG ((LM_ERROR,
                ACE_TEXT ("failed to ACE_FILE_Connector::connect() to file \"%s\": \"%m\", aborting\n"),
                ACE_TEXT (filename_in.c_str ())));
    return false;
  } // end IF
  result =
    receptor.connect (target_file,                                         // file
                      target_address,                                      // remote SAP
                      const_cast<ACE_Time_Value*> (&ACE_Time_Value::zero), // timeout
                      ACE_Addr::sap_any,                                   // local SAP
                      0,                                                   // reuse address ?
                      (O_WRONLY | O_CREAT | O_BINARY | O_TRUNC),           // flags
                      ACE_DEFAULT_FILE_PERMS);                             // permissions
  if (result == -1)
  {
    ACE_DEBUG ((LM_ERROR,
                ACE_TEXT ("failed to ACE_FILE_Connector::connect() to file \"%s\": \"%m\", aborting\n"),
                ACE_TEXT (target_filename.c_str ())));

    // clean up
    result = source_file.close ();
    if (result == -1)
      ACE_DEBUG ((LM_ERROR,
                  ACE_TEXT ("failed to ACE_FILE::close(\"%s\"): \"%m\", continuing\n"),
                  ACE_TEXT (filename_in.c_str ())));

    return false;
  } // end IF

  // copy file
//  iovec io_vec;
//  ACE_OS::memset (&io_vec, 0, sizeof (io_vec));
//  if (source_file.recvv (&io_vec) == -1)
//  {
//    ACE_DEBUG ((LM_ERROR,
//                ACE_TEXT ("failed to ACE_FILE_IO::recvv() file \"%s\": \"%m\", aborting\n"),
//                ACE_TEXT (filename_in.c_str())));

//    // clean up
//    if (source_file.close () == -1)
//      ACE_DEBUG ((LM_ERROR,
//                  ACE_TEXT ("failed to ACE_FILE::close(\"%s\"): \"%m\", continuing\n"),
//                  ACE_TEXT (filename_in.c_str ())));
//    if (target_file.remove () == -1)
//      ACE_DEBUG ((LM_ERROR,
//                  ACE_TEXT ("failed to ACE_FILE::remove(\"%s\"): \"%m\", continuing\n"),
//                  ACE_TEXT (target_filename.c_str ())));

//    return false;
//  } // end IF
//  ACE_ASSERT (io_vec.iov_base);
//  if (target_file.sendv_n (&io_vec, 1) == -1)
//  {
//    ACE_DEBUG ((LM_ERROR,
//                ACE_TEXT ("failed to ACE_FILE_IO::sendv_n() file \"%s\": \"%m\", aborting\n"),
//                ACE_TEXT (target_filename.c_str ())));

//    // clean up
//    delete[] io_vec.iov_base;
//    if (source_file.close () == -1)
//      ACE_DEBUG ((LM_ERROR,
//                  ACE_TEXT ("failed to ACE_FILE::close(\"%s\"): \"%m\", continuing\n"),
//                  ACE_TEXT (filename_in.c_str ())));
//    if (target_file.remove () == -1)
//      ACE_DEBUG ((LM_ERROR,
//                  ACE_TEXT ("failed to ACE_FILE::remove(\"%s\"): \"%m\", continuing\n"),
//                  ACE_TEXT (target_filename.c_str ())));

//    return false;
//  } // end IF
  ACE_FILE_Info file_info;
  result = source_file.get_info (file_info);
  if (result == -1)
  {
    ACE_DEBUG ((LM_ERROR,
                ACE_TEXT ("failed to ACE_FILE_IO::get_info(\"%s\"): \"%m\", aborting\n"),
                ACE_TEXT (filename_in.c_str ())));

    // clean up
    result = source_file.close ();
    if (result == -1)
      ACE_DEBUG ((LM_ERROR,
                  ACE_TEXT ("failed to ACE_FILE::close(\"%s\"): \"%m\", continuing\n"),
                  ACE_TEXT (filename_in.c_str ())));
    result = target_file.remove ();
    if (result == -1)
      ACE_DEBUG ((LM_ERROR,
                  ACE_TEXT ("failed to ACE_FILE::remove(\"%s\"): \"%m\", continuing\n"),
                  ACE_TEXT (target_filename.c_str ())));

    return false;
  } // end IF
  ssize_t bytes_written = ACE_OS::sendfile (source_file.get_handle (),
                                            target_file.get_handle (),
                                            NULL,
                                            file_info.size_);
  if (bytes_written != file_info.size_)
  {
    ACE_DEBUG ((LM_ERROR,
                ACE_TEXT ("failed to ACE_OS::sendfile(\"%s\",\"%s\"): \"%m\", aborting\n"),
                ACE_TEXT (filename_in.c_str ()),
                ACE_TEXT (target_filename.c_str ())));

    // clean up
    result = source_file.close ();
    if (result == -1)
      ACE_DEBUG ((LM_ERROR,
                  ACE_TEXT ("failed to ACE_FILE::close(\"%s\"): \"%m\", continuing\n"),
                  ACE_TEXT (filename_in.c_str ())));
    result = target_file.remove ();
    if (result == -1)
      ACE_DEBUG  ((LM_ERROR,
                  ACE_TEXT ("failed to ACE_FILE::remove(\"%s\"): \"%m\", continuing\n"),
                  ACE_TEXT (target_filename.c_str ())));

    return false;
  } // end IF

  // clean up
//  delete[] io_vec.iov_base;
  result = source_file.close ();
  if (result == -1)
    ACE_DEBUG ((LM_ERROR,
                ACE_TEXT ("failed to ACE_FILE::close(\"%s\"): \"%m\", continuing\n"),
                ACE_TEXT (filename_in.c_str ())));
  result = target_file.close ();
  if (result == -1)
    ACE_DEBUG ((LM_ERROR,
                ACE_TEXT ("failed to ACE_FILE::close(\"%s\"): \"%m\", continuing\n"),
                ACE_TEXT (target_filename.c_str ())));

  ACE_DEBUG ((LM_DEBUG,
              ACE_TEXT ("copied \"%s\" --> \"%s\"...\n"),
              ACE_TEXT (filename_in.c_str ()),
              ACE_TEXT (target_filename.c_str ())));

  return true;
}

bool
Common_File_Tools::deleteFile (const std::string& filename_in)
{
  COMMON_TRACE (ACE_TEXT ("Common_File_Tools::deleteFile"));

  int result = -1;

  // connect to the file...
  ACE_FILE_Addr address;
  result = address.set (ACE_TEXT_CHAR_TO_TCHAR (filename_in.c_str ()));
  if (result == -1)
  {
    ACE_DEBUG ((LM_ERROR,
                ACE_TEXT ("failed to ACE_FILE_Addr::set() file \"%s\": \"%m\", aborting\n"),
                ACE_TEXT (filename_in.c_str ())));
    return false;
  } // end IF

  // don't want to block on file opening (see ACE doc)...
  ACE_FILE_Connector connector;
  ACE_FILE_IO file;
  result =
    connector.connect (file,
                       address,
                       const_cast<ACE_Time_Value*> (&ACE_Time_Value::zero),
                       ACE_Addr::sap_any,
                       0,
                       (O_WRONLY | O_BINARY),
                       ACE_DEFAULT_FILE_PERMS);
  if (result == -1)
  {
    ACE_DEBUG ((LM_ERROR,
                ACE_TEXT ("failed to ACE_FILE_Connector::connect() to file \"%s\": \"%m\", aborting\n"),
                ACE_TEXT (filename_in.c_str ())));
    return false;
  } // end IF

  // delete file
  result = file.remove ();
  if (result == -1)
  {
    ACE_DEBUG ((LM_ERROR,
                ACE_TEXT ("failed to ACE_FILE_IO::remove() file \"%s\": \"%m\", aborting\n"),
                ACE_TEXT (filename_in.c_str ())));
    return false;
  } // end IF
  ACE_DEBUG ((LM_DEBUG,
              ACE_TEXT ("deleted \"%s\"...\n"),
              ACE_TEXT (filename_in.c_str ())));

  return true;
}

bool
Common_File_Tools::loadFile (const std::string& filename_in,
                             unsigned char*& file_out)
{
  COMMON_TRACE (ACE_TEXT ("Common_File_Tools::loadFile"));

  int result = -1;

  // initialize return value(s)
  file_out = NULL;

  FILE* file_p =
    ACE_OS::fopen (ACE_TEXT (filename_in.c_str ()),
                   ACE_TEXT_ALWAYS_CHAR ("rb"));
  if (!file_p)
  {
    ACE_DEBUG ((LM_ERROR,
                ACE_TEXT ("failed to ACE_OS::fopen(\"%s\"): %m, aborting\n"),
                ACE_TEXT (filename_in.c_str ())));
    return false;
  } // end IF

  // obtain file size
  result = ACE_OS::fseek (file_p, 0, SEEK_END);
  if (result)
  {
    ACE_DEBUG ((LM_ERROR,
                ACE_TEXT ("failed to ACE_OS::fseek(\"%s\"): %m, aborting\n"),
                ACE_TEXT (filename_in.c_str ())));

    // clean up
    result = ACE_OS::fclose (file_p);
    if (result == -1)
      ACE_DEBUG ((LM_ERROR,
                  ACE_TEXT ("failed to ACE_OS::fclose(\"%s\"): %m, continuing\n"),
                  ACE_TEXT (filename_in.c_str ())));
    return false;
  } // end IF
  long fsize = ACE_OS::ftell (file_p);
  if (fsize == -1)
  {
    ACE_DEBUG ((LM_ERROR,
                ACE_TEXT ("failed to ACE_OS::ftell(\"%s\"): %m, aborting\n"),
                ACE_TEXT (filename_in.c_str ())));

    // clean up
    result = ACE_OS::fclose (file_p);
    if (result == -1)
      ACE_DEBUG ((LM_ERROR,
                  ACE_TEXT ("failed to ACE_OS::fclose(\"%s\"): %m, continuing\n"),
                  ACE_TEXT (filename_in.c_str ())));
    return false;
  } // end IF
  ACE_OS::rewind (file_p);

  // *PORTABILITY* allocate array
//  file_out = new (std::nothrow) unsigned char[fsize];
  ACE_NEW_NORETURN (file_out,
                    unsigned char[fsize]);
  if (!file_out)
  {
    ACE_DEBUG ((LM_CRITICAL,
                ACE_TEXT ("failed to allocate memory(%d): %m, aborting\n"),
                fsize));

    // clean up
    result = ACE_OS::fclose (file_p);
    if (result == -1)
      ACE_DEBUG ((LM_ERROR,
                  ACE_TEXT ("failed to ACE_OS::fclose(\"%s\"): %m, continuing\n"),
                  ACE_TEXT (filename_in.c_str ())));
    return false;
  } // end IF

  // read data
  result = ACE_OS::fread (static_cast<void*> (file_out), // target buffer
                          fsize,                         // read everything
                          1,                             // ... all at once
                          file_p);                       // handle
  if (result != 1)
  {
    ACE_DEBUG ((LM_ERROR,
                ACE_TEXT ("failed to read file(\"%s\"): %m, aborting\n"),
                ACE_TEXT (filename_in.c_str ())));

    // clean up
    result = ACE_OS::fclose (file_p);
    if (result == -1)
      ACE_DEBUG ((LM_ERROR,
                  ACE_TEXT ("failed to ACE_OS::fclose(\"%s\"): %m, continuing\n"),
                  ACE_TEXT (filename_in.c_str ())));
    delete [] file_out;
    file_out = NULL;

    return false;
  } // end IF

  // clean up
  result = ACE_OS::fclose (file_p);
  if (result == -1)
  {
    ACE_DEBUG ((LM_ERROR,
                ACE_TEXT ("failed to ACE_OS::fclose(\"%s\"): %m, aborting\n"),
                ACE_TEXT (filename_in.c_str ())));

    // clean up
    delete [] file_out;
    file_out = NULL;

    return false;
  } // end IF

  return true;
}

std::string
Common_File_Tools::realPath (const std::string& path_in)
{
  COMMON_TRACE (ACE_TEXT ("Common_File_Tools::realPath"));

  // initialize result(s)
  std::string result;

  char path[PATH_MAX];
  if (!ACE_OS::realpath (path_in.c_str (), path))
  {
    ACE_DEBUG ((LM_ERROR,
                ACE_TEXT ("failed to ACE_OS::realpath(\"%s\"): %m, aborting\n"),
                ACE_TEXT (path_in.c_str ())));
    return result;
  } // end IF
  result = path;

  return result;
}

std::string
Common_File_Tools::getWorkingDirectory ()
{
  COMMON_TRACE (ACE_TEXT ("Common_File_Tools::getWorkingDirectory"));

  std::string result;

  // retrieve working directory
  char cwd[PATH_MAX];
  ACE_OS::memset (cwd, 0, sizeof(cwd));
  if (!ACE_OS::getcwd (cwd, sizeof (cwd)))
  {
    ACE_DEBUG ((LM_ERROR,
                ACE_TEXT ("failed to ACE_OS::getcwd(): \"%m\", aborting\n")));
    return result;
  } // end IF
  result = cwd;

  return result;
}

//std::string
//Common_File_Tools::getConfigurationDataDirectory (const std::string& baseDir_in,
//                                                  bool isConfig_in)
//{
//  COMMON_TRACE (ACE_TEXT ("Common_File_Tools::getConfigurationDataDirectory"));

//  std::string result = baseDir_in;

//  if (baseDir_in.empty ())
//	{
//#if defined (ACE_WIN32) || defined (ACE_WIN64)
//    TCHAR buffer[PATH_MAX];
//    ACE_OS::memset (buffer, 0, sizeof (buffer));

//    HRESULT win_result =
//        SHGetFolderPath (NULL,                                         // hwndOwner
//                         CSIDL_PROGRAM_FILES | CSIDL_FLAG_DONT_VERIFY, // nFolder
//                         NULL,                                         // hToken
//                         SHGFP_TYPE_CURRENT,                           // dwFlags
//                         buffer);                                      // pszPath
//    if (FAILED (win_result))
//    {
//      ACE_OS::memset (buffer, 0, sizeof (buffer));
//      if (FormatMessage (FORMAT_MESSAGE_FROM_SYSTEM,                // dwFlags
//                         NULL,                                      // lpSource
//                         win_result,                                // dwMessageId
//                         MAKELANGID(LANG_NEUTRAL, SUBLANG_DEFAULT), // dwLanguageId
//                         buffer,                                    // lpBuffer
//                         PATH_MAX,                                  // nSize
//                         NULL) == 0)                                // Arguments
//        ACE_DEBUG ((LM_ERROR,
//                    ACE_TEXT ("failed to FormatMessage(%d): \"%m\", continuing\n"),
//                    win_result));
//      ACE_DEBUG ((LM_ERROR,
//                  ACE_TEXT ("failed to SHGetFolderPath(CSIDL_PROGRAM_FILES): \"%s\", falling back\n"),
//                  buffer));

//      // fallback
//      return Common_File_Tools::getWorkingDirectory ();
//    } // end IF

//    result = ACE_TEXT_ALWAYS_CHAR(buffer);
//    result += ACE_DIRECTORY_SEPARATOR_CHAR_A;
//    result += ACE_TEXT_ALWAYS_CHAR(RPG_PACKAGE);
//#else
//    return Common_File_Tools::getWorkingDirectory ();
//#endif
//  } // end IF

//  result += ACE_DIRECTORY_SEPARATOR_CHAR_A;
//  result += (isConfig_in ? ACE_TEXT_ALWAYS_CHAR (COMMON_CONFIG_SUB)
//                         : ACE_TEXT_ALWAYS_CHAR (COMMON_DATA_SUB));

//  // sanity check(s)
//  if (!Common_File_Tools::isDirectory (result))
//  {
//    ACE_DEBUG ((LM_ERROR,
//                ACE_TEXT ("not a directory: \"%s\", falling back\n"),
//                ACE_TEXT (result.c_str ())));

//    // fallback
//    return Common_File_Tools::getWorkingDirectory ();
//  } // end IF

//  return result;
//}

std::string
Common_File_Tools::getUserHomeDirectory (const std::string& user_in)
{
  COMMON_TRACE (ACE_TEXT ("Common_File_Tools::getUserHomeDirectory"));

  // initialize result value(s)
  std::string result;

  std::string user_name = user_in;
  if (user_name.empty ())
  {
    std::string real_name;
    Common_Tools::getCurrentUserName (user_name, real_name);
    if (user_name.empty ())
    {
      ACE_DEBUG ((LM_ERROR,
                  ACE_TEXT ("failed to Common_Tools::getCurrentUserName(), falling back\n")));

      // fallback
      result =
          ACE_TEXT_ALWAYS_CHAR (ACE_OS::getenv (ACE_TEXT (COMMON_DEF_DUMP_DIR)));
      return result;
    } // end IF
  } // end IF

#if !defined (ACE_WIN32) && !defined (ACE_WIN64)
  int            result_2 = -1;
  struct passwd  pwd;
  struct passwd* result_p = NULL;
  char           buffer[BUFSIZ]; // _SC_GETPW_R_SIZE_MAX
  ACE_OS::memset (buffer, 0, sizeof (BUFSIZ));
  result_2 = ACE_OS::getpwnam_r (user_name.c_str (), // user name
                                 &pwd,               // passwd entry
                                 buffer,             // buffer
                                 BUFSIZ,             // buffer size
                                 &result_p);         // result (handle)
  if (!result_p)
  {
    if (result_2 == 0)
      ACE_DEBUG ((LM_ERROR,
                  ACE_TEXT ("user \"%s\" not found, falling back\n"),
                  ACE_TEXT (user_name.c_str ())));
    else
      ACE_DEBUG ((LM_ERROR,
                  ACE_TEXT ("failed to ACE_OS::getpwnam_r(\"%s\"): \"%m\", falling back\n"),
                  ACE_TEXT (user_name.c_str ())));

    // fallback
    result =
        ACE_TEXT_ALWAYS_CHAR (ACE_OS::getenv (ACE_TEXT (COMMON_DEF_DUMP_DIR)));
  } // end IF
  else result = ACE_TEXT_ALWAYS_CHAR (pwd.pw_dir);
#else
  HANDLE token = 0;
  if (!OpenProcessToken (GetCurrentProcess (), TOKEN_QUERY, &token))
  {
    ACE_DEBUG ((LM_ERROR,
                ACE_TEXT ("failed to OpenProcessToken(), falling back\n")));

    // fallback
    result =
        ACE_TEXT_ALWAYS_CHAR (ACE_OS::getenv (ACE_TEXT (COMMON_DEF_DUMP_DIR)));
    return result;
  } // end IF

  ACE_TCHAR buffer[PATH_MAX];
  ACE_OS::memset (buffer, 0, sizeof (buffer));
  DWORD buffer_size = PATH_MAX;
  // *TODO*: this is apparently inconsistent (see also config.h for details)
#if defined (ACE_USES_WCHAR)
  if (!GetUserProfileDirectoryW (token, buffer, &buffer_size))
#else
  if (!GetUserProfileDirectoryA (token, buffer, &buffer_size))
#endif
  {
    ACE_DEBUG ((LM_ERROR,
                ACE_TEXT ("failed to GetUserProfileDirectory(): \"%s\", falling back\n")));

    // clean up
    if (!CloseHandle (token))
      ACE_DEBUG ((LM_ERROR,
                  ACE_TEXT ("failed to CloseHandle(), continuing\n")));

    // fallback
    result =
      ACE_TEXT_ALWAYS_CHAR (ACE_OS::getenv (ACE_TEXT (COMMON_DEF_DUMP_DIR)));
    return result;
  } // end IF

  // clean up
  if (!CloseHandle (token))
    ACE_DEBUG ((LM_ERROR,
                ACE_TEXT ("failed to CloseHandle(), continuing\n")));

  result = ACE_TEXT_ALWAYS_CHAR (buffer);
#endif

  return result;
}

std::string
Common_File_Tools::getUserConfigurationDirectory ()
{
  COMMON_TRACE (ACE_TEXT ("Common_File_Tools::getUserConfigurationDirectory"));

  std::string result;

#if !defined (ACE_WIN32) && !defined (ACE_WIN64)
  std::string user_name;
  std::string real_name;
  Common_Tools::getCurrentUserName (user_name, real_name);
  if (user_name.empty ())
  {
    ACE_DEBUG ((LM_ERROR,
                ACE_TEXT ("failed to Common_Tools::getCurrentUserName(), falling back\n")));

    // fallback
    result =
        ACE_TEXT_ALWAYS_CHAR (ACE_OS::getenv (ACE_TEXT (COMMON_DEF_DUMP_DIR)));
    return result;
  } // end IF

  result = Common_File_Tools::getUserHomeDirectory (user_name);
  if (result.empty ())
  {
    ACE_DEBUG ((LM_ERROR,
                ACE_TEXT("failed to Common_File_Tools::getUserHomeDirectory(\"%s\"), falling back\n"),
                ACE_TEXT (user_name.c_str ())));

    // fallback
    result =
        ACE_TEXT_ALWAYS_CHAR (ACE_OS::getenv (ACE_TEXT (COMMON_DEF_DUMP_DIR)));
    return result;
  } // end IF

  result += ACE_DIRECTORY_SEPARATOR_CHAR_A;
  result += '.';
#else
  ACE_TCHAR buffer[PATH_MAX];
  ACE_OS::memset (buffer, 0, sizeof (buffer));

  HRESULT win_result =
// *TODO*: this is apparently inconsistent (see also config.h for details)
#if defined (ACE_USES_WCHAR)
  SHGetFolderPathW (NULL,                                   // hwndOwner
#else
  SHGetFolderPathA (NULL,                                   // hwndOwner
#endif
                    CSIDL_APPDATA | CSIDL_FLAG_DONT_VERIFY, // nFolder
                    NULL,                                   // hToken
                    SHGFP_TYPE_CURRENT,                     // dwFlags
                    buffer);                                // pszPath
  if (FAILED (win_result))
  {
    ACE_OS::memset (buffer, 0, sizeof (buffer));
    win_result =
      ACE_TEXT_FormatMessage (FORMAT_MESSAGE_FROM_SYSTEM,                 // dwFlags
                              NULL,                                       // lpSource
                              win_result,                                 // dwMessageId
                              MAKELANGID (LANG_NEUTRAL, SUBLANG_DEFAULT), // dwLanguageId
                              buffer,                                     // lpBuffer
                              PATH_MAX,                                   // nSize
                              NULL);                                      // Arguments
    if (FAILED (win_result))                                 
      ACE_DEBUG ((LM_ERROR,
                  ACE_TEXT ("failed to FormatMessage(%d): \"%m\", continuing\n"),
                  win_result));
    ACE_DEBUG ((LM_ERROR,
                ACE_TEXT ("failed to SHGetFolderPath(CSIDL_APPDATA): \"%s\", falling back\n"),
                buffer));

    // fallback
    result =
        ACE_TEXT_ALWAYS_CHAR (ACE_OS::getenv (ACE_TEXT (COMMON_DEF_DUMP_DIR)));
    return result;
  } // end IF

  result = ACE_TEXT_ALWAYS_CHAR (buffer);
  result += ACE_DIRECTORY_SEPARATOR_CHAR_A;
#endif
  result += ACE_TEXT_ALWAYS_CHAR (LIBCOMMON_PACKAGE);

  if (!Common_File_Tools::isDirectory (result))
  {
    if (!Common_File_Tools::createDirectory (result))
    {
      ACE_DEBUG ((LM_ERROR,
                  ACE_TEXT ("failed to Common_File_Tools::createDirectory(\"%s\"), falling back\n"),
                  ACE_TEXT (result.c_str ())));

      // fallback
      result =
          ACE_TEXT_ALWAYS_CHAR (ACE_OS::getenv (ACE_TEXT (COMMON_DEF_DUMP_DIR)));
    } // end IF
    else
      ACE_DEBUG ((LM_DEBUG,
                  ACE_TEXT ("created game directory \"%s\"\n"),
                  ACE_TEXT (result.c_str ())));
  } // end IF

  return result;
}

std::string
Common_File_Tools::getDumpDirectory ()
{
  COMMON_TRACE (ACE_TEXT ("Common_File_Tools::getDumpDirectory"));

  // initialize return value(s)
  std::string result;
#if defined (ACE_WIN32) || defined (ACE_WIN64)
  result =
    ACE_TEXT_ALWAYS_CHAR (ACE_OS::getenv (ACE_TEXT (COMMON_DEF_DUMP_DIR)));
#else
  result = ACE_TEXT_ALWAYS_CHAR (COMMON_DEF_DUMP_DIR);
#endif

  // sanity check(s): directory exists ?
  // No ? --> try to create it then !
  if (!Common_File_Tools::isDirectory (result))
  {
    if (!Common_File_Tools::createDirectory (result))
    {
      ACE_DEBUG ((LM_ERROR,
                  ACE_TEXT ("failed to Common_File_Tools::createDirectory(\"%s\"), aborting\n"),
                  ACE_TEXT (result.c_str ())));

      // clean up
      result.clear ();

      return result;
    } // end IF
    ACE_DEBUG ((LM_DEBUG,
                ACE_TEXT ("created directory: \"%s\"...\n"),
                ACE_TEXT (result.c_str ())));
  } // end IF

  return result;
}

std::string
Common_File_Tools::getLogFilename (const std::string& programName_in)
{
  COMMON_TRACE (ACE_TEXT ("Common_File_Tools::getLogFilename"));

  // sanity check(s)
  ACE_ASSERT (!programName_in.empty ());

  // construct correct logfilename...
  std::string result = Common_File_Tools::getLogDirectory ();
  result += ACE_DIRECTORY_SEPARATOR_CHAR_A;
  result += programName_in;
  result += COMMON_LOG_FILENAME_SUFFIX;

  // sanity check(s): log file exists ?
  // Yes ? --> try to delete it then !
  if (Common_File_Tools::isReadable (result))
  {
    if (!Common_File_Tools::deleteFile (result))
    {
      ACE_DEBUG((LM_ERROR,
                 ACE_TEXT ("failed to Common_File_Tools::deleteFile(\"%s\"), aborting\n"),
                 ACE_TEXT (result.c_str ())));

      // clean up
      result.clear ();

      return result;
    } // end IF
    ACE_DEBUG ((LM_DEBUG,
                ACE_TEXT ("deleted file: \"%s\"...\n"),
                ACE_TEXT (result.c_str ())));
  } // end IF

  return result;
}

std::string
Common_File_Tools::getLogDirectory ()
{
  COMMON_TRACE (ACE_TEXT ("Common_File_Tools::getLogDirectory"));

  // initialize return value(s)
  std::string result;
#if defined (ACE_WIN32) || defined (ACE_WIN64)
  result =
    ACE_TEXT_ALWAYS_CHAR (ACE_OS::getenv (ACE_TEXT (COMMON_DEF_LOG_DIRECTORY)));
#else
  result = ACE_TEXT_ALWAYS_CHAR (COMMON_DEF_LOG_DIRECTORY);
#endif

  // sanity check(s): directory exists ?
  // No ? --> try to create it then !
  if (!Common_File_Tools::isDirectory (result))
  {
    if (!Common_File_Tools::createDirectory (result))
    {
      ACE_DEBUG ((LM_ERROR,
                  ACE_TEXT ("failed to Common_File_Tools::createDirectory(\"%s\"), aborting\n"),
                  ACE_TEXT (result.c_str ())));

      // clean up
      result.clear ();

      return result;
    } // end IF
    ACE_DEBUG ((LM_DEBUG,
                ACE_TEXT ("created directory: \"%s\"...\n"),
                ACE_TEXT (result.c_str ())));
  } // end IF

  return result;
}
