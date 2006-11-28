package com.tc.admin.common;

import org.dijon.TextField;

import javax.swing.JPopupMenu;

public class XTextField extends TextField {
  protected TextComponentHelper m_helper;
  
  public XTextField() {
    super();
    m_helper = new TextComponentHelper(this);
    setPopupMenu(createPopup());
  }
  
  protected JPopupMenu createPopup() {
    return m_helper.createPopup();
  }

  public void setPopupMenu(JPopupMenu popupMenu) {
    m_helper.setPopupMenu(popupMenu);
  }

  public JPopupMenu getPopupMenu() {
    return m_helper.getPopupMenu();
  }
}
