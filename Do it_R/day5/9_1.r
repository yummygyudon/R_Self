library(ggplot2)
library(dplyr)

#Chapter 9 _ 데이터 분석 프로젝트 : 한국인의 삶 파악

# [foreign] 패키지
# SPSS, SAS, STATA 등의 통계분석 프로그램 파일 다운로드
install.packages("foreign")

library(foreign)
library(readxl)
library(ggplot2)
library(dplyr)

#데이터 부르기
# to.data.frame = T 는 프레임 형태로 변환하는 것
raw_welfare <- read.spss(file = "Koweps_hpc10_2015_beta1.sav",
                         to.data.frame = T)

#복사본 만들기
welfare <-raw_welfare


#데이터 확인
head(welfare)
tail(welfare)
View(welfare)
#차원 확인
dim(welfare)
str(welfare)
summary(welfare)

##################################################################################
##################################################################################
데이터 분석과정

#보기 좋고 이해하기 쉽게
#rename 하기
#성별 - 생년 - 혼인 여부 - 종교 - 월급 - 직업코드 - 지역코드
welfare <- rename(welfare,
                  sex = h10_g3,
                  birth = h10_g4,
                  marrige = h10_g10,
                  religion = h10_g11,
                  income = p1002_8aq1,
                  code_job = h10_eco9,
                  code_region = h10_reg7) 

#<1># 변수 검토 단계
class(welfare$sex) # 변수 타입 확인
table(welfare$sex) # 범주별 데이터 갯수 파악


#<2># 전처리
# table()로 데이터 결측치 파악
table(welfare$sex)
table(is.na(welfare$sex))

#변수 내 숫자타입의 값들을 의미있는 이름 지어주기
welfare$sex <- ifelse(welfare$sex ==1, "male", "female")
table(welfare$sex)

#범주별 상대적 분포 확인
qplot(welfare$sex)
class(welfare$income)
table(welfare$income)
summary(welfare$income)

qplot(welfare$income)
# x가 2500까지 설정되어 있어 자세한 분포확인이 어려우니
qplot(welfare$income) + xlim(0,1000)

#범위가 무조건 1부터시작인데 Min에 0으로 나타났다.
#이는 결측치가 있다는 의미
#결측치 & 무응답(9999)를 제거해주는 작업
welfare$income <- ifelse(welfare$income %in% c(0,9999), NA, welfare$income)

#결측치와 무응답 값이 NA가 되어 TRUE같으로 변한다
table(is.na(welfare$income))

#income을 분석할 때, filter(!is.na(income)) 으로 정수값들만 사용

## 성별에 따른 월급 차이 분석 ##
sex_income <- welfare %>%
  filter(!is.na(income)) %>%
  group_by(sex) %>%
  summarise(mean_income = mean(income))

sex_income

ggplot(data = sex_income, aes(x = sex, y = mean_income)) + geom_col()
