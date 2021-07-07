library(ggplot2)
library(dplyr)

#Chapter 9 _ ������ �м� ������Ʈ : �ѱ����� �� �ľ�

# [foreign] ��Ű��
# SPSS, SAS, STATA ���� ���м� ���α׷� ���� �ٿ�ε�
install.packages("foreign")

library(foreign)
library(readxl)
library(ggplot2)
library(dplyr)

#������ �θ���
# to.data.frame = T �� ������ ���·� ��ȯ�ϴ� ��
raw_welfare <- read.spss(file = "Koweps_hpc10_2015_beta1.sav",
                         to.data.frame = T)

#���纻 �����
welfare <-raw_welfare


#������ Ȯ��
head(welfare)
tail(welfare)
View(welfare)
#���� Ȯ��
dim(welfare)
str(welfare)
summary(welfare)

##################################################################################
##################################################################################
������ �м�����

#���� ���� �����ϱ� ����
#rename �ϱ�
#���� - ���� - ȥ�� ���� - ���� - ���� - �����ڵ� - �����ڵ�
welfare <- rename(welfare,
                  sex = h10_g3,
                  birth = h10_g4,
                  marrige = h10_g10,
                  religion = h10_g11,
                  income = p1002_8aq1,
                  code_job = h10_eco9,
                  code_region = h10_reg7) 

#<1># ���� ���� �ܰ�
class(welfare$sex) # ���� Ÿ�� Ȯ��
table(welfare$sex) # ���ֺ� ������ ���� �ľ�


#<2># ��ó��
# table()�� ������ ����ġ �ľ�
table(welfare$sex)
table(is.na(welfare$sex))

#���� �� ����Ÿ���� ������ �ǹ��ִ� �̸� �����ֱ�
welfare$sex <- ifelse(welfare$sex ==1, "male", "female")
table(welfare$sex)

#���ֺ� ����� ���� Ȯ��
qplot(welfare$sex)
class(welfare$income)
table(welfare$income)
summary(welfare$income)

qplot(welfare$income)
# x�� 2500���� �����Ǿ� �־� �ڼ��� ����Ȯ���� ������
qplot(welfare$income) + xlim(0,1000)

#������ ������ 1���ͽ����ε� Min�� 0���� ��Ÿ����.
#�̴� ����ġ�� �ִٴ� �ǹ�
#����ġ & ������(9999)�� �������ִ� �۾�
welfare$income <- ifelse(welfare$income %in% c(0,9999), NA, welfare$income)

#����ġ�� ������ ���� NA�� �Ǿ� TRUE������ ���Ѵ�
table(is.na(welfare$income))

#income�� �м��� ��, filter(!is.na(income)) ���� �������鸸 ���

## ������ ���� ���� ���� �м� ##
sex_income <- welfare %>%
  filter(!is.na(income)) %>%
  group_by(sex) %>%
  summarise(mean_income = mean(income))

sex_income

ggplot(data = sex_income, aes(x = sex, y = mean_income)) + geom_col()
