import { ChangeEvent, useState } from "react";
import styles from "../styles/components/login.module.scss";
import Setaxios from "../fetching/Setaxios";
import Cookies from "js-cookie";
import axios from "axios";

export default function Login({
  handleLoginModal,
  handleLoginStatus,
  handleSignupModal,
}: {
  handleLoginModal(): void;
  handleLoginStatus(): void;
  handleSignupModal(): void;
}) {
  const [userData, setUserData] = useState({
    email: "",
    password: "",
  });

  const handleInputValue =
    (key: string) => (e: ChangeEvent<HTMLInputElement>) => {
      setUserData({ ...userData, [key]: e.target.value });
    };

  async function LoginSubmit() {
    const endpoint = "signin";
    const data = {
      email: userData.email,
      password: userData.password,
    };

    //TODO:: 비밀번호가 틀린건지 아이디가 틀린건지 등등정보 나오게
    Setaxios.postAxios(endpoint, data)
      .then((res) => {
        const resData: any = res.data;
        Cookies.set("refreshToken", resData.data.refreshToken, {
          sameSite: "lax",
        });
        Cookies.set("accesstoken", resData.data.accessToken, {
          sameSite: "lax",
        });
        axios.defaults.headers.common["refreshtoken"] =
          resData.data.refreshToken;
        axios.defaults.headers.common["accesstoken"] = resData.data.accessToken;
        alert("로그인에 성공하였습니다");
        //    location.reload();
        handleLoginModal();
        handleLoginStatus();
      })
      .catch((err) => {
        if (err.response.data.code === 4001) alert("비밀번호가 틀렸습니다");
        if (err.response.data.co