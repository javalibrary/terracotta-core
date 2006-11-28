/*
 * Copyright (c) 2003-2006 Terracotta, Inc. All rights reserved.
 */
package org.terracotta.dso.editors.tree;

import org.eclipse.core.resources.IProject;

import com.tc.admin.common.XRootNode;

public class ProjectRoot extends XRootNode {
  protected IProject m_project;
  
  public ProjectRoot(IProject project) {
    super(project);
    m_project = project;
  }
  
  public IProject getProject() {
    return m_project;
  }
}
