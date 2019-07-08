#include<stdio.h>

int main(){
	int a,b,c;
	while(true) {
	printf("请输入三角形的三条边："); 
	//scanf("%d%d%d",&a,&b,&c);
	int x,y,z;
	x=scanf("%d",&a);
	y=scanf("%d",&b);
	z=scanf("%d",&c);
	if(!x||!y||!z||a<0||b<0|c<0){
		printf("输入的变量中有字符或为负数！\n");
		printf("请重新输入->\n");
		fflush(stdin);
		
	}else{
	
	if(a+b>c&&a+c>b&&b+c>a){
		if(a==b&&a==c&&b==c){
			printf("这是一个等边三角形！");
		}else if(a==b||a==c||b==c){
			printf("这是一个等腰三角形！");
		}else if(a*a+b*b==c*c||a*a+c*c==b*b||c*c+b*b==a*a){
			printf("这是一个直角三角形！");
		}else{
			printf("这是一个普通三角形！");
		}
	}else{
		printf("这不是三角形！");
	} 
	printf("\n");
}
}

	return 0;
}
