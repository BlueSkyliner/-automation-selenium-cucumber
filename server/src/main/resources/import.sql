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
INSERT INTO `board` (id, user_id, is_approve, title, producer, distributor, poster_img, view_link, info_country, info_created_year, info_created_date, info_time, info_limit, info_story, info_subtitle) VALUES(38,2,true,"감독님 연출하지 마세요","이대영",null,"https://img1.daumcdn.net/thumb/C400x572/?fname=http%3A%2F%2Ft1.daumcdn.net%2Fmovie%2Fb2afd087d729c71cb4cf018c3c72ca501d060c80","https://youtu.be/BxZdEtW5wRk","한국","2017",null,13,2,"<p>민경은 단편영화 주인공을 맡아 촬영에 임한다.</p><p>시간이 지날수록 현장이 꼬이고 감독과 미세한 균열이 일기 시작한다.</p><p>(2017년 제16회 미쟝센 단편영화제)</p>",false);
INSERT INTO `board_genre` (board_id, genre_id) VALUES (38,9);
INSERT INTO `board` (id, user_id, is_approve, title, producer, distributor, poster_img, view_link, info_country, info_created_year, info_created_date, info_time, info_limit, info_story, info_subtitle) VALUES(39,2,true,"밀크","장유진",null,"https://user-images.githubusercontent.com/45745049/141706859-cbe83c70-eb85-483d-af3c-bcdacc0fc2df.png","https://youtu.be/zrsUszuLZ0I","한국","2018",null,23,1,"<p>태국 푸켓의 한 리조트에서 하우스 키퍼로 일하는 싸이(Sai).</p><p>가난한 아기엄마인 그녀는 손님으로 온 부잣집 아기엄마를 만나게 된다.</p>",true);
INSERT INTO `board_genre` (board_id, genre_id) VALUES (39,1);
INSERT INTO `board` (id, user_id, is_approve, title, producer, distributor, poster_img, view_link, info_country, info_created_year, info_created_date, info_time, info_limit, info_story, info_subtitle) VALUES(40,2,true,"여름, 버스 ","조범식, 류진아",null,"https://an2-img.amz.wtchn.net/image/v2/4db9f74f79d91e8c41d5d0d61f2a30ec.jpg?jwt=ZXlKaGJHY2lPaUpJVXpJMU5pSjkuZXlKaVlXTnJaM0p2ZFc1a0lqcDdJbklpT2pJMU5Td2laeUk2TWpVMUxDSmlJam95TlRWOUxDSmpjbTl3SWpwMGNuVmxMQ0pvWldsbmFIUWlPalF3TUN3aWNHRjBhQ0k2SWk5Mk1TOTVjR0p5TUdKc2JuTmtiV1Z1T0doME5UVnhNeUlzSW5GMVlXeHBkSGtpT2pnd0xDSjNhV1IwYUNJNk1qZ3dmUS5KeDFDbXpVRmFxR1ZtZ242RW9OX3kyS2hrQmZWYjRjMG1rV0lMR0t4UEhn","https://youtu.be/-MliIE5PGrI","한국","2018",null,18,1,"<p>버스 안에서 일어나는 여름날의 소소하고 행복한 이야기</p><p>(2018년 제6회 서울구로국제어린이영화제)</p>",false);
INSERT INTO `board_genre` (board_id, genre_id) VALUES (40,1);
INSERT INTO `board` (id, user_id, is_approve, title, producer, distributor, poster_img, view_link, info_country, info_created_year, info_created_date, info_time, info_limit, info_story, info_subtitle) VALUES(41,2,true,"9월이 지나면","고형동",null,"https://user-images.githubusercontent.com/45745049/141707436-f4160473-5ac9-4982-b622-6dd1e2d120dc.png","https://youtu.be/ui1RZ1Agk2Q?list=PLNPi9xvM1NrMzz18cUGwAfvRdr3_OKo77","한국","2013",null,23,1,"<p>공모전 설계도 제출을 하루 앞두고 선영의 설계도가 사라진다. 선영은 지연을 의심하고, 승조는 지연을 감싸준다.</p><p>(2013년 12회 미쟝센 단편영화제)</p>",false);
INSERT INTO `board_genre` (board_id, genre_id) VALUES (41,1);
INSERT INTO `board` (id, user_id, is_approve, title, producer, distributor, poster_img, view_link, info_country, info_created_year, info_created_date, info_time, info_limit, info_story, info_subtitle) VALUES(42,2,true,"Curve","Tim Egan",null,"https://t1.daumcdn.net/cfile/tistory/99A68C475EECB8240F","https://youtu.be/2dD3Fawk4y0","호주","2016",null,9,3,"<p>어둡고 가파른 비탈 한가운데서 깨어난 여인.</p><p>잡을 것조차 없는 그곳에서 손바닥의 마찰 만으로 몸을 지탱해야만 한다.</p><p>필사적으로 버티는 그녀에게 이번엔 발 밑 어둠속에서 섬뜩한 소리가 들려오는데...</p><p>(2016년 제18회 쇼트쇼츠국제단편영화제)</p>",true);
INSERT INTO `board_genre` (board_id, genre_id) VALUES (42,2);
INSERT INTO `board` (id, user_id, is_approve, title, producer, distributor, poster_img, view_link, info_country, info_created_year, info_created_date, info_time, info_limit, info_story, info_subtitle) VALUES(43,2,true,"Alternative Math","David Maddox",null,"https://m.media-amazon.com/images/M/MV5BZjFhN2FhMTQtNTA2OS00MjUxLWIwN2UtOGY2ZWQ4NWRmOWE4XkEyXkFqcGdeQXVyMjI3MTE4MjU@._V1_.jpg","https://youtu.be/Zh3Yz3PiXZw","미국","2017",null,9,1,null,true);
INSERT INTO `board_genre` (board_id, genre_id) VALUES (43,9);
INSERT INTO `board` (id, user_id, is_approve, title, producer, distributor, poster_img, view_link, info_country, info_created_year, info_created_date, info_time, info_limit, info_story, info_subtitle) VALUES(44,2,true,"두개의 빛: 릴루미노","허진호",null,"http://t1.daumcdn.net/movie/f2498357e6717f12a7db19b031140b2dfea13f43","https://youtu.be/3y5zBY96Mio","한국","2017",null,31,1,"<p>시력을 차츰 잃어가고 있는 인수는 사진동호회에서 같은 시각장애를 가진 수영을 만난다. 잔뜩 움츠러든 자신과 달리 당당한 모습의 수영에게 호감을 느끼는 인수.</p><p>세 번의 출사, 다섯 번의 만남 속 그들은 서로의 빛이 될 수 있을까?</p>",false);
INSERT INTO `board_genre` (board_id, genre_id) VALUES (44,3);
INSERT INTO `board` (id, user_id, is_approve, title, producer, distributor, poster_img, view_link, info_country, info_created_year, info_created_date, info_time, info_limit, info_story, info_subtitle) VALUES(45,2,true,"사회수업","이용훈",null,"https://user-images.githubusercontent.com/45745049/141708992-f9c2e2e5-4736-485e-9d21-d7f8e0973c48.png","https://youtu.be/oIws_PYoDqE","한국","2017",null,19,1,"<p>대학생 신해는 고교에서 교생실습중이다. 학교에 결원이 생겨서 임용의 가능성이 있지만 그녀를 가로막는 난관은 만만치 않다. 학교에 넌더리가 난 신해, 하지만 교생실습기간은 아직 많이 남았다.</p>",false);
INSERT INTO `board_genre` (board_id, genre_id) VALUES (45,1);
INSERT INTO `board` (id, user_id, is_approve, title, producer, distributor, poster_img, view_link, info_country, info_created_year, info_created_date, info_time, info_limit, info_story, info_subtitle) VALUES(46,2,true,"야경꾼","노도연",null,"https://an2-img.amz.wtchn.net/image/v2/7e6383aa687830521ae242029ac59bba.jpg?jwt=ZXlKaGJHY2lPaUpJVXpJMU5pSjkuZXlKaVlXTnJaM0p2ZFc1a0lqcDdJbklpT2pJMU5Td2laeUk2TWpVMUxDSmlJam95TlRWOUxDSmpjbTl3SWpwMGNuVmxMQ0pvWldsbmFIUWlPamN3TUN3aWNHRjBhQ0k2SWk5Mk1TOXRlWFYxWTIxa2RXVTNhWGQxZDNVNWRXYzBPQ0lzSW5GMVlXeHBkSGtpT2pnd0xDSjNhV1IwYUNJNk5Ea3dmUS5Ka3ptcnBQc3NnQW9GbGdLcFhqeWtrbU1Icl95eVJJZ2NsRUZrMTBBdDZJ","https://youtu.be/na2hyI_SAPM","한국","2015",null,13,3,"<p>종합설비센터에서 일하는 남자는 자신의 가게 맞은편 약국의 약사를 관찰한다.</p><p>수상한 남자가 퇴근하는 약사를 쫓아가는 것을 목격한 주인공은 그녀가 위험에 빠졌음을 깨닫고 따라나서지만 오히려 자신이 스토커로 오해를 받는 상황에 처한다.</p><p>(2015년 제14회 미쟝센 단편영화제)</p>",false);
INSERT INTO `board_genre` (board_id, genre_id) VALUES (46,5);
INSERT INTO `board` (id, user_id, is_approve, title, producer, distributor, poster_img, view_link, info_country, info_created_year, info_created_date, info_time, info_limit, info_story, info_subtitle) VALUES(47,2,true,"The Ballerina","Aaron Fradkin",null,"https://m.media-amazon.com/images/M/MV5BMWNmNTU1YWYtODM3NS00YjE4LWIwYTUtZjVkYzI1MTFiZjI5XkEyXkFqcGdeQXVyNjUzNTE5NjA@._V1_FMjpg_UX1000_.jpg","https://youtu.be/sTtmpFIaFqc","미국","2021",null,8,3,null,true);
INSERT INTO `board_genre` (board_id, genre_id) VALUES (47,2);
INSERT INTO `board` (id, user_id, is_approve, title, producer, distributor, poster_img, view_link, info_country, info_created_year, info_created_date, info_time, info_limit, info_story, info_subtitle) VALUES(48,2,true,"Other Side of the Box","Caleb J. Phillips",null,"https://img1.daumcdn.net/thumb/R1280x0.fjpg/?fname=http://t1.daumcdn.net/brunch/service/user/1cnb/image/flNpjRA9coKsncRV3cR_tLzbrd0.jpg","https://youtu.be/OrOYvVf6tIMM","미국","2018",null,15,3,"<p>늦은 밤, 젊은 커플이 오랜 친구로부터 정체불명의 선물을 받게되는데..</p>",false);
INSERT INTO `board_genre` (board_id, genre_id) VALUES (48,2);
INSERT INTO `board` (id, user_id, is_approve, title, producer, distributor, poster_img, view_link, info_country, info_created_year, info_created_date, info_time, info_limit, info_story, info_subtitle) VALUES(49,2,true,"The Wrong Rock","Michael Cawood",null,"https://user-images.githubusercontent.com/45745049/141709892-cb7d072f-f2af-43af-92ec-c5f04e9160eb.png","https://youtu.be/eDaNejmf-1A","미국","2018",null,13,1,null,true);
INSERT INTO `board_genre` (board_id, genre_id) VALUES (49,10);
INSERT INTO `board` (id, user_id, is_approve, title, producer, distributor, poster_img, view_link, info_country, info_created_year, info_created_date, info_time, info_limit, info_story, info_subtitle) VALUES(50,2,true,"언니","김인욱",null,"https://image.tmdb.org/t/p/w500/rG98Zhee2oPY9HysOx0wpRzpqLR.jpg","https://youtu.be/mqh_fWDDzig","한국","2017",null,21,2,"<p>아파트에 살고있는 두 자매. 청소년인 동생이 한밤에 집을 나가고, 언니 혼자 남게된 집안에 괴한이 들어온다.</p><p>동생을 납치한 괴한으로 부터 동생을 구하기위한 언니의 처절한 이야기가 펼쳐진다.</p>",false);
INSERT INTO `board_genre` (board_id, genre_id) VALUES (50,8);
INSERT INTO `board` (id, user_id, is_approve, title, producer, distributor, poster_img, view_link, info_country, info_created_year, info_created_date, info_time, info_limit, info_story, info_subtitle) VALUES(51,2,true,"원룸","이병진",null,"https://user-images.githubusercontent.com/45745049/141710189-4f2c509b-6a6a-40be-a70a-4217dcb62542.png","https://youtu.be/tyXxjw_SyxE","한국","2018",null,26,1,"<p>야근 때문에 자주 원룸을 비우는 일한은 원룸의 반나절 세입자를 구한다.</p><p>고교 자퇴생 준은 뮤지션의 꿈을 위해 서울로 상경하고 일한의 반나절 룸메이트가 된다.</p><p>두 사람의 예민한 반나절 동거에 준의 고향 친구 병두가 나타나는데...</p>",true);
INSERT INTO `board_genre` (board_id, genre_id) VALUES (51,1);
INSERT INTO `board` (id, user_id, is_approve, title, producer, distributor, poster_img, view_link, info_country, info_created_year, info_created_date, info_time, info_limit, info_story, info_subtitle) VALUES(52,2,true,"가족",null, null,"https://user-images.githubusercontent.com/45745049/141710873-8ed5b60a-9c6b-4329-8a81-66ad4b506af4.png","https://youtu.be/NXPsKHqkuEM","한국","2016",null,5,1,"<p>반려동물의 시각에서 인간의 이기적인 (혹은 이중적인) 모습을 판타지적으로 표현한 작품. 보는 이들이 영화를 통해 반려동물에 대한 인식과 책임을 다시 한 번 생각해보도록 한다.</p>",false);
INSERT INTO `board_genre` (board_id, genre_id) VALUES (52,7);
INSERT INTO `board` (id, user_id, is_approve, title, producer, distributor, poster_img, view_link, info_country, info_created_year, info_created_date, info_time, info_limit, info_story, info_subtitle) VALUES(53,2,true,"결백","김재식",null,"https://user-images.githubusercontent.com/45745049/141713974-95d4827f-7a88-4566-86f3-6a4c043d8b8a.png","https://youtu.be/wjLtkqYleqs?list=PL9WxTUjNNa_G0fNdRQQ794Mf0g-7o1p8Y","한국","2015",null,24,1,"<p>나름 큰 사고 없이 수년째 고등학교 교직생활을 성실히 해온 ‘혜원’에게 큰 위기가 찾아온다. 그것은 평소 관리에 신경 썼던 시험답지인 OMR카드를 분실하면서 시작된다. OMR카드를 가져간 사람으로 ‘혜원’의 반 우등생 ‘나영’이 거론되고 전교 1등 ‘나영’이 왜 그것을 가져갔는지에 ‘혜원’은 더 큰 관심이 생긴다. 방과 후 ‘나영’을 따로 불러 그 이유를 물어보는데 ‘나영’이로부터 생각지도 못한 이야기들이 나온다. (2015년 제17회 부산독립영화제)</p>",false);
INSERT INTO `board_genre` (board_id, genre_id) VALUES (53,1);
INSERT INTO `board` (id, user_id, is_approve, title, producer, distributor, poster_img, view_link, info_country, info_created_year, info_created_date, info_time, info_limit, info_story, info_subtitle) VALUES(54,2,true,"철원에서","김혜정",null,"https://user-images.githubusercontent.com/45745049/141714122-a28d44e2-a3d0-4ba0-85e6-e19f17e50974.png","https://youtu.be/6OvDfaSJDIc?list=PL9WxTUjNNa_G0fNdRQQ794Mf0g-7o1p8Y","한국","2018",null,17,1,"<p>예술 강사인 남희는 강원도 철원으로 수업을 하러 떠나지만 어느 것 하나 순탄치가 않다. 일을 다 마친 남희는 집으로 돌아가기 위해 터미널로 향하지만 마지막 버스를 놓치게 된다. </p>",false);
INSERT INTO `board_genre` (board_id, genre_id) VALUES (54,1);
INSERT INTO `board` (id, user_id, is_approve, title, producer, distributor, poster_img, view_link, info_country, info_created_year, info_created_date, info_time, info_limit, info_story, info_subtitle) VALUES(55,2,true,"인싸","차경훈",null,"https://user-images.githubusercontent.com/45745049/141714312-f74f1eed-d51a-496b-bb06-8f0e2ac407f4.png","https://www.youtube.com/watch?v=P2X93az89y8&t=2s","한국","2020",null,9,2,"<p>많은 사람들의 관심과 사랑을 받는 인스타 스타 세영이 모두들 세영이의 화려한 일상을 부러워 한다. 하지만 보이는 것과는 조금 달라 보이는데 ...</p>",false);
INSERT INTO `board_genre` (board_id, genre_id) VALUES (55,1);
INSERT INTO `board` (id, user_id, is_approve, title, producer, distributor, poster_img, view_link, info_country, info_created_year, info_created_date, info_time, info_limit, info_story, info_subtitle) VALUES(56,2,true,"사람하는 사랑","오선주",null,"https://user-images.githubusercontent.com/45745049/141715037-305b2116-32e7-413f-9bb6-d82b55256f9f.png","https://www.youtube.com/watch?v=jjDZge2tVHA","한국","2019",null,23,1,"<p>무엇과 하는 무엇을 사랑이라 할까.</p><p>어떻게 해야 서로에게 닿을 수 있을까.</p>",true);
INSERT INTO `board_genre` (board_id, genre_id) VALUES (56,1);
INSERT INTO `board` (id, user_id, is_approve, title, producer, distributor, poster_img, view_link, info_country, info_created_year, info_created_date, info_time, info_limit, info_story, info_subtitle) VALUES(57,2,true,"왜 독립영화 감독들은 DVD를 주지 않는가?","구교환",null,"http://t1.daumcdn.net/cfile/276B3D41535419CD2E","https://ww