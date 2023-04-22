#include<iostream>
#include<iomanip>
#include<stdio.h>
#include<string.h>
using namespace std;
class BenhNhan;
class Nguoi {
	protected:
		char hoTen[30];
		int tuoi;
	public:
		void nhap();
		void xuat();
	friend void soLuong(BenhNhan a[], int n);
	friend void suaTT(BenhNhan a[], int n);
};

void Nguoi::nhap() {
	cout<<"Nhap ho ten: ";        fflush(stdin);          gets(hoTen);
	cout<<"Nhap tuoi: ";                                  cin>>tuoi;
}

void Nguoi::xuat() {
	cout<<"\nHo ten: "<<hoTen;
	cout<<"\nTuoi: "<<tuoi;
}

class BenhVien {
	private:
		char tenBenhVien[30];
		char diaChi[50];
		char giamDoc[30];
	friend class BenhNhan;
};

class BenhNhan: public Nguoi {
	private:
		char maBN[20];
		char tienSu[50];
		char chuanDoan[50];
		BenhVien x;
	public:
		void nhap();
		void xuat();
	friend void nhap(BenhNhan a[], int n);
	friend void xuat(BenhNhan a[], int n);
	friend void suaTT(BenhNhan a[], int n);
};

void BenhNhan::nhap() {
	cout<<"Nhap ma benh nhan: ";       fflush(stdin);        gets(maBN);
	Nguoi::nhap();
	cout<<"Nhap tien su: ";            fflush(stdin);        gets(tienSu);
	cout<<"Nhap chuan doan: ";         fflush(stdin);        gets(chuanDoan);
	cout<<"Nhap ten benh vien: ";      fflush(stdin);        gets(x.tenBenhVien);
	cout<<"Nhap dia chi benh vien: ";  fflush(stdin);        gets(x.diaChi);
	cout<<"Nhap ten giam doc: ";       fflush(stdin);        gets(x.giamDoc);
}

void BenhNhan::xuat() {
	cout<<"\nMa benh nhan: "<<maBN;
	Nguoi::xuat();
	cout<<"\nTien su: "<<tienSu;
	cout<<"\nChuan doan: "<<chuanDoan;
	cout<<"\nTen benh vien: "<<x.tenBenhVien;
	cout<<"\nDia chi: "<<x.diaChi;
	cout<<"\nGiam doc: "<<x.giamDoc;
	cout<<endl;
}

void nhap(BenhNhan a[], int n) {
	for(int i=0; i<n; i++) {
		cout<<"\nNhap thong tin cho benh nhan "<<i+1<<":\n";
		a[i].nhap();
	}
}

void xuat(BenhNhan a[], int n) {
	for(int i=0; i<n; i++) {
		cout<<"\nThong tin benh nhan "<<i+1<<":";
		a[i].xuat();
	}
}

void soLuong(BenhNhan a[], int n) {
	int dem=0;
	for(int i=0; i<n; i++) {
		if(a[i].tuoi >30) {
			dem++;
		}
	}
	
	if(dem==0) {
		cout<<"\n_ Khong co benh nhan nao lon hon 30!";
	}else {
		cout<<"\n_ Co "<<dem<<" benh nhan lon hon 30";
	}
}

void suaTT(BenhNhan a[], int n) {
	int dem=0;
	for(int i=0; i<n; i++) {
		if(strcmp(a[i].maBN, "BN01")==0) {
			dem++;
			a[i].tuoi = 20;
		}
	}
	if(dem==0) {
		cout<<"\n_ Khong co benh nhan nao co ma BN01!";
	}
}

int main() {
	BenhNhan a[100];
	int n;
	cout<<"Nhap vao so luong benh nhan: ";
	cin>>n;
	nhap(a,n);
	cout<<"\n-------- THONG TIN CAC BENH NHAN ---------\n";
	xuat(a,n);
	soLuong(a,n);
	cout<<"\n_Sua tuoi cua benh nhan co ma BN01 (neu co):";
	suaTT(a,n);
	cout<<"\n-------- THONG TIN CAC BENH NHAN SAU KHI SUA ---------\n";
	xuat(a,n);
}
/*
2
BN01
nguyen nhu cong
20
khong
sot virus
phung
dan phuong
nguyen van an
BN02
le thi dieu ly
20
khong
gay chan
phung
dan phuong
nguyen van an

*/
