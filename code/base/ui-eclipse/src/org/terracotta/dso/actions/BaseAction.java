/*
 * Copyright (c) 2003-2006 Terracotta, Inc. All rights reserved.
 */
package org.terracotta.dso.actions;

import org.eclipse.core.resources.IProject;
import org.eclipse.jdt.core.ICompilationUnit;
import org.eclipse.jdt.core.IJavaElement;
import org.eclipse.jface.action.Action;
import org.eclipse.swt.widgets.Display;
import org.eclipse.swt.widgets.Event;
import org.eclipse.ui.IWorkbench;
import org.eclipse.ui.PlatformUI;

import org.terracotta.dso.ConfigurationHelper;
import org.terracotta.dso.TcPlugin;

/**
 * Base type for all popup actions which operate on Jave Project elements.
 *
 * @see org.eclipse.core.resources.IProject
 * @see org.eclipse.jdt.core.ICompilationUnit
 * @see org.eclipse.jdt.core.IJavaElement
 */

public class BaseAction extends Action {
  protected IJavaElement m_element;
  
  public BaseAction(String label) {
    super(label);
  }
  
  public BaseAction(String label, int type) {
    super(label, type);
  }
  
  public void setJavaElement(IJavaElement element) {
    m_element = element;
  }
  
  public IJavaElement getJavaElement() {
    return m_element;
  }
  
  public ICompilationUnit getCompilationUnit() {
    if(m_element != null) {
      return (ICompilationUnit)m_element.getAncestor(IJavaElement.COMPILATION_UNIT);
    }
    
    return null;
  }
  
  public void performAction() {
    // do nothing
  }
  
  public void performAction(Event event) {
    performAction();
  }
  
  protected void inspectCompilationUnit() {
    ICompilationUnit cu = getCompilationUnit();
    
    if(cu != null) {
      TcPlugin.getDefault().inspect(cu);
    }
  }
  
  public void runWithEvent(final Event event) {
    IWorkbench workbench = PlatformUI.getWorkbench();
    Display    display   = workbench.getDisplay();
    
    display.asyncExec(new Runnable () {
      public void run() {
        if(getJavaElement() != null) {
          performAction(event);
        }
      }
    });
  }

  protected ConfigurationHelper getConfigHelper() {
    ConfigurationHelper helper  = null;    
    IProject            project = getProject();
    
    if(project != null) {
      helper = TcPlugin.getDefault().getConfigurationHelper(project);
    }
    
    return helper;
  }
  
  protected IProject getProject() {
    return m_element != null ? m_element.getJavaProject().getProject() : null;
  }
}
