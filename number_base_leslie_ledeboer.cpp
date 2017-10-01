// Number Base in C/C++
// Leslie Ledeboer

#include <cstdio>

using namespace std;

const int MAX_BASE = 36;
const int STRING_SIZE = 33;

int main()
{
    unsigned int integer;
    unsigned int newBase;
    
    char digits[MAX_BASE] = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H',
                              'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'};
    
    char string[STRING_SIZE] = {0};
    
    printf("Enter an unsigned integer: ");
    scanf("%u", &integer);
    printf("\n");
    
    printf("Enter a new number base: ");
    scanf("%u", &newBase);
    printf("\n");
    
    while (newBase < 2 || newBase > 36)
    {
        printf("Error. Enter a new number base: ");
        scanf("%u", &newBase);
        printf("\n");
    }
    
    if (newBase == 10)
    {
        printf("%u", integer);
    }
    
    else
    {
        for (int i = 0; i < STRING_SIZE && integer != 0; i++)
        {
            int remainder = integer % newBase;
            
            integer /= newBase;
            
            string[i] = digits[remainder];
        }
        
        for (int i = STRING_SIZE - 1; i >= 0; i--)
        {
            if (digits[i] != 0)
            {
                printf("%c", string[i]);
            }
        }
        
        printf("\n\n");
    }
}