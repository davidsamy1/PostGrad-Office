insert into PostGradUser (email,passwordd) values ('Admin123@gmail.com','qwer0123')
insert into PostGradUser (email,passwordd) values ('kahled.ahmed@student.guc.edu.eg','qwer0124')
insert into PostGradUser (email,passwordd) values ('adel.mohamed@student.guc.edu.eg','qwer0125') 
insert into PostGradUser (email,passwordd) values ('ahmed.sief@student.guc.edu.eg','qwer0126')
insert into PostGradUser (email,passwordd) values ('adham.ammar@student.guc.edu.eg','qwer0127')
insert into PostGradUser (email,passwordd) values ('saeed.ahmed@student.guc.edu.eg','qwer0128') 
insert into PostGradUser (email,passwordd) values ('mahmoud.ayad@student.guc.edu.eg','qwer0129')
insert into PostGradUser (email,passwordd) values ('adham.kareem@hotmail.com','qwer01210')
insert into PostGradUser (email,passwordd) values ('hussien.tamer@hotmail.com','qwer01211')
insert into PostGradUser (email,passwordd) values ('yasser.hamdy@hotmail.com','qwer01212')
insert into PostGradUser (email,passwordd) values ('ahmed.hegazy@guc.edu.eg','qwer01213')
insert into PostGradUser (email,passwordd) values ('mohamed.hazem@guc.edu.eg','qwer01214')  
insert into PostGradUser (email,passwordd) values ('zeyad.omar@guc.edu.eg','qwer01215')

insert into Admin (id) values(1)

insert into GUCianstudent values (2,'Khaled','ahmed','PHD','Engineering','dokki',0.73,3123)
insert into GUCianstudent values (3,'adel','mohamed','PHD','Pharmacy','giza',0.8,1093)
insert into GUCianstudent values (4,'ahmed','seif','Master','Engineering','manial',1.3,15672)
insert into GUCianstudent values (5,'adham','ammar','Master','Mangement','rehab',1.05,1235)
insert into GUCianstudent values (6,'saeed','ahmed','Master','Law','maadi',1.1,6789)
insert into GUCianstudent values (7,'mahmoud','ayad','Master','Applied Arts','new cairo',1.2,12039)

insert into NONGUCIANstudent values (8,'adam','kareem','PHD','Engineering','6th october',4.0)
insert into NONGUCIANstudent values	(9,'hussien','tamer','Master','Pharmacy','rehab',3.8)
insert into NONGUCIANstudent values	(10,'yasser','hamdy','Master','Law','5th settelement',3.7)

insert into supervisor(id,namee,faculty) values (11,'ahmed hegazy','Engineering')
insert into supervisor(id,namee,faculty) values (12,'mohamed hazem','Applied Arts')
insert into supervisor(id,namee,faculty) values (13,'zeyad omar','Mangement')

select * from PostGradUser
select * from GUCianstudent
select * from NONGUCIANstudent
select * from supervisor
select * from PostGradUser P,GUCianstudent G where P.id=G.id
select * from PostGradUser P,NONGUCIANstudent NG where P.id=NG.id
select * from PostGradUser P,supervisor S where P.id=S.id


insert into payment values (50000,2,8.75)
insert into payment values (50000,2,8.75)
insert into payment values (50000,2,8.75)
insert into payment values (50000,2,8.75)
insert into payment values (50000,2,8.75)
insert into payment values (50000,2,8.75)
insert into payment values (50000,2,8.75)
insert into payment values (50000,2,8.75)
insert into payment values (50000,2,8.75)
insert into payment values (50000,2,8.75)
insert into payment values (50000,2,8.75)
insert into payment values (50000,2,8.75)
insert into payment values (50000,2,8.75)
insert into payment values (50000,2,8.75)
insert into payment values (50000,2,8.75)
insert into payment values (50000,2,8.75)
insert into payment values (50000,2,8.75)
insert into payment values (50000,2,8.75)
insert into payment values (50000,2,8.75)
insert into payment values (50000,2,8.75)
insert into payment values (80000,2,9.5)
insert into payment values (80000,2,9.5)
insert into payment values (80000,2,9.5)
insert into payment values (80000,2,9.5)
insert into payment values (80000,2,9.5)
insert into payment values (80000,2,9.5)
insert into payment values (80000,2,9.5)
insert into payment values (80000,2,9.5)
insert into payment values (80000,2,9.5)
insert into payment values (80000,2,9.5)

