import Link from "next/link";
import styles from "../../styles/components/layout/header.module.scss";
import Login from "../Login";
import Signup from "../Signup";
import { useEffect, useState } from "react";
import Setaxios from "../../fetching/Setaxios";
import { useRouter } from "next/router";
import axios from "axios";
import Cookies from "js-cookie";
export default function Header() {
  const [loginModalOpen, setLoginModalOpen] = useState<boolean>(false);
  const [signupModalOpen, setSignupModalOpen] = useState<boolean>(false);
  const [userLoginStatus, setUserLoginStatus] = useState<boolean>(false);
  const [userAdminStatus, setUserAdminStatus] = useState<boolean>(false);
  const [searchedData, setSearchedData] = useState([]);
  const [searchedOnfocus, setSearchedOnfocus] = useState<boolean>(false);
  const router = useRouter();
  //헤더 상단 투명처리
  //TODO::/효율적인 방법 찾기
  useEffect(() => {
    if (!router.isReady) return;
    if (router.pathname !== "/board/view/[boardid]") {
      return;
    }
    const header = document.querySelector("#header__div");
    header?.classList.add(styles.transparent);
    function CheckScroll() {
      if (window.scrollY === 0) {
        header?.classList.add(styles.transparent);
      }
   