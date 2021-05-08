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
        Cookies.set("nexturl", urlcomp.data.next_redirect_pc_url