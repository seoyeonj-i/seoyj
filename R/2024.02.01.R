#2024.02.01 ctrl+enter

#변수 생성
a<-10
print(a)
b="test"
print(b)
TRUE->c #화살표는 반대로 표시해도 상관없음
print(c)

#벡터형태데이터생성
#c()함수를 이용하여 생성
#일반적인 변수에는 데이터가 1개 대입
#벡터데이터로 여러개의 데이터를 하나의 변수에 대입
#문자입력시 큰따옴표, 작은따옴표 상관없음
d<-c(1,2,3,4,5)
e<-c('test','test2','test3')
print(d)
print(e)
f<-1:10

print(d[1])
#d 변수의 첫번째 데이터 출력
print(e[1])
# R은 1부터 시작 다른 프로그램(파이썬...)은 0부터 시작

#행렬형태데이터생성
#2차원데이터
#크기(1:20)와 범위(dim=c(4,5))지정 => 1~20까지 스무개의 데이터 행4,열5
arr_x = array(1:20, dim=c(4,5))
print(arr_x)
arr_y = array(1:20, dim=c(4,4)) # 16까지만 출력
print(arr_y)
arr_z = array(1:20, dim=c(4,6)) #구간 반복
print(arr_z)

# 리스트형태데이터생성
# 벡터 데이터에서 index(위치) 값 대신에 key값을 지정
# 벡터 데이터에서 순서대로 데이터를 나열해야되는 데이터
# 리스트 데이터는 순서와 상관없이 key값을 기준으로 데이터 출력가능

list_a=list(name='test',age=20, phone='01012345678')
print(list_a)
print(list_a['name'])
print(list_a['age'])
print(list_a['phone'])
# b=c('test',20,'01012345678')과 같은 형태
# print(b[1]) 출력해보면 결과 값 같음을 확인할 수있음

# 데이터프레임형태데이터생성
# 2차원 데이터를 생성하는 과정
# 인덱스와 컬럼을 기준으로 데이터를 생성
# 콤마 빼먹지 않도록 주의해서 잘 쓸것!!!
df=data.frame(
  name=c('test','test2','test3'),
  age=c(20,30,40),
  phone=c('01011112222','01022223333','01033334444')
)
# 각 변수의 데이터 개수는 같아야함
print(df)

# 벡터의개수 다르게 데이터 프레임을 생성=> 백터데이터의 개수가 다르면 에러발생
df2=data.frame(
  name=c('test','test2','test3'),
  age=c(20,30)
)

# 연산자
# (1)산술연산자
x<-10
y<-3
print(x+y)
print(x-y)
# 결과 값 저장
x-y->result
print(x*y)
print(x/y)
print(x^y)
print(x %% y)
print(x%/% y)

# (2) 비교연산자
# 두개의 데이터를 비교하여 결과 값은 논리값(참/거짓)으로 출력
z<-5
print(x==y) # 두 변수의 데이터값이 같냐?
print(y!=z) # 두 변수의 데이터값이 다르냐?
print(x>y)
print(x<z)

# 세미콜론(;) 사용시 한줄에 입력 가능
a=1; b=2

# 논리연산자
# 부정연산자(!)
print(!TRUE)

# and 연산자 : 두개의 논리값이 모두 참인 경우에만 true 출력 그외의 경우 모두 false
print(TRUE&TRUE)
print(TRUE&FALSE)

# or 연산자 : 두개의 논리값 중 하나만 참이어도 true 출력 두개의 논리값이 모두 거짓인 경우에만 false 출력
print(TRUE|TRUE)
print(TRUE|FALSE)
print(FALSE|FALSE)

# 조건문(if문)
x<-3
if(x>5){
  print('x는 5보다 크다')
}
# 해당하는 식이 거짓기때문에 실행을 하지않음(결과도출x)

# if~else문
# if 조건식이 참인경우 실행할 코드와 else문에서 조건식이 거짓인경우 실행할 코드를 작성
if(x>5){
  print('x는 5보다 크다')
} else{
  print('x는 5보다 작거나 같다')
}

# 조건이 여러개인 조건문 생성
score<-78
if(score>=90){
  # score가 90점 이상인경우
  print('A')
} else if (score>=80){
  # score가 90점 미만이고 80점 이상인 경우
  print('B')
} else if(score>=70){
  # score가 80점 미만이고 70점 이상인 경우
  print('c')
} else{
  # score가 70점 미만인 경우
  print('f')
}

# ctrl+c 강제종료 => 코드 처음부터 다시 실행

# 만약 g값이 존재한다면 test를 출력
# 0은 false를 의미(출력x)
g<-1
if (g){
  print("test")
}

# if 조건식에 조건식이 2개 이상인 경우
id<-'test'
pass<-'1234'

# id와 passwoerd 두개다 다 일치하면 로그인 성공/ 아니면 실패 출력하기
if(id=="test" & pass=="1234"){
  print('로그인성공')
} else{
  print('로그인실패')
}

