#include <iostream>
#include <math.h>  
//��ȡ���� 
#include<fstream>
#include<typeinfo>
//����С������ 
#include <iomanip>  

using namespace std;

#define Error 1e-2	  //��Χ 
#define ROWMAX 20     //���� 
#define COLUMNMAX 3   //���� 

/************************************
**�������ƣ�MatrixMax(d,M[])*********
**�������ܣ����������е�Ԫ�����ֵ***
************************************/
int MatrixMax(int d,int Mtr[])
{
	for (int i=1;i<d;i++)
		if (Mtr[0]<Mtr[i]) Mtr[0]=Mtr[i];
	return Mtr[0];
};

/*************************************
**�������ƣ�SameRowNum(i,N,Mtr[][3])**
**�������ܣ����ؾ����������i����ͬ��*
*************************************/
int SameColNum(int i,int N,double Mt[][3])
{
	int sum=0;
	for(int j=0;j<N;j++)
	if (Mt[i][0]==Mt[j][0]&&Mt[i][1]==Mt[j][1]&&Mt[i][2]==Mt[j][2])	sum++;
	return sum;
};

int main()
{
	double points[ROWMAX][COLUMNMAX] = { 0 };//����һ��1500*2�ľ������ڴ������
	ifstream infile;//�����ȡ�ļ���������ڳ�����˵��in
	infile.open("points.txt");//���ļ�
	for (int i = 0; i < ROWMAX; i++)//������ѭ��
	{
		for (int j = 0; j < COLUMNMAX; j++)//������ѭ��
		{
			//��ȡһ��ֵ���ո��Ʊ�������и�������д�뵽�����У����в���ѭ������
			//����С����10λ 
			infile >> setprecision(10) >> points[i][j];
		}
	}
	infile.close();//��ȡ���֮��ر��ļ�
	
	cout << points[3][0] <<','<<points[3][1]<< endl;//���´�����������֤��ȡ����ֵ�Ƿ���ȷ
	cout << points[10][0] << ',' << points[10][1] << endl;
	//����ʱ��֪������������(�Է��������ͣ�typeid���ڱ���ʱ��ʶ��ģ�ֻ���������ͲŻ�������ʱʶ��)
	cout << typeid(points[3][0]).name()  << endl;
	
	
	
	cout << "Please input the number of points:";
	int n;//��ĸ���
	cin >> n;
	double Point_x[n];//��ĺ�����
	double Point_y[n];//���������
	cout<<"Please input the coordinates of points"<<endl;
	for (int i=0;i<n;i++)
	{
		cin >> Point_x[i];
		cin >> Point_y[i];
	}
    int N=n*(n-1)/2;//ѭ������
    double a[N];//����ȷ����ֱ�߲���a
    double b[N];//����ȷ����ֱ�߲���b
    double v[N];//����ȷ����ֱ�߲���v
    int k=0;
    for (int i=0;i<n-1;i++)
		for (int j=i+1;j<n;j++)
		{
			if (Point_x[j]==Point_x[i])
			{
				a[k]=Point_x[i];
				b[k]=0;
				v[k]=1;
			}
			else
			{
				a[k]=(Point_y[j]-Point_y[i])/(Point_x[j]-Point_x[i]);
				b[k]=(Point_x[j]*Point_y[i]-Point_x[i]*Point_y[j])/(Point_x[j]-Point_x[i]);
				v[k]=0;
			}
			k++;
		};
/*	cout<<"[a;b;v]'="<<endl;
    for (int k=0;k<N;k++)
	{
		cout<<a[k]<<b[k]<<v[k]<<endl;
	};*/
	double M[N][3];
	for (int i=0;i<N;i++)
	{
		M[i][0]=a[i];
		M[i][1]=b[i];
		M[i][2]=v[i];
	};
	int Sum=0;
	int K[N];
	for (int i=0;i<N;i++)
	{
		K[i]=SameColNum(i,N,M);
	};
	Sum=MatrixMax(N,K);
	int Max_Point=(1+sqrt(1+8*Sum))/2;
    cout<<"��һ��ֱ�������ĵ�ĸ���Ϊ��"<<Max_Point<<endl;
    return 0;
}

