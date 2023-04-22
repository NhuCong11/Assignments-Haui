#include<iostream>
#include<fstream>
using namespace std;

class TamGiac {
	private:
		float a;
		float b;
		float c;
	public:
		float operator++();
	friend istream& operator>>(istream& x, TamGiac &y);
	friend ostream& operator << (ostream& x, TamGiac y);
};

float TamGiac::operator++() {
	return a+b+c;
}

istream& operator >> (istream& x, TamGiac &y) {
	cout<<"\nNhap vao canh a: ";   x>>y.a;
	cout<<"Nhap vao canh b: ";   x>>y.b;
	cout<<"Nhap vao canh c: ";   x>>y.c;
	return x;
}

ostream& operator << (ostream& x, TamGiac y) {
	x<<"_ Ba canh tam giac: "<<y.a<<" "<<y.b<<" "<<y.c;
	x<<"\n_ Chu vi tam giac: "<<++y;
}

int main() {
	TamGiac p;
	TamGiac q;
	cout<<"Nhap thong tin tam giac P:";
	cin>>p;
	cout<<"\nNhap thong tin tam giac Q:";
	cin>>q;
	cout<<"\nThong tin tam giac P:\n";
	cout<<p;
	cout<<endl;
	cout<<"\nThong tin tam giac P:\n";
	cout<<q;
	ofstream file("INOUT.txt");
	file<<"Thong tin tam giac P:"<<endl<<p;
	file<<endl;
	file<<"Thong tin tam giac Q:"<<endl<<q;
	file.close();
}
