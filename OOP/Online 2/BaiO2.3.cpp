#include<iostream>
#include<iomanip>
#include<stdio.h>
#include<string.h>
using namespace std;
class TruongDH;
class Khoa {
	private:
		char maKhoa[20];
		char tenKhoa[20];
		char truongKhoa[30];
	friend class TruongDH;
    friend void xoa(TruongDH &a);
};

class Ban {
	private:
		char maBan[20];
		char tenBan[20];
		char ngayThanhLap[20];
	friend class TruongDH;
};

class Truong {
	protected:
		char maTruong[20];
		char tenTruong[20];
		char diaChi[30];
	public:
		void nhap();
		void xuat();
};

void Truong::nhap() {
	cout<<"Nhap ma truong: ";      fflush(stdin);        gets(maTruong);
	cout<<"Nhap ten truong: ";     fflush(stdin);        gets(tenTruong);
	cout<<"Nhap dia chi: ";        fflush(stdin);        gets(diaChi);
}

void Truong::xuat() {
	cout<<"\nMa truong: "<<maTruong;
	cout<<"\nTen truong: "<<tenTruong;
	cout<<"\nDia chi: "<<diaChi;
}

class TruongDH: public Truong {
	private:
		Khoa x[50];
		int n;
		Ban y[50];
		int m;
	public:
		void nhap();
		void xuat();
	friend void xoa(TruongDH &a);
};

void TruongDH::nhap() {
	Truong::nhap();
	cout<<"\nNhap vao so luong khoa: ";                      cin>>n;
	for(int i=0; i<n; i++) {
		cout<<"\nNhap vao thong tin khoa "<<i+1<<": ";
		cout<<"\nNhap ma khoa: ";       fflush(stdin);       gets(x[i].maKhoa);
		cout<<"Nhap ten khoa: ";      fflush(stdin);       gets(x[i].tenKhoa);
		cout<<"Nhap truong khoa: ";   fflush(stdin);       gets(x[i].truongKhoa);
	}
	
	cout<<"\nNhap vao so luong ban: ";                       cin>>m;
	for(int j=0; j<m; j++) {
		cout<<"\nNhap vao thong tin ban "<<j+1<<": ";
		cout<<"\nNhap ma ban: ";           fflush(stdin);     gets(y[j].maBan);
		cout<<"Nhap ten ban: ";          fflush(stdin);     gets(y[j].tenBan);
		cout<<"Nhap ngay thanh lap: ";   fflush(stdin);     gets(y[j].ngayThanhLap);
	}
}

void TruongDH::xuat() {
	Truong::xuat();
	cout<<"\nThong tin ve khoa: \n";
	cout<<setw(20)<<left<<"Ma khoa";
	cout<<setw(20)<<left<<"Ten khoa";
	cout<<setw(30)<<left<<"Truong khoa";
	cout<<endl;
	for(int i=0; i<n; i++) {
		cout<<setw(20)<<left<<x[i].maKhoa;
		cout<<setw(20)<<left<<x[i].tenKhoa;
		cout<<setw(30)<<left<<x[i].truongKhoa;
		cout<<endl;
	}
	
	cout<<"Thong tin ve ban: \n";
	cout<<setw(20)<<left<<"Ma ban";
	cout<<setw(20)<<left<<"Ten ban";
	cout<<setw(30)<<left<<"Ngay thanh lap";
	cout<<endl;
	for(int j=0; j<m; j++) {
		cout<<setw(20)<<left<<y[j].maBan;
		cout<<setw(20)<<left<<y[j].tenBan;
		cout<<setw(30)<<left<<y[j].ngayThanhLap;
		cout<<endl;
	}
}

void xoa(TruongDH &a) {
	int dem=0;
	for(int i=0; i<a.n; i++) {
		if(strcmp(a.x[i].maKhoa, "KH01")==0) {
			dem++;
			for(int j=i; j<a.n-1; j++) {
				a.x[j] = a.x[j+1];
			}
			a.n--;
		}
	}
	
	if(dem==0) {
		cout<<"\nKhong co khoa nao co ma khoa la KH01!";
	}
}

int main() {
	TruongDH a;
	a.nhap();
	cout<<"\n---------- Thong tin cua truong -------------\n";
	a.xuat();
	xoa(a);
	cout<<"\n---------- Thong tin cua truong sau khi xoa khoa co ma khoa KH01 (neu co) -------------\n";
	a.xuat();
}
