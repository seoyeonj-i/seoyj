# 패키지 설치
install.packages('dplyr')

# 패키지 로드
library(dplyr)

# 파일의 경로
# 1) 절대경로: 절대적인 주소값, 환경이 변하더라도 같은 위치를 지정
# ex) c:/users/admin/document/a.txt, http://www.google.com
# 2) 상대경로: 상대적인 주소값, 환경이 변함에 따라 위치도 변화
# ./ : 현재 작업중인 디렉토리(워킹 디렉토리)
# ../ : 현재 디렉토리에서 상위 디렉토리 이동
# 폴더명/ : 하위 디렉토리(폴더명)로 이동

# 외부의 데이터 파일 로드
# csv 파일 로드 -> read.csv(파일의 경로)

# 상대경로 사용
# 현재 디렉토리에서 상위 디렉토리 이동(../)
# csv 라는 하위 디렉토리 이동(csv/)
# example.csv(example.csv)
df <- read.csv('../csv/example.csv')
df
# 절대경로 사용
df2 <- read.csv("C:/UBION RPHY/csv/example.csv")
df2

# 파이프 연산자(%>%): ctrl+shift+m 단축키 사용
# 왼쪽에있는 데이터를 오른쪽의 함수에 대입한다(두개의 데이터 연결)
# head(데이터프레임명, 개수): 데이터프레임 상위 n개를 출력
head(df,3)
df %>% head(3)

# 인덱스의 조건식으로 필터링
# filter(조건식)
df %>% filter(Gender=='male')

# base 함수로 필터링
# 조건식 생성
df$Gender=='male'->flag
df[flag, ]

# 특정 컬럼의 데이터만 출력
# 패키지 사용
df %>% select('Name','Phone')
df %>% select(-Gender) # 젠더 컬럼 제외한 나머지 컬럼 모두 보겠다

# base
df[c('Name','Phone')]

# 성별이 남자인 데이터 중 이름과 휴대폰 번호만 출력
# 패키지 사용
df %>% 
  filter(Gender=='male') %>% 
  select(Name,Phone)

# base
df$Gender=='male'->flag
df[flag, c('Name','Phone')]

exam<-read.csv("../csv/csv_exam.csv")
exam

# 차순 정렬 변경(오름차순/내림차순)
# 수학 성적을 기준으로 오름차순 정렬
exam %>% arrange(math)

# 수학성적을 기준으로 내림차순 정렬
exam %>% arrange(desc(math))
exam %>% arrange(-math)

# base(오름차순)
order(exam$math)->flag2
exam[flag2,]

# base(내림차순)
order(exam$math, decreasing = TRUE)->flag3
exam[flag3,]

# 정렬방식의 조건이 2개 이상인 경우
# 학년별로 내림차순 정렬->수학성적은 오름차순 정렬
exam %>% 
  arrange(desc(class),math)

# 그룹화 연산
# class별 수학, 과학, 영어의 평균 점수를 출력
exam %>% 
  group_by(class) %>% 
  summarise(
    mean_math=mean(math),
    mean_english=mean(english),
    mean_science=mean(science)
  )

# 데이터프레임의 결합
# 행을 결합->유니언결합
# 열을 결합->조인결합

# 유니언결합(단순한 행 결합)
df_1<-data.frame(
  id=1:5,
  score=c(70,80,65,80,90)
)
df_2<-data.frame(
  id=3:6,
  weight=c(60,50,70,80)
)

# 행 결합 함수 rbind(): 데이터 프레임의 구조가 같은 데이터만 결합
rbind(df_1,df_2) # 에러발생(데이터의 구조가 다르기 때문)

df_3<-data.frame(
  id=3:8,
  score=c(50,70,80,70,90,50)
)

rbind(df_1,df_3)

# bind_rows() : 데이터의 구조와 상관없이 테이터를 결합
bind_rows(df_1, df_2)

# 조인결합
# 특정한 조건이 참인경우 컬럼의 데이터를 추가
df_4<-data.frame(
  id=c('test','test2','test3','test4'),
  item=c('A','B','B','D')
)
df_5<-data.frame(
  item=c('A','B','C'),
  price=c('1000','2000','3000')
)

