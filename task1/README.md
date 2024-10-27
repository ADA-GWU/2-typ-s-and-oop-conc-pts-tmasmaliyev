# Problem № 1

Writе thrее functions in C or C++: one that declares a largе array statically, onе that dеclarеs thе samе
largе array on thе stack, and onе that crеatеs thе samе largе array from thе hеap. Call еach of thе
subprograms many timеs (at lеast 100,000) and output thе timе rеquirеd by еach. Еxplain thе rеsults.

# Problem approach

- Static Allocation: Declares a `fixed-size` array with a fixed location in memory. This memory persists for the lifetime of the program.
- Stack Allocation: Declares an array within a `function scope`. The memory is allocated on the stack and is automatically freed when the function returns.
- Heap Allocation: Allocates memory `dynamically` using new (in C++). This memory persists until it’s explicitly freed using `delete`.

# Code Implementation

In `main.cpp`, the task is implemented. There, I created 3 functions in the following:
- staticAllocation
- stackAllocation
- heapAllocation

As the name implies, each function creates array in `global scope`, `stack` and `heap` respectively. The array size for all use cases is `100,000`. 

In `main` function, each function is called `1,000,000` times and the time it takes are calculated in `milliseconds`. Then, the output is shown to the user.

## NOTE

In order not let optimizer of `C++` work, each function has assignment of first index of array to random value. In this case `1`.
This prevents the optimizer to work on arrays and see the true problem statement.

# Output

This program was loaded on `AMD Ryzen 7 4800H` and it took the following amount of time for each process:

- **Static allocation time: 5 milliseconds**
- **Stack  allocation time: 4793 milliseconds**
- **Heap   allocation time: 13785 milliseconds**

# Explanation

Static Allocation: The static array is only allocated once, at the start of the program. Subsequent calls to `staticAllocation` simply access the array without any reallocation. This should be the **fastest** in terms of access time since no memory allocation occurs in each function call.

Stack Allocation: For each call to `stackAllocation`, memory is allocated on the stack. This allocation is typically faster than `heap` allocation since stack allocation is **simpler** and more **lightweight**. However, the function will consume stack space every time it is called, which could lead to a stack overflow if the array is large and the number of calls is high.

Heap Allocation: Each call to `heapAllocation` dynamically allocates memory, which is slower because it involves requesting memory from the heap. Additionally, there’s overhead from freeing the memory with delete[]. This method is generally the `slowest` due to the heap allocation and deallocation cost.

# Conclusion

By running this code, you can observe the execution times and confirm the expected performance: `static < stack < heap`. The measurements will give insight into why static allocation is the most efficient method for repeatedly accessing large arrays.