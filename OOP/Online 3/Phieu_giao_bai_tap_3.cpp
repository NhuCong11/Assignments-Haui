#include<iostream>
#include<fstream>
using namespace std;
class PhanSo {
	private:
	    float tuSo;
	    float mauSo;
	public:
		PhanSo();
	    PhanSo operator*(PhanSo b);
	    float operator++();
	friend istream& operator>>(istream& x, PhanSo &y);
	friend ostream& operator<<(ostream& x, PhanSo y);
};

PhanSo::PhanSo() {
	tuSo = 1;
	mauSo = 1;
}

istream& operator>>(istream& x, PhanSo &y) {
	cout<<"\nNhap vao tu so: ";  x>>y.tuSo;
	cout<<"Nhap vao mau so: "; x>>y.mauSo;
	return x;
}

ostream& operator<<(ostream& x, PhanSo y) {
	x<<y.tuSo<<"/"<<y.mauSo;
    return x;
}

PhanSo PhanSo::operator*(PhanSo b) {
	PhanSo k;
	k.tuSo = tuSo * b.tuSo;
	k.mauSo = mauSo * b.mauSo;
	return k;
}

float PhanSo::operator++() {
	return tuSo/mauSo;
}

int main() {
	PhanSo a;
	PhanSo b;
	cout<<"Nhap vao phan so 1:";
	cin>>a;
	cout<<"Phan so 1: ";
	cout<<a;
	cout<<endl;
	cout<<"\nNhap vao phan so 2:";
	cin>>b;
	cout<<"Phan so 2: ";
	cout<<b;
	cout<<endl;
	cout<<"\nTich hai phan so: "<<a*b;
	cout<<"\nGia tri cua phan so 1: "<<++a;
	cout<<"\nGia tri cua phan so 2: "<<++b;
	ofstream file("TichPhanSo.txt");
	file<<"Tich 2 phan so: "<<a*b;
	file.close();
}
