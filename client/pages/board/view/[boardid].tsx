import styles from "../../../styles/view_boardid.module.scss";
import InfoWrapper from "../../../components/boardInfos/InfoWrapper";
import { GetServerSideProps } from "next";
import Rating from "../../../components/boardInfos/Rating";
import Setaxios from "../../../fetching/Setaxios";
import Cookies from "js-cookie";

process.env.NODE_TLS_REJECT_UNAUTHORIZED = "0";

export default function BoarDetails({ film }: any) {
  let filmData: any;
  if (film) {
    filmData = film.FindBoardId.data;
  } else {
    return <></>;
  }
  function Payment() {
    Setaxios.getAxios(`pay/ready?amount=3000&board_id=${filmData.id}`)
      .then((res) => {
        Cookies.set("boardId", filmData.id);
        const urlcomp: any = res.data;
        Cookies.set("nexturl", urlcomp.data.next_redirect_pc_url);
        const payment: Window | null = window.open(
          urlcomp.data.next_redirect_pc_url,
          "_blank",
          "width=600,height=500"
        );
        if (payment === null) return;
        payment.addEventListener("unload", () => {
          location.reload();
        });
      })
      .catch((err) => {
        if (err.response.data.code === 4016) {
          alert("먼저 영화에 대한 평을 작성해주세요!");
        }
        if (err.response.data.code === 4000) {
          alert("로그인이 필요합니다");
        }
      });
  }
  async function SwitchLikeBoard() {
    const query = `mutation SwitchLikeBoard($boardId: ID!){
      SwitchLikeBoard(boardId: $boardId){
        code
      }
    }`;
    Setaxios.postFindboardGraphql(query, filmData.id)
      .then((res) => {
        const data: any = res.data;
        if (data.data.SwitchLikeBoard.code === 2000) {
          alert("성공적으로 담아두었습니다");
        }
      })
      .catch((err) => alert(err));
  }
  return (
    <div className={styles["board-detail__wrapper"]}>
      <div className={styles.header__img__wrapper}>
        <div className={styles.header__img}>
          {filmData.still[0] ? (
            <img draggable="false" src={filmData.still[0].image} />
          ) : null}
        </div>
      </div>
      <div className={styles.poster__img__div}>
        <div className={styles["poster__img-positional"]}>
          <div className={styles["poster__img-wrapper"]}>
            {filmData.posterImg ? (
              <img
                className={styles.poster__img}
                onError={(e) => {
                  const img: any = e.target;
                  img.src = "/Poster.jpg";
                }}
                src={filmData.posterImg}
              />
            ) : (
              <img src="/Poster.jpg" loading="lazy" />
            )}
          </div>
        </div>
      </div>
      <div className={styles.content__wrapper}>
        <div className={styles.content}>
          <div className={styles.filminfo__wrapper}>
            <div className={styles.filminfo__title}>{filmData.title}</div>
            <div className={styles.filminfo__info}>
              <span>{filmData.infoCreatedYear}</span>
              <span className={styles.dot}>・</span>
            