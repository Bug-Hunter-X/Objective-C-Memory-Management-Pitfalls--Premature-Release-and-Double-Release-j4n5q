To solve the memory management issues, leverage the `retainCount` method for debugging and use ARC (Automatic Reference Counting) or follow proper manual memory management practices.

**Using ARC (Recommended):**
ARC simplifies memory management significantly.  Instead of manually managing `retain`, `release`, and `autorelease`, the compiler handles memory management automatically. To enable ARC, ensure your project settings have it activated. The example code will then work correctly without manual memory management.

**Manual Memory Management (Without ARC):**

If ARC isn't being used, more care is needed.  For the `createObject` method, the preferred solution is to ensure the caller of this method takes responsibility for managing the object.

```objectivec
+ (MyObject*) createObject {
    return [[MyObject alloc] init];
}

// Caller takes responsibility
MyObject *myObject = [MyObject createObject];
[myObject autorelease]; // or [myObject release]; based on usage.
```

In the first example, proper handling depends on the context. If other objects retain `myObject`, then you should not manually release it unless you are certain no one else has a reference.

Always strive to use ARC, as it dramatically reduces the risk of memory-management errors.