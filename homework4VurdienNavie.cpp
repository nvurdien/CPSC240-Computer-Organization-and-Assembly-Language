//Homework 4
//Navie Vurdien
//Due - November 3rd, 2016
//Compiler Used - Visual Studios 2015
//Program Description:
//The program encrypts a string of text with a maximum size of 81 characters by XOR'ing a hex AC to each character in the input buffer. 
//The program will display the input buffer, the encrypt buffer and the decrypted buffer. 
//The program will display each char of the buffer as a hex character.

#include "stdafx.h"
#include<iostream>
#include <string>
#include <fstream>
using namespace std;

//TranslateBuffer
//arguments - a pointer of the char array, an unsigned int of the number of chars that are not null in the array
//translates the text into the encrypted text 
void TranslateBuffer(char* buffer, unsigned count)
{
	__asm {
			//stores the values from buffer into the esi register
			mov esi, buffer
			//stores the number of chars in the array into the ecx register
			mov ecx, count
			//move the value 172 decimal or AC hexidecimal into the AL register
			mov al, 172
			L1 ://loop through the array to encrypt each char
				//xor each char with the 
				xor[esi], al
				//increments the index
				inc esi
				//loops until the esi register reaches the ecx register's value
				loop L1
			}
}
int main()
{
	//what needs to be encrypted
	char inputbuffer[81];
	//encrypted
	char encrypted[81];
	//ask what text needs to be encrypted
	cout << "Please enter the text you would like to encrypt: " << endl;
	//get what needs to be encrypted
	cin.getline(inputbuffer, sizeof inputbuffer);
	//copy the chars from the input to the encrypted char array
	strncpy_s(encrypted, inputbuffer, sizeof inputbuffer);
	//count the number of chars inputted
	int count = int(cin.gcount() - 1);
	//tells user what they inputted
	cout << endl << "You have inputted \"" << inputbuffer << "\"" << endl;
	//encrypts the text inputted
	TranslateBuffer(encrypted, count);
	//tells user the encrypted text
	cout << "Your encrypted text is : ";
	for (int a = 0; a < count; a++)
		cout << encrypted[a];
	cout << endl;
	return 0;
}

