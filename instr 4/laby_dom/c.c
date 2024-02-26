#include <stdio.h>

// Declaration of the external assembly function
extern __int32 suma(int size, int* tab);

int main()
{
    // Initialize variables
    char strTab[256] = "";
    char currNum[256] = "";
    int size = 1;
    int startIndex = 0;
    int endIndex = 0;
    int currentNumIndex = 0;

    // Read a line of input up to 255 characters
    scanf_s("%255[^\n]", strTab, sizeof(char) * 256);

    // Count the number of integers in the input
    for (int i = 0; i < 256; i++)
    {
        if (strTab[i] == ' ')
            size++;
    }

    // Dynamically allocate memory for the array of integers
    int* numTab = (int*)calloc(size * sizeof(int));

    // Parse the input string to extract integers
    for (int i = 0; i < 256; i++)
    {
        // Check for a space character, indicating the end of a number
        if (strTab[i] == ' ')
        {
            endIndex = i;

            // Copy the characters representing the current number to currNum
            for (int j = 0; j < endIndex - startIndex; j++)
            {
                currNum[j] = strTab[startIndex + j];
                currNum[j + 1] = '\0';
            }

            // Convert the string to an integer and store it in numTab
            numTab[currentNumIndex] = atoi(currNum);
            printf_s("%d \n", numTab[currentNumIndex]);

            // Move to the next index and update the start index
            currentNumIndex++;
            startIndex = i + 1;
        }

        // Check for the end of the string
        if (strTab[i] == '\0')
        {
            // Break if the last character before the end is a space
            if (startIndex > 0 && strTab[startIndex - 1] == ' ')
                break;

            endIndex = i;

            // Copy the characters representing the last number to currNum
            for (int j = 0; j < endIndex - startIndex; j++)
            {
                currNum[j] = strTab[startIndex + j];
                currNum[j + 1] = '\0';
            }

            // Convert the string to an integer and store it in numTab
            numTab[currentNumIndex] = atoi(currNum);
            printf_s("%d \n", numTab[currentNumIndex]);

            // Break out of the loop since we've reached the end of the string
            break;
        }
    }

    // Check if numTab is not NULL before calling the assembly function
    if (numTab != NULL)
    {
        // Call the assembly function and print the sum of the integers
        printf_s("Suma: %d\n", suma(size, numTab));
    }

    // Free the dynamically allocated memory
    free(numTab);

    return 0;
}
