/*
 * Copyright (c) 2011, 2023, Oracle and/or its affiliates. All rights reserved.
 * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
 *
 * This code is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License version 2 only, as
 * published by the Free Software Foundation.  Oracle designates this
 * particular file as subject to the "Classpath" exception as provided
 * by Oracle in the LICENSE file that accompanied this code.
 *
 * This code is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
 * version 2 for more details (a copy is included in the LICENSE file that
 * accompanied this code).
 *
 * You should have received a copy of the GNU General Public License version
 * 2 along with this work; if not, write to the Free Software Foundation,
 * Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
 *
 * Please contact Oracle, 500 Oracle Parkway, Redwood Shores, CA 94065 USA
 * or visit www.oracle.com if you need additional information or have any
 * questions.
 */

#import <jni.h>
#import <mach-o/dyld.h>
#import <jni_util.h>

#import "InitIDs.h"

JNIEXPORT void JNICALL Java_java_awt_AWTEvent_initIDs
(JNIEnv *env, jclass cls)
{
}

JNIEXPORT void JNICALL Java_java_awt_Checkbox_initIDs
(JNIEnv *env, jclass cls)
{
}

JNIEXPORT void JNICALL Java_java_awt_CheckboxMenuItem_initIDs
(JNIEnv *env, jclass cls)
{
}

JNIEXPORT void JNICALL Java_java_awt_Choice_initIDs
(JNIEnv *env, jclass cls)
{
}

JNIEXPORT void JNICALL Java_java_awt_Component_initIDs
(JNIEnv *env, jclass cls)
{
}

JNIEXPORT void JNICALL Java_java_awt_Container_initIDs
(JNIEnv *env, jclass cls)
{
}

JNIEXPORT void JNICALL Java_java_awt_Cursor_initIDs
(JNIEnv *env, jclass cls)
{
}

JNIEXPORT void JNICALL Java_java_awt_Dialog_initIDs
(JNIEnv *env, jclass cls)
{
}

JNIEXPORT void JNICALL Java_java_awt_Dimension_initIDs
(JNIEnv *env, jclass cls)
{
}

JNIEXPORT void JNICALL Java_java_awt_Event_initIDs
(JNIEnv *env, jclass cls)
{
}

JNIEXPORT void JNICALL Java_java_awt_Font_initIDs
(JNIEnv *env, jclass cls)
{
}

JNIEXPORT void JNICALL Java_java_awt_FontMetrics_initIDs
(JNIEnv *env, jclass cls)
{
}

JNIEXPORT void JNICALL Java_java_awt_Frame_initIDs
(JNIEnv *env, jclass cls)
{
}

JNIEXPORT void JNICALL Java_java_awt_Insets_initIDs
(JNIEnv *env, jclass cls)
{
}

JNIEXPORT void JNICALL Java_java_awt_Label_initIDs
(JNIEnv *env, jclass cls)
{
}

JNIEXPORT void JNICALL Java_java_awt_Menu_initIDs
(JNIEnv *env, jclass cls)
{
}

JNIEXPORT void JNICALL Java_java_awt_MenuBar_initIDs
(JNIEnv *env, jclass cls)
{
}

JNIEXPORT void JNICALL Java_java_awt_MenuComponent_initIDs
(JNIEnv *env, jclass cls)
{
}

JNIEXPORT void JNICALL Java_java_awt_MenuItem_initIDs
(JNIEnv *env, jclass cls)
{
}

JNIEXPORT void JNICALL Java_java_awt_ScrollPane_initIDs
(JNIEnv *env, jclass cls)
{
}

JNIEXPORT void JNICALL Java_java_awt_ScrollPaneAdjustable_initIDs
(JNIEnv *env, jclass cls)
{
}

JNIEXPORT void JNICALL Java_java_awt_Scrollbar_initIDs
(JNIEnv *env, jclass cls)
{
}

JNIEXPORT void JNICALL Java_java_awt_TextArea_initIDs
(JNIEnv *env, jclass cls)
{
}

JNIEXPORT void JNICALL Java_java_awt_Toolkit_initIDs
(JNIEnv *env, jclass cls)
{
}

JNIEXPORT void JNICALL Java_java_awt_Window_initIDs
(JNIEnv *env, jclass cls)
{
}

JNIEXPORT void JNICALL Java_java_awt_event_InputEvent_initIDs
(JNIEnv *env, jclass cls)
{
}

JNIEXPORT void JNICALL Java_java_awt_event_KeyEvent_initIDs
(JNIEnv *env, jclass cls)
{
}

JNIEXPORT void JNICALL Java_java_awt_event_MouseEvent_initIDs
(JNIEnv *env, jclass cls)
{
}

JNIEXPORT jarray JNICALL Java_sun_font_FontManagerNativeLibrary_loadedLibraries
    (JNIEnv *env, jclass cls)
{
  const uint32_t count = _dyld_image_count();

  jclass stringClazz = (*env)->FindClass(env, "java/lang/String");
  CHECK_NULL_RETURN(stringClazz, NULL);
  jarray libsArray = (*env)->NewObjectArray(env, count, stringClazz, NULL);
  JNU_CHECK_EXCEPTION_RETURN(env, NULL);

  if ((*env)->EnsureLocalCapacity(env, count + 2) != JNI_OK) {
    return NULL; // OOME has been thrown already
  }

  for (uint32_t i = 0; i < count; i++) {
    const char * name = _dyld_get_image_name(i);
    if (name) {
      jstring jName = (*env)->NewStringUTF(env, name);
      JNU_CHECK_EXCEPTION_RETURN(env, NULL);
      (*env)->SetObjectArrayElement(env, libsArray, i, jName);
      JNU_CHECK_EXCEPTION_RETURN(env, NULL);
    }
  }

  return libsArray;
}
