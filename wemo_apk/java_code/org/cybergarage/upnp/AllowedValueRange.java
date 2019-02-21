package org.cybergarage.upnp;

import org.cybergarage.xml.Node;

public class AllowedValueRange
{
  public static final String ELEM_NAME = "allowedValueRange";
  private static final String MAXIMUM = "maximum";
  private static final String MINIMUM = "minimum";
  private static final String STEP = "step";
  private Node allowedValueRangeNode;
  
  public AllowedValueRange()
  {
    this.allowedValueRangeNode = new Node("allowedValueRange");
  }
  
  public AllowedValueRange(Number paramNumber1, Number paramNumber2, Number paramNumber3)
  {
    this.allowedValueRangeNode = new Node("allowedValueRange");
    if (paramNumber1 != null) {
      setMaximum(paramNumber1.toString());
    }
    if (paramNumber2 != null) {
      setMinimum(paramNumber2.toString());
    }
    if (paramNumber3 != null) {
      setStep(paramNumber3.toString());
    }
  }
  
  public AllowedValueRange(Node paramNode)
  {
    this.allowedValueRangeNode = paramNode;
  }
  
  public static boolean isAllowedValueRangeNode(Node paramNode)
  {
    return "allowedValueRange".equals(paramNode.getName());
  }
  
  public Node getAllowedValueRangeNode()
  {
    return this.allowedValueRangeNode;
  }
  
  public String getMaximum()
  {
    return getAllowedValueRangeNode().getNodeValue("maximum");
  }
  
  public String getMinimum()
  {
    return getAllowedValueRangeNode().getNodeValue("minimum");
  }
  
  public String getStep()
  {
    return getAllowedValueRangeNode().getNodeValue("step");
  }
  
  public void setMaximum(String paramString)
  {
    getAllowedValueRangeNode().setNode("maximum", paramString);
  }
  
  public void setMinimum(String paramString)
  {
    getAllowedValueRangeNode().setNode("minimum", paramString);
  }
  
  public void setStep(String paramString)
  {
    getAllowedValueRangeNode().setNode("step", paramString);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/cybergarage/upnp/AllowedValueRange.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */