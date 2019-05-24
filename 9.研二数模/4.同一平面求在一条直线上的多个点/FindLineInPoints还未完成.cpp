#include <iostream>
#include <math.h>  
//读取数据 
#include<fstream>
#include<typeinfo>
//控制小数精度 
#include <iomanip>  

using namespace std;

#define Error 1e-2	  //误差范围 
#define ROWMAX 20     //行数 
#define COLUMNMAX 3   //列数 

/************************************
**函数名称：MatrixMax(d,M[])*********
**函数功能：返回向量中的元素最大值***
************************************/
int MatrixMax(int d,int Mtr[])
{
	for (int i=1;i<d;i++)
		if (Mtr[0]<Mtr[i]) Mtr[0]=Mtr[i];
	return Mtr[0];
};

/*************************************
**函数名称：SameRowNum(i,N,Mtr[][3])**
**函数功能：返回矩阵行中与第i行相同数*
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
	double points[ROWMAX][COLUMNMAX] = { 0 };//定义一个1500*2的矩阵，用于存放数据
	ifstream infile;//定义读取文件流，相对于程序来说是in
	infile.open("points.txt");//打开文件
	for (int i = 0; i < ROWMAX; i++)//定义行循环
	{
		for (int j = 0; j < COLUMNMAX; j++)//定义列循环
		{
			//读取一个值（空格、制表符、换行隔开）就写入到矩阵中，行列不断循环进行
			//保留小数后10位 
			infile >> setprecision(10) >> points[i][j];
		}
	}
	infile.close();//读取完成之后关闭文件
	
	cout << points[3][0] <<','<<points[3][1]<< endl;//以下代码是用来验证读取到的值是否正确
	cout << points[10][0] << ',' << points[10][1] << endl;
	//运行时获知变量类型名称(对非引用类型，typeid是在编译时期识别的，只有引用类型才会在运行时识别)
	cout << typeid(points[3][0]).name()  << endl;
	
	
	
	cout << "Please input the number of points:";
	int n;//点的个数
	cin >> n;
	double Point_x[n];//点的横坐标
	double Point_y[n];//点的纵坐标
	cout<<"Please input the coordinates of points"<<endl;
	for (int i=0;i<n;i++)
	{
		cin >> Point_x[i];
		cin >> Point_y[i];
	}
    int N=n*(n-1)/2;//循环次数
    double a[N];//两点确定的直线参数a
    double b[N];//两点确定的直线参数b
    double v[N];//两点确定的直线参数v
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
    cout<<"在一条直线上最多的点的个数为："<<Max_Point<<endl;
    return 0;
}

