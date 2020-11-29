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
      if (window.scrollY > 10) {
        header?.classList.remove(styles.transparent);
      }
    }
    window.addEventListener("scroll", CheckScroll);
  }, [router.pathname]);
  //쿠키 리프레쉬 토큰확인하여 엑세스토큰 받아오기
  useEffect(() => {
    if (Cookies.get("refreshToken")) {
      Setaxios.getAxios("reissuance")
        .then((res) => {
          const resData: any = res.data;
          Cookies.set("accesstoken", resData.data.accessToken, {
            sameSite: "lax",
          });
          axios.defaults.headers.common["accesstoken"] =
            resData.data.accessToken;
          setUserLoginStatus(true);
          Setaxios.getAxios("user")
            .then((res) => {
              let userdata: any = res.data;
              if (userdata.data.admin_role) {
                setUserAdminStatus(true);
              }
            })
            .catch((err) => console.log(err.response));
        })
        .catch((err) => console.log(err.response));
    }
  }, []);
  const handleSignupModal = (): void => {
    setSignupModalOpen(!signupModalOpen);
  };
  const handleLoginModal = (): void => {
    setLoginModalOpen(!loginModalOpen);
  };
  const handleLoginStatus = (): void => {
    setUserLoginStatus(true);
  };

  async function Signout() {
    Setaxios.postAxios("signout")
      .then(() => {
        alert("로그아웃에 성공하였습니다");
        setUserLoginStatus(false);
        Cookies.set("accesstoken", "");
        Cookies.remove("accesstoken");
        router.push("/");
        location.reload();
        delete axios.defaults.headers.common["accesstoken"];
      })
      .catch((err) => {
        alert(err);
      });
  }
  const searchData = (e: any) => {
    const query = `query SearchBoardName ($what: String){
      SearchBoardName(what: $what){
        code
        data{
          id
          posterImg
          title
        }
      }
    }`;
    if (e.target.value === "") {
      setSearchedData([]);
      return;
    }
    Setaxios.postSearchBoardGraphql(query, e.target.value)
      .then((res) => {
        const data: any = res.data;
        console.log(res);
        setSearchedData(data.data.SearchBoardName.data);
      })
      .catch((err) => alert(err));
  }