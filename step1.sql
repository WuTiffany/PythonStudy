-- 作业1创建3张表如下

-- 创建一个名为university的数据库
create database university;

-- 使用创建的数据库
use university;

-- 创建一张名为department的表，且主键为dept_name,属性类型为变长字符串类型；表中还有属性类型为int的building和为varchar类型的budget;
-- 该表被后面创的student表所参照
CREATE TABLE `university`.`department` (
  `dept_name` VARCHAR(100) NOT NULL,
  `building` INT NULL,
  `budget` VARCHAR(45) NULL,
  PRIMARY KEY (`dept_name`));

-- 再创建一张名为student的表，主键是ID，外码是dept_name,参照表是上面创的department表
CREATE TABLE `university`.`student` (
  `ID` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `sex` VARCHAR(45) NULL,
  `age` INT NULL,
  `emotion-state` VARCHAR(45) NULL,
  `dept_name` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`),
  INDEX `dept_name_idx` (`dept_name` ASC),
  CONSTRAINT `dept_name`
    FOREIGN KEY (`dept_name`)
    REFERENCES `university`.`department` (`dept_name`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

-- 接着创建一张名为exam的表，它的参考表是student表，exam表的主码是student_ID和exam_name,外码是student_ID
CREATE TABLE `university`.`exam` (
  `student_ID` INT NOT NULL,
  `exam_name` VARCHAR(45) NOT NULL,
  `grade` INT NULL,
  PRIMARY KEY (`student_ID`, `exam_name`),
  CONSTRAINT `student-ID`
    FOREIGN KEY (`student_ID`)
    REFERENCES `university`.`student` (`ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

 -- 修改building的数据类型
 alter table department modify building varchar(100);
