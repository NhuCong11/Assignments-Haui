#include<iostream>
#include<iomanip>
#include<stdio.h>
#include<string.h>
using namespace std;
class SinhVien {
	private:
		char maSV[20];
		char tenSV[50];
		char lop[20];
		int khoa;
	public:
		void nhap();
		void xuat();
};

void SinhVien::nhap() {
	cout<<"Nhap vao ma sinh vien: ";      fflush(stdin);   gets(maSV);
	cout<<"\nNhap vao ten sinh vien: ";   fflush(stdin);   gets(tenSV);
	cout<<"\nNhap vao ten lop: ";         fflush(stdin);   gets(lop);
	cout<<"\nNhap vao khoa: ";                             cin>>khoa;
}

void SinhVien::xuat() {
	cout<<"Ma sinh vien: "<<maSV;
	cout<<"\tTen sinh vien: "<<tenSV;
	cout<<"\nLop: "<<lop;
	cout<<"\t\tKhoa: "<<khoa;
}
class Phieu;

class Mon {
	private:
		char tenMon[50];
		int soTrinh;
		float diem;
	public:
		void nhap();
		void xuat();
	friend class Phieu;
	friend void bonus1(Phieu a);
};

void Mon::nhap() {
	cout<<"\nNhap vao ten mon: ";     fflush(stdin);   gets(tenMon);
	cout<<"\nNhap vao so trinh: ";                     cin>>soTrinh;  
	cout<<"\nNhap vao diem: ";                         cin>>diem;
}

void Mon::xuat() {
	cout<<setw(30)<<left<<tenMon;
	cout<<setw(20)<<left<<soTrinh;
	cout<<setw(20)<<left<<diem;
	cout<<endl;
}

class Phieu {
	private:
		SinhVien a;
		Mon DS[30];
		int n;
	public:
		void nhap();
		void xuat();
	friend void bonus1(Phieu a);
    friend void bonus2(Phieu &a);
};

void Phieu::nhap() {
	a.nhap();
	cout<<endl;
	cout<<"Nhap vao so luong mon hoc: ";
	cin>>n;
	for(int i=0; i<n; i++) {
		cout<<"\nNhap thong tin mon hoc "<<i+1<<": ";
		DS[i].nhap();
	}
}

void Phieu::xuat() {
	cout<<endl;
	cout<<"--------------- PHIEU BAO DIEM ----------------";
	cout<<endl;
	a.xuat();
	cout<<"\nBang diem:";
	cout<<endl;
	cout<<setw(30)<<left<<"Ten mon";
	cout<<setw(20)<<left<<"So trinh";
	cout<<setw(20)<<left<<"Diem";
	cout<<endl;
	for(int i=0; i<n; i++) {
		DS[i].xuat();
	}
	int tongSoTrinh=0;
	for(int i=0; i<n; i++) {
		tongSoTrinh += DS[i].soTrinh;
	}
	float diemSoTrinh=0;
	for(int i=0; i<n; i++) {
		diemSoTrinh += DS[i].soTrinh*DS[i].diem;
	}
	float diemTB = diemSoTrinh/tongSoTrinh;

	cout<<setw(30)<<"";
	cout<<setw(20)<<"Diem trung binh";
	cout<<setw(20)<<left<<diemTB;
}

void bonus1(Phieu a) {
	for(int i=0; i<a.n; i++) {
		if(a.DS[i].soTrinh > 3) {
			cout<<a.DS[i].tenMon<<" ";
		}
	}
}

void bonus2(Phieu &a) {
	Mon x;
	cout<<"\n_ Nhap thong tin mon can chen: ";
	cout<<endl;
	x.nhap();
	a.DS[a.n] = x;
	a.n++;
}

int main() {
	Phieu x;
	x.nhap();
	x.xuat();
	cout<<"\n-----------------------------------------------\n";
	cout<<"\n_ Ten cac mon hoc co so trinh lon hon 3: ";
	bonus1(x);
	bonus2(x);
	cout<<"\n--------> Phieu sau khi chen them: ";
	cout<<endl;
	x.xuat();
}
