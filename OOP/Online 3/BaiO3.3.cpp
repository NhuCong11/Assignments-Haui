#include<iostream>
#include<fstream>
using namespace std;
class MaTran {
	private:
		int m;
		int n;
	    double a[100][100];
	public:
		MaTran operator-();
	friend istream& operator >>(istream& x, MaTran &y);
	friend ostream& operator <<(ostream& x, MaTran y);
};

istream& operator >>(istream& x, MaTran &y) {
	cout<<"Nhap vao m: ";     x>>y.m;
	cout<<"Nhap vao n: ";     x>>y.n;
	for(int i=0; i<y.m; i++) {
		for(int j=0; j<y.n; j++) {
			cout<<"\nNhap vao a["<<i<<"]["<<j<<"]: ";
			x>>y.a[i][j];
		}
	}
	return x;
}

ostream& operator <<(ostream& x, MaTran y) {
	for(int i=0; i<y.m; i++) {
		for(int j=0; j<y.n; j++) {
			x<<y.a[i][j]<<"\t";
		}
		x<<endl;
	}
	return x;
}

MaTran MaTran::operator-() {
	MaTran z;
	z.m = n;
	z.n = m;
	for(int i=0; i<m; i++) {
		for(int j=0; j<n; j++) {
			z.a[j][i] = a[i][j];
		}
	}
	return z;
}

int main() {
	MaTran a;
	MaTran b;
	cout<<"\nNhap vao ma tran a:";
	cout<<endl;
	cin>>a;
	cout<<"\nNhap vao ma tran b:";
	cout<<endl;
	cin>>b;
	cout<<"\nMa tran A: ";
	cout<<endl;
	cout<<a;
	cout<<"\nMa tran B: ";
	cout<<endl;
	cout<<b;
	cout<<"\nMa tran chuyen vi cua A: ";
	cout<<endl;
	cout<<-a;
	cout<<"\nMa tran chuyen vi cua B: ";
	cout<<endl;
	cout<<-b;
}
/*
2
2
1
2
3
4
3
3
1.1
2.2
3.3
4.4
5.5
6.6
7.7
8.8
9.9

*/
