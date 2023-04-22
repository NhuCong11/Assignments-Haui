#include<iostream>
#include<fstream>
using namespace std;

class Mang {
	private:
		int n;
		float value[100];
	public:
		Mang operator++();
		Mang operator--();
	friend istream& operator>>(istream& x, Mang &y);
	friend ostream& operator<<(ostream& x, Mang &y);
};

istream& operator>>(istream& x, Mang &y) {
	cout<<"Nhap so luong phan tu n: ";
	x>>y.n;
	for(int i=0; i<y.n; i++) {
		cout<<"\nNhap vao a["<<i<<"]: ";
		x>>y.value[i];
	}
	return x;
}

ostream& operator<<(ostream& x, Mang &y) {
	for(int i=0; i<y.n; i++) {
		x<<y.value[i]<<" ";
	}
	return x;
}

Mang Mang::operator++() {
	for(int i=0; i<n-1; i++) {
		for(int j=i+1; j<n; j++) {
			if(value[i]>value[j]) {
				float temp = value[i];
				value[i] = value[j];
				value[j] = temp;
			}
		}
	}
}

Mang Mang::operator--() {
	for(int i=0; i<n-1; i++) {
		for(int j=i+1; j<n; j++) {
			if(value[i]<value[j]) {
				float temp = value[i];
				value[i] = value[j];
				value[j] = temp;
			}
		}
	}
}

int main() {
	Mang a;
	cin>>a;
	cout<<"\nMang vua nhap: ";
	cout<<a;
	ofstream file("Mang.txt");
	cout<<"\nMang sau khi sap xep tang dan: ";
	++a;
	cout<<a;
	file<<"Mang sap xep tang dan: "<<a;
	cout<<"\nMang sau khi sap xep giam dan: ";
	--a;
	cout<<a;
	file<<endl;
	file<<"Mang sap xep giam dan: "<<a;
	file.close();
}
