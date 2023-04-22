#include<iostream>
#include<iomanip>
#include<stdio.h>
#include<string.h>
using namespace std;
class Nguoi {
	protected:
		char hoTen[30];
		char ngaySinh[20];
		char queQuan[50];
	public:
		void nhap();
		void xuat();
};

void Nguoi::nhap() {
	cout<<"Nhap ho ten: ";       fflush(stdin);        gets(hoTen);
	cout<<"Nhap ngay sinh: ";    fflush(stdin);        gets(ngaySinh);
	cout<<"Nhap que quan: ";     fflush(stdin);        gets(queQuan);
}

void Nguoi::xuat() {
	cout<<setw(30)<<left<<hoTen;
	cout<<setw(20)<<left<<ngaySinh;
	cout<<setw(20)<<left<<queQuan;
}

class LopHoc;

class SinhVien: public Nguoi {
	private:
		char maSV[30];
		char nghanh[30];
		int khoaHoc;
	public:
		void nhap();
		void xuat();
	friend void soLuongSV(LopHoc a);
	friend void sapXep(LopHoc &a);
};

void SinhVien::nhap() {
	cout<<"Nhap ma sinh vien: ";       fflush(stdin);           gets(maSV);
	Nguoi::nhap();
	cout<<"Nhap nghanh: ";             fflush(stdin);           gets(nghanh);
	cout<<"Nhap khoa hoc: ";                                    cin>>khoaHoc;
}

void SinhVien::xuat() {
	cout<<setw(20)<<left<<maSV;
	Nguoi::xuat();
	cout<<setw(30)<<left<<nghanh;
	cout<<setw(20)<<left<<khoaHoc;
	cout<<endl;
}

class LopHoc {
	private:
		char maLH[20];
		char tenLH[30];
		char ngayMo[20];
		SinhVien *x;
		int n;
		char giaoVien[30];
	public:
		void nhap();
		void xuat();
	friend void soLuongSV(LopHoc a);
	friend void sapXep(LopHoc &a);	
};

void LopHoc::nhap() {
	cout<<"Nhap ma lop hoc: ";          fflush(stdin);           gets(maLH);
	cout<<"Nhap ten lop hoc: ";         fflush(stdin);           gets(tenLH);
	cout<<"Nhap ngay mo: ";             fflush(stdin);           gets(ngayMo);
	x = new SinhVien[100];
	cout<<"Nhap so luong sinh vien: ";                           cin>>n;
	for(int i=0; i<n; i++) {
		cout<<"\nNhap thong tin sinh vien "<<i+1<<":\n";
		x[i].nhap();
	}
	cout<<"Nhap giao vien: ";           fflush(stdin);           gets(giaoVien);
}

void LopHoc::xuat() {
	cout<<"\nMa lop hoc: "<<maLH;
	cout<<"\nTen lop hoc: "<<tenLH;
	cout<<"\nNgay mo: "<<ngayMo;
	cout<<"\nDanh sach sinh vien:";
	cout<<endl;
	cout<<setw(20)<<left<<"Ma SV";
	cout<<setw(30)<<left<<"Ho ten";
	cout<<setw(20)<<left<<"Ngay sinh";
	cout<<setw(20)<<left<<"Que quan";
	cout<<setw(30)<<left<<"Nganh";
	cout<<setw(20)<<left<<"Khoa hoc";
	cout<<endl;
	for(int i=0; i<n; i++) {
		x[i].xuat();
	}
	cout<<"\nGiao vien: "<<giaoVien;
}

void soLuongSV(LopHoc a) {
	int dem=0;
	for(int i=0; i<a.n; i++) {
		if(a.x[i].khoaHoc==11) {
			dem++;
		}
	}
	if(dem==0){
		cout<<"\n_ Khong co sinh vien nao khoa 11!";
	}else {
		cout<<"\n_ Co "<<dem<<" sinh vien khoa 11";
	}
}

void sapXep(LopHoc &a) {
	for(int i=0; i<a.n-1; i++) {
		for(int j=i+1; j<a.n; j++) {
			if(a.x[i].khoaHoc > a.x[j].khoaHoc) {
				SinhVien temp = a.x[i];
				a.x[i] = a.x[j];
				a.x[j] = temp;
			}
		}
	}
}

int main() {
	LopHoc a;
	a.nhap();
	cout<<"\n------------ THONG TIN LOP HOC -----------\n";
	a.xuat();
	cout<<endl;
	soLuongSV(a);
	cout<<"\n_ Xep sap danh sach sinh vien theo chieu tang cua khoa hoc:";
	sapXep(a);
	cout<<endl;
	a.xuat();
}
/*
LH01
KTPM03
1/8/2021
2
SV01
Nguyen Nhu Cong
11/11/2003
Dan Phuong
CNTT
16
SV02
Le Thi Dieu Ly
18/10/2003
Dan Phuong
Ngon ngu TQ
15
Nguyen Thi Kim Tuyen

*/
