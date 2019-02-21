package android.support.v4.app;

import android.content.Context;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.os.Build.VERSION;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.Parcelable;
import android.support.annotation.CallSuper;
import android.support.v4.util.DebugUtils;
import android.support.v4.util.LogWriter;
import android.support.v4.view.LayoutInflaterFactory;
import android.support.v4.view.ViewCompat;
import android.util.AttributeSet;
import android.util.Log;
import android.util.SparseArray;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.AccelerateInterpolator;
import android.view.animation.AlphaAnimation;
import android.view.animation.Animation;
import android.view.animation.Animation.AnimationListener;
import android.view.animation.AnimationSet;
import android.view.animation.AnimationUtils;
import android.view.animation.DecelerateInterpolator;
import android.view.animation.Interpolator;
import android.view.animation.ScaleAnimation;
import java.io.FileDescriptor;
import java.io.PrintWriter;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

final class FragmentManagerImpl
  extends FragmentManager
  implements LayoutInflaterFactory
{
  static final Interpolator ACCELERATE_CUBIC = new AccelerateInterpolator(1.5F);
  static final Interpolator ACCELERATE_QUINT;
  static final int ANIM_DUR = 220;
  public static final int ANIM_STYLE_CLOSE_ENTER = 3;
  public static final int ANIM_STYLE_CLOSE_EXIT = 4;
  public static final int ANIM_STYLE_FADE_ENTER = 5;
  public static final int ANIM_STYLE_FADE_EXIT = 6;
  public static final int ANIM_STYLE_OPEN_ENTER = 1;
  public static final int ANIM_STYLE_OPEN_EXIT = 2;
  static boolean DEBUG = false;
  static final Interpolator DECELERATE_CUBIC;
  static final Interpolator DECELERATE_QUINT;
  static final boolean HONEYCOMB = false;
  static final String TAG = "FragmentManager";
  static final String TARGET_REQUEST_CODE_STATE_TAG = "android:target_req_state";
  static final String TARGET_STATE_TAG = "android:target_state";
  static final String USER_VISIBLE_HINT_TAG = "android:user_visible_hint";
  static final String VIEW_STATE_TAG = "android:view_state";
  static Field sAnimationListenerField;
  ArrayList<Fragment> mActive;
  ArrayList<Fragment> mAdded;
  ArrayList<Integer> mAvailBackStackIndices;
  ArrayList<Integer> mAvailIndices;
  ArrayList<BackStackRecord> mBackStack;
  ArrayList<FragmentManager.OnBackStackChangedListener> mBackStackChangeListeners;
  ArrayList<BackStackRecord> mBackStackIndices;
  FragmentContainer mContainer;
  FragmentController mController;
  ArrayList<Fragment> mCreatedMenus;
  int mCurState = 0;
  boolean mDestroyed;
  Runnable mExecCommit = new Runnable()
  {
    public void run()
    {
      FragmentManagerImpl.this.execPendingActions();
    }
  };
  boolean mExecutingActions;
  boolean mHavePendingDeferredStart;
  FragmentHostCallback mHost;
  boolean mNeedMenuInvalidate;
  String mNoTransactionsBecause;
  Fragment mParent;
  ArrayList<Runnable> mPendingActions;
  SparseArray<Parcelable> mStateArray = null;
  Bundle mStateBundle = null;
  boolean mStateSaved;
  Runnable[] mTmpActions;
  
  static
  {
    int i = Build.VERSION.SDK_INT;
    boolean bool = false;
    if (i >= 11) {
      bool = true;
    }
    HONEYCOMB = bool;
    sAnimationListenerField = null;
    DECELERATE_QUINT = new DecelerateInterpolator(2.5F);
    DECELERATE_CUBIC = new DecelerateInterpolator(1.5F);
    ACCELERATE_QUINT = new AccelerateInterpolator(2.5F);
  }
  
  private void checkStateLoss()
  {
    if (this.mStateSaved) {
      throw new IllegalStateException("Can not perform this action after onSaveInstanceState");
    }
    if (this.mNoTransactionsBecause != null) {
      throw new IllegalStateException("Can not perform this action inside of " + this.mNoTransactionsBecause);
    }
  }
  
  static Animation makeFadeAnimation(Context paramContext, float paramFloat1, float paramFloat2)
  {
    AlphaAnimation localAlphaAnimation = new AlphaAnimation(paramFloat1, paramFloat2);
    localAlphaAnimation.setInterpolator(DECELERATE_CUBIC);
    localAlphaAnimation.setDuration(220L);
    return localAlphaAnimation;
  }
  
  static Animation makeOpenCloseAnimation(Context paramContext, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4)
  {
    AnimationSet localAnimationSet = new AnimationSet(false);
    ScaleAnimation localScaleAnimation = new ScaleAnimation(paramFloat1, paramFloat2, paramFloat1, paramFloat2, 1, 0.5F, 1, 0.5F);
    localScaleAnimation.setInterpolator(DECELERATE_QUINT);
    localScaleAnimation.setDuration(220L);
    localAnimationSet.addAnimation(localScaleAnimation);
    AlphaAnimation localAlphaAnimation = new AlphaAnimation(paramFloat3, paramFloat4);
    localAlphaAnimation.setInterpolator(DECELERATE_CUBIC);
    localAlphaAnimation.setDuration(220L);
    localAnimationSet.addAnimation(localAlphaAnimation);
    return localAnimationSet;
  }
  
  static boolean modifiesAlpha(Animation paramAnimation)
  {
    if ((paramAnimation instanceof AlphaAnimation)) {
      return true;
    }
    if ((paramAnimation instanceof AnimationSet))
    {
      List localList = ((AnimationSet)paramAnimation).getAnimations();
      for (int i = 0;; i++)
      {
        if (i >= localList.size()) {
          break label55;
        }
        if ((localList.get(i) instanceof AlphaAnimation)) {
          break;
        }
      }
    }
    label55:
    return false;
  }
  
  public static int reverseTransit(int paramInt)
  {
    switch (paramInt)
    {
    default: 
      return 0;
    case 4097: 
      return 8194;
    case 8194: 
      return 4097;
    }
    return 4099;
  }
  
  private void setHWLayerAnimListenerIfAlpha(View paramView, Animation paramAnimation)
  {
    if ((paramView == null) || (paramAnimation == null)) {}
    while (!shouldRunOnHWLayer(paramView, paramAnimation)) {
      return;
    }
    try
    {
      if (sAnimationListenerField == null)
      {
        sAnimationListenerField = Animation.class.getDeclaredField("mListener");
        sAnimationListenerField.setAccessible(true);
      }
      localAnimationListener = (Animation.AnimationListener)sAnimationListenerField.get(paramAnimation);
    }
    catch (NoSuchFieldException localNoSuchFieldException)
    {
      for (;;)
      {
        Log.e("FragmentManager", "No field with the name mListener is found in Animation class", localNoSuchFieldException);
        localAnimationListener = null;
      }
    }
    catch (IllegalAccessException localIllegalAccessException)
    {
      for (;;)
      {
        Log.e("FragmentManager", "Cannot access Animation's mListener field", localIllegalAccessException);
        Animation.AnimationListener localAnimationListener = null;
      }
    }
    paramAnimation.setAnimationListener(new AnimateOnHWLayerIfNeededListener(paramView, paramAnimation, localAnimationListener));
  }
  
  static boolean shouldRunOnHWLayer(View paramView, Animation paramAnimation)
  {
    return (Build.VERSION.SDK_INT >= 19) && (ViewCompat.getLayerType(paramView) == 0) && (ViewCompat.hasOverlappingRendering(paramView)) && (modifiesAlpha(paramAnimation));
  }
  
  private void throwException(RuntimeException paramRuntimeException)
  {
    Log.e("FragmentManager", paramRuntimeException.getMessage());
    Log.e("FragmentManager", "Activity state:");
    PrintWriter localPrintWriter = new PrintWriter(new LogWriter("FragmentManager"));
    if (this.mHost != null) {}
    for (;;)
    {
      try
      {
        this.mHost.onDump("  ", null, localPrintWriter, new String[0]);
        throw paramRuntimeException;
      }
      catch (Exception localException2)
      {
        Log.e("FragmentManager", "Failed dumping state", localException2);
        continue;
      }
      try
      {
        dump("  ", null, localPrintWriter, new String[0]);
      }
      catch (Exception localException1)
      {
        Log.e("FragmentManager", "Failed dumping state", localException1);
      }
    }
  }
  
  public static int transitToStyleIndex(int paramInt, boolean paramBoolean)
  {
    switch (paramInt)
    {
    default: 
      return -1;
    case 4097: 
      if (paramBoolean) {
        return 1;
      }
      return 2;
    case 8194: 
      if (paramBoolean) {
        return 3;
      }
      return 4;
    }
    if (paramBoolean) {
      return 5;
    }
    return 6;
  }
  
  void addBackStackState(BackStackRecord paramBackStackRecord)
  {
    if (this.mBackStack == null) {
      this.mBackStack = new ArrayList();
    }
    this.mBackStack.add(paramBackStackRecord);
    reportBackStackChanged();
  }
  
  public void addFragment(Fragment paramFragment, boolean paramBoolean)
  {
    if (this.mAdded == null) {
      this.mAdded = new ArrayList();
    }
    if (DEBUG) {
      Log.v("FragmentManager", "add: " + paramFragment);
    }
    makeActive(paramFragment);
    if (!paramFragment.mDetached)
    {
      if (this.mAdded.contains(paramFragment)) {
        throw new IllegalStateException("Fragment already added: " + paramFragment);
      }
      this.mAdded.add(paramFragment);
      paramFragment.mAdded = true;
      paramFragment.mRemoving = false;
      if ((paramFragment.mHasMenu) && (paramFragment.mMenuVisible)) {
        this.mNeedMenuInvalidate = true;
      }
      if (paramBoolean) {
        moveToState(paramFragment);
      }
    }
  }
  
  public void addOnBackStackChangedListener(FragmentManager.OnBackStackChangedListener paramOnBackStackChangedListener)
  {
    if (this.mBackStackChangeListeners == null) {
      this.mBackStackChangeListeners = new ArrayList();
    }
    this.mBackStackChangeListeners.add(paramOnBackStackChangedListener);
  }
  
  public int allocBackStackIndex(BackStackRecord paramBackStackRecord)
  {
    try
    {
      if ((this.mAvailBackStackIndices == null) || (this.mAvailBackStackIndices.size() <= 0))
      {
        if (this.mBackStackIndices == null) {
          this.mBackStackIndices = new ArrayList();
        }
        int i = this.mBackStackIndices.size();
        if (DEBUG) {
          Log.v("FragmentManager", "Setting back stack index " + i + " to " + paramBackStackRecord);
        }
        this.mBackStackIndices.add(paramBackStackRecord);
        return i;
      }
      int j = ((Integer)this.mAvailBackStackIndices.remove(-1 + this.mAvailBackStackIndices.size())).intValue();
      if (DEBUG) {
        Log.v("FragmentManager", "Adding back stack index " + j + " with " + paramBackStackRecord);
      }
      this.mBackStackIndices.set(j, paramBackStackRecord);
      return j;
    }
    finally {}
  }
  
  public void attachController(FragmentHostCallback paramFragmentHostCallback, FragmentContainer paramFragmentContainer, Fragment paramFragment)
  {
    if (this.mHost != null) {
      throw new IllegalStateException("Already attached");
    }
    this.mHost = paramFragmentHostCallback;
    this.mContainer = paramFragmentContainer;
    this.mParent = paramFragment;
  }
  
  public void attachFragment(Fragment paramFragment, int paramInt1, int paramInt2)
  {
    if (DEBUG) {
      Log.v("FragmentManager", "attach: " + paramFragment);
    }
    if (paramFragment.mDetached)
    {
      paramFragment.mDetached = false;
      if (!paramFragment.mAdded)
      {
        if (this.mAdded == null) {
          this.mAdded = new ArrayList();
        }
        if (this.mAdded.contains(paramFragment)) {
          throw new IllegalStateException("Fragment already added: " + paramFragment);
        }
        if (DEBUG) {
          Log.v("FragmentManager", "add from attach: " + paramFragment);
        }
        this.mAdded.add(paramFragment);
        paramFragment.mAdded = true;
        if ((paramFragment.mHasMenu) && (paramFragment.mMenuVisible)) {
          this.mNeedMenuInvalidate = true;
        }
        moveToState(paramFragment, this.mCurState, paramInt1, paramInt2, false);
      }
    }
  }
  
  public FragmentTransaction beginTransaction()
  {
    return new BackStackRecord(this);
  }
  
  public void detachFragment(Fragment paramFragment, int paramInt1, int paramInt2)
  {
    if (DEBUG) {
      Log.v("FragmentManager", "detach: " + paramFragment);
    }
    if (!paramFragment.mDetached)
    {
      paramFragment.mDetached = true;
      if (paramFragment.mAdded)
      {
        if (this.mAdded != null)
        {
          if (DEBUG) {
            Log.v("FragmentManager", "remove from detach: " + paramFragment);
          }
          this.mAdded.remove(paramFragment);
        }
        if ((paramFragment.mHasMenu) && (paramFragment.mMenuVisible)) {
          this.mNeedMenuInvalidate = true;
        }
        paramFragment.mAdded = false;
        moveToState(paramFragment, 1, paramInt1, paramInt2, false);
      }
    }
  }
  
  public void dispatchActivityCreated()
  {
    this.mStateSaved = false;
    moveToState(2, false);
  }
  
  public void dispatchConfigurationChanged(Configuration paramConfiguration)
  {
    if (this.mAdded != null) {
      for (int i = 0; i < this.mAdded.size(); i++)
      {
        Fragment localFragment = (Fragment)this.mAdded.get(i);
        if (localFragment != null) {
          localFragment.performConfigurationChanged(paramConfiguration);
        }
      }
    }
  }
  
  public boolean dispatchContextItemSelected(MenuItem paramMenuItem)
  {
    if (this.mAdded != null) {
      for (int i = 0; i < this.mAdded.size(); i++)
      {
        Fragment localFragment = (Fragment)this.mAdded.get(i);
        if ((localFragment != null) && (localFragment.performContextItemSelected(paramMenuItem))) {
          return true;
        }
      }
    }
    return false;
  }
  
  public void dispatchCreate()
  {
    this.mStateSaved = false;
    moveToState(1, false);
  }
  
  public boolean dispatchCreateOptionsMenu(Menu paramMenu, MenuInflater paramMenuInflater)
  {
    ArrayList localArrayList1 = this.mAdded;
    ArrayList localArrayList2 = null;
    boolean bool = false;
    if (localArrayList1 != null) {
      for (int j = 0; j < this.mAdded.size(); j++)
      {
        Fragment localFragment2 = (Fragment)this.mAdded.get(j);
        if ((localFragment2 != null) && (localFragment2.performCreateOptionsMenu(paramMenu, paramMenuInflater)))
        {
          bool = true;
          if (localArrayList2 == null) {
            localArrayList2 = new ArrayList();
          }
          localArrayList2.add(localFragment2);
        }
      }
    }
    if (this.mCreatedMenus != null) {
      for (int i = 0; i < this.mCreatedMenus.size(); i++)
      {
        Fragment localFragment1 = (Fragment)this.mCreatedMenus.get(i);
        if ((localArrayList2 == null) || (!localArrayList2.contains(localFragment1))) {
          localFragment1.onDestroyOptionsMenu();
        }
      }
    }
    this.mCreatedMenus = localArrayList2;
    return bool;
  }
  
  public void dispatchDestroy()
  {
    this.mDestroyed = true;
    execPendingActions();
    moveToState(0, false);
    this.mHost = null;
    this.mContainer = null;
    this.mParent = null;
  }
  
  public void dispatchDestroyView()
  {
    moveToState(1, false);
  }
  
  public void dispatchLowMemory()
  {
    if (this.mAdded != null) {
      for (int i = 0; i < this.mAdded.size(); i++)
      {
        Fragment localFragment = (Fragment)this.mAdded.get(i);
        if (localFragment != null) {
          localFragment.performLowMemory();
        }
      }
    }
  }
  
  public boolean dispatchOptionsItemSelected(MenuItem paramMenuItem)
  {
    if (this.mAdded != null) {
      for (int i = 0; i < this.mAdded.size(); i++)
      {
        Fragment localFragment = (Fragment)this.mAdded.get(i);
        if ((localFragment != null) && (localFragment.performOptionsItemSelected(paramMenuItem))) {
          return true;
        }
      }
    }
    return false;
  }
  
  public void dispatchOptionsMenuClosed(Menu paramMenu)
  {
    if (this.mAdded != null) {
      for (int i = 0; i < this.mAdded.size(); i++)
      {
        Fragment localFragment = (Fragment)this.mAdded.get(i);
        if (localFragment != null) {
          localFragment.performOptionsMenuClosed(paramMenu);
        }
      }
    }
  }
  
  public void dispatchPause()
  {
    moveToState(4, false);
  }
  
  public boolean dispatchPrepareOptionsMenu(Menu paramMenu)
  {
    ArrayList localArrayList = this.mAdded;
    boolean bool = false;
    if (localArrayList != null) {
      for (int i = 0; i < this.mAdded.size(); i++)
      {
        Fragment localFragment = (Fragment)this.mAdded.get(i);
        if ((localFragment != null) && (localFragment.performPrepareOptionsMenu(paramMenu))) {
          bool = true;
        }
      }
    }
    return bool;
  }
  
  public void dispatchReallyStop()
  {
    moveToState(2, false);
  }
  
  public void dispatchResume()
  {
    this.mStateSaved = false;
    moveToState(5, false);
  }
  
  public void dispatchStart()
  {
    this.mStateSaved = false;
    moveToState(4, false);
  }
  
  public void dispatchStop()
  {
    this.mStateSaved = true;
    moveToState(3, false);
  }
  
  public void dump(String paramString, FileDescriptor paramFileDescriptor, PrintWriter paramPrintWriter, String[] paramArrayOfString)
  {
    String str = paramString + "    ";
    if (this.mActive != null)
    {
      int i6 = this.mActive.size();
      if (i6 > 0)
      {
        paramPrintWriter.print(paramString);
        paramPrintWriter.print("Active Fragments in ");
        paramPrintWriter.print(Integer.toHexString(System.identityHashCode(this)));
        paramPrintWriter.println(":");
        for (int i7 = 0; i7 < i6; i7++)
        {
          Fragment localFragment3 = (Fragment)this.mActive.get(i7);
          paramPrintWriter.print(paramString);
          paramPrintWriter.print("  #");
          paramPrintWriter.print(i7);
          paramPrintWriter.print(": ");
          paramPrintWriter.println(localFragment3);
          if (localFragment3 != null) {
            localFragment3.dump(str, paramFileDescriptor, paramPrintWriter, paramArrayOfString);
          }
        }
      }
    }
    if (this.mAdded != null)
    {
      int i4 = this.mAdded.size();
      if (i4 > 0)
      {
        paramPrintWriter.print(paramString);
        paramPrintWriter.println("Added Fragments:");
        for (int i5 = 0; i5 < i4; i5++)
        {
          Fragment localFragment2 = (Fragment)this.mAdded.get(i5);
          paramPrintWriter.print(paramString);
          paramPrintWriter.print("  #");
          paramPrintWriter.print(i5);
          paramPrintWriter.print(": ");
          paramPrintWriter.println(localFragment2.toString());
        }
      }
    }
    if (this.mCreatedMenus != null)
    {
      int i2 = this.mCreatedMenus.size();
      if (i2 > 0)
      {
        paramPrintWriter.print(paramString);
        paramPrintWriter.println("Fragments Created Menus:");
        for (int i3 = 0; i3 < i2; i3++)
        {
          Fragment localFragment1 = (Fragment)this.mCreatedMenus.get(i3);
          paramPrintWriter.print(paramString);
          paramPrintWriter.print("  #");
          paramPrintWriter.print(i3);
          paramPrintWriter.print(": ");
          paramPrintWriter.println(localFragment1.toString());
        }
      }
    }
    if (this.mBackStack != null)
    {
      int n = this.mBackStack.size();
      if (n > 0)
      {
        paramPrintWriter.print(paramString);
        paramPrintWriter.println("Back Stack:");
        for (int i1 = 0; i1 < n; i1++)
        {
          BackStackRecord localBackStackRecord2 = (BackStackRecord)this.mBackStack.get(i1);
          paramPrintWriter.print(paramString);
          paramPrintWriter.print("  #");
          paramPrintWriter.print(i1);
          paramPrintWriter.print(": ");
          paramPrintWriter.println(localBackStackRecord2.toString());
          localBackStackRecord2.dump(str, paramFileDescriptor, paramPrintWriter, paramArrayOfString);
        }
      }
    }
    try
    {
      if (this.mBackStackIndices != null)
      {
        int k = this.mBackStackIndices.size();
        if (k > 0)
        {
          paramPrintWriter.print(paramString);
          paramPrintWriter.println("Back Stack Indices:");
          for (int m = 0; m < k; m++)
          {
            BackStackRecord localBackStackRecord1 = (BackStackRecord)this.mBackStackIndices.get(m);
            paramPrintWriter.print(paramString);
            paramPrintWriter.print("  #");
            paramPrintWriter.print(m);
            paramPrintWriter.print(": ");
            paramPrintWriter.println(localBackStackRecord1);
          }
        }
      }
      if ((this.mAvailBackStackIndices != null) && (this.mAvailBackStackIndices.size() > 0))
      {
        paramPrintWriter.print(paramString);
        paramPrintWriter.print("mAvailBackStackIndices: ");
        paramPrintWriter.println(Arrays.toString(this.mAvailBackStackIndices.toArray()));
      }
      if (this.mPendingActions != null)
      {
        int i = this.mPendingActions.size();
        if (i > 0)
        {
          paramPrintWriter.print(paramString);
          paramPrintWriter.println("Pending Actions:");
          for (int j = 0; j < i; j++)
          {
            Runnable localRunnable = (Runnable)this.mPendingActions.get(j);
            paramPrintWriter.print(paramString);
            paramPrintWriter.print("  #");
            paramPrintWriter.print(j);
            paramPrintWriter.print(": ");
            paramPrintWriter.println(localRunnable);
          }
        }
      }
      paramPrintWriter.print(paramString);
    }
    finally {}
    paramPrintWriter.println("FragmentManager misc state:");
    paramPrintWriter.print(paramString);
    paramPrintWriter.print("  mHost=");
    paramPrintWriter.println(this.mHost);
    paramPrintWriter.print(paramString);
    paramPrintWriter.print("  mContainer=");
    paramPrintWriter.println(this.mContainer);
    if (this.mParent != null)
    {
      paramPrintWriter.print(paramString);
      paramPrintWriter.print("  mParent=");
      paramPrintWriter.println(this.mParent);
    }
    paramPrintWriter.print(paramString);
    paramPrintWriter.print("  mCurState=");
    paramPrintWriter.print(this.mCurState);
    paramPrintWriter.print(" mStateSaved=");
    paramPrintWriter.print(this.mStateSaved);
    paramPrintWriter.print(" mDestroyed=");
    paramPrintWriter.println(this.mDestroyed);
    if (this.mNeedMenuInvalidate)
    {
      paramPrintWriter.print(paramString);
      paramPrintWriter.print("  mNeedMenuInvalidate=");
      paramPrintWriter.println(this.mNeedMenuInvalidate);
    }
    if (this.mNoTransactionsBecause != null)
    {
      paramPrintWriter.print(paramString);
      paramPrintWriter.print("  mNoTransactionsBecause=");
      paramPrintWriter.println(this.mNoTransactionsBecause);
    }
    if ((this.mAvailIndices != null) && (this.mAvailIndices.size() > 0))
    {
      paramPrintWriter.print(paramString);
      paramPrintWriter.print("  mAvailIndices: ");
      paramPrintWriter.println(Arrays.toString(this.mAvailIndices.toArray()));
    }
  }
  
  public void enqueueAction(Runnable paramRunnable, boolean paramBoolean)
  {
    if (!paramBoolean) {
      checkStateLoss();
    }
    try
    {
      if ((this.mDestroyed) || (this.mHost == null)) {
        throw new IllegalStateException("Activity has been destroyed");
      }
    }
    finally
    {
      throw ((Throwable)localObject);
      if (this.mPendingActions == null) {
        this.mPendingActions = new ArrayList();
      }
      this.mPendingActions.add(paramRunnable);
      if (this.mPendingActions.size() == 1) {
        this.mHost.getHandler().removeCallbacks(this.mExecCommit);
      }
    }
  }
  
  public boolean execPendingActions()
  {
    if (this.mExecutingActions) {
      throw new IllegalStateException("Recursive entry to executePendingTransactions");
    }
    if (Looper.myLooper() != this.mHost.getHandler().getLooper()) {
      throw new IllegalStateException("Must be called from main thread of process");
    }
    boolean bool2;
    for (boolean bool1 = false;; bool1 = true) {
      try
      {
        if ((this.mPendingActions == null) || (this.mPendingActions.size() == 0))
        {
          if (!this.mHavePendingDeferredStart) {
            return bool1;
          }
          bool2 = false;
          for (int i = 0; i < this.mActive.size(); i++)
          {
            Fragment localFragment = (Fragment)this.mActive.get(i);
            if ((localFragment != null) && (localFragment.mLoaderManager != null)) {
              bool2 |= localFragment.mLoaderManager.hasRunningLoaders();
            }
          }
        }
        int j = this.mPendingActions.size();
        if ((this.mTmpActions == null) || (this.mTmpActions.length < j)) {
          this.mTmpActions = new Runnable[j];
        }
        this.mPendingActions.toArray(this.mTmpActions);
        this.mPendingActions.clear();
        this.mHost.getHandler().removeCallbacks(this.mExecCommit);
        this.mExecutingActions = true;
        for (int k = 0; k < j; k++)
        {
          this.mTmpActions[k].run();
          this.mTmpActions[k] = null;
        }
        this.mExecutingActions = false;
      }
      finally {}
    }
    if (!bool2)
    {
      this.mHavePendingDeferredStart = false;
      startPendingDeferredFragments();
    }
    return bool1;
  }
  
  public boolean executePendingTransactions()
  {
    return execPendingActions();
  }
  
  public Fragment findFragmentById(int paramInt)
  {
    Fragment localFragment;
    if (this.mAdded != null) {
      for (int j = -1 + this.mAdded.size(); j >= 0; j--)
      {
        localFragment = (Fragment)this.mAdded.get(j);
        if ((localFragment != null) && (localFragment.mFragmentId == paramInt)) {
          return localFragment;
        }
      }
    }
    if (this.mActive != null) {
      for (int i = -1 + this.mActive.size();; i--)
      {
        if (i < 0) {
          break label107;
        }
        localFragment = (Fragment)this.mActive.get(i);
        if ((localFragment != null) && (localFragment.mFragmentId == paramInt)) {
          break;
        }
      }
    }
    label107:
    return null;
  }
  
  public Fragment findFragmentByTag(String paramString)
  {
    Fragment localFragment;
    if ((this.mAdded != null) && (paramString != null)) {
      for (int j = -1 + this.mAdded.size(); j >= 0; j--)
      {
        localFragment = (Fragment)this.mAdded.get(j);
        if ((localFragment != null) && (paramString.equals(localFragment.mTag))) {
          return localFragment;
        }
      }
    }
    if ((this.mActive != null) && (paramString != null)) {
      for (int i = -1 + this.mActive.size();; i--)
      {
        if (i < 0) {
          break label121;
        }
        localFragment = (Fragment)this.mActive.get(i);
        if ((localFragment != null) && (paramString.equals(localFragment.mTag))) {
          break;
        }
      }
    }
    label121:
    return null;
  }
  
  public Fragment findFragmentByWho(String paramString)
  {
    if ((this.mActive != null) && (paramString != null)) {
      for (int i = -1 + this.mActive.size(); i >= 0; i--)
      {
        Fragment localFragment1 = (Fragment)this.mActive.get(i);
        if (localFragment1 != null)
        {
          Fragment localFragment2 = localFragment1.findFragmentByWho(paramString);
          if (localFragment2 != null) {
            return localFragment2;
          }
        }
      }
    }
    return null;
  }
  
  public void freeBackStackIndex(int paramInt)
  {
    try
    {
      this.mBackStackIndices.set(paramInt, null);
      if (this.mAvailBackStackIndices == null) {
        this.mAvailBackStackIndices = new ArrayList();
      }
      if (DEBUG) {
        Log.v("FragmentManager", "Freeing back stack index " + paramInt);
      }
      this.mAvailBackStackIndices.add(Integer.valueOf(paramInt));
      return;
    }
    finally {}
  }
  
  public FragmentManager.BackStackEntry getBackStackEntryAt(int paramInt)
  {
    return (FragmentManager.BackStackEntry)this.mBackStack.get(paramInt);
  }
  
  public int getBackStackEntryCount()
  {
    if (this.mBackStack != null) {
      return this.mBackStack.size();
    }
    return 0;
  }
  
  public Fragment getFragment(Bundle paramBundle, String paramString)
  {
    int i = paramBundle.getInt(paramString, -1);
    Fragment localFragment;
    if (i == -1) {
      localFragment = null;
    }
    do
    {
      return localFragment;
      if (i >= this.mActive.size()) {
        throwException(new IllegalStateException("Fragment no longer exists for key " + paramString + ": index " + i));
      }
      localFragment = (Fragment)this.mActive.get(i);
    } while (localFragment != null);
    throwException(new IllegalStateException("Fragment no longer exists for key " + paramString + ": index " + i));
    return localFragment;
  }
  
  public List<Fragment> getFragments()
  {
    return this.mActive;
  }
  
  LayoutInflaterFactory getLayoutInflaterFactory()
  {
    return this;
  }
  
  public void hideFragment(Fragment paramFragment, int paramInt1, int paramInt2)
  {
    if (DEBUG) {
      Log.v("FragmentManager", "hide: " + paramFragment);
    }
    if (!paramFragment.mHidden)
    {
      paramFragment.mHidden = true;
      if (paramFragment.mView != null)
      {
        Animation localAnimation = loadAnimation(paramFragment, paramInt1, false, paramInt2);
        if (localAnimation != null)
        {
          setHWLayerAnimListenerIfAlpha(paramFragment.mView, localAnimation);
          paramFragment.mView.startAnimation(localAnimation);
        }
        paramFragment.mView.setVisibility(8);
      }
      if ((paramFragment.mAdded) && (paramFragment.mHasMenu) && (paramFragment.mMenuVisible)) {
        this.mNeedMenuInvalidate = true;
      }
      paramFragment.onHiddenChanged(true);
    }
  }
  
  public boolean isDestroyed()
  {
    return this.mDestroyed;
  }
  
  Animation loadAnimation(Fragment paramFragment, int paramInt1, boolean paramBoolean, int paramInt2)
  {
    Animation localAnimation1 = paramFragment.onCreateAnimation(paramInt1, paramBoolean, paramFragment.mNextAnim);
    if (localAnimation1 != null) {
      return localAnimation1;
    }
    if (paramFragment.mNextAnim != 0)
    {
      Animation localAnimation2 = AnimationUtils.loadAnimation(this.mHost.getContext(), paramFragment.mNextAnim);
      if (localAnimation2 != null) {
        return localAnimation2;
      }
    }
    if (paramInt1 == 0) {
      return null;
    }
    int i = transitToStyleIndex(paramInt1, paramBoolean);
    if (i < 0) {
      return null;
    }
    switch (i)
    {
    default: 
      if ((paramInt2 == 0) && (this.mHost.onHasWindowAnimations())) {
        paramInt2 = this.mHost.onGetWindowAnimations();
      }
      if (paramInt2 == 0) {
        return null;
      }
      break;
    case 1: 
      return makeOpenCloseAnimation(this.mHost.getContext(), 1.125F, 1.0F, 0.0F, 1.0F);
    case 2: 
      return makeOpenCloseAnimation(this.mHost.getContext(), 1.0F, 0.975F, 1.0F, 0.0F);
    case 3: 
      return makeOpenCloseAnimation(this.mHost.getContext(), 0.975F, 1.0F, 0.0F, 1.0F);
    case 4: 
      return makeOpenCloseAnimation(this.mHost.getContext(), 1.0F, 1.075F, 1.0F, 0.0F);
    case 5: 
      return makeFadeAnimation(this.mHost.getContext(), 0.0F, 1.0F);
    case 6: 
      return makeFadeAnimation(this.mHost.getContext(), 1.0F, 0.0F);
    }
    return null;
  }
  
  void makeActive(Fragment paramFragment)
  {
    if (paramFragment.mIndex >= 0) {}
    for (;;)
    {
      return;
      if ((this.mAvailIndices == null) || (this.mAvailIndices.size() <= 0))
      {
        if (this.mActive == null) {
          this.mActive = new ArrayList();
        }
        paramFragment.setIndex(this.mActive.size(), this.mParent);
        this.mActive.add(paramFragment);
      }
      while (DEBUG)
      {
        Log.v("FragmentManager", "Allocated fragment index " + paramFragment);
        return;
        paramFragment.setIndex(((Integer)this.mAvailIndices.remove(-1 + this.mAvailIndices.size())).intValue(), this.mParent);
        this.mActive.set(paramFragment.mIndex, paramFragment);
      }
    }
  }
  
  void makeInactive(Fragment paramFragment)
  {
    if (paramFragment.mIndex < 0) {
      return;
    }
    if (DEBUG) {
      Log.v("FragmentManager", "Freeing fragment index " + paramFragment);
    }
    this.mActive.set(paramFragment.mIndex, null);
    if (this.mAvailIndices == null) {
      this.mAvailIndices = new ArrayList();
    }
    this.mAvailIndices.add(Integer.valueOf(paramFragment.mIndex));
    this.mHost.inactivateFragment(paramFragment.mWho);
    paramFragment.initState();
  }
  
  void moveToState(int paramInt1, int paramInt2, int paramInt3, boolean paramBoolean)
  {
    if ((this.mHost == null) && (paramInt1 != 0)) {
      throw new IllegalStateException("No host");
    }
    if ((!paramBoolean) && (this.mCurState == paramInt1)) {}
    do
    {
      do
      {
        return;
        this.mCurState = paramInt1;
      } while (this.mActive == null);
      boolean bool = false;
      for (int i = 0; i < this.mActive.size(); i++)
      {
        Fragment localFragment = (Fragment)this.mActive.get(i);
        if (localFragment != null)
        {
          moveToState(localFragment, paramInt1, paramInt2, paramInt3, false);
          if (localFragment.mLoaderManager != null) {
            bool |= localFragment.mLoaderManager.hasRunningLoaders();
          }
        }
      }
      if (!bool) {
        startPendingDeferredFragments();
      }
    } while ((!this.mNeedMenuInvalidate) || (this.mHost == null) || (this.mCurState != 5));
    this.mHost.onSupportInvalidateOptionsMenu();
    this.mNeedMenuInvalidate = false;
  }
  
  void moveToState(int paramInt, boolean paramBoolean)
  {
    moveToState(paramInt, 0, 0, paramBoolean);
  }
  
  void moveToState(Fragment paramFragment)
  {
    moveToState(paramFragment, this.mCurState, 0, 0, false);
  }
  
  void moveToState(final Fragment paramFragment, int paramInt1, int paramInt2, int paramInt3, boolean paramBoolean)
  {
    if (((!paramFragment.mAdded) || (paramFragment.mDetached)) && (paramInt1 > 1)) {
      paramInt1 = 1;
    }
    if ((paramFragment.mRemoving) && (paramInt1 > paramFragment.mState)) {
      paramInt1 = paramFragment.mState;
    }
    if ((paramFragment.mDeferStart) && (paramFragment.mState < 4) && (paramInt1 > 3)) {
      paramInt1 = 3;
    }
    if (paramFragment.mState < paramInt1) {
      if ((!paramFragment.mFromLayout) || (paramFragment.mInLayout)) {}
    }
    for (;;)
    {
      return;
      if (paramFragment.mAnimatingAway != null)
      {
        paramFragment.mAnimatingAway = null;
        moveToState(paramFragment, paramFragment.mStateAfterAnimating, 0, 0, true);
      }
      switch (paramFragment.mState)
      {
      }
      while (paramFragment.mState != paramInt1)
      {
        Log.w("FragmentManager", "moveToState: Fragment state for " + paramFragment + " not updated inline; " + "expected state " + paramInt1 + " found " + paramFragment.mState);
        paramFragment.mState = paramInt1;
        return;
        if (DEBUG) {
          Log.v("FragmentManager", "moveto CREATED: " + paramFragment);
        }
        if (paramFragment.mSavedFragmentState != null)
        {
          paramFragment.mSavedFragmentState.setClassLoader(this.mHost.getContext().getClassLoader());
          paramFragment.mSavedViewState = paramFragment.mSavedFragmentState.getSparseParcelableArray("android:view_state");
          paramFragment.mTarget = getFragment(paramFragment.mSavedFragmentState, "android:target_state");
          if (paramFragment.mTarget != null) {
            paramFragment.mTargetRequestCode = paramFragment.mSavedFragmentState.getInt("android:target_req_state", 0);
          }
          paramFragment.mUserVisibleHint = paramFragment.mSavedFragmentState.getBoolean("android:user_visible_hint", true);
          if (!paramFragment.mUserVisibleHint)
          {
            paramFragment.mDeferStart = true;
            if (paramInt1 > 3) {
              paramInt1 = 3;
            }
          }
        }
        paramFragment.mHost = this.mHost;
        paramFragment.mParentFragment = this.mParent;
        if (this.mParent != null) {}
        for (FragmentManagerImpl localFragmentManagerImpl = this.mParent.mChildFragmentManager;; localFragmentManagerImpl = this.mHost.getFragmentManagerImpl())
        {
          paramFragment.mFragmentManager = localFragmentManagerImpl;
          paramFragment.mCalled = false;
          paramFragment.onAttach(this.mHost.getContext());
          if (paramFragment.mCalled) {
            break;
          }
          throw new SuperNotCalledException("Fragment " + paramFragment + " did not call through to super.onAttach()");
        }
        if (paramFragment.mParentFragment == null) {
          this.mHost.onAttachFragment(paramFragment);
        }
        if (!paramFragment.mRetaining) {
          paramFragment.performCreate(paramFragment.mSavedFragmentState);
        }
        paramFragment.mRetaining = false;
        if (paramFragment.mFromLayout)
        {
          paramFragment.mView = paramFragment.performCreateView(paramFragment.getLayoutInflater(paramFragment.mSavedFragmentState), null, paramFragment.mSavedFragmentState);
          if (paramFragment.mView == null) {
            break label1009;
          }
          paramFragment.mInnerView = paramFragment.mView;
          if (Build.VERSION.SDK_INT >= 11)
          {
            ViewCompat.setSaveFromParentEnabled(paramFragment.mView, false);
            label555:
            if (paramFragment.mHidden) {
              paramFragment.mView.setVisibility(8);
            }
            paramFragment.onViewCreated(paramFragment.mView, paramFragment.mSavedFragmentState);
          }
        }
        else
        {
          label583:
          if (paramInt1 > 1)
          {
            if (DEBUG) {
              Log.v("FragmentManager", "moveto ACTIVITY_CREATED: " + paramFragment);
            }
            if (!paramFragment.mFromLayout)
            {
              int j = paramFragment.mContainerId;
              ViewGroup localViewGroup = null;
              if (j != 0)
              {
                localViewGroup = (ViewGroup)this.mContainer.onFindViewById(paramFragment.mContainerId);
                if ((localViewGroup == null) && (!paramFragment.mRestored)) {
                  throwException(new IllegalArgumentException("No view found for id 0x" + Integer.toHexString(paramFragment.mContainerId) + " (" + paramFragment.getResources().getResourceName(paramFragment.mContainerId) + ") for fragment " + paramFragment));
                }
              }
              paramFragment.mContainer = localViewGroup;
              paramFragment.mView = paramFragment.performCreateView(paramFragment.getLayoutInflater(paramFragment.mSavedFragmentState), localViewGroup, paramFragment.mSavedFragmentState);
              if (paramFragment.mView == null) {
                break label1031;
              }
              paramFragment.mInnerView = paramFragment.mView;
              if (Build.VERSION.SDK_INT < 11) {
                break label1017;
              }
              ViewCompat.setSaveFromParentEnabled(paramFragment.mView, false);
              label795:
              if (localViewGroup != null)
              {
                Animation localAnimation2 = loadAnimation(paramFragment, paramInt2, true, paramInt3);
                if (localAnimation2 != null)
                {
                  setHWLayerAnimListenerIfAlpha(paramFragment.mView, localAnimation2);
                  paramFragment.mView.startAnimation(localAnimation2);
                }
                localViewGroup.addView(paramFragment.mView);
              }
              if (paramFragment.mHidden) {
                paramFragment.mView.setVisibility(8);
              }
              paramFragment.onViewCreated(paramFragment.mView, paramFragment.mSavedFragmentState);
            }
          }
        }
        for (;;)
        {
          paramFragment.performActivityCreated(paramFragment.mSavedFragmentState);
          if (paramFragment.mView != null) {
            paramFragment.restoreViewState(paramFragment.mSavedFragmentState);
          }
          paramFragment.mSavedFragmentState = null;
          if (paramInt1 > 3)
          {
            if (DEBUG) {
              Log.v("FragmentManager", "moveto STARTED: " + paramFragment);
            }
            paramFragment.performStart();
          }
          if (paramInt1 <= 4) {
            break;
          }
          if (DEBUG) {
            Log.v("FragmentManager", "moveto RESUMED: " + paramFragment);
          }
          paramFragment.performResume();
          paramFragment.mSavedFragmentState = null;
          paramFragment.mSavedViewState = null;
          break;
          paramFragment.mView = NoSaveStateFrameLayout.wrap(paramFragment.mView);
          break label555;
          label1009:
          paramFragment.mInnerView = null;
          break label583;
          label1017:
          paramFragment.mView = NoSaveStateFrameLayout.wrap(paramFragment.mView);
          break label795;
          label1031:
          paramFragment.mInnerView = null;
        }
        if (paramFragment.mState > paramInt1) {
          switch (paramFragment.mState)
          {
          default: 
            break;
          case 1: 
          case 5: 
          case 4: 
          case 3: 
          case 2: 
            while (paramInt1 < 1)
            {
              if ((this.mDestroyed) && (paramFragment.mAnimatingAway != null))
              {
                View localView = paramFragment.mAnimatingAway;
                paramFragment.mAnimatingAway = null;
                localView.clearAnimation();
              }
              if (paramFragment.mAnimatingAway == null) {
                break label1462;
              }
              paramFragment.mStateAfterAnimating = paramInt1;
              paramInt1 = 1;
              break;
              if (paramInt1 < 5)
              {
                if (DEBUG) {
                  Log.v("FragmentManager", "movefrom RESUMED: " + paramFragment);
                }
                paramFragment.performPause();
              }
              if (paramInt1 < 4)
              {
                if (DEBUG) {
                  Log.v("FragmentManager", "movefrom STARTED: " + paramFragment);
                }
                paramFragment.performStop();
              }
              if (paramInt1 < 3)
              {
                if (DEBUG) {
                  Log.v("FragmentManager", "movefrom STOPPED: " + paramFragment);
                }
                paramFragment.performReallyStop();
              }
              if (paramInt1 < 2)
              {
                if (DEBUG) {
                  Log.v("FragmentManager", "movefrom ACTIVITY_CREATED: " + paramFragment);
                }
                if ((paramFragment.mView != null) && (this.mHost.onShouldSaveFragmentState(paramFragment)) && (paramFragment.mSavedViewState == null)) {
                  saveFragmentViewState(paramFragment);
                }
                paramFragment.performDestroyView();
                if ((paramFragment.mView != null) && (paramFragment.mContainer != null))
                {
                  int i = this.mCurState;
                  Animation localAnimation1 = null;
                  if (i > 0)
                  {
                    boolean bool = this.mDestroyed;
                    localAnimation1 = null;
                    if (!bool) {
                      localAnimation1 = loadAnimation(paramFragment, paramInt2, false, paramInt3);
                    }
                  }
                  if (localAnimation1 != null)
                  {
                    paramFragment.mAnimatingAway = paramFragment.mView;
                    paramFragment.mStateAfterAnimating = paramInt1;
                    localAnimation1.setAnimationListener(new AnimateOnHWLayerIfNeededListener(paramFragment.mView, localAnimation1)
                    {
                      public void onAnimationEnd(Animation paramAnonymousAnimation)
                      {
                        super.onAnimationEnd(paramAnonymousAnimation);
                        if (paramFragment.mAnimatingAway != null)
                        {
                          paramFragment.mAnimatingAway = null;
                          FragmentManagerImpl.this.moveToState(paramFragment, paramFragment.mStateAfterAnimating, 0, 0, false);
                        }
                      }
                    });
                    paramFragment.mView.startAnimation(localAnimation1);
                  }
                  paramFragment.mContainer.removeView(paramFragment.mView);
                }
                paramFragment.mContainer = null;
                paramFragment.mView = null;
                paramFragment.mInnerView = null;
              }
            }
            label1462:
            if (DEBUG) {
              Log.v("FragmentManager", "movefrom CREATED: " + paramFragment);
            }
            if (!paramFragment.mRetaining) {
              paramFragment.performDestroy();
            }
            for (;;)
            {
              paramFragment.mCalled = false;
              paramFragment.onDetach();
              if (paramFragment.mCalled) {
                break;
              }
              throw new SuperNotCalledException("Fragment " + paramFragment + " did not call through to super.onDetach()");
              paramFragment.mState = 0;
            }
            if (!paramBoolean) {
              if (!paramFragment.mRetaining)
              {
                makeInactive(paramFragment);
              }
              else
              {
                paramFragment.mHost = null;
                paramFragment.mParentFragment = null;
                paramFragment.mFragmentManager = null;
                paramFragment.mChildFragmentManager = null;
              }
            }
            break;
          }
        }
      }
    }
  }
  
  public void noteStateNotSaved()
  {
    this.mStateSaved = false;
  }
  
  public View onCreateView(View paramView, String paramString, Context paramContext, AttributeSet paramAttributeSet)
  {
    if (!"fragment".equals(paramString)) {}
    String str1;
    int i;
    String str2;
    do
    {
      return null;
      str1 = paramAttributeSet.getAttributeValue(null, "class");
      TypedArray localTypedArray = paramContext.obtainStyledAttributes(paramAttributeSet, FragmentTag.Fragment);
      if (str1 == null) {
        str1 = localTypedArray.getString(0);
      }
      i = localTypedArray.getResourceId(1, -1);
      str2 = localTypedArray.getString(2);
      localTypedArray.recycle();
    } while (!Fragment.isSupportFragmentClass(this.mHost.getContext(), str1));
    if (paramView != null) {}
    for (int j = paramView.getId(); (j == -1) && (i == -1) && (str2 == null); j = 0) {
      throw new IllegalArgumentException(paramAttributeSet.getPositionDescription() + ": Must specify unique android:id, android:tag, or have a parent with an id for " + str1);
    }
    Fragment localFragment;
    int k;
    if (i != -1)
    {
      localFragment = findFragmentById(i);
      if ((localFragment == null) && (str2 != null)) {
        localFragment = findFragmentByTag(str2);
      }
      if ((localFragment == null) && (j != -1)) {
        localFragment = findFragmentById(j);
      }
      if (DEBUG) {
        Log.v("FragmentManager", "onCreateView: id=0x" + Integer.toHexString(i) + " fname=" + str1 + " existing=" + localFragment);
      }
      if (localFragment != null) {
        break label445;
      }
      localFragment = Fragment.instantiate(paramContext, str1);
      localFragment.mFromLayout = true;
      if (i == 0) {
        break label438;
      }
      k = i;
      label295:
      localFragment.mFragmentId = k;
      localFragment.mContainerId = j;
      localFragment.mTag = str2;
      localFragment.mInLayout = true;
      localFragment.mFragmentManager = this;
      localFragment.mHost = this.mHost;
      localFragment.onInflate(this.mHost.getContext(), paramAttributeSet, localFragment.mSavedFragmentState);
      addFragment(localFragment, true);
      label363:
      if ((this.mCurState >= 1) || (!localFragment.mFromLayout)) {
        break label576;
      }
      moveToState(localFragment, 1, 0, 0, false);
    }
    for (;;)
    {
      if (localFragment.mView != null) {
        break label585;
      }
      throw new IllegalStateException("Fragment " + str1 + " did not create a view.");
      localFragment = null;
      break;
      label438:
      k = j;
      break label295;
      label445:
      if (localFragment.mInLayout) {
        throw new IllegalArgumentException(paramAttributeSet.getPositionDescription() + ": Duplicate id 0x" + Integer.toHexString(i) + ", tag " + str2 + ", or parent id 0x" + Integer.toHexString(j) + " with another fragment for " + str1);
      }
      localFragment.mInLayout = true;
      localFragment.mHost = this.mHost;
      if (localFragment.mRetaining) {
        break label363;
      }
      localFragment.onInflate(this.mHost.getContext(), paramAttributeSet, localFragment.mSavedFragmentState);
      break label363;
      label576:
      moveToState(localFragment);
    }
    label585:
    if (i != 0) {
      localFragment.mView.setId(i);
    }
    if (localFragment.mView.getTag() == null) {
      localFragment.mView.setTag(str2);
    }
    return localFragment.mView;
  }
  
  public void performPendingDeferredStart(Fragment paramFragment)
  {
    if (paramFragment.mDeferStart)
    {
      if (this.mExecutingActions) {
        this.mHavePendingDeferredStart = true;
      }
    }
    else {
      return;
    }
    paramFragment.mDeferStart = false;
    moveToState(paramFragment, this.mCurState, 0, 0, false);
  }
  
  public void popBackStack()
  {
    enqueueAction(new Runnable()
    {
      public void run()
      {
        FragmentManagerImpl.this.popBackStackState(FragmentManagerImpl.this.mHost.getHandler(), null, -1, 0);
      }
    }, false);
  }
  
  public void popBackStack(final int paramInt1, final int paramInt2)
  {
    if (paramInt1 < 0) {
      throw new IllegalArgumentException("Bad id: " + paramInt1);
    }
    enqueueAction(new Runnable()
    {
      public void run()
      {
        FragmentManagerImpl.this.popBackStackState(FragmentManagerImpl.this.mHost.getHandler(), null, paramInt1, paramInt2);
      }
    }, false);
  }
  
  public void popBackStack(final String paramString, final int paramInt)
  {
    enqueueAction(new Runnable()
    {
      public void run()
      {
        FragmentManagerImpl.this.popBackStackState(FragmentManagerImpl.this.mHost.getHandler(), paramString, -1, paramInt);
      }
    }, false);
  }
  
  public boolean popBackStackImmediate()
  {
    checkStateLoss();
    executePendingTransactions();
    return popBackStackState(this.mHost.getHandler(), null, -1, 0);
  }
  
  public boolean popBackStackImmediate(int paramInt1, int paramInt2)
  {
    checkStateLoss();
    executePendingTransactions();
    if (paramInt1 < 0) {
      throw new IllegalArgumentException("Bad id: " + paramInt1);
    }
    return popBackStackState(this.mHost.getHandler(), null, paramInt1, paramInt2);
  }
  
  public boolean popBackStackImmediate(String paramString, int paramInt)
  {
    checkStateLoss();
    executePendingTransactions();
    return popBackStackState(this.mHost.getHandler(), paramString, -1, paramInt);
  }
  
  boolean popBackStackState(Handler paramHandler, String paramString, int paramInt1, int paramInt2)
  {
    if (this.mBackStack == null) {
      return false;
    }
    if ((paramString == null) && (paramInt1 < 0) && ((paramInt2 & 0x1) == 0))
    {
      int i1 = -1 + this.mBackStack.size();
      if (i1 < 0) {
        return false;
      }
      BackStackRecord localBackStackRecord4 = (BackStackRecord)this.mBackStack.remove(i1);
      SparseArray localSparseArray3 = new SparseArray();
      SparseArray localSparseArray4 = new SparseArray();
      localBackStackRecord4.calculateBackFragments(localSparseArray3, localSparseArray4);
      localBackStackRecord4.popFromBackStack(true, null, localSparseArray3, localSparseArray4);
      reportBackStackChanged();
    }
    for (;;)
    {
      return true;
      int i = -1;
      if ((paramString != null) || (paramInt1 >= 0))
      {
        for (i = -1 + this.mBackStack.size();; i--)
        {
          BackStackRecord localBackStackRecord3;
          if (i >= 0)
          {
            localBackStackRecord3 = (BackStackRecord)this.mBackStack.get(i);
            if ((paramString == null) || (!paramString.equals(localBackStackRecord3.getName()))) {
              break label165;
            }
          }
          label165:
          while ((paramInt1 >= 0) && (paramInt1 == localBackStackRecord3.mIndex))
          {
            if (i >= 0) {
              break;
            }
            return false;
          }
        }
        if ((paramInt2 & 0x1) != 0)
        {
          i--;
          while (i >= 0)
          {
            BackStackRecord localBackStackRecord2 = (BackStackRecord)this.mBackStack.get(i);
            if (((paramString == null) || (!paramString.equals(localBackStackRecord2.getName()))) && ((paramInt1 < 0) || (paramInt1 != localBackStackRecord2.mIndex))) {
              break;
            }
            i--;
          }
        }
      }
      if (i == -1 + this.mBackStack.size()) {
        return false;
      }
      ArrayList localArrayList = new ArrayList();
      for (int j = -1 + this.mBackStack.size(); j > i; j--) {
        localArrayList.add(this.mBackStack.remove(j));
      }
      int k = -1 + localArrayList.size();
      SparseArray localSparseArray1 = new SparseArray();
      SparseArray localSparseArray2 = new SparseArray();
      for (int m = 0; m <= k; m++) {
        ((BackStackRecord)localArrayList.get(m)).calculateBackFragments(localSparseArray1, localSparseArray2);
      }
      BackStackRecord.TransitionState localTransitionState = null;
      int n = 0;
      if (n <= k)
      {
        if (DEBUG) {
          Log.v("FragmentManager", "Popping back stack state: " + localArrayList.get(n));
        }
        BackStackRecord localBackStackRecord1 = (BackStackRecord)localArrayList.get(n);
        if (n == k) {}
        for (boolean bool = true;; bool = false)
        {
          localTransitionState = localBackStackRecord1.popFromBackStack(bool, localTransitionState, localSparseArray1, localSparseArray2);
          n++;
          break;
        }
      }
      reportBackStackChanged();
    }
  }
  
  public void putFragment(Bundle paramBundle, String paramString, Fragment paramFragment)
  {
    if (paramFragment.mIndex < 0) {
      throwException(new IllegalStateException("Fragment " + paramFragment + " is not currently in the FragmentManager"));
    }
    paramBundle.putInt(paramString, paramFragment.mIndex);
  }
  
  public void removeFragment(Fragment paramFragment, int paramInt1, int paramInt2)
  {
    if (DEBUG) {
      Log.v("FragmentManager", "remove: " + paramFragment + " nesting=" + paramFragment.mBackStackNesting);
    }
    int i;
    if (!paramFragment.isInBackStack())
    {
      i = 1;
      if ((!paramFragment.mDetached) || (i != 0))
      {
        if (this.mAdded != null) {
          this.mAdded.remove(paramFragment);
        }
        if ((paramFragment.mHasMenu) && (paramFragment.mMenuVisible)) {
          this.mNeedMenuInvalidate = true;
        }
        paramFragment.mAdded = false;
        paramFragment.mRemoving = true;
        if (i == 0) {
          break label137;
        }
      }
    }
    label137:
    for (int j = 0;; j = 1)
    {
      moveToState(paramFragment, j, paramInt1, paramInt2, false);
      return;
      i = 0;
      break;
    }
  }
  
  public void removeOnBackStackChangedListener(FragmentManager.OnBackStackChangedListener paramOnBackStackChangedListener)
  {
    if (this.mBackStackChangeListeners != null) {
      this.mBackStackChangeListeners.remove(paramOnBackStackChangedListener);
    }
  }
  
  void reportBackStackChanged()
  {
    if (this.mBackStackChangeListeners != null) {
      for (int i = 0; i < this.mBackStackChangeListeners.size(); i++) {
        ((FragmentManager.OnBackStackChangedListener)this.mBackStackChangeListeners.get(i)).onBackStackChanged();
      }
    }
  }
  
  void restoreAllState(Parcelable paramParcelable, List<Fragment> paramList)
  {
    if (paramParcelable == null) {}
    for (;;)
    {
      return;
      FragmentManagerState localFragmentManagerState = (FragmentManagerState)paramParcelable;
      if (localFragmentManagerState.mActive != null)
      {
        if (paramList != null) {
          for (int n = 0; n < paramList.size(); n++)
          {
            Fragment localFragment4 = (Fragment)paramList.get(n);
            if (DEBUG) {
              Log.v("FragmentManager", "restoreAllState: re-attaching retained " + localFragment4);
            }
            FragmentState localFragmentState2 = localFragmentManagerState.mActive[localFragment4.mIndex];
            localFragmentState2.mInstance = localFragment4;
            localFragment4.mSavedViewState = null;
            localFragment4.mBackStackNesting = 0;
            localFragment4.mInLayout = false;
            localFragment4.mAdded = false;
            localFragment4.mTarget = null;
            if (localFragmentState2.mSavedFragmentState != null)
            {
              localFragmentState2.mSavedFragmentState.setClassLoader(this.mHost.getContext().getClassLoader());
              localFragment4.mSavedViewState = localFragmentState2.mSavedFragmentState.getSparseParcelableArray("android:view_state");
              localFragment4.mSavedFragmentState = localFragmentState2.mSavedFragmentState;
            }
          }
        }
        this.mActive = new ArrayList(localFragmentManagerState.mActive.length);
        if (this.mAvailIndices != null) {
          this.mAvailIndices.clear();
        }
        int i = 0;
        if (i < localFragmentManagerState.mActive.length)
        {
          FragmentState localFragmentState1 = localFragmentManagerState.mActive[i];
          if (localFragmentState1 != null)
          {
            Fragment localFragment3 = localFragmentState1.instantiate(this.mHost, this.mParent);
            if (DEBUG) {
              Log.v("FragmentManager", "restoreAllState: active #" + i + ": " + localFragment3);
            }
            this.mActive.add(localFragment3);
            localFragmentState1.mInstance = null;
          }
          for (;;)
          {
            i++;
            break;
            this.mActive.add(null);
            if (this.mAvailIndices == null) {
              this.mAvailIndices = new ArrayList();
            }
            if (DEBUG) {
              Log.v("FragmentManager", "restoreAllState: avail #" + i);
            }
            this.mAvailIndices.add(Integer.valueOf(i));
          }
        }
        if (paramList != null)
        {
          int m = 0;
          if (m < paramList.size())
          {
            Fragment localFragment2 = (Fragment)paramList.get(m);
            if (localFragment2.mTargetIndex >= 0) {
              if (localFragment2.mTargetIndex >= this.mActive.size()) {
                break label481;
              }
            }
            for (localFragment2.mTarget = ((Fragment)this.mActive.get(localFragment2.mTargetIndex));; localFragment2.mTarget = null)
            {
              m++;
              break;
              label481:
              Log.w("FragmentManager", "Re-attaching retained fragment " + localFragment2 + " target no longer exists: " + localFragment2.mTargetIndex);
            }
          }
        }
        if (localFragmentManagerState.mAdded != null)
        {
          this.mAdded = new ArrayList(localFragmentManagerState.mAdded.length);
          for (int k = 0; k < localFragmentManagerState.mAdded.length; k++)
          {
            Fragment localFragment1 = (Fragment)this.mActive.get(localFragmentManagerState.mAdded[k]);
            if (localFragment1 == null) {
              throwException(new IllegalStateException("No instantiated fragment for index #" + localFragmentManagerState.mAdded[k]));
            }
            localFragment1.mAdded = true;
            if (DEBUG) {
              Log.v("FragmentManager", "restoreAllState: added #" + k + ": " + localFragment1);
            }
            if (this.mAdded.contains(localFragment1)) {
              throw new IllegalStateException("Already added!");
            }
            this.mAdded.add(localFragment1);
          }
        }
        this.mAdded = null;
        if (localFragmentManagerState.mBackStack == null) {
          break;
        }
        this.mBackStack = new ArrayList(localFragmentManagerState.mBackStack.length);
        for (int j = 0; j < localFragmentManagerState.mBackStack.length; j++)
        {
          BackStackRecord localBackStackRecord = localFragmentManagerState.mBackStack[j].instantiate(this);
          if (DEBUG)
          {
            Log.v("FragmentManager", "restoreAllState: back stack #" + j + " (index " + localBackStackRecord.mIndex + "): " + localBackStackRecord);
            localBackStackRecord.dump("  ", new PrintWriter(new LogWriter("FragmentManager")), false);
          }
          this.mBackStack.add(localBackStackRecord);
          if (localBackStackRecord.mIndex >= 0) {
            setBackStackIndex(localBackStackRecord.mIndex, localBackStackRecord);
          }
        }
      }
    }
    this.mBackStack = null;
  }
  
  ArrayList<Fragment> retainNonConfig()
  {
    ArrayList localArrayList1 = this.mActive;
    ArrayList localArrayList2 = null;
    if (localArrayList1 != null)
    {
      int i = 0;
      if (i < this.mActive.size())
      {
        Fragment localFragment = (Fragment)this.mActive.get(i);
        if ((localFragment != null) && (localFragment.mRetainInstance))
        {
          if (localArrayList2 == null) {
            localArrayList2 = new ArrayList();
          }
          localArrayList2.add(localFragment);
          localFragment.mRetaining = true;
          if (localFragment.mTarget == null) {
            break label139;
          }
        }
        label139:
        for (int j = localFragment.mTarget.mIndex;; j = -1)
        {
          localFragment.mTargetIndex = j;
          if (DEBUG) {
            Log.v("FragmentManager", "retainNonConfig: keeping retained " + localFragment);
          }
          i++;
          break;
        }
      }
    }
    return localArrayList2;
  }
  
  Parcelable saveAllState()
  {
    execPendingActions();
    if (HONEYCOMB) {
      this.mStateSaved = true;
    }
    if ((this.mActive == null) || (this.mActive.size() <= 0)) {}
    FragmentState[] arrayOfFragmentState;
    label357:
    do
    {
      return null;
      int i = this.mActive.size();
      arrayOfFragmentState = new FragmentState[i];
      int j = 0;
      int k = 0;
      if (k < i)
      {
        Fragment localFragment = (Fragment)this.mActive.get(k);
        FragmentState localFragmentState;
        if (localFragment != null)
        {
          if (localFragment.mIndex < 0) {
            throwException(new IllegalStateException("Failure saving state: active " + localFragment + " has cleared index: " + localFragment.mIndex));
          }
          j = 1;
          localFragmentState = new FragmentState(localFragment);
          arrayOfFragmentState[k] = localFragmentState;
          if ((localFragment.mState <= 0) || (localFragmentState.mSavedFragmentState != null)) {
            break label357;
          }
          localFragmentState.mSavedFragmentState = saveFragmentBasicState(localFragment);
          if (localFragment.mTarget != null)
          {
            if (localFragment.mTarget.mIndex < 0) {
              throwException(new IllegalStateException("Failure saving state: " + localFragment + " has target not in fragment manager: " + localFragment.mTarget));
            }
            if (localFragmentState.mSavedFragmentState == null) {
              localFragmentState.mSavedFragmentState = new Bundle();
            }
            putFragment(localFragmentState.mSavedFragmentState, "android:target_state", localFragment.mTarget);
            if (localFragment.mTargetRequestCode != 0) {
              localFragmentState.mSavedFragmentState.putInt("android:target_req_state", localFragment.mTargetRequestCode);
            }
          }
        }
        for (;;)
        {
          if (DEBUG) {
            Log.v("FragmentManager", "Saved state of " + localFragment + ": " + localFragmentState.mSavedFragmentState);
          }
          k++;
          break;
          localFragmentState.mSavedFragmentState = localFragment.mSavedFragmentState;
        }
      }
      if (j != 0) {
        break;
      }
    } while (!DEBUG);
    Log.v("FragmentManager", "saveAllState: no fragments!");
    return null;
    ArrayList localArrayList1 = this.mAdded;
    int[] arrayOfInt = null;
    if (localArrayList1 != null)
    {
      int i1 = this.mAdded.size();
      arrayOfInt = null;
      if (i1 > 0)
      {
        arrayOfInt = new int[i1];
        for (int i2 = 0; i2 < i1; i2++)
        {
          arrayOfInt[i2] = ((Fragment)this.mAdded.get(i2)).mIndex;
          if (arrayOfInt[i2] < 0) {
            throwException(new IllegalStateException("Failure saving state: active " + this.mAdded.get(i2) + " has cleared index: " + arrayOfInt[i2]));
          }
          if (DEBUG) {
            Log.v("FragmentManager", "saveAllState: adding fragment #" + i2 + ": " + this.mAdded.get(i2));
          }
        }
      }
    }
    ArrayList localArrayList2 = this.mBackStack;
    BackStackState[] arrayOfBackStackState = null;
    if (localArrayList2 != null)
    {
      int m = this.mBackStack.size();
      arrayOfBackStackState = null;
      if (m > 0)
      {
        arrayOfBackStackState = new BackStackState[m];
        for (int n = 0; n < m; n++)
        {
          arrayOfBackStackState[n] = new BackStackState((BackStackRecord)this.mBackStack.get(n));
          if (DEBUG) {
            Log.v("FragmentManager", "saveAllState: adding back stack #" + n + ": " + this.mBackStack.get(n));
          }
        }
      }
    }
    FragmentManagerState localFragmentManagerState = new FragmentManagerState();
    localFragmentManagerState.mActive = arrayOfFragmentState;
    localFragmentManagerState.mAdded = arrayOfInt;
    localFragmentManagerState.mBackStack = arrayOfBackStackState;
    return localFragmentManagerState;
  }
  
  Bundle saveFragmentBasicState(Fragment paramFragment)
  {
    if (this.mStateBundle == null) {
      this.mStateBundle = new Bundle();
    }
    paramFragment.performSaveInstanceState(this.mStateBundle);
    boolean bool = this.mStateBundle.isEmpty();
    Bundle localBundle = null;
    if (!bool)
    {
      localBundle = this.mStateBundle;
      this.mStateBundle = null;
    }
    if (paramFragment.mView != null) {
      saveFragmentViewState(paramFragment);
    }
    if (paramFragment.mSavedViewState != null)
    {
      if (localBundle == null) {
        localBundle = new Bundle();
      }
      localBundle.putSparseParcelableArray("android:view_state", paramFragment.mSavedViewState);
    }
    if (!paramFragment.mUserVisibleHint)
    {
      if (localBundle == null) {
        localBundle = new Bundle();
      }
      localBundle.putBoolean("android:user_visible_hint", paramFragment.mUserVisibleHint);
    }
    return localBundle;
  }
  
  public Fragment.SavedState saveFragmentInstanceState(Fragment paramFragment)
  {
    if (paramFragment.mIndex < 0) {
      throwException(new IllegalStateException("Fragment " + paramFragment + " is not currently in the FragmentManager"));
    }
    int i = paramFragment.mState;
    Fragment.SavedState localSavedState = null;
    if (i > 0)
    {
      Bundle localBundle = saveFragmentBasicState(paramFragment);
      localSavedState = null;
      if (localBundle != null) {
        localSavedState = new Fragment.SavedState(localBundle);
      }
    }
    return localSavedState;
  }
  
  void saveFragmentViewState(Fragment paramFragment)
  {
    if (paramFragment.mInnerView == null) {
      return;
    }
    if (this.mStateArray == null) {
      this.mStateArray = new SparseArray();
    }
    for (;;)
    {
      paramFragment.mInnerView.saveHierarchyState(this.mStateArray);
      if (this.mStateArray.size() <= 0) {
        break;
      }
      paramFragment.mSavedViewState = this.mStateArray;
      this.mStateArray = null;
      return;
      this.mStateArray.clear();
    }
  }
  
  /* Error */
  public void setBackStackIndex(int paramInt, BackStackRecord paramBackStackRecord)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield 382	android/support/v4/app/FragmentManagerImpl:mBackStackIndices	Ljava/util/ArrayList;
    //   6: ifnonnull +14 -> 20
    //   9: aload_0
    //   10: new 321	java/util/ArrayList
    //   13: dup
    //   14: invokespecial 322	java/util/ArrayList:<init>	()V
    //   17: putfield 382	android/support/v4/app/FragmentManagerImpl:mBackStackIndices	Ljava/util/ArrayList;
    //   20: aload_0
    //   21: getfield 382	android/support/v4/app/FragmentManagerImpl:mBackStackIndices	Ljava/util/ArrayList;
    //   24: invokevirtual 380	java/util/ArrayList:size	()I
    //   27: istore 4
    //   29: iload_1
    //   30: iload 4
    //   32: if_icmpge +58 -> 90
    //   35: getstatic 91	android/support/v4/app/FragmentManagerImpl:DEBUG	Z
    //   38: ifeq +39 -> 77
    //   41: ldc 34
    //   43: new 148	java/lang/StringBuilder
    //   46: dup
    //   47: invokespecial 149	java/lang/StringBuilder:<init>	()V
    //   50: ldc_w 384
    //   53: invokevirtual 155	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   56: iload_1
    //   57: invokevirtual 387	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   60: ldc_w 389
    //   63: invokevirtual 155	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   66: aload_2
    //   67: invokevirtual 338	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   70: invokevirtual 159	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   73: invokestatic 341	android/util/Log:v	(Ljava/lang/String;Ljava/lang/String;)I
    //   76: pop
    //   77: aload_0
    //   78: getfield 382	android/support/v4/app/FragmentManagerImpl:mBackStackIndices	Ljava/util/ArrayList;
    //   81: iload_1
    //   82: aload_2
    //   83: invokevirtual 405	java/util/ArrayList:set	(ILjava/lang/Object;)Ljava/lang/Object;
    //   86: pop
    //   87: aload_0
    //   88: monitorexit
    //   89: return
    //   90: iload 4
    //   92: iload_1
    //   93: if_icmpge +82 -> 175
    //   96: aload_0
    //   97: getfield 382	android/support/v4/app/FragmentManagerImpl:mBackStackIndices	Ljava/util/ArrayList;
    //   100: aconst_null
    //   101: invokevirtual 326	java/util/ArrayList:add	(Ljava/lang/Object;)Z
    //   104: pop
    //   105: aload_0
    //   106: getfield 379	android/support/v4/app/FragmentManagerImpl:mAvailBackStackIndices	Ljava/util/ArrayList;
    //   109: ifnonnull +14 -> 123
    //   112: aload_0
    //   113: new 321	java/util/ArrayList
    //   116: dup
    //   117: invokespecial 322	java/util/ArrayList:<init>	()V
    //   120: putfield 379	android/support/v4/app/FragmentManagerImpl:mAvailBackStackIndices	Ljava/util/ArrayList;
    //   123: getstatic 91	android/support/v4/app/FragmentManagerImpl:DEBUG	Z
    //   126: ifeq +30 -> 156
    //   129: ldc 34
    //   131: new 148	java/lang/StringBuilder
    //   134: dup
    //   135: invokespecial 149	java/lang/StringBuilder:<init>	()V
    //   138: ldc_w 1294
    //   141: invokevirtual 155	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   144: iload 4
    //   146: invokevirtual 387	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   149: invokevirtual 159	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   152: invokestatic 341	android/util/Log:v	(Ljava/lang/String;Ljava/lang/String;)I
    //   155: pop
    //   156: aload_0
    //   157: getfield 379	android/support/v4/app/FragmentManagerImpl:mAvailBackStackIndices	Ljava/util/ArrayList;
    //   160: iload 4
    //   162: invokestatic 664	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   165: invokevirtual 326	java/util/ArrayList:add	(Ljava/lang/Object;)Z
    //   168: pop
    //   169: iinc 4 1
    //   172: goto -82 -> 90
    //   175: getstatic 91	android/support/v4/app/FragmentManagerImpl:DEBUG	Z
    //   178: ifeq +39 -> 217
    //   181: ldc 34
    //   183: new 148	java/lang/StringBuilder
    //   186: dup
    //   187: invokespecial 149	java/lang/StringBuilder:<init>	()V
    //   190: ldc_w 399
    //   193: invokevirtual 155	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   196: iload_1
    //   197: invokevirtual 387	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   200: ldc_w 401
    //   203: invokevirtual 155	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   206: aload_2
    //   207: invokevirtual 338	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   210: invokevirtual 159	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   213: invokestatic 341	android/util/Log:v	(Ljava/lang/String;Ljava/lang/String;)I
    //   216: pop
    //   217: aload_0
    //   218: getfield 382	android/support/v4/app/FragmentManagerImpl:mBackStackIndices	Ljava/util/ArrayList;
    //   221: aload_2
    //   222: invokevirtual 326	java/util/ArrayList:add	(Ljava/lang/Object;)Z
    //   225: pop
    //   226: goto -139 -> 87
    //   229: astore_3
    //   230: aload_0
    //   231: monitorexit
    //   232: aload_3
    //   233: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	234	0	this	FragmentManagerImpl
    //   0	234	1	paramInt	int
    //   0	234	2	paramBackStackRecord	BackStackRecord
    //   229	4	3	localObject	Object
    //   27	143	4	i	int
    // Exception table:
    //   from	to	target	type
    //   2	20	229	finally
    //   20	29	229	finally
    //   35	77	229	finally
    //   77	87	229	finally
    //   87	89	229	finally
    //   96	123	229	finally
    //   123	156	229	finally
    //   156	169	229	finally
    //   175	217	229	finally
    //   217	226	229	finally
    //   230	232	229	finally
  }
  
  public void showFragment(Fragment paramFragment, int paramInt1, int paramInt2)
  {
    if (DEBUG) {
      Log.v("FragmentManager", "show: " + paramFragment);
    }
    if (paramFragment.mHidden)
    {
      paramFragment.mHidden = false;
      if (paramFragment.mView != null)
      {
        Animation localAnimation = loadAnimation(paramFragment, paramInt1, true, paramInt2);
        if (localAnimation != null)
        {
          setHWLayerAnimListenerIfAlpha(paramFragment.mView, localAnimation);
          paramFragment.mView.startAnimation(localAnimation);
        }
        paramFragment.mView.setVisibility(0);
      }
      if ((paramFragment.mAdded) && (paramFragment.mHasMenu) && (paramFragment.mMenuVisible)) {
        this.mNeedMenuInvalidate = true;
      }
      paramFragment.onHiddenChanged(false);
    }
  }
  
  void startPendingDeferredFragments()
  {
    if (this.mActive == null) {}
    for (;;)
    {
      return;
      for (int i = 0; i < this.mActive.size(); i++)
      {
        Fragment localFragment = (Fragment)this.mActive.get(i);
        if (localFragment != null) {
          performPendingDeferredStart(localFragment);
        }
      }
    }
  }
  
  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder(128);
    localStringBuilder.append("FragmentManager{");
    localStringBuilder.append(Integer.toHexString(System.identityHashCode(this)));
    localStringBuilder.append(" in ");
    if (this.mParent != null) {
      DebugUtils.buildShortClassTag(this.mParent, localStringBuilder);
    }
    for (;;)
    {
      localStringBuilder.append("}}");
      return localStringBuilder.toString();
      DebugUtils.buildShortClassTag(this.mHost, localStringBuilder);
    }
  }
  
  static class AnimateOnHWLayerIfNeededListener
    implements Animation.AnimationListener
  {
    private Animation.AnimationListener mOrignalListener = null;
    private boolean mShouldRunOnHWLayer = false;
    private View mView = null;
    
    public AnimateOnHWLayerIfNeededListener(View paramView, Animation paramAnimation)
    {
      if ((paramView == null) || (paramAnimation == null)) {
        return;
      }
      this.mView = paramView;
    }
    
    public AnimateOnHWLayerIfNeededListener(View paramView, Animation paramAnimation, Animation.AnimationListener paramAnimationListener)
    {
      if ((paramView == null) || (paramAnimation == null)) {
        return;
      }
      this.mOrignalListener = paramAnimationListener;
      this.mView = paramView;
    }
    
    @CallSuper
    public void onAnimationEnd(Animation paramAnimation)
    {
      if ((this.mView != null) && (this.mShouldRunOnHWLayer)) {
        this.mView.post(new Runnable()
        {
          public void run()
          {
            ViewCompat.setLayerType(FragmentManagerImpl.AnimateOnHWLayerIfNeededListener.this.mView, 0, null);
          }
        });
      }
      if (this.mOrignalListener != null) {
        this.mOrignalListener.onAnimationEnd(paramAnimation);
      }
    }
    
    public void onAnimationRepeat(Animation paramAnimation)
    {
      if (this.mOrignalListener != null) {
        this.mOrignalListener.onAnimationRepeat(paramAnimation);
      }
    }
    
    @CallSuper
    public void onAnimationStart(Animation paramAnimation)
    {
      if (this.mView != null)
      {
        this.mShouldRunOnHWLayer = FragmentManagerImpl.shouldRunOnHWLayer(this.mView, paramAnimation);
        if (this.mShouldRunOnHWLayer) {
          this.mView.post(new Runnable()
          {
            public void run()
            {
              ViewCompat.setLayerType(FragmentManagerImpl.AnimateOnHWLayerIfNeededListener.this.mView, 2, null);
            }
          });
        }
      }
      if (this.mOrignalListener != null) {
        this.mOrignalListener.onAnimationStart(paramAnimation);
      }
    }
  }
  
  static class FragmentTag
  {
    public static final int[] Fragment = { 16842755, 16842960, 16842961 };
    public static final int Fragment_id = 1;
    public static final int Fragment_name = 0;
    public static final int Fragment_tag = 2;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/android/support/v4/app/FragmentManagerImpl.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */