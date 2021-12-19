// To find Eigen value of 2 by 2 matrix
//  [5,0;-1,7]
// date: 2021_Dec_20 (20-12-2021)
//

#include<stdio.h>
#include<conio.h>
#include<math.h>
int main()
{ 
    int i,j,x,b,c;
    int k,l,a[6][6];
    float d,f,e,g;
    printf("enter the value of the matrix ");
    for(i=0;i<2;i++)
    {
        for(j=0;j<2;j++)
        {
            scanf("%d",&a[i][j]);
        }
    }

printf("show the matrix ");
printf(" \n ");
for(i=0;i<2;i++)
{
    for(j=0;j<2;j++)
    {
        printf(" %d ",a[i][j]);
    }
    printf(" \n ");
}

b=(a[0][0]+a[1][1]);
c=(a[0][0]*a[1][1])-(a[0][1]*a[1][0]);

d=b+sqrt(pow(b,2)-4*c);
f=b-sqrt(pow(b,2)-4*c);
e=d/2 ;
g=f/2 ;
printf("the value of e = %f ",e);
printf("the value of g = %f ",g);
}