# inner_join(): 두 개의 데이터프레임에서 모두 가진 데이터만 결합하여 출력
inner_join(df_4,df_5,by='item')

# left_join(): 왼쪽 데이터프레임을 기준으로 결합
left_join(df_4, df_5, by='item')

right_join(df_4,df_5, by='item')
full_join(df_4,df_5,by='item')

install.packages('ggplot2')
library(ggplot2)

# ggplot2 패키지 안에 샘플데이터 로드
midwest<-ggplot2::midwest

head(midwest,3)
str(midwest)

# 데이터프레임을 뷰어창에서 확인
View(midwest)

# 컬럼의 이름을 변경
# rename(데이터프레임명, 새컬럼명=변경할컬럼명)
# popasian 컬럼을 asian
# poptotal컬럼을 total로 변경
rename(midwest, asian=popasian)->midwest
rename(midwest, total=poptotal)->midwest

# 복사본 생성
# midwest에서 country, asian, total 데이터만 추출하여 저장
midwest[c('county','asian','total')]

midwest %>% 
  select(county,asian,total)->df

# 전체 인구수 대비 아시안 인구비율이라는 컬럼 생성
# 컬럼의 이름은 ratio
# (아시아인구수/전체인구수)*100=ratio

# 벡터 데이터를 이용하여 아시아 인구비율을 생성
(midwest$asian/midwest$total) * 100->ratio

bind_cols(df,ratio=ratio)
cbind(df,ratio)
data.frame(df,ratio)
midwest$ratio<-ratio
head(df,1)

# 패키지 이용해서 파생변수 추가
df2<-midwest[c('county','asian','total')]
# mutate(): 파생변수 생성 함수
df2 %>% 
  mutate(ratio=(asian/total)*100)

# 히스토그램
# hist(벡터데이터)
hist(df$ratio)

# 전체 ratio의 평균 값을 출력
mean(df$ratio)->mean_ratio

# mean_ratio와 ratio 데이터를 비교하여 평균값보다 높은 경우 large
# 평균값 이하인 경우 small
# group 컬럼명에 데이터를 추가
ifelse(mean_ratio>midwest$ratio,'large','small')->group_data
midwest$group=group

# 패키지 이용하여 컬럼 추가
df %>% 
  mutate(group=ifelse(
    midwest$ratio>mean_ratio,
    'large',
    'small'
    )
)->df

midwest$ratio
mean_ratio

# midwest 데이터에서 데이터 정제
# 컬럼의 이름을 변경
# popadult 컬럼을 adults로 변경
# poptotal 컬럼을 total로 변경
# county, adult, total 컬럼만 따로 추출하여 변수에 저장
# 전체 인구수 대비 미성년자의 인구 비율 컬럼(child_ratio) 생성
#  1. 성인의 인구수와 전체 인구수가 존재하고 미성년 인구수가 존재
#  2. 미성년자의 인구수 컬럼을 생성(total-adult)
#  3. 미성년자의 인구수/총인구수 *100
# child_ratio가 가장 높은 상위 5개의 지역을 출력
midwest<-ggplot2::midwest
rename(midwest, adults=popadults)->midwest
rename(midwest, total=poptotal)->midwest
df6<-midwest[c('county','adults','total')]
df6 %>% 
  mutate(child_ratio=(total-adults)/total*100)->df6
df6 %>% arrange(desc(child_ratio))->df6
df6
head(df6,5)
# df6 %>% head(5) 로도 사용가능

# [정답] base
# 컬럼의 이름 변경
# rename(midwest,adult=popadults)->midwest
# rename(midwest,total=poptotal)->midwest
# county, adult, total 컬럼만 따로 추출하여 변수에 저장
# df<-midwest[c('county','adults','total')]
# child 컬럼을 추가하여 total-adult 데이터를 추가
# df$total-df$adult->df$child
# child_ratio 컬럼을 추가하여 child/total*100 데이터 추가
# (df$child/df$total)*100->df$child_ratio
# child_ratio 높은 상위 5개의 지역 출력
# child_ratio 기준으로 내림차순 정렬 후 상위 5개 지역 출력-> 데이터 프레임에 상위 5개의 데이터 출력
# order(df$child_ratio, decreasing=true)->flag
# df[flag,]->df
# 상위 5개의 데이터를 출력
#head(df,5)

