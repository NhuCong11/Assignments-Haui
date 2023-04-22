O#include<iostream>
#include<iomanip>
#include<stdio.h>
#include<string.h>
using namespace std;
class NSX {
	private:
		char tenNSX[30];
	    char diaChi[50];
	public:
		void nhap();
		void xuat();
};

void NSX::nhap() {
	cout<<"\nNhap ten nha san xuat: ";       fflush(stdin);            gets(tenNSX);
	cout<<"\nNhap dia chi NSX: ";            fflush(stdin);            gets(diaChi);
}

void NSX::xuat() {
	cout<<"\nTen NSX: "<<tenNSX;
	cout<<"\nDia chi: "<<diaChi;
}

class Date {
	private:
		int ngay;
		int thang;
		int nam;
	public:
		void nhap();
		void xuat();
};

void Date::nhap() {
	cout<<"Nhap vao ngay: ";           cin>>ngay;
	cout<<"Nhap vao thang: ";         cin>>thang;
	cout<<"Nhap vao nam: ";           cin>>nam;
}

void Date::xuat() {
	cout<<ngay<<"/"<<thang<<"/"<<nam;
}

class Hang {
	protected:
		char tenHang[30];
		NSX x;
		double donGia;
	public:
		void nhap();
		void xuat();
		Hang();
};

Hang::Hang() {
	strcpy(tenHang, "Null");
	donGia = 0;
}

void Hang::nhap() {
	cout<<"Nhap vao ten hang: ";        fflush(stdin);          gets(tenHang);
	x.nhap();
	cout<<"Nhap vao don gia: ";                                 cin>>donGia;
}

void Hang::xuat() {
	cout<<"\nTen hang: "<<tenHang;
	x.xuat();
	cout<<"\nDon gia: "<<donGia;
}

class Tivi: public Hang {
	private:
		char kichThuoc[20];
	    Date ngayNhap;
	public:
		void nhap();
		void xuat();
		Tivi();
};

Tivi::Tivi(): Hang() {
	strcpy(kichThuoc, "0 inch");
}

void Tivi::nhap() {
	Hang::nhap();
	cout<<"Nhap vao kich thuoc: ";         fflush(stdin);           gets(kichThuoc);
	ngayNhap.nhap();
}

void Tivi::xuat() {
	Hang::xuat();
	cout<<"\nKich thuoc: "<<kichThuoc;
	cout<<"\nNgay nhap: ";
	ngayNhap.xuat();
}

int main() {
	Tivi a;
	a.nhap();
	cout<<"\n-------- Thong tin cua Tivi vua nhap --------";
	a.xuat();
}

/*
Tivi 1
Samsung
Viet Nam
23.5
53 inch
18
10
2022

*/
