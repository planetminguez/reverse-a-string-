//d0cvinny


#include <stdio.h>
#include <string.h>
#include <stdint.h>

void print_bytes(const unsigned char *data, size_t length)
{
	for (size_t i = 0; i < length; i++)
		{
			printf("%02X ", data[i]);
		}
	printf("\n");
}

int main(void)
{
	char str[100];
	size_t length;
	
	printf("Enter a string: ");
	fgets(str, sizeof(str), stdin);
	
	/* Remove the newline character */
	str[strcspn(str, "\n")] = '\0';
	
	length = strlen(str);
	
	/*
	* ---------------------------------------------------------
	* Reversed String
	* ---------------------------------------------------------
	*/
	printf("\nOriginal string : %s\n", str);
	
	printf("Reversed string : ");
	
	for (int i = (int)length - 1; i >= 0; i--)
		{
			printf("%c", str[i]);
		}
	
	printf("\n");
	
	/*
	* ---------------------------------------------------------
	* Individual Bytes
	* ---------------------------------------------------------
	*/
	printf("\nBytes in memory:\n");
	
	for (size_t i = 0; i < length; i++)
		{
			printf("'%c' = 0x%02X\n",
				str[i],
				(unsigned char)str[i]);
		}
	
	/*
	* ---------------------------------------------------------
	* Big-Endian Byte Order
	* ---------------------------------------------------------
	*
	* Big-endian:
	* Most significant byte comes first.
	*/
	printf("\nBig-endian byte order:\n");
	
	for (size_t i = 0; i < length; i++)
		{
			printf("%02X ", (unsigned char)str[i]);
		}
	
	printf("\n");
	
	/*
	* ---------------------------------------------------------
	* Little-Endian Byte Order
	* ---------------------------------------------------------
	*
	* Little-endian:
	* Least significant byte comes first.
	*/
	printf("\nLittle-endian byte order:\n");
	
	for (int i = (int)length - 1; i >= 0; i--)
		{
			printf("%02X ", (unsigned char)str[i]);
		}
	
	printf("\n");
	
	/*
	* ---------------------------------------------------------
	* Detect Actual Machine Endianness
	* ---------------------------------------------------------
	*/
	uint32_t value = 0x12345678;
	
	unsigned char *bytes = (unsigned char *)&value;
	
	printf("\nYour machines endianness is:\n");
	
	if (bytes[0] == 0x78)
		{
			printf("Little-endian\n");
		}
	else if (bytes[0] == 0x12)
		{
			printf("Big-endian\n");
		}
	else
		{
			printf("Unknown/mixed-endian\n");
		}
	
}
