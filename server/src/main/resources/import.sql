--Test Dummy Data
--User
INSERT INTO `user` (admin_role,banned,email,password,nickname) VALUES (true, false, "admin1@admin.com", "1234", "관리자 1호");
INSERT INTO `user` (admin_role,banned,email,password,nickname) VALUES (true, false, "admin2@admin.com", "1234", "관리자 2호");

INSERT INTO `user` (email,password,nickname,total_donation) VALUES ("test1@gofundindie.com", "1111", "김하나", 100);
INSERT INTO `user` (email,password,nickname,total_donation) VALUES ("test2@gofundindie.com", "2222", "이둘", 2000);
INSERT INTO `user` (email,password,nickname,total_donation) VALUES ("test3@gofundindie.com", "3333", "박셋", 300);
INSERT INTO `user` (email,password,nickname,total_donation) VALUES ("test4@gofundindie.com", "4444", "최넷", 0);
INSERT INTO `user` (email,password,nickname,total_donation) VALUES ("test5@gofundindie.com", "5555", "한다섯", 0);
INSERT INTO `user` (email,password,nickname,total_donation) VALUES ("askdjaskjd@gofundindie.com", "6666", "김여섯", 0);
INSERT INTO `user` (email,password,nickname,total_donation) VALUES ("qwerasdf4567@gofundindie.com", "7777", "조일곱", 17000);
INSERT INTO `user` (email,password,nickname,total_donation) VALUES ("mansoor@gofundindie.com", "8888", "만수르", 50000000);

INSERT INTO `user` (email,password,nickname) VALUES ("mansoor@gofundindie.com", "1234", "스포왕");

INSERT INTO `user` (email,password,nickname,ad_agree) VALUES ("mansoor@gofundindie.com", "1234", "광고 거부맨", false);
INSERT INTO `user` (email,password,nickname,ad_agree) VALUES ("mansoor@gofundindie.com", "1234", "광고 거부걸", false);


--Genre
INSERT INTO `genre` (id, name) VALUES (1, "드라마");
INSERT INTO `genre` (id, name) VALUES (2, "공포");
INSERT INTO `genre` (id, name) VALUES (3, "로멘스");
INSERT INTO `genre` (id, name) VALUES (4, "판타지");
INSERT INTO `genre` (id, name) VALUES (5, "스릴러");
INSERT INTO `genre` (id, name) VALUES (6, "다큐멘터리");
INSERT INTO `genre` (id, name) VALUES (7, "가족");
INSERT INTO `genre` (id, name) VALUES (8, "범죄");
INSERT INTO `genre` (id, name) VALUES (9, "코미디");
INSERT INTO `genre` (id, name) VALUES (10, "애니메이션");
INSERT INTO `genre` (id, name) VALUES (11, "액션");
INSERT INTO `genre` (id, name) VALUES (12, "SF");
INSERT INTO `genre` (id, name) VALUES (13, "뮤지컬");

-- 유월
INSERT INTO `board` (id, user_id, is_approve, title, producer, distributor, poster_img, view_link, info_country, info_created_year, info_created_date, info_time, info_limit, info_story, info_subtitle) VALUES (33, 3, true, "유월", "베프 (BEFF)", null, "https://cdn.notefolio.net/img/b9/93/b9938dc2e3873a124318f5275a94219112a61af429a0a3791357d9540ac363e7_v1.jpg", "https://www.youtube.com/watch?v=zOXFqZ9rGUo&t=1211s&ab_channel=TeamYuwol", "한국", "2019", null, "25", 0, "한시도 몸을 가만두지 않고 춤추는 소년 유월은 어느날 사립초등학교에 발발한 집단무용증(a.k.a. 댄스바이러스)의 원흉으로 지목당하며, 질서에 목매는 담임선생 혜림과 옆반 선생들에게 추격당하기 시작하는데… ", true)
insert into `still` (image, board_id) values ("http://t1.daumcdn.net/movie/1c5dba172b234f069beb6fbe73697abb1541961065119", 33), ("http://t1.daumcdn.net/movie/ce9bcdab5d724c58b04ced12c506e20f1556290815564", 33), ("http://t1.daumcdn.net/movie/1baed4d6d11f4a7d8b698c77c6812b011561201162187", 33) ,( "http://t1.daumcdn.net/movie/501ac33768514f5d88bbd802ef05ba981556290815280",33) ,("http://t1.daumcdn.net/movie/486e5c921866477aaecf477fe6d4d9821541961066872",33),("http://t1.daumcdn.net/movie/26e2e96597ec417c95510b8cf58b14401562230555905",33);
INSERT INTO `board_genre` (board_id, genre_id) VALUES (33,9);
insert into `board_like` (user_id, board_id) values (7, 33);
INSERT INTO `casting` (name, `position`, image, board_id) VALUES ("이병윤", 1, "https://img1.daumcdn.net/thumb/C200x210/?fname=http%3A%2F%2Ft1.daumcdn.net%2Fmovie%2F8c4e537395c5c07aa1e37be376f2f93ce5cd223c", 33);

INSERT INTO `board` (id, user_id, is_approve, title, producer, distributor, poster_img, view_link, info_country, info_created_year, info_created_date, info_time, info_limit, info_story, info_subtitle) VALUES(36,2,true,"죽기 좋은 날","손정은","HONG FRAME","http://t1.daumcdn.net/movie/42c97f27f8d648ccacb62eb4f78d5dfb1561867715397","https://youtu.be/JzBX1vz4ABY","한국","2018",null,13,1,"<p>남자친구의 배신으로 세상의 끝자락으로 몰린 고등학생 지은은</p><p>인터넷에서 만난 진호와 함께 다음 날 한 시 마포대교에서 투신을 하기로 계획한다.</p><p>2019년 제14회 부산국제어린이청소년영화제</p>",false);
INSERT INTO `board_genre` (board_id, genre_id) VALUES (36,1);
INSERT INTO `board` (id, user_id, is_approve, title, producer, distributor, poster_img, view_link, info_country, info_created_year, info_created_date, info_time, info_limit, info_story, info_subtitle) VALUES(37,2,true,"시간보관소",null,null,"https://user-images.githubusercontent.com/45745049/141706420-ba17ff6a-76ea-4be4-86bb-e9557de9c788.png","https://youtu.be/_dApFdx_psg","한국","2020",null,10,1,"<p>슬럼프에 빠진 어느 가난한 화가가 시간보관소에 시간을 맡기게 되면서 벌어지는 이야기.</p><p> </p><p>2020. 10. 각색, 연출</p><p>2020 아시아 골목 영화제 최우수상 수상</p>",false);
INSERT INTO `board_genre` (board_id, genre_id) VALUES (37,12);
INSERT INTO `board` (id, user_id, is_approve, title, producer, distributor, poster_img, view_link, info_country, info_created_year, info_created_date, info_time, info_limit, info_story, info_subtitle) VALUES(38,2,true,"감독님 연출하지 마세요","이대영",null,"https://img1.daumcdn.net/thumb/C400x572/?fname=http%3A%2F%2Ft1.daumcdn.net%2Fmovie%2Fb2afd087d729c71cb4cf018c3c72ca501d060c80","https://youtu.be/BxZdEtW5wRk","한국