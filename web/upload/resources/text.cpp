#include<stdio.h>

int main(){
	int a,b,c;
	while(true) {
	printf("�����������ε������ߣ�"); 
	//scanf("%d%d%d",&a,&b,&c);
	int x,y,z;
	x=scanf("%d",&a);
	y=scanf("%d",&b);
	z=scanf("%d",&c);
	if(!x||!y||!z||a<0||b<0|c<0){
		printf("����ı��������ַ���Ϊ������\n");
		printf("����������->\n");
		fflush(stdin);
		
	}else{
	
	if(a+b>c&&a+c>b&&b+c>a){
		if(a==b&&a==c&&b==c){
			printf("����һ���ȱ������Σ�");
		}else if(a==b||a==c||b==c){
			printf("����һ�����������Σ�");
		}else if(a*a+b*b==c*c||a*a+c*c==b*b||c*c+b*b==a*a){
			printf("����һ��ֱ�������Σ�");
		}else{
			printf("����һ����ͨ�����Σ�");
		}
	}else{
		printf("�ⲻ�������Σ�");
	} 
	printf("\n");
}
}

	return 0;
}
