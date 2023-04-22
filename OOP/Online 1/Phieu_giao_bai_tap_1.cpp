#include<iostream>
#include<iomanip>
#include<stdio.h>
#include<string.h>
using namespace std;
class Phieu;

class SanPham {
	private:
		char maSP[20];
		char tenSP[50];
		int soLuong;
		int donGia;
	public:
		void nhap();
		void xuat();
	friend class Phieu;
	friend void timSL(Phieu a);
	friend void sapXepTang(Phieu &a);
};

void SanPham::nhap() {
	cout<<"\nNhap vao ma san pham: ";      fflush(stdin);      gets(maSP);
	cout<<"\nNhap vao ten san pham: ";   fflush(stdin);      gets(tenSP);
	cout<<"\nNhap vao so luong: ";                           cin>>soLuong;
	cout<<"\nNhap vao don gia: ";                            cin>>donGia;
}

void SanPham::xuat() {
	cout<<setw(20)<<left<<maSP;
	cout<<setw(20)<<left<<tenSP;
	cout<<setw(20)<<left<<soLuong;
	cout<<setw(20)<<left<<donGia;
	cout<<setw(20)<<left<<soLuong*donGia;
	cout<<endl;
}

class NCC {
	private:
		char maNCC[20];
		char tenNCC[50];
		char diaChi[50];
		char dienThoai[20];
	public:
		void nhap();
		void xuat();
};

void NCC::nhap() {
	cout<<"Nhap vao ma nha cung cap: ";      fflush(stdin);     gets(maNCC);
	cout<<"\nNhap vao ten nha cung cap: ";   fflush(stdin);     gets(tenNCC);
	cout<<"\nNhap vao dia chi: ";            fflush(stdin);     gets(diaChi);
	cout<<"\nNhap vao so dien thoai: ";      fflush(stdin);      gets(dienThoai);
}

void NCC::xuat() {
	cout<<"Ma nha cung cap: "<<maNCC;
	cout<<"\t\t\tTen nha cung cap: "<<tenNCC;
	cout<<"\nDia chi: "<<diaChi;
	cout<<"\t\tSDT: "<<dienThoai;
}

class Phieu {
	private:
		char maPhieu[20];
		char ngayLap[20];
		NCC a;
		SanPham DS[50];
		int n;
	public:
		void nhap();
		void xuat();
	friend void timSL(Phieu a);
	friend void sapXepTang(Phieu &a);
	
};

void Phieu::nhap() {
	cout<<"Nhap vao ma phieu: ";      fflush(stdin);       gets(maPhieu);
	cout<<"\nNhap vao ngay lap: ";    fflush(stdin);       gets(ngayLap);
	cout<<endl;
	a.nhap();
	cout<<"\nNhap vao so luong san pham: ";
	cin>>n;
	cout<<endl;
	for(int i=0; i<n; i++) {
		cout<<"\nNhap vao thong tin san pham "<<i+1<<": ";
		DS[i].nhap();
	}
}

void Phieu::xuat() {
	cout<<"\nDai hoc Victory";
	cout<<"\n------------------- PHIEU NHAP VAN PHONG PHAM -------------------";
	cout<<endl;
	cout<<"Ma phieu: "<<maPhieu;
	cout<<"\t\t\t\tNgay lap: "<<ngayLap;
	cout<<endl;
	a.xuat();
	cout<<endl;
	cout<<setw(20)<<left<<"Ma SP";
	cout<<setw(20)<<left<<"Ten san pham";
	cout<<setw(20)<<left<<"So luong";
	cout<<setw(20)<<left<<"Don gia";
	cout<<setw(20)<<left<<"Thanh tien";
	cout<<endl;
	for(int i=0; i<n; i++) {
		DS[i].xuat();
	}
	int tong=0;
	for(int i=0; i<n; i++) {
		tong += DS[i].soLuong * DS[i].donGia;
	}
	cout<<endl;
	cout<<setw(20)<<"";
	cout<<setw(20)<<"";
	cout<<setw(20)<<"";
	cout<<setw(20)<<"Tong: ";
	cout<<setw(20)<<left<<tong;
	cout<<endl;
}

void timSL(Phieu a) {
	int dem=0;
	for(int i=0; i<a.n; i++) {
		if(a.DS[i].soLuong < 80) {
			dem++;
		}
	}
	cout<<"\n_ Co "<<dem<<" san pham co so luong nhap nho hon 80";
}

void sapXepTang(Phieu &a) {
	for(int i=0; i<a.n-1; i++) {
		for(int j=i+1; j<a.n; j++) {
			if(a.DS[i].donGia > a.DS[j].donGia) {
				SanPham temp = a.DS[i];
				a.DS[i] = a.DS[j];
				a.DS[j] = temp;
			}
		}
	}
}

int main() {
	Phieu x;
	x.nhap();
	x.xuat();
	timSL(x);
	sapXepTang(x);
	cout<<"\n_ Phieu sau khi sap xep danh sanh cac san pham theo chieu tang don gia: ";
	cout<<endl;
	x.xuat();
}
