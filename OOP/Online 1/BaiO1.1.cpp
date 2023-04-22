#include<iostream>
#include<iomanip>
#include<stdio.h>
#include<string.h>
using namespace std;
class Hang {
	private:
		char tenHang[50];
		float donGia;
		int soLuong;
	public:
		void nhap();
		void xuat();
	friend class Phieu;
};

void Hang::nhap() {
	cout<<"\nNhap vao ten hang: ";     fflush(stdin);      gets(tenHang);
	cout<<"\nNhap vao don gia: ";                          cin>>donGia;
	cout<<"\nNhap vao so luong: ";                         cin>>soLuong;
}

void Hang::xuat() {
	cout<<setw(20)<<left<<tenHang;
	cout<<setw(20)<<left<<donGia;
	cout<<setw(20)<<left<<soLuong;
	cout<<setw(20)<<left<<donGia*soLuong;
	cout<<endl;
}

class NCC {
	private:
		char maNCC[20];
		char tenNCC[50];
		char diaChi[100];
	public:
		void nhap();
		void xuat();
};

void NCC::nhap() {
	cout<<"\nNhap ma nha cung cap: ";       fflush(stdin);     gets(maNCC);
	cout<<"\nNhap ten nha cung cap: ";      fflush(stdin);     gets(tenNCC);
	cout<<"\nNhap dia chi nha cung cap: ";  fflush(stdin);     gets(diaChi);
}

void NCC::xuat() {
	cout<<"Ma NCC: "<<maNCC; 
	cout<<"\t\tTen NCC: "<<tenNCC;
	cout<<"\nDia chi: "<<diaChi;
}

class Phieu {
	private:
		char maPhieu[20];
		char ngayLap[20];
		NCC nhaCungCap;
		Hang DS[50];
		int n;
	public:
		void nhap();
		void xuat();
};


void Phieu::nhap() {
	cout<<"\nNhap vao ma phieu: ";     fflush(stdin);     gets(maPhieu);
	cout<<"\nNhap vao ngay lap: ";     fflush(stdin);     gets(ngayLap);
	nhaCungCap.nhap();
	cout<<"\nNhap vao so luong mat hang: ";               cin>>n;
	for(int i=0; i<n; i++) {
		cout<<"Nhap vao thong tin mat hang "<<i+1<<":\n";
		DS[i].nhap();
	}
}

void Phieu::xuat() {
	cout<<endl;
	cout<<"------------------ PHIEU NHAP HANG ------------------\n";
	cout<<"Ma phieu: "<<maPhieu;
	cout<<"\t\tNgay lap: "<<ngayLap;
	cout<<endl;
	nhaCungCap.xuat();
	cout<<endl;
	cout<<setw(20)<<left<<"Ten hang";
	cout<<setw(20)<<left<<"Don gia";
	cout<<setw(20)<<left<<"So luong";
	cout<<setw(20)<<left<<"Thanh tien";
	cout<<endl;
	for(int i=0; i<n; i++) {
		DS[i].xuat();
	}
	float tongTien=0;
	for(int i=0; i<n; i++) {
		tongTien+=(DS[i].donGia)*(DS[i].soLuong);
	}
	cout<<endl;
	cout<<setw(20)<<"";
	cout<<setw(20)<<"";
	cout<<setw(20)<<"Cong thanh tien: ";
	cout<<setw(20)<<left<<tongTien;
}


int main() {
	Phieu a;
	a.nhap();
	a.xuat();
}
