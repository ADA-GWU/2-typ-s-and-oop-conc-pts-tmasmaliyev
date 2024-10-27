# Problem № 2

Writе a C# program to dеmonstratе dynamic and static binding in OOP. Dеmonstratе thе usagе of virtual,
nеw and ovеrridе kеywords.

# Problem approach

In `C#`, binding refers to linking a method call to its actual method implementation. This can be done either at compile-time (`static binding`) or at runtime (`dynamic binding`):

- Static Binding: It occurs at `compile time`. When a method is not marked as `virtual` or `override`, it uses static binding. This is typically applied to methods marked with the `new` keyword when hiding a base class method.

- Dynamic Binding: It occurs at runtime. This allows a method to be overridden in a `derived class`. Methods marked as `virtual` in the base class and `override` in the derived class use dynamic binding.

# Keywords

`virtual`: Declares a method in the base class that can be overridden in derived classes. It supports polymorphism and allows dynamic binding.

`override`: Used in the derived class to provide a new implementation for a base class method that was marked as virtual or abstract.

`new`: Used in a derived class to hide a method in the base class without overriding it. This can lead to static binding, and it informs the compiler that the derived class intends to hide the base method.

# Code implementation

To demonstrate dynamic and static binding:

- Create a base class `Animal` with a method marked `virtual` as `Speak` and `Move` as a regular method.
- Create a derived class that overrides the **virtual method** to provide dynamic binding.
- Add another method in the derived class using the `new` keyword to hide a base class method, which showcases static binding.

# Output

- **The animal makes a sound.**
- **The dog barks.**
- **The animal moves.**
- **The dog runs.**
- **The dog barks.**
- **The animal moves.**

# Explanation

**Dynamic Binding** (Speak method):

The `Speak` method in Animal is marked as `virtual`, allowing it to be overridden in the Dog class. If function is called and instance is `Animal`, then, that `virtual` implementation will be used.
When `polymorphicDog.Speak()` is called, it uses the overridden method in `Dog` because of dynamic binding.

**Static Binding** (Move method):

The `Move` method in Animal is not marked as `virtual`, so calling it directly on an Animal instance calls the base implementation.
The Dog class redefines `Move` with the `new` keyword, hiding the base class method. This uses **static binding**, and when `Move` is called on `specificDog`, it calls the derived class’s version.

# Conclusion

To sum up : 
- **Dynamic binding** allows methods to be overridden and resolved at runtime.
- **Static binding** hides methods using the new keyword and resolves at compile-time.