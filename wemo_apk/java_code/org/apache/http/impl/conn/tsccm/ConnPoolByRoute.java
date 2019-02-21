package org.apache.http.impl.conn.tsccm;

import java.util.Map;
import java.util.Queue;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.locks.Condition;
import org.apache.http.conn.ClientConnectionOperator;
import org.apache.http.conn.ConnectionPoolTimeoutException;
import org.apache.http.conn.routing.HttpRoute;
import org.apache.http.params.HttpParams;

@Deprecated
public class ConnPoolByRoute
  extends AbstractConnPool
{
  protected Queue<BasicPoolEntry> freeConnections;
  protected final int maxTotalConnections;
  protected final ClientConnectionOperator operator;
  protected final Map<HttpRoute, RouteSpecificPool> routeToPool;
  protected Queue<WaitingThread> waitingThreads;
  
  public ConnPoolByRoute(ClientConnectionOperator paramClientConnectionOperator, HttpParams paramHttpParams)
  {
    throw new RuntimeException("Stub!");
  }
  
  protected BasicPoolEntry createEntry(RouteSpecificPool paramRouteSpecificPool, ClientConnectionOperator paramClientConnectionOperator)
  {
    throw new RuntimeException("Stub!");
  }
  
  protected Queue<BasicPoolEntry> createFreeConnQueue()
  {
    throw new RuntimeException("Stub!");
  }
  
  protected Map<HttpRoute, RouteSpecificPool> createRouteToPoolMap()
  {
    throw new RuntimeException("Stub!");
  }
  
  protected Queue<WaitingThread> createWaitingThreadQueue()
  {
    throw new RuntimeException("Stub!");
  }
  
  public void deleteClosedConnections()
  {
    throw new RuntimeException("Stub!");
  }
  
  protected void deleteEntry(BasicPoolEntry paramBasicPoolEntry)
  {
    throw new RuntimeException("Stub!");
  }
  
  protected void deleteLeastUsedEntry()
  {
    throw new RuntimeException("Stub!");
  }
  
  public void freeEntry(BasicPoolEntry paramBasicPoolEntry, boolean paramBoolean, long paramLong, TimeUnit paramTimeUnit)
  {
    throw new RuntimeException("Stub!");
  }
  
  public int getConnectionsInPool(HttpRoute paramHttpRoute)
  {
    throw new RuntimeException("Stub!");
  }
  
  protected BasicPoolEntry getEntryBlocking(HttpRoute paramHttpRoute, Object paramObject, long paramLong, TimeUnit paramTimeUnit, WaitingThreadAborter paramWaitingThreadAborter)
    throws ConnectionPoolTimeoutException, InterruptedException
  {
    throw new RuntimeException("Stub!");
  }
  
  protected BasicPoolEntry getFreeEntry(RouteSpecificPool paramRouteSpecificPool, Object paramObject)
  {
    throw new RuntimeException("Stub!");
  }
  
  protected RouteSpecificPool getRoutePool(HttpRoute paramHttpRoute, boolean paramBoolean)
  {
    throw new RuntimeException("Stub!");
  }
  
  protected void handleLostEntry(HttpRoute paramHttpRoute)
  {
    throw new RuntimeException("Stub!");
  }
  
  protected RouteSpecificPool newRouteSpecificPool(HttpRoute paramHttpRoute)
  {
    throw new RuntimeException("Stub!");
  }
  
  protected WaitingThread newWaitingThread(Condition paramCondition, RouteSpecificPool paramRouteSpecificPool)
  {
    throw new RuntimeException("Stub!");
  }
  
  protected void notifyWaitingThread(RouteSpecificPool paramRouteSpecificPool)
  {
    throw new RuntimeException("Stub!");
  }
  
  public PoolEntryRequest requestPoolEntry(HttpRoute paramHttpRoute, Object paramObject)
  {
    throw new RuntimeException("Stub!");
  }
  
  public void shutdown()
  {
    throw new RuntimeException("Stub!");
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/apache/http/impl/conn/tsccm/ConnPoolByRoute.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */