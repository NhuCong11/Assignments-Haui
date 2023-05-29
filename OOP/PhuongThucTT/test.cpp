#include<iostream>
#include<fstream>

using namespace std;

class TTB2 {
	private:
		int a, b, c;
	public:
		TTB2();
		TTB2(int x, int y, int z);
		TTB2 operator+(TTB2 x);
		TTB2 operator-(TTB2 x);
	friend istream& operator>>(istream& in, TTB2 &x);
	friend ostream& operator<<(ostream& out, TTB2 x);
};

TTB2::TTB2() {
	a = 1;
	b = 1;
	c = 1;
}

TTB2::TTB2(int x, int y, int z) {
	a = x;
	b = y;
	c = z;
}

istream& operator>>(istream& in, TTB2 &x) {
	cout<<"Nhap vao a: ";
	in>>x.a;
	cout<<"Nhap vao b: ";
	in>>x.b;
	cout<<"Nhap vao c: ";
	in>>x.c;
	return in;
}

ostream& operator<<(ostream& out, TTB2 x) {
	if(x.a == 1) {
		out<<"x^2 ";
	}else if(x.a == -1) {
		out<<"x^2 ";
	}else {
		out<<x.a<<"x^2 ";
	}
	if(x.b > 0) {
		out<<"+ "<<x.b<<"x ";
	}else {
		out<<"- "<<-x.b<<"x ";
	}
	if(x.c > 0) {
		out<<"+ "<<x.c;
	}else {
		out<<"- "<<-x.c;
	}
	return out;
}

TTB2 TTB2::operator+(TTB2 x) {
	TTB2 k;
	k.a = a + x.a;
	k.b = b + x.b;
	k.c = c + x.c;
	return k;
}

TTB2 TTB2::operator-(TTB2 x) {
	TTB2 k;
	k.a = a - x.a;
	k.b = b - x.b;
	k.c = c - x.c;
	return k;
}

int main() {
	TTB2 x, y;
	fstream file("TTB2.TXT", ios::out);
	
	cout<<"Nhap tam thuc bac 2 x: "<<endl;
	cin>>x;
	file<<"Tam thuc bac 2 x: "<<x;
	
	cout<<"\nNhap tam thuc bac 2 y: "<<endl;
	cin>>y;
	file<<"\nTam thuc bac 2 y: "<<y;
	
	cout<<"\nTam thuc x: "<<x;
	cout<<"\nTam thuc y: "<<y;
	
	cout<<"\nTong x + y: "<<x+y;
	file<<"\nTong x + y: "<<x+y;
	
	cout<<"\nHieu x - y: "<<x-y;
	file<<"\nHieu x - y: "<<x-y;
	
	file.close();
}