# [정답] 파이프 %>%  이용
# midwest<-ggplot2::midwest
#midwest %>%
#  rename(adulr=popadults, total=poptotal) %>%
#  select(county, adult, total) %>% 
#  mutate(child=total-adult,
#         child_ratio=child/total*100) %>% 
#  arrange(desc(child_ratio)) %>% head(5)

# 데이터 시각화
# 그래프 표현
# 레이어를 하나씩 추가하여 그래프를 완성
# 배경 레이어 생성
ggplot(
  data=mpg,
  aes(
    x=displ,
    y= 고속도로
    )
  )+geom_point()

# 막대 그래프
mpg %>% 
  group_by(구동방식) %>% 
  summarise(
    평균연비=mean(
      고속도로,na.rm=T))->group_data

ggplot(
  data=group_data,
  aes(
    x=구동방식,
    y=평균연비
  )
)+geom_col()

ggplot(
  data=mpg,
  aes(
    x=구동방식
  )
)+geom_bar()

# 제조년도별 차량의 개수 라인 그래프
table(mpg$year)
mpg %>%
  group_by(year) %>% 
  summarise(count=n())->group_data2

ggplot(
  data=group_data2,
  aes(
    x=year,
    y=count
  )
)+geom_line()

ggplot(
  data=economics,
  aes(
    x=date,
    y=unemploy
  )
)+geom_line()
View(economics)

mpg<-ggplot2::mpg
boxplot(mpg$hwy)
ggplot(
  data=mpg,
  aes(
    x=drv,
    y=hwy
  )
)+geom_boxplot()

# sav 파일을 로드
# foreign 라이브러리 설치
install.packages('foreign')
library(foreign)

welfare<-read.spss("../csv/koweps.sav",
        to.data.frame = T)
str(welfare)

# 컬럼의 이름을 변경
welfare %>% 
  rename(
    gender=h10_g3,
    birth=h10_g4,
    income=p1002_8aq1,
    code_job=h10_eco9
  )->welfare
# 특정 컬럼만 추출
welfare_copy<-welfare[c(
  'gender','birth','income','code_job'
)]
# 결측치의 개수 확인
table(is.na(welfare_copy))
table(is.na(welfare_copy$gender))
table(is.na(welfare_copy$birth))
table(is.na(welfare_copy$income))
table(is.na(welfare_copy$code_job))

# 성별 데이터에서 이상치 존재 유무 확인
table(welfare_copy$gender)
# gender 컬럼의 데이터가 1이면 'male' 1이 아니라면 'female'
ifelse(
  welfare_copy$gender==1,
  'male',
  'female'
)->welfare_copy$gender
table(welfare_copy$gender)

# income 컬럼의 데이터가0, 9999라면 NA 변환
# CASE1
welfare_copy$income>0&welfare_copy$income<9999->flag
ifelse(
  flag,
  welfare_copy$income,
  NA
)

#CASE2
welfare_copy$income==0|welfare_copy$income==9999->flag2
ifelse(
  flag2,
  NA,
  welfare_copy$income
)

# CASE3
# income이 (0,9999)안에 포함되어있으면
welfare_copy$income %in% c(0,9999)->flag3
ifelse(
  flag3,
  NA,
  welfare_copy$income
  
)-> welfare_copy$income

# 성별을 기준으로 평균 임금의 차이가 존재하는지
# filter(): income이 결측치인 데이터를 제거
# select(): gender, income 컬럼만 따로 추출
# group_by(): gender를 기준으로 그룹화
# summarise(): income의 평균 값을 그룹연산
welfare_copy %>% 
  filter(!is.na(income)) %>% 
  select(gender,income) %>% 
  group_by(gender) %>% 
  summarise(mean_income=mean(income))->gender_data
