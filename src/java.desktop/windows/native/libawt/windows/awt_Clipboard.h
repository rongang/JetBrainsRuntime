/*
 * Copyright (c) 1996, 2020, Oracle and/or its affiliates. All rights reserved.
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

#ifndef AWT_CLIPBOARD_H
#define AWT_CLIPBOARD_H

#include "awt.h"


/************************************************************************
 * AwtClipboard class
 */

class AwtClipboard {
private:
    static volatile BOOL isGettingOwnership;
    static volatile BOOL isClipboardViewerRegistered;
    static volatile jmethodID handleContentsChangedMID;

public:
    static jmethodID lostSelectionOwnershipMID;
    static jobject theCurrentClipboard;

    INLINE static void GetOwnership() {
        AwtClipboard::isGettingOwnership = TRUE;
        VERIFY(EmptyClipboard());
        AwtClipboard::isGettingOwnership = FALSE;
        AwtClipboard::isOwner = TRUE;
    }

    INLINE static BOOL IsGettingOwnership() {
        return isGettingOwnership;
    }

    static void LostOwnership(JNIEnv *env);
    static void WmClipboardUpdate(JNIEnv *env);
    static void RegisterClipboardViewer(JNIEnv *env, jobject jclipboard);
    static void UnregisterClipboardViewer(JNIEnv *env);

    // ===================== JBR-5980 Pasting from clipboard not working reliably in Windows ==========================
public:
    static jmethodID ensureNoOwnedDataMID;

public:
    static void SetOwnershipExtraChecksEnabled(BOOL enabled);
    // Checks if ownership has been lost since the last check or the last acquiring of ownership
    static void ExtraCheckOfOwnership();

private:
    static volatile BOOL areOwnershipExtraChecksEnabled;
    static volatile BOOL isOwner;
    // ================================================================================================================
};

#endif /* AWT_CLIPBOARD_H */
