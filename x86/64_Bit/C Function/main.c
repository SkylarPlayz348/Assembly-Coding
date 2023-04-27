#include <stdio.h> // Add Standard Input output Library
#include "add42.h" // Include the add42 header file

int main() {
    int result; // make variable result of type integer
    result = add42(30); // Make result equal to 30 + 42
    printf("Result: %i\n", result); // Print the result to the Console
    return 0;  // Make the Exit code 0
}