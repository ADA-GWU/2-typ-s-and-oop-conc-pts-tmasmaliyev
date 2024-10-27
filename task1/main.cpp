// Import necessary libraries
#include <iostream>
#include <chrono>

const int ARRAY_SIZE = 1e5;                // Array size that will be given to static & stack & heap allocation array

// Static allocation function
void staticAllocation() {
	static int staticArray[ARRAY_SIZE];    // Creating static array
	staticArray[0] = 1;                    // Do random stuff so that optimization doesn't work on array
}

// Stack allocation function
void stackAllocation() {
	int stackArray[ARRAY_SIZE];            // Creating array in stack
	stackArray[0] = 1;                     // Do random stuff so that optimization doesn't work on array
}

// Heap allocation function
void heapAllocation() {
	int* heapArray = new int[ARRAY_SIZE];  // Creating array in heap
	heapArray[0] = 1;                      // Do random stuff so that optimiaztion doesn't work on array

	delete[] heapArray;                    // Free up the memory
}

int main()
{
	const int NUM_ITERATIONS = 1e6;        // Number of iterations that each function will be tested

	auto start = std::chrono::high_resolution_clock::now(); // Start the timer for `Static allocation function`
	
	// Call `staticAllocation` num of iterations times
	for (int i = 0; i < NUM_ITERATIONS; i++) {
		staticAllocation();
	}
	auto end = std::chrono::high_resolution_clock::now();   // Stop the clock

	auto staticDuration = std::chrono::duration_cast<std::chrono::milliseconds>(end - start).count();   // Get the exact time that took for calling `staticAllocation` `NUM_ITERATIONS` times
	
	start = std::chrono::high_resolution_clock::now();      // Start the timer for `Stack allocation function`
	
	// Call `stackAllocation` num of iterations times
	for (int i = 0; i < NUM_ITERATIONS; i++) {
		stackAllocation();
	}

	end = std::chrono::high_resolution_clock::now();        // Stop the clock
	
	auto stackDuration = std::chrono::duration_cast<std::chrono::milliseconds>(end - start).count();    // Get the exact time that took for calling `stackAllocation` `NUM_ITERATIONS` times

	start = std::chrono::high_resolution_clock::now();      // Start the timer for `Heap allocation function`

	// Call `heapAllocation` num of iterations times
	for (int i = 0; i < NUM_ITERATIONS; i++) {
		heapAllocation();
	}

	end = std::chrono::high_resolution_clock::now();        // Stop the clock
	
	auto heapDuration = std::chrono::duration_cast<std::chrono::milliseconds>(end - start).count();     // Get the exact time that took for calling `stackAllocation` `NUM_ITERATIONS` times
 
	std::cout << "Static allocation time: " << staticDuration << " millisecond\n";
	std::cout << "Stack  allocation time: " << stackDuration  << " millisecond\n";
	std::cout << "Heap   allocation time: " << heapDuration   << " millisecond\n";
}