ggplot(
  data=gender_data,
  aes(
    x=gender,
    y=mean_income
  )
)+geom_col()
View(welfare_copy)
# 나이에 따른 임금의 차이가 어느 정도인가?
# 나이(age) 컬럼을 생성
# 데이터의 기준년도(2015)-birth
# welfare_copy에 저장
# income이 결측치인 데이터를 제거
# age, income만 추출
# age를 기준으로 그룹화
# 평균 임금 그룹화 연산
# 바형 그래프로 표시
welfare_copy %>% 
  mutate(age=2015-birth)

2015-welfare_copy$birth->welfare_copy$age

welfare_copy %>% 
  filter(!is.na(income)) %>% 
  select(age,income) %>% 
  group_by(age) %>% 
  summarise(mean_income=mean(income))-> age_data

ggplot(
  data=age_data,
  aes(
    x=age,
    y=mean_income
  )
)+geom_col()

# 평균 임금이 높은 상위 5개를 출력
age_data %>% 
  arrange(desc(mean_income)) %>% 
  head(5)

# 연령대별 평균임금
# 연령대(ageg) 컬럼을 추가
# 나이가 40이면 young
# 나이가 40이상 60미만이라면 middle
# 나이가 60이상이라면 old
# ageg, income 컬럼을 따로 추출
# ageg을 기준으로 그룹화
# 평균 임금을 그룹화 연산(결측치 제외)
# 바형 그래프로 표시
ifelse(
  welfare_copy$age<40,
  'young',
  ifelse(
    welfare_copy$age<60,
    'middle',
    'old'
  )
)

welfare_copy %>% 
  mutate(
    ageg=ifelse(
      age<40, 'young',
      ifelse(
        age<60,'middle','old'
      )
    )
  ) %>% 
  select(ageg,income) %>% 
  group_by(ageg) %>% 
  summarise(
    mean_income=mean(income,na.rm=T)
  )->ageg_data

# 바형 그래프로 표시(x축의 순서를 커스텀)
ggplot(
  data=ageg_data,
  aes(
    x=ageg,
    y=mean_income
  )
)+geom_col()+scale_x_discrete(
  limits=c('young','middle','old')
)

# excel 파일을 로드 사용할 패키지를 설치
install.packages('readxl')
library(readxl)

read_excel("../csv/koweps_codebook.xlsx")

read_excel(
  "../csv/koweps_codebook.xlsx",sheet=2
)->code_book

# join 결합
# welfare_copy, code_book->기준이 컬럼(code_job)
left_join_data<-left_join(
  welfare_copy,
  code_book,
  by='code_job'
)
str(left_join_data)
inner_join_data<-inner_join(
  welfare_copy,
  code_book,
  by='code_job'
)
str(inner_join_data)

welfare_copy %>% 
  filter(!is.na(code_job)&is.na(income))

# 직업별 평균 임금이 높은 상위 5개
head(left_join_data,1)
left_join_data %>% 
  filter(!is.na(income)) %>% 
  select(job,income) %>% 
  group_by(job) %>%
  summarise(mean_income=mean(income)) %>% 
  arrange(-mean_income) %>% 
  head(5)

# 남성을 기준으로
left_join_data %>% 
  filter(!is.na(income)&gender=='male') %>% 
  select(job,income) %>%
  group_by(job) %>% 
  summarise(mean_income=mean(income)) %>% 
  arrange(desc(mean_income)) %>% 
  head(5)

# 여성을 기준으로
left_join_data %>% 
  filter(!is.na(income)&gender=='female') %>% 
  select(job,income) %>%
  group_by(job) %>% 
  summarise(mean_income=mean(income)) %>% 
  arrange(desc(mean_income)) %>% 
  head(5)

# income 데이터의 결측치를 0으로 대체
ifelse(
  is.na(left_join_data$income),
  0,
  left_join_data$income
)->left_join_data$income

left_join_data %>% 
  filter(gender=='female'&!is.na(job)) %>% 
  select(job, income) %>% 
  group_by(job) %>% 
  summarise(mean_income=mean(income)) %>% 
  arrange(-mean_income) %>% 
  head(5)
