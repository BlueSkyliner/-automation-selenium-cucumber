import styles from "../../../styles/view_boardid.module.scss";
import InfoWrapper from "../../../components/boardInfos/InfoWrapper";
import { GetServerSideProps } from "next";
import Rating from "../../../components/boardInfos/Rating";
import Setaxios from "../../../fetching/Setaxios";
import Cookies from "js-cookie";

process.env.N