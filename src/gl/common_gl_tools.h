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

#ifndef COMMON_GL_TOOLS_H
#define COMMON_GL_TOOLS_H

#include <string>

#include "ace/config-lite.h"
#if defined (ACE_WIN32) || defined (ACE_WIN64)
#include <gl/GL.h>
#else
#include <GL/gl.h>
#endif

#include "glm/glm.hpp"

#include "assimp/color4.h"
#include "assimp/matrix4x4.h"
#include "assimp/vector3.h"

#include "ace/Global_Macros.h"

#include "common_gl_common.h"

//#include "common_gl_exports.h"

// forward declarations
struct aiMaterial;
struct aiNode;
struct aiScene;

//class Common_GL_Export Common_GL_Tools
class Common_GL_Tools
{
 public:
  static std::string errorToString (GLenum);

  static GLuint loadModel (const std::string&,       // path
                           Common_GL_BoundingBox_t&, // return value: bounding box
                           glm::vec3&);              // return value: center
  // *NOTE*: invokes glTexImage2D() with 'target' GL_TEXTURE_2D and 'internal
  //         format' GL_RGBA8
  // *TODO*: currently, only PNG files are supported
  static GLuint loadTexture (const std::string&); // path

  // *NOTE*: includes glBegin()/glEnd() calls
  static void drawCube (bool = false); // set (2d-)texture coordinates ?

 private:
  ACE_UNIMPLEMENTED_FUNC (Common_GL_Tools ())
  ACE_UNIMPLEMENTED_FUNC (~Common_GL_Tools ())
  ACE_UNIMPLEMENTED_FUNC (Common_GL_Tools (const Common_GL_Tools&))
  ACE_UNIMPLEMENTED_FUNC (Common_GL_Tools& operator= (const Common_GL_Tools&))

  static void boundingBox (const struct aiScene*, // scene handle
                           const struct aiNode*,  // node handle
                           aiVector3D*,           // return value: min
                           aiVector3D*,           // return value: max
                           aiMatrix4x4*);         // return value: transformation
  static void boundingBox (const struct aiScene*, // scene handle
                           aiVector3D*,           // return value: min
                           aiVector3D*);          // return value: max
  static bool loadModel (const std::string&, // path
                         struct aiScene*&);  // return value: scene handle

  inline static void color4_to_float4 (const aiColor4D* c, float f[4]) { f[0] = c->r; f[1] = c->g; f[2] = c->b; f[3] = c->a; }
  inline static void set_float4 (float f[4], float a, float b, float c, float d) { f[0] = a; f[1] = b; f[2] = c; f[3] = d; }
  static void applyMaterial (const struct aiMaterial*); // material handle
  static void render (const struct aiScene*, // scene handle
                      const struct aiNode*); // node handle

  // *IMPORTANT NOTE*: callers need to free() allocated memory (5th argument)
  static bool loadPNG (const std::string&, // path
                       unsigned int&,      // return value: width
                       unsigned int&,      // return value: height
                       bool&,              // return value: has alpha channel ?
                       GLubyte*&);         // return value: data
};

#endif