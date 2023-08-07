# carray
Pointer and non-pointer array strcture in C

~~~C
#include <stdio.h>
#include <stdlib.h>

/**
 * Array structure
 */
typedef struct Array
{
    int *values;
    size_t size;
} Array;

/**
 * Pointer array function prototypes
 */
Array *new_array_ptr(size_t n);
void fill_array_ptr(Array *arr);

/**
 * Non-pointer array function prototypes
 */
Array new_array(size_t n);
void fill_array(Array arr);
void free_array(Array arr);

/**
 * Main function
 */
int main(void)
{
    /**
     * Array of integers
     */
    int arr[] = {};

    /**
     * Pointer array
     */
    Array *array = new_array_ptr(10);
    fill_array_ptr(array);

    if (array)
    {
        for (int i = 0; i < array->size; i++)
        {
            printf("%d ", array->values[i]);
        }
        free(array);
    }

    // Print a new line
    printf("\n");

    /**
     * Non-pointer array
     */
    Array array2 = new_array(10);
    fill_array(array2);
    for (int i = 0; i < array2.size; i++)
    {
        printf("%d ", array2.values[i]);
    }
    free_array(array2);

    /**
     * Which one is better and safer?
     * 
     * The non-pointer array is better and safer because it is
     * easier to use and it is less likely to cause memory leaks.
     * 
     * The pointer array is more flexible and can be used to
     * create dynamic arrays.
     * 
     * Although, freeing memory for the pointer array is much easier
     * and is less likely to forget when to actually free the memory.
     * 
    */

    // Return the main fucntion
    return 0;
}

/**
 * Initialize a new array pointer type
 */
Array *new_array_ptr(size_t n)
{
    Array *new_arr = malloc(sizeof(Array));
    if (new_arr)
    {
        new_arr->size = n;
        new_arr->values = malloc(n * sizeof(int));
    }
    return new_arr;
}

/**
 * Fill array with numbers from 1 to n
 */
void fill_array_ptr(Array *array)
{
    if (array)
    {
        for (int i = 0; i < array->size; i++)
        {
            array->values[i] = i + 1;
        }
    }
}

/**
 * Create a new non-ptr array
 */
Array new_array(size_t n)
{
    Array new_arr;
    new_arr.size = n;
    new_arr.values = malloc(n * sizeof(int));
    return new_arr;
}

/**
 * Fill array with numbers from 1 to n
 */
void fill_array(Array array)
{
    for (int i = 0; i < array.size; i++)
    {
        array.values[i] = i + 1;
    }
}

/**
 * Free the array
 */
void free_array(Array array)
{
    free(array.values);
}
```
