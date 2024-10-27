using System;

namespace BindingExample
{
    // Base class
    public class Animal
    {
        // Virtual method for dynamic binding
        public virtual void Speak()
        {
            Console.WriteLine("The animal makes a sound.");
        }

        // Regular method (not virtual)
        public void Move()
        {
            Console.WriteLine("The animal moves.");
        }
    }

    // Derived class
    public class Dog : Animal
    {
        // Override Speak method for dynamic binding
        public override void Speak()
        {
            Console.WriteLine("The dog barks.");
        }

        // Hide method for static binding using the 'new' keyword
        public new void Move()
        {
            Console.WriteLine("The dog runs.");
        }
    }

    class Program
    {
        static void Main(string[] args)
        {
            // Static binding example
            Animal genericAnimal = new Animal();
            Dog specificDog = new Dog();

            // Demonstrating dynamic binding
            genericAnimal.Speak();               // Output: "The animal makes a sound."
            specificDog.Speak();                 // Output: "The dog barks."

            // Demonstrating static binding
            genericAnimal.Move();                // Output: "The animal moves."
            specificDog.Move();                  // Output: "The dog runs."

            // Dynamic binding with polymorphism
            Animal polymorphicDog = new Dog();
            polymorphicDog.Speak();              // Output: "The dog barks."
            polymorphicDog.Move();               // Output: "The animal moves."
        }
    }
}