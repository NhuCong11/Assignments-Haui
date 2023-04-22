#include<iostream>
#include<iomanip>
#include<stdio.h>
#include<string.h>
using namespace std;
class Student;
class School {
	private:
		char nameSchool[30];
		char dateSchool[20];
	friend class Faculty;
	friend void suaTT(Student &a);
};

class Faculty {
	private:
		char facultyName[30];
		char dateFaculty[20];
		School x;
	public:
		void input();
		void output();
	friend void suaTT(Student &a);
};

void Faculty::input() {
	cout<<"Nhap vao faculty name: ";        fflush(stdin);         gets(facultyName);
	cout<<"Nhap vao date faculty: ";        fflush(stdin);         gets(dateFaculty);
	cout<<"Nhap vao school name: ";         fflush(stdin);         gets(x.nameSchool);
	cout<<"Nhap vao date school: ";         fflush(stdin);         gets(x.dateSchool);
}

void Faculty::output() {
	cout<<"\nFaculty name: "<<facultyName;
	cout<<"\nFaculty date: "<<dateFaculty;
	cout<<"\nSchool name: "<<x.nameSchool;
	cout<<"\nSchool date: "<<x.dateSchool;
}

class Person {
	protected:
		char personName[30];
		char birth[20];
		char address[50];
	public:
		void input();
		void output();
		Person();
};

Person::Person() {
	strcpy(personName, "Null");
	strcpy(birth, "Null");
	strcpy(address, "Null");
}

void Person::input() {
	cout<<"Nhap vao person name: ";    fflush(stdin);               gets(personName);
	cout<<"Nhap birth: ";              fflush(stdin);               gets(birth);
	cout<<"Nhap address: ";            fflush(stdin);               gets(address);
}

void Person::output() {
	cout<<"\nPerson name: "<<personName;
	cout<<"\nBirth: "<<birth;
	cout<<"\nAddress: "<<address;
}

class Student: public Person {
	private:
		Faculty y;
		char studentClass[20];
		float score;
	public:
		void input();
		void output();
		Student();
	friend void suaTT(Student &a);
};

Student::Student():Person() {
	strcpy(studentClass, "Null");
	score = 0;	
}

void Student::input() {
	Person::input();
	y.input();
	cout<<"Nhap class: ";    fflush(stdin);     gets(studentClass);
	cout<<"Nhap score: ";                       cin>>score;
}

void Student::output() {
	Person::output();
	y.output();
	cout<<"\nClass: "<<studentClass;
	cout<<"\nScore: "<<score;
}

void suaTT(Student &a) {
	strcpy(a.y.x.nameSchool, "DHCNHN");
}

int main() {
	Student a;
	a.input();
	cout<<"\n-------- Thong tin student --------";
	a.output();
	suaTT(a);
	cout<<"\n------ Thong tin student sau khi sua thong tin ve ten truong ------";
	a.output();
}
/*
Nguyen Nhu Cong
11/11/2003
Dan Phuong, Ha Noi
CNTT
18/10/1990
DHDL
24/5/1890
KTPM03
2.88

*/
