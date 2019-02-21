package com.localytics.android;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

final class JsonHelper
{
  private static Object fromJson(Object paramObject)
    throws JSONException
  {
    if (paramObject == JSONObject.NULL) {
      paramObject = null;
    }
    do
    {
      return paramObject;
      if ((paramObject instanceof JSONObject)) {
        return toMap((JSONObject)paramObject);
      }
    } while (!(paramObject instanceof JSONArray));
    return toList((JSONArray)paramObject);
  }
  
  static Map<String, Object> getMap(JSONObject paramJSONObject, String paramString)
    throws JSONException
  {
    return toMap(paramJSONObject.getJSONObject(paramString));
  }
  
  static boolean getSafeBooleanFromMap(Map<String, Object> paramMap, String paramString)
  {
    Object localObject = paramMap.get(paramString);
    boolean bool2;
    if ((localObject instanceof Boolean)) {
      bool2 = ((Boolean)localObject).booleanValue();
    }
    boolean bool1;
    do
    {
      return bool2;
      if ((localObject instanceof Integer)) {
        return ((Integer)localObject).intValue() != 0;
      }
      bool1 = localObject instanceof String;
      bool2 = false;
    } while (!bool1);
    return ((String)localObject).equalsIgnoreCase("true");
  }
  
  static int getSafeIntegerFromMap(Map<String, Object> paramMap, String paramString)
  {
    Object localObject = paramMap.get(paramString);
    if (localObject == null) {
      return 0;
    }
    int i;
    if ((localObject instanceof Integer)) {
      i = ((Integer)localObject).intValue();
    }
    for (;;)
    {
      return i;
      boolean bool = localObject instanceof String;
      i = 0;
      if (bool) {
        i = Integer.parseInt((String)localObject);
      }
    }
  }
  
  static List<Object> getSafeListFromMap(Map<String, Object> paramMap, String paramString)
  {
    Object localObject = paramMap.get(paramString);
    if (localObject == null) {
      return null;
    }
    boolean bool = localObject instanceof List;
    List localList = null;
    if (bool) {
      localList = (List)localObject;
    }
    return localList;
  }
  
  static Map<String, Object> getSafeMapFromMap(Map<String, Object> paramMap, String paramString)
  {
    Object localObject = paramMap.get(paramString);
    if (localObject == null) {
      return null;
    }
    boolean bool = localObject instanceof Map;
    Map localMap = null;
    if (bool) {
      localMap = (Map)localObject;
    }
    return localMap;
  }
  
  static String getSafeStringFromMap(Map<String, Object> paramMap, String paramString)
  {
    Object localObject = paramMap.get(paramString);
    if (localObject == null) {
      return null;
    }
    String str;
    if ((localObject instanceof Integer)) {
      str = Integer.toString(((Integer)localObject).intValue());
    }
    for (;;)
    {
      return str;
      boolean bool = localObject instanceof String;
      str = null;
      if (bool) {
        str = (String)localObject;
      }
    }
  }
  
  static String getSafeStringFromValue(Object paramObject)
  {
    if (paramObject == null) {
      return null;
    }
    String str;
    if ((paramObject instanceof Integer)) {
      str = Integer.toString(((Integer)paramObject).intValue());
    }
    for (;;)
    {
      return str;
      boolean bool = paramObject instanceof String;
      str = null;
      if (bool) {
        str = (String)paramObject;
      }
    }
  }
  
  static boolean isEmptyObject(JSONObject paramJSONObject)
  {
    return paramJSONObject.names() == null;
  }
  
  static Object toJSON(Object paramObject)
    throws JSONException
  {
    if ((paramObject instanceof Map))
    {
      localObject1 = new JSONObject();
      Map localMap = (Map)paramObject;
      Iterator localIterator1 = localMap.keySet().iterator();
      while (localIterator1.hasNext())
      {
        Object localObject2 = localIterator1.next();
        ((JSONObject)localObject1).put(localObject2.toString(), toJSON(localMap.get(localObject2)));
      }
    }
    if ((paramObject instanceof Iterable))
    {
      localObject1 = new JSONArray();
      Iterator localIterator2 = ((Iterable)paramObject).iterator();
      while (localIterator2.hasNext()) {
        ((JSONArray)localObject1).put(toJSON(localIterator2.next()));
      }
    }
    Object localObject1 = paramObject;
    return localObject1;
  }
  
  static List toList(JSONArray paramJSONArray)
    throws JSONException
  {
    ArrayList localArrayList = new ArrayList();
    for (int i = 0; i < paramJSONArray.length(); i++) {
      localArrayList.add(fromJson(paramJSONArray.get(i)));
    }
    return localArrayList;
  }
  
  static Map<String, Object> toMap(JSONObject paramJSONObject)
    throws JSONException
  {
    HashMap localHashMap = new HashMap();
    Iterator localIterator = paramJSONObject.keys();
    while (localIterator.hasNext())
    {
      String str = (String)localIterator.next();
      localHashMap.put(str, fromJson(paramJSONObject.get(str)));
    }
    return localHashMap;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/localytics/android/JsonHelper.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */