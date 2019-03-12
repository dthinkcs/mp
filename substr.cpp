#include <iostream>
#include <cstring>
using namespace std;

bool check_sub(char* main_str, char* sub_str)
{
    //int equal_i = 0;
    for (int i = 0, j = 0; i < strlen(main_str); i++)
    {
        if (main_str[i] == sub_str[j])
        {
            for (int inner_i = i ; j < strlen(sub_str); )
            {
                if (main_str[inner_i] == sub_str[j])
                {
                    inner_i++;
                    j++;
                }
                else
                    break;
            }

            if (j == strlen(sub_str))
                return true;
            else
                j = 0;
        }

        // j = 0;
    }
    return false;
}

int main()
{
    char main_str[100];
    char sub_str[100];

    cout << "Enter the main string: ";
    cin >> main_str;
    cout << "Enter the sub string: ";
    cin >> sub_str;

    if (check_sub(main_str, sub_str))
        cout << "substring found" << endl;
    else
        cout << "substring NOT found" << endl;
}
