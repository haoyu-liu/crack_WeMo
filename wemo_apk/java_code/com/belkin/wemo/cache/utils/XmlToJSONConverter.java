package com.belkin.wemo.cache.utils;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.w3c.dom.DOMException;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

public class XmlToJSONConverter
{
  private Node xmlNode = null;
  
  public XmlToJSONConverter(Node paramNode)
  {
    this.xmlNode = paramNode;
  }
  
  private JSONObject getChildNode(Node paramNode)
  {
    if (paramNode == null) {
      return null;
    }
    JSONObject localJSONObject = new JSONObject();
    try
    {
      localJSONObject.put(paramNode.getNodeName(), paramNode.getNodeValue());
      return localJSONObject;
    }
    catch (DOMException localDOMException)
    {
      localDOMException.printStackTrace();
      return localJSONObject;
    }
    catch (JSONException localJSONException)
    {
      localJSONException.printStackTrace();
    }
    return localJSONObject;
  }
  
  private JSONArray getJSONforNode(Node paramNode)
  {
    if (paramNode == null)
    {
      localJSONArray = null;
      return localJSONArray;
    }
    JSONArray localJSONArray = new JSONArray();
    int i = 0;
    for (;;)
    {
      int j;
      try
      {
        if (i >= paramNode.getChildNodes().getLength()) {
          break;
        }
        Node localNode1 = paramNode.getChildNodes().item(i);
        if (localNode1 != null)
        {
          JSONObject localJSONObject = new JSONObject();
          if ((localNode1.getChildNodes().getLength() == 1) && (localNode1.getFirstChild().getNodeType() == 3))
          {
            localJSONObject.put(localNode1.getNodeName(), localNode1.getFirstChild().getNodeValue());
            localJSONArray.put(localJSONObject);
            if (i >= -1 + paramNode.getChildNodes().getLength()) {}
          }
          else
          {
            if (localNode1.getChildNodes().getLength() > 0)
            {
              NodeList localNodeList = localNode1.getChildNodes();
              j = 0;
              if (i >= localNodeList.getLength()) {
                continue;
              }
              Node localNode2 = localNodeList.item(j);
              if (localNode2 == null) {
                break label259;
              }
              localJSONObject.put(localNode1.getNodeName(), getChildNode(localNode2));
              break label259;
            }
            localJSONObject.put(localNode1.getNodeName(), localNode1.getNodeValue());
            continue;
          }
        }
        i++;
      }
      catch (Exception localException)
      {
        localException.printStackTrace();
        return localJSONArray;
      }
      continue;
      label259:
      j++;
    }
  }
  
  private String getJSONforNodeForMaker(Node paramNode)
  {
    if (paramNode == null) {
      return "";
    }
    String str1 = "{";
    int i = 0;
    if (i < paramNode.getChildNodes().getLength())
    {
      Node localNode = paramNode.getChildNodes().item(i);
      if (localNode != null)
      {
        if ((localNode.getChildNodes().getLength() != 1) || (localNode.getFirstChild().getNodeType() != 3)) {
          break label198;
        }
        String str4 = str1 + "\"" + localNode.getNodeName() + "\": ";
        str1 = str4 + "\"" + localNode.getFirstChild().getNodeValue() + "\" ";
      }
      for (;;)
      {
        if (i < -1 + paramNode.getChildNodes().getLength()) {
          str1 = str1 + ",";
        }
        i++;
        break;
        label198:
        if (localNode.getChildNodes().getLength() > 0)
        {
          String str3 = str1 + "\"" + localNode.getNodeName() + "\": ";
          str1 = str3 + getJSONforNode(localNode);
        }
        else
        {
          String str2 = str1 + "\"" + localNode.getNodeName() + "\": ";
          str1 = str2 + "\"" + localNode.getNodeValue() + "\" ";
        }
      }
    }
    return str1 + "}";
  }
  
  public String getJSONMakerString()
  {
    return getJSONforNodeForMaker(this.xmlNode);
  }
  
  public String getJSONString()
  {
    return getJSONforNode(this.xmlNode).toString();
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/utils/XmlToJSONConverter.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */