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
INSERT INTO `board` (id, user_id, is_approve, title, producer, distributor, poster_img, view_link, info_country, info_created_year, info_created_date, info_time, info_limit, info_story, info_subtitle) VALUES(57,2,true,"왜 독립영화 감독들은 DVD를 주지 않는가?","구교환",null,"http://t1.daumcdn.net/cfile/276B3D41535419CD2E","https://www.youtube.com/watch?v=j9QzZ5hwDhA","한국","2013",null,28,1,"<p>고기환(32세,남)은 다수의 독립영화에 출연한 배우다. 기환은 대부분의 독립영화 감독들로부터 자신의 출연작dvd를 받지 못했다. 직접 dvd를 받기 위해 과거 함께 작업했던 감독들과 재회하면서 기환은 뜻밖의 사실들을 알게 된다.</p>",true);
INSERT INTO `board_genre` (board_id, genre_id) VALUES (57,1);
INSERT INTO `board` (id, user_id, is_approve, title, producer, distributor, poster_img, view_link, info_country, info_created_year, info_created_date, info_time, info_limit, info_story, info_subtitle) VALUES(58,2,true,"플라이 투 더 스카이","구교환, 이옥섭",null,"https://img1.daumcdn.net/thumb/R1280x0.fjpg/?fname=http://t1.daumcdn.net/brunch/service/user/kOf/image/rG2vEQA1HD9dKbMsJ-7UcE_068Q.jpg","https://www.youtube.com/watch?v=7y-eps3O-Ko","한국","2015",null,14,1,"<p>이태리에서 돌아온 성환이 교환과 재회한다. 성환은 한국에서 건설기계조종사 면허를 취득하려고 한다. 교환은 성환에게 우선 자동차 운전연습부터 시킨다.</p>",false);
INSERT INTO `board_genre` (board_id, genre_id) VALUES (58,1);
INSERT INTO `board` (id, user_id, is_approve, title, producer, distributor, poster_img, view_link, info_country, info_created_year, info_created_date, info_time, info_limit, info_story, info_subtitle) VALUES(59,2,true,"평행소설","최승현, 고민시",null,"https://img1.daumcdn.net/thumb/C400x572/?fname=http%3A%2F%2Ft1.daumcdn.net%2Fmovie%2Fde593f8c8311a34e1346dae076f00768a8920bee","https://www.youtube.com/watch?v=Guc4QrdHUKY","한국","2016",null,3,1,"<p>작가는 연필로 소설을 쓰고 있다. 그의 소설 속 주인공 여자는 남자를 만나 사랑에 빠지고, 멀어지고, 이별하고, 결국 약을 먹고 자살을 하게 되는 때 작가의 연필이 부러진다. 소설은 중단되고 작가는 연필을 깎기 시작한다. 소설속 주인공은 가까스로 먹은 약을 토해서 살아난다. 그녀는 죽고 싶지 않다. 그녀는 살기 위해 주변을 필사적으로 찾다 노트와, 선물받은 만년필을 꺼내고 작가에 대한 소설을 쓰기 시작한다.</p>",true);
INSERT INTO `board_genre` (board_id, genre_id) VALUES (59,1);
INSERT INTO `board` (id, user_id, is_approve, title, producer, distributor, poster_img, view_link, info_country, info_created_year, info_created_date, info_time, info_limit, info_story, info_subtitle) VALUES(60,2,true,"Mouse-X","Justin Tagg",null,"https://m.media-amazon.com/images/M/MV5BMjExMzU3OTI5OF5BMl5BanBnXkFtZTgwOTUzMjYzMTE@._V1_.jpg","https://www.youtube.com/watch?v=gJPlk6O8XMw","영국","2014",null,15,1,"<p>만약 타임머신이 있다면 무엇을 할까?</p>",false);
INSERT INTO `board_genre` (board_id, genre_id) VALUES (60,4);
INSERT INTO `board` (id, user_id, is_approve, title, producer, distributor, poster_img, view_link, info_country, info_created_year, info_created_date, info_time, info_limit, info_story, info_subtitle) VALUES(61,2,true,"Scrap to the Future","michael formanski",null,"https://user-images.githubusercontent.com/45745049/141719734-c82d584c-c2f7-4e37-94ce-9d633f6f8a8d.png","https://www.youtube.com/watch?v=d2xhV3krRLU","미국","2015",null,19,1,"<p>스크랩 투 더 퓨쳐는 스크래퍼 펑크스타일의 단편영화로 두 스크래퍼가 스크랩핑 메탈로 만들어진 미래에서 살아남는 이야기이다. 시간여행을 하는 기계를 찾아내 과거로부터 메탈덩어리들을 가져오다 현실의 붕괴가 시작되고 만다.</p>",true);
INSERT INTO `board_genre` (board_id, genre_id) VALUES (61,12);
INSERT INTO `board` (id, user_id, is_approve, title, producer, distributor, poster_img, view_link, info_country, info_created_year, info_created_date, info_time, info_limit, info_story, info_subtitle) VALUES(62,2,true,"얼음꽃","이민영",null,"https://user-images.githubusercontent.com/45745049/141719986-81e042ec-8ba0-4897-bceb-8712155f2136.png","https://www.youtube.com/watch?v=Z-cEHs9OTc8","한국","2016",null,14,3,"<p>남편에게 버림받고 임신초기인 지현은 얼굴도 모르는 오프라인 자살 카페 모임에서 만난 사람들(병우, 슬철)과 죽을 장소로 향한다. 지현은 승철과 병우와 자살을 시도하는데 죽는 것도 쉽지 않다.</p>",false);
INSERT INTO `board_genre` (board_id, genre_id) VALUES (62,1);
INSERT INTO `board` (id, user_id, is_approve, title, producer, distributor, poster_img, view_link, info_country, info_created_year, info_created_date, info_time, info_limit, info_story, info_subtitle) VALUES(63,2,true,"도브맘","김아람",null,"https://www.indieground.kr/fileFolder/a6ac8334-3e1f-46ed-b820-c89d8e2b72ef_jpg",null,"한국","2021",null,29,1,"<p>김아람은 비둘기(Dove) 엄마(Mom)가 되길 자청한다.</p>",true);
INSERT INTO `board_genre` (board_id, genre_id) VALUES (63,6);
INSERT INTO `board` (id, user_id, is_approve, title, producer, distributor, poster_img, view_link, info_country, info_created_year, info_created_date, info_time, info_limit, info_story, info_subtitle) VALUES(64,2,true,"가장 보통의 존재","김민지",null,"https://user-images.githubusercontent.com/45745049/141720156-cf108dc3-4379-47e4-8002-0401602c0414.png","https://www.moviebloc.com/detail/ct_11ea27879e34cd25a799025083dcaf84/ko","한국","2013",null,13,3,"<p>조금 여성스럽고 소심한 진우는 수진을 짝사랑하지만 그녀와 한마디도 못했다. 그러던 어느 날, 빈 강의실에 수진과 둘만 남게 된다. 진우의 친구 용철과 희준은 여성스러운 진우에 대해 온갖 상상을 하기 시작한다.</p>",true);
INSERT INTO `board_genre` (board_id, genre_id) VALUES (64,3);
INSERT INTO `board` (id, user_id, is_approve, title, producer, distributor, poster_img, view_link, info_country, info_created_year, info_created_date, info_time, info_limit, info_story, info_subtitle) VALUES(65,2,true,"여름이 지나면","윤진",null,"https://nujhrcqkiwag1408085.cdn.ntruss.com/static/upload/movie_poster_images/280x400/movie_84191_1597020971.png","https://www.moviebloc.com/detail/ct_11ea2842cdedfceaa14b023f85d07bb2/ko","한국","2014",null,14,3,"<p>석호를 짝사랑하고 있는 슬기는 우연히 석호가 양호실에서 희선이의 가슴을 만지려는 걸 목격하게 된다. 석호의 비밀을 지켜주는 대신 슬기는 석호를 마음대로 부려먹기 시작하고 얼떨결에 데이트 아닌 데이트를 하게 된다.</p>",true);
INSERT INTO `board_genre` (board_id, genre_id) VALUES (65,3);
INSERT INTO `board` (id, user_id, is_approve, title, producer, distributor, poster_img, view_link, info_country, info_created_year, info_created_date, info_time, info_limit, info_story, info_subtitle) VALUES(66,2,true,"죽어도 좋은날 ","변현아",null,"http://t1.daumcdn.net/cfile/1362383B5049F75B04","https://www.moviebloc.com/detail/ct_11ea284b1689a8d7a14b023f85d07bb2/ko","한국","2012",null,16,2,"<p>또래에 비해 초경이 빨리 찾아온 11살 소녀, 유정. 자신이 죽어가고 있다고 오해하게 된 유정은 친한 친구 승준에게만 이 사실을 털어놓는다.</p>",true);
INSERT INTO `board_genre` (board_id, genre_id) VALUES (66,1);
INSERT INTO `board` (id, user_id, is_approve, title, producer, distributor, poster_img, view_link, info_country, info_created_year, info_created_date, info_time, info_limit, info_story, info_subtitle) VALUES(67,2,true,"내 이름 송병준! 이렇게 강할 리가 없어!!","박재현",null,"https://user-images.githubusercontent.com/45745049/141714844-525d8386-77bc-4263-b1b0-5c94b0072695.png","https://www.moviebloc.com/detail/ct_11ec253997d90b02a2e3025083dcaf84/ko","한국","2018",null,24,2,"<p>학교에서 조용히 지내는 오타쿠 송병준. 그에게는 그를 괴롭히는 용훈이 있다. 용훈은 병준이 만화부 선배에게 물려받은 소중한 시계를 부숴버린다. 분노에 가득 찬 병준. 만화부원들과 힘을 합쳐 무찌르기로 결정한다.</p>",false);
INSERT INTO `board_genre` (board_id, genre_id) VALUES (67,9);
INSERT INTO `board` (id, user_id, is_approve, title, producer, distributor, poster_img, view_link, info_country, info_created_year, info_created_date, info_time, info_limit, info_story, info_subtitle) VALUES(68,2,true,"Lips","Team DADA",null,"https://blogfiles.pstatic.net/MjAxODExMDRfMjky/MDAxNTQxMzE2MzY5NDkw.wha3W2OvQan9AA2nbyD60oKQevfLoUsJ8G4kbtXP9lsg.VXnAcLgEZwZCGUUNn1U8qkA82yhG9whoemET68R-qd8g.JPEG.pon06023/2018-11-04_16%3B25%3B59.jpg","https://youtu.be/mB0FiOY1S3Q","한국","2018",null,6,1,"<p>소문은 언제 어디서 누가 시작했는지, 아무도 모른다.</p>",false);
INSERT INTO `board_genre` (board_id, genre_id) VALUES (68,1);
INSERT INTO `board` (id, user_id, is_approve, title, producer, distributor, poster_img, view_link, info_country, info_created_year, info_created_date, info_time, info_limit, info_story, info_subtitle) VALUES(69,2,true,"꽃잠","박해정",null,"https://user-images.githubusercontent.com/45745049/141720836-772bcf0e-ff08-4a88-8f2d-5ffe224479fc.png","https://www.moviebloc.com/detail/ct_11ea26334e9e0d86a14b023f85d07bb2/ko","한국","2012",null,23,3,"<p>오랫동안 짝사랑해 오던 남자와 관계를 갖게 된 여자. 여자는 정서적 교감의 시작이라고 생각하지만, 여자 친구가 있는 남자는 그저 육체적인 욕망만을 채운다. 남자의 허울뿐인 섹스를 알게 되면서도 남자에 대한 자신의 욕망때문에 은밀한 관계를 유지해 가는 여자. 이 둘의 이율 배반적인 관계 속에서 수직적 결정에 대한 우위는 어떻게 흘러 갈 것인가.</p>",false);
INSERT INTO `board_genre` (board_id, genre_id) VALUES (69,1);
INSERT INTO `board` (id, user_id, is_approve, title, producer, distributor, poster_img, view_link, info_country, info_created_year, info_created_date, info_time, info_limit, info_story, info_subtitle) VALUES(70,2,true,"수선화","박종철",null,"https://img1.daumcdn.net/thumb/C400x572/?fname=http%3A%2F%2Ft1.daumcdn.net%2Fcfile%2F147DC9364DB7CF1F0B","https://youtu.be/me0XmgTb8ig","한국","2010",null,33,1,"<p>종근은 인터넷으로 청바지를 산 뒤 밑단을 살리면서 기장을 줄이기 위해 동네 세탁소에 수선을 맡긴다.</p><p>그런데 수선이 끝난 바지는 재봉선이 뒤죽박죽 엉망으로 줄여져 있다.</p><p>세탁소 주인과 실랑이 끝에 종근은 5만 원 주고 산 바지로 15만 원을 받아낸다.</p><p>다시 같은 바지를 주문하여 다른 세탁소에 맡겨 보는데, 이번엔 주인과 더 큰 싸움만 일어날 뿐이다.</p><p>결국 전문 수선집을 알아내 바지를 맡기지만, 이곳 주인은 어이없게도 종근의 바지를 잃어버린다.</p><p>(2011년 제5회 시네마디지털서울 영화제)</p>",false);
INSERT INTO `board_genre` (board_id, genre_id) VALUES (70,1);
INSERT INTO `board` (id, user_id, is_approve, title, producer, distributor, poster_img, view_link, info_country, info_created_year, info_created_date, info_time, info_limit, info_story, info_subtitle) VALUES(71,2,true,"방문","신미래",null,"https://github.com/JogiYo/practice1/blob/master/practice1/%EB%B0%A9%EB%AC%B8.png?raw=true","https://youtu.be/j3XW8gh_3cQ","한국","2016",null,18,2,"<p>아동학대를 받고 있다는 제보를 받은 사회복지사 동원은 어느 한가로운 시골마을로 조사를 나선다. 신고가 들어온 집을 방문한 동원은 아이들의 행동에 수상함을 느낀다. 무언가 미심쩍은 아이들에게 의구심을 품고 집으로 돌아가던 중 아이들의 다급한 연락을 받고 다시 그 집으로 돌아 가는데... 　</p>",false);
INSERT INTO `board_genre` (board_id, genre_id) VALUES (71,5);
INSERT INTO `board` (id, user_id, is_approve, title, producer, distributor, poster_img, view_link, info_country, info_created_year, info_created_date, info_time, info_limit, info_story, info_subtitle) VALUES(72,2,true,"더 앵글러","장승욱",null,"https://www.indieground.kr/fileFolder/p031.jpg",null,"한국","2018",null,13,1,"<p>노아는 매일 물고기를 잡으려고 한다, 이유도 잊은 채. 마을의 점등사 이보는 묵묵히 등불을 밝히며 그를 살핀다.</p>",false);
INSERT INTO `board_genre` (board_id, genre_id) VALUES (72,10);
INSERT INTO `board` (id, user_id, is_approve, title, producer, distributor, poster_img, view_link, info_country, info_created_year, info_created_date, info_time, info_limit, info_story, info_subtitle) VALUES(73,2,true,"레몬","이현지",null,"https://github.com/JogiYo/practice1/blob/master/practice1/%EB%A0%88%EB%AA%AC.png?raw=true","https://youtu.be/nvkhIuG7ias","한국","2017",null,7,1,"<p>롯데월드가 폭피하는 상상으로 사회적 불만을 해소한다는 내용의 단편 영화.</p>",false);
INSERT INTO `board_genre` (board_id, genre_id) VALUES (73,1);
INSERT INTO `board` (id, user_id, is_approve, title, producer, distributor, poster_img, view_link, info_country, info_created_year, info_created_date, info_time, info_limit, info_story, info_subtitle) VALUES(74,2,true,"부탁","유재선",null,"https://img1.daumcdn.net/thumb/C400x572/?fname=http%3A%2F%2Ft1.daumcdn.net%2Fmovie%2F8eb68ab6f006b25f7e3d6f8b4903573291d78835","https://www.moviebloc.com/detail/ct_11ea287720bb5b43a799025083dcaf84/ko","한국","2018",null,17,3,"<p>곤히 잠든 아들을 깨우는 아빠. 주섬주섬 100만 원이 든 봉투를 내밀며 자다가 봉창 두드리는 부탁을 한다. 평범한 듯 평범하지 않은 부자의 특별하고도 웃고픈 사정</p>",true);
INSERT INTO `board_genre` (board_id, genre_id) VALUES (74,7);
INSERT INTO `board` (id, user_id, is_approve, title, producer, distributor, poster_img, view_link, info_country, info_created_year, info_created_date, info_time, info_limit, info_story, info_subtitle) VALUES(75,1,true,"실","이나연","필름다빈","https://www.indieground.kr/fileFolder/p049.png","https://play24.yes24.com/Main/Detail/S000009830","한국","2020",null,30,1,"<p>창신동 명선의 봉제 공장에 드나드는 사람들. 노동에 관한 저마다의 시선이 명선 주위를 맴돈다. 오랜 세월 함께해 온 이웃 현이 결국 창신동을 떠나게 되자, 명선은 고민에 빠진다.</p>",false);
INSERT INTO `board_genre` (board_id, genre_id) VALUES (75,1);
INSERT INTO `board` (id, user_id, is_approve, title, producer, distributor, poster_img, view_link, info_country, info_created_year, info_created_date, info_time, info_limit, info_story, info_subtitle) VALUES(76,1,true,"실버택배","김나연","필름다빈","https://www.indieground.kr/fileFolder/8cea0c8c-9a34-44f3-b293-8d3229ccbaf0_jpg",null,"한국","2020",null,26,2,"<p>70세 신정숙씨는 지하철 택배원이다.</p><p>그녀는 어느 날 범죄에 관련된 통장을 운반하게 되고 경찰 조사를 받게 된다.</p><p>하지만 경찰 앞에서 거짓말만 늘어놓는 그녀.</p><p>결국 기록 일지를 모두 불태워 증거인멸을 하게 되는데…</p><p>초고령 사회가 도래하면서 노후 파산에 빠지는 사람들이 점점 늘어나고 있다.</p><p>나름대로의 최선을 다해 살아온 최정숙씨 또한 노후 파산을 피해갈 수만은 없다.</p><p>과연 그녀는 눈앞에 놓인 문제를 어떻게 해결해 나갈까? 그녀가 원하는 인생의 막을 내릴 수 있을까?</p>",false);
INSERT INTO `board_genre` (board_id, genre_id) VALUES (76,1);
INSERT INTO `board` (id, user_id, is_approve, title, producer, distributor, poster_img, view_link, info_country, info_created_year, info_created_date, info_time, info_limit, info_story, info_subtitle) VALUES(77,1,true,"자매들의 밤","김보람","센트럴파크","https://www.indieground.kr/fileFolder/9740ac41-1786-4acf-a83a-e549551fd0b4_jpg",null,"한국","2020",null,22,2,"<p>어머니의 기일에 맞춰, 추모 예배를 드리기 위해 중년의 자매들이 첫째 혜정의 집에 모인다.</p>",false);
INSERT INTO `board_genre` (board_id, genre_id) VALUES (77,1);
INSERT INTO `board` (id, user_id, is_approve, title, producer, distributor, poster_img, view_link, info_country, info_created_year, info_created_date, info_time, info_limit, info_story, info_subtitle) VALUES(78,1,true,"조금 부족한 여자","허수영","한국독립애니메이션협회","https://www.indieground.kr/fileFolder/297b8a98-925f-4e42-aec8-7147fbfac1ce_jpg",null,"한국","2020",null,10,2,"<p>중요한 시험을 앞두고, 뜻대로 되지 않는 자신의 몸에 실망한 머리가 누워서 침을 뱉고 가출한다. 이때다 싶었는지 오른팔과 상체도 나머지 몸에서 벗어난다. 잔인하고 엽기적이지만 그들의 여정을 함께 하다 보면, 토막난 채로 살아가도 나쁠 것 같지 않다. 종종 있는 일이라고도 하니까, 뭐. 시험 따위 망치면 어때! 그러고 보니 나도 손과 머리가 분리된 것 같다.</p>",false);
INSERT INTO `board_genre` (board_id, genre_id) VALUES (78,10);
INSERT INTO `board` (id, user_id, is_approve, title, producer, distributor, poster_img, view_link, info_country, info_created_year, info_created_date, info_time, info_limit, info_story, info_subtitle) VALUES(79,1,true,"달팽이","김태양",null,"https://www.indieground.kr/fileFolder/b21dd63b-0446-4691-ac51-c9aea7e04e2b_jpg",null,"한국","2020",null,20,2,"<p>버스에서 잘못 내린 남자는 익숙한 길을 찾으려 거리를 걷는다. 그날 저녁, 우연히 같은 길을 다시 걷게 되는데, 무언가 달라졌다.</p>",false);
INSERT INTO `board_genre` (board_id, genre_id) VALUES (79,1);
INSERT INTO `board` (id, user_id, is_approve, title, producer, distributor, poster_img, view_link, info_country, info_created_year, info_created_date, info_time, info_limit, info_story, info_subtitle) VALUES(80,1,true,"두 개의 물과 한 개의 라이터","조희영","필름다빈","https://www.indieground.kr/fileFolder/p033.png","https://play24.yes24.com/Main/Detail/S000009821","한국","2020",null,30,1,"<p>어제 낮잠을 잔 지원은 평소와 다르게 이른 아침에 눈이 떠졌다. 책을 좀 보다가 창가에서 담배를 피우는데 저 멀리 숲의 나무들이 눈에 들어온다. 가만히 멈춰 있는 것 같던 나무의 나뭇잎들을 자세히 보니 살살 움직이고 있다. 산책을 간 숲에서 오래 전 친했던 친구이자, 같은 사람을 좋아했던 혜영을 마주친다.</p>",false);
IN