insert into Thesis values ('AI','Masters','AI and how it is affected by machine learning','2019/8/5','2021/6/3','2020/10/6',9.0,1,1)
insert into Thesis values ('Economics','Masters','how stock markets affects financial stability','2019/8/16','2021/6/23','2020/5/28',9.25,2,0)
insert into Thesis values ('Law','Masters','Criminal law dissertation ','2019/8/7','2021/3/3','2020/5/18',8.45,3,0)
insert into Thesis values ('Law','Masters','A comprehensive review on child labour laws','2019/8/28','2021/11/3','2020/12/12',7.25,4,0)
insert into Thesis values ('Law','Masters','Effect of International Commercial Law on Egyptian Laws','2019/8/6','2021/5/3','2020/6/8',8.35,5,1)
insert into Thesis values ('Business','Masters','Influence of banking sector on economic growth','2019/8/15','2021/6/3','2020/5/8',9.1,6,2)
insert into Thesis values ('Business','Masters','Relationship of financial incentives to worker morale','2019/8/13','2021/6/3','2020/5/19',8.9,7,0)
insert into Thesis values ('Cs','Masters',' databases and data mining','2019/8/20','2021/6/3','2020/5/8',7.95,8,0)
insert into Thesis values ('Art','Masters','Does Performance Art Have Boundaries?','2019/8/3','2021/6/3','2020/5/9',8.35,9,1)
insert into Thesis values ('CS','Masters','Quantum computing','2019/7/15','2021/6/3','2020/5/18',9.15,10,0)
insert into Thesis values ('CS','Masters','Merits and demerits of cloud storage','2019/8/22','2021/12/3','2020/5/24',8.25,11,1)
insert into Thesis values ('CS','Masters','Network Security and Cryptography','2019/8/19','2020/7/13','2020/5/5',9.35,12,0)
insert into Thesis values ('AI','Masters','AI based fake product detection from motion patterns ','2019/8/11','2021/2/14','2020/5/6',8.45,13,0)
insert into Thesis values ('AI','Masters','Data/driven Test Cases Generation for Autonomous Vehicles','2019/8/5','2021/5/11','2020/5/17',7.55,14,0)
insert into Thesis values ('Economics','Masters','The company objectives and their reflection in a pricing policy','2019/8/9','2021/12/2','2020/5/8',9.65,15,2)
insert into Thesis values ('Machine Learning','Masters','Automated real/time support','2019/8/30','2021/6/9','2020/5/25',9.2,16,0)
insert into Thesis values ('CS','Masters','Hardware and architecture','2019/8/6','2021/6/3','2020/5/8',8.6,17,0)
insert into Thesis values ('Robotics','Masters','Medical eobots','2019/8/7','2021/6/9','2020/5/16',7.5,18,0)
insert into Thesis values ('Robotics','Masters','AI and Robotics','2019/8/8','2021/6/25','2020/5/9',8.7,19,0)
insert into Thesis values ('CS','Masters','Cyber/physical systems','2019/8/9','2022/6/6','2020/5/8',7.8,20,1)
insert into Thesis values ('AI','PHD','Acceptance of AI/Based Decision Making','2018/8/21','2022/6/3','2020/5/20',7.9,21,0)
insert into Thesis values ('CS','PHD','Decryption, and encryption of data','2018/8/29','2022/6/9','2020/5/29',9.9,22,0)
insert into Thesis values ('CS','PHD','Natural language processing','2018/8/2','2021/6/2','2020/5/7',7.8,23,1)
insert into Thesis values ('Cybersecurity','PHD','Cyber security in IoT appliances','2018/8/30','2021/6/3','2020/5/23',9.5,24,0)
insert into Thesis values ('Automation','PHD','Machine learning for Autonomous Factories','2018/8/9','2021/6/1','2020/5/10',8.5,25,0)
insert into Thesis values ('Machine Learning','PHD','Chess engines Vs AlPhaGO','2018/8/5','2021/6/29','2020/5/1',2.5,26,0)
insert into Thesis values ('AI','PHD','Optimization algorithms for self driving cars','2018/8/11','2021/6/30','2020/5/2',8.3,27,0)
insert into Thesis values ('Robotics','PHD','Humanoid robot and imitation','2018/8/1','2021/6/3','2020/5/27',9.25,28,1)
insert into Thesis values ('Economics','PHD','Free Market Capitalism','2018/8/26','2021/6/4','2020/5/21',8.66,29,0)
insert into Thesis values ('Law','PHD','Police interrogations and Egyptian legal system','2018/8/28','2021/6/9','2020/5/10',8.75,30,0)


insert into Installment values ('2019/6/1',1,25000,1)
insert into Installment values ('2020/12/30',1,25000,0)

insert into Installment values ('2019/6/1',2,25000,1)
insert into Installment values ('2020/12/30',2,25000,0)

insert into Installment values ('2019/6/1',3,25000,1)
insert into Installment values ('2020/12/30',3,25000,0)

