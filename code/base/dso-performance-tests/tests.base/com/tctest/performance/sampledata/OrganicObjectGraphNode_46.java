package com.tctest.performance.sampledata;

public final class OrganicObjectGraphNode_46 extends OrganicObjectGraph {

  private int size = 28;
  private int[] types = new int[] { 3, 2, 2, 2, 1, 1, 1, 3, 2, 3, 2, 0, 3, 0, 1, 0, 2, 2, 2, 1, 1, 3, 3, 1, 1, 3, 3, 2 };

  private double f0;
  private short f1;
  private short f2;
  private short f3;
  private String f4;
  private String f5;
  private String f6;
  private double f7;
  private short f8;
  private double f9;
  private short f10;
  private int f11;
  private double f12;
  private int f13;
  private String f14;
  private int f15;
  private short f16;
  private short f17;
  private short f18;
  private String f19;
  private String f20;
  private double f21;
  private double f22;
  private String f23;
  private String f24;
  private double f25;
  private double f26;
  private short f27;

  public OrganicObjectGraphNode_46(int sequenceNumber, String envKey) {
    super(sequenceNumber, envKey);
  }

  public OrganicObjectGraphNode_46() {
    super();
  }

  protected int getSize() {
    return size;
  }

  protected int getType(int index) {
    return types[index];
  }

  protected void setValue(int index, double value) {
    switch (index) {
      case 0:
        f0 = value;
      case 7:
        f7 = value;
      case 9:
        f9 = value;
      case 12:
        f12 = value;
      case 21:
        f21 = value;
      case 22:
        f22 = value;
      case 25:
        f25 = value;
      case 26:
        f26 = value;
      default:
        break;
    }
  }

  protected void setValue(int index, short value) {
    switch (index) {
      case 1:
        f1 = value;
      case 2:
        f2 = value;
      case 3:
        f3 = value;
      case 8:
        f8 = value;
      case 10:
        f10 = value;
      case 16:
        f16 = value;
      case 17:
        f17 = value;
      case 18:
        f18 = value;
      case 27:
        f27 = value;
      default:
        break;
    }
  }

  protected void setValue(int index, String value) {
    switch (index) {
      case 4:
        f4 = value;
      case 5:
        f5 = value;
      case 6:
        f6 = value;
      case 14:
        f14 = value;
      case 19:
        f19 = value;
      case 20:
        f20 = value;
      case 23:
        f23 = value;
      case 24:
        f24 = value;
      default:
        break;
    }
  }

  protected void setValue(int index, int value) {
    switch (index) {
      case 11:
        f11 = value;
      case 13:
        f13 = value;
      case 15:
        f15 = value;
      default:
        break;
    }
  }

  public boolean equals(Object rawObj) {
    if (!(rawObj instanceof OrganicObjectGraphNode_46)) { System.out.println("not instanceof"); System.out.println(rawObj.getClass().getName() + "=OrganicObjectGraphNode_46"); return false; }
    OrganicObjectGraphNode_46 obj = (OrganicObjectGraphNode_46) rawObj;
    if (f0 != obj.f0) return false;
    if (f1 != obj.f1) return false;
    if (f2 != obj.f2) return false;
    if (f3 != obj.f3) return false;
    if (!("" + f4).equals("" + obj.f4)) return false;
    if (!("" + f5).equals("" + obj.f5)) return false;
    if (!("" + f6).equals("" + obj.f6)) return false;
    if (f7 != obj.f7) return false;
    if (f8 != obj.f8) return false;
    if (f9 != obj.f9) return false;
    if (f10 != obj.f10) return false;
    if (f11 != obj.f11) return false;
    if (f12 != obj.f12) return false;
    if (f13 != obj.f13) return false;
    if (!("" + f14).equals("" + obj.f14)) return false;
    if (f15 != obj.f15) return false;
    if (f16 != obj.f16) return false;
    if (f17 != obj.f17) return false;
    if (f18 != obj.f18) return false;
    if (!("" + f19).equals("" + obj.f19)) return false;
    if (!("" + f20).equals("" + obj.f20)) return false;
    if (f21 != obj.f21) return false;
    if (f22 != obj.f22) return false;
    if (!("" + f23).equals("" + obj.f23)) return false;
    if (!("" + f24).equals("" + obj.f24)) return false;
    if (f25 != obj.f25) return false;
    if (f26 != obj.f26) return false;
    if (f27 != obj.f27) return false;
    return super.equals(obj);
  }
}
