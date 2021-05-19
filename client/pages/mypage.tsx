
import styles from "../styles/mypage.module.scss";
import { GetServerSideProps } from "next";
import Link from "next/link";
import { useState } from "react";
import Setaxios from "../fetching/Setaxios";

process.env.NODE_TLS_REJECT_UNAUTHORIZED = "0";
export default function Mypage({ userInfo, film }: any) {
  const [passwordChange, setPasswordChange] = useState<Boolean>(false);
  const [nickChange, setNickChange] = useState<Boolean>(false);
  const [changeValue, setChangeValue] = useState<string>("");
  const [fileInfo, setFileInfo] = useState("");
  const [nickChangeValue, setnickChangeValue] = useState<string>("");
  if (userInfo === null || !userInfo.data) {
    return <div className={styles.error}>로그인이 필요합니다</div>;
  }
  if (userInfo.code === 4101) location.reload();
  userInfo = userInfo.data;
  function strip_tags(str: any) {
    return str.replace(/(<([^>]+)>)/gi, "");
  }
  const mybuckets = () => {
    if (film.data.FindLikeBoards.data.length === 0) return <></>;
    return film.data.FindLikeBoards.data.map((movie: any) => {
      let story = strip_tags(movie.infoStory);
      return (
        <div key={movie.id} className={styles["information"]}>
          <div className={styles.posterimg}>
            <img src={movie.posterImg} />
          </div>
          <div className={styles.blankedinfos}>
            <div className={styles.title}>
              <span>{movie.title}</span>
              <span className={styles.link}>
                <Link
                  href="/board/view/[boardid]"
                  as={`/board/view/${movie.id}`}
                >
                  영화 상세페이지로
                </Link>
              </span>
            </div>
            <div>
              <span>{movie.infoCreatedYear}</span>
              <span className={styles.dot}>・</span>
              <span>{movie.genre[0].name}</span>
              <span className={styles.dot}>・</span>
              <span>{movie.infoCountry}</span>
            </div>
            <div>러닝타임 {movie.infoTime}분</div>
            <div>{movie.infoCountry}</div>
            <p>{story}</p>
          </div>
        </div>
      );
    });
  };
  console.log(userInfo);
  const mydonations = () => {
    if (film.data.FindDonationBoards.data.length === 0) return <></>;
    return film.data.FindDonationBoards.data.map((movie: any) => {
      return (
        <div key={movie.id} className={styles["information"]}>
          <div className={styles.posterimg}>
            <img src={movie.posterImg} />
          </div>
          <div className={styles.blankedinfos}>
            <div className={styles.title}>
              <span>{movie.title}</span>
              <span className={styles.link}>
                <Link
                  href="/board/view/[boardid]"
                  as={`/board/view/${movie.id}`}
                >
                  영화 상세페이지로
                </Link>
              </span>
            </div>
            <div>
              {movie.donationCreatedAt.slice(
                0,
                movie.donationCreatedAt.length - 5
              )}
            </div>
            <div className={styles.pay}>
              <div className={styles.logo}>
                <div className={styles.border}>
                  <img src="/pay_logo.png" />
                </div>