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
package com.tc.config.schema.beanfactory;

import org.xml.sax.SAXParseException;

import com.tc.util.Assert;

/**
 * An XML bean, plus a list of errors.
 */
public class BeanWithErrors {

  private final Object bean;
  private final SAXParseException[] errors;

  public BeanWithErrors(Object bean, SAXParseException[] errors) {
    Assert.assertNotNull(bean);
    Assert.assertNoNullElements(errors);

    this.bean = bean;
    this.errors = errors;
  }

  public Object bean() {
    return this.bean;
  }

  public SAXParseException[] errors() {
    return this.errors;
  }

}