# which문
# 벡터데이터에서 조건식이 일치하는 데이터의 위치값을 출력
name<-c('test','test2','test3')

which(name=='test2')

# 벡터데이터에서 조건식이 불일치하는 데이터의 위치값 출력
which(name!='test2')

# 벡터데이터에서 값이 없는 데이터의 위치값 출력
which(name=='test5')

# if문으로 같은 결과 출력해보기
if (name[1]=='test2'){
  print(1)
}
if (name[2]=='test2'){
  print(2)
}
if (name[3]=='test2'){
  print[3]
}

# 반복문(for문,while문)
# for뭄 : 길이가 지정되어있는 형태일때 사용
# while문: 길이가 지정되어있지않은 형태일때 사용, 반복횟수가 정해져있지않는경우 사용

# for문
# 벡터데이터의 원소의 개수 만큼 반복 실행하는 구문
array_a=1:10
for(i in array_a){
  print(i)
}
# print 총 10번 실행 후 i라는 변수가 만들어짐

# L이 의미하는 것 => 정수(Long)

# 1부터 10까지의 합계 출력
# 초기 합계데이터를 0으로 지정
result<-0
# 1부터 10까지 반복하는 반복문 생성
for (i in array_a){
  result=result+i
}
print(result)

# while문
# 초기 시작값을 지정하고 해당하는 값을 반복 실행할때마다 증감시킴
# 조건식이 거짓이 될 때까지 반복 실행
i=1
while (i<=10){
  print(i)
  i=i+1
}

# while문을 이용하여 1부터 10까지의 합계 출력
i=1
# 합계 초기값 0을 대입
result=0
while(i<=10){
  #i의 값을 resulr에 누적합
  result=result+i
  i=i+1
}
print(result)

# 반복문을 이용한 구구단 생성
# 2부터 9까지 반복을 하는 반복문 생성
array_a=2:9
array_b=1:9

for (i in array_a){
  # print(i) 값확인 후 주석처리
  # i값이 2부터 9일때 1부터 9까지 반복을 하는 반복문생성
  for(j in array_b){
    print(i*j)
  }
}

# 반복문 문제
# 2개의 주사위를 굴려서 두 주사위의 합이 5의 배수인 경우의 수 출력
# 1부터 6까지 반복을 하는 반복문 생성
for(i in 1:6){
  for(j in 1:6){
    if((i+j)%%5==0){
      count<-count+1
      cat("첫번째주사위:",i,"두번째주사위:",j)
    }
  }
}
cat("두 주사위의 합이 5의 배수인 경우의수",count)

# break문
# 반복문을 강제로 종료
for(i in 1:100){
  if (i>3){
    break
  }
  print(i)
}

# 1부터 100까지의 누적합중에 누적합의 값이 200이 넘어가는 부분의 숫자몇?
# 합계는 몇?
result=0
for(i in 1:100){
  result=result+i
  if(result>=2000){
    break
  }
}
print(c(i,result))

# 1부터 1씩 증가시킨 데이터를 누적합을 하는 도중 누적합이 50000이 넘어가는 
# 최초의 순간은 언제인가?
i=1
result=0
while (TRUE){
  result=result+i
  if(result>=50000){
    break
  }
  i=i+1
}
print(c(i,result))

# 1부터 100까지 숫자 중 짝수의 누적합 출력
# 합계라는 초기값을 0을 대입해서 생성
res=0
# 1부터 100까지 반복을 하는 반복문 생성
for(i in 1:100){
  # 짝수인 경우 조건문 생성
  if(i%%2==0){
  # 조건식이 참인 경우 누적합 실행
    res=res+i
  }
}
print(res)

# 다른방법
res=0
for (i in 1:50){
  res=res+(i*2)
}
print(result)

# while 구문 이용한 다른 방법
i=1
result=0
while(TRUE){
  if (i>100){
    break
  }
  if (i%%2==0){
    result=result+i
  }
i=i+1
}
print(result)

# 다른방법(짝수)
i=2
result=0
while (TRUE){
  if(i>100){
    break
  }
  result=result+i
  i=i+2
}
print(result)

# 다른방법(홀수)
i=1
result=0
while (TRUE){
  if(i>100){
    break
  }
  result=result+i
  i=i+2
}
print(result)

# 비순서형 벡터 데이터를 이용한 for 문
array_a=c('kim','park','lee')
for (i in array_a){
  print(i)
}
i<-1
while (i<=3){
  print(array_a[i])
  i=i+1
}

# next문 : 반복문으로 되돌아간다. 다음으로 넘어간다.
for (i in 1:10){
  if (i<5){
    next
  }
  print(i)
}

#next문 이용해서 짝수 합계
result=0
for(i in 1:100){
  if(i %% 2==1){
    next
  }
  result=result+i
}
print(result)