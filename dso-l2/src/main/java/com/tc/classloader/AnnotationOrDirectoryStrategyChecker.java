/*
 *
 *  The contents of this file are subject to the Terracotta Public License Version
 *  2.0 (the "License"); You may not use this file except in compliance with the
 *  License. You may obtain a copy of the License at
 *
 *  http://terracotta.org/legal/terracotta-public-license.
 *
 *  Software distributed under the License is distributed on an "AS IS" basis,
 *  WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License for
 *  the specific language governing rights and limitations under the License.
 *
 *  The Covered Software is Terracotta Core.
 *
 *  The Initial Developer of the Covered Software is
 *  Terracotta, Inc., a Software AG company
 *
 */
package com.tc.classloader;

/**
 * @author vmad
 */
public class AnnotationOrDirectoryStrategyChecker implements CommonComponentChecker {
    /**
     * @param clazz to be checked
     * @return true if given class is a common component
     */
    @Override
    public boolean check(Class<?> clazz) {
        if(clazz.getClassLoader() instanceof ApiClassLoader) {
            return true;
        } else if(clazz.getAnnotation(CommonComponent.class) != null) {
            return true;
        } else {
            return false;
        }
    }
}