insert into Installment values ('2019/6/1',4,25000,1)
insert into Installment values ('2020/12/30',4,25000,0)

insert into Installment values ('2019/6/1',5,25000,1)
insert into Installment values ('2020/12/30',5,25000,0)

insert into Installment values ('2019/6/1',6,25000,1)
insert into Installment values ('2020/12/30',6,25000,0)

insert into Installment values ('2019/6/1',7,25000,1)
insert into Installment values ('2020/12/30',7,25000,0)

insert into Installment values ('2019/6/1',8,25000,1)
insert into Installment values ('2020/12/30',8,25000,0)

insert into Installment values ('2019/6/1',9,25000,1)
insert into Installment values ('2020/12/30',9,25000,0)

insert into Installment values ('2019/6/1',10,25000,1)
insert into Installment values ('2020/12/30',10,25000,0)

insert into Installment values ('2019/6/1',11,25000,1)
insert into Installment values ('2020/12/30',11,25000,0)

insert into Installment values ('2019/6/1',12,25000,1)
insert into Installment values ('2020/12/30',12,25000,0)

insert into Installment values ('2019/6/1',13,25000,1)
insert into Installment values ('2020/12/30',13,25000,0)

insert into Installment values ('2019/6/1',14,25000,1)
insert into Installment values ('2020/12/30',14,25000,0)

insert into Installment values ('2019/6/1',15,25000,1)
insert into Installment values ('2020/12/30',15,25000,0)

insert into Installment values ('2019/6/1',16,25000,1)
insert into Installment values ('2020/12/30',16,25000,0)

insert into Installment values ('2019/6/1',17,25000,1)
insert into Installment values ('2020/12/30',17,25000,0)

insert into Installment values ('2019/6/1',18,25000,1)
insert into Installment values ('2020/12/30',18,25000,0)

insert into Installment values ('2019/6/1',19,25000,1)
insert into Installment values ('2020/12/30',19,25000,0)

insert into Installment values ('2019/6/1',20,25000,1)
insert into Installment values ('2020/12/30',20,25000,0)

insert into Installment values ('1/6/2018',21,40000,1)
insert into Installment values ('2020/12/30',21,40000,0)

insert into Installment values ('1/6/2018',22,40000,1)
insert into Installment values ('2020/12/30',22,40000,0)

insert into Installment values ('1/6/2018',23,40000,1)
insert into Installment values ('2020/12/30',23,40000,0)

insert into Installment values ('1/6/2018',24,40000,1)
insert into Installment values ('2020/12/30',24,40000,0)

insert into Installment values ('1/6/2018',25,40000,1)
insert into Installment values ('2020/12/30',25,40000,0)

insert into Installment values ('1/6/2018',26,40000,1)
insert into Installment values ('2020/12/30',26,40000,0)

insert into Installment values ('1/6/2018',27,40000,1)
insert into Installment values ('2020/12/30',27,40000,0)

insert into Installment values ('1/6/2018',28,40000,1)
insert into Installment values ('2020/12/30',28,40000,0)

insert into Installment values ('1/6/2018',29,40000,1)
insert into Installment values ('2020/12/30',29,40000,0)

insert into Installment values ('1/6/2018',30,40000,1)
insert into Installment values ('2020/12/30',30,40000,0)

select * from Payment 
select * from Payment P, Installment I where P.id=I.paymentID
select * from Payment P, Thesis T where P.id=T.payment_id


-- Examiner Insertions

INSERT INTO PostGradUser(id,email,passwordd) VALUES(14,'somerandommail@gmail.com','12345678')
INSERT INTO PostGradUser(id,email,passwordd) VALUES(15,'anotherrandommail@gmail.com','1234ASD78')
INSERT INTO PostGradUser(id,email,passwordd) VALUES(16,'athirdrandommail@gmail.com','1234dfgh78')
INSERT INTO PostGradUser(id,email,passwordd) VALUES(17,'justarandommail@gmail.com','1dfg5678')
INSERT INTO PostGradUser(id,email,passwordd) VALUES(18,'randommail@gmail.com','123sfn78')
INSERT INTO Examiner(id,namee,FieldOfWork,isNational) VALUES(14, 'Ziad','Applies Science','0')
INSERT INTO Examiner(id,namee,FieldOfWork,isNational) VALUES(15, 'Ahmed','Mathimatics','0')
INSERT INTO Examiner(id,namee,FieldOfWork,isNational) VALUES(16, 'Yousef','Engineering','1')
INSERT INTO Examiner(id,namee,FieldOfWork,isNational) VALUES(17, 'Adham','Networks','1')
INSERT INTO Examiner(id,namee,FieldOfWork,isNational) VALUES(18, 'Hatem','CS','1')
