
import styles from "../styles/components/signup.module.scss";
import { ChangeEvent, useState } from "react";
import Setaxios from "../fetching/Setaxios";

export default function Signup({
  handleSignupModal,
  handleLoginModal,
}: {
  handleSignupModal(): void;
  handleLoginModal(): void;
}) {
  const [userData, setUserData] = useState({
    email: "",
    password: "",
    nickname: "",
    profilepic: "",
    ad_agree: "false",
  });
  const [validation, setValidation] = useState<{
    [index: string]: boolean;
    email: boolean;
    nickname: boolean;
  }>({
    email: true,
    nickname: true,
  });
  const [errormessage, setErrormessage] = useState("");

  const handleInputValue =
    (key: string) => (e: ChangeEvent<HTMLInputElement>) => {
      setUserData({ ...userData, [key]: e.target.value });
    };

  async function SignupSubmit() {
    for (let keys in validation) {
      if (!validation[keys]) {
        setErrormessage(`${keys}을 확인해주세요\n`);
        return null;
      }
    }
    await Setaxios.postAxios("signup", userData)
      .then((res) => {
        alert("성공적으로 가입됐습니다");
        handleSignupModal();
      })
      .catch((err) => {
        setErrormessage("가입에 실패했습니다");
      });
  }
  const validationCheck =
    (key: string) => async (e: { target: { value: string } }) => {
      if (e.target.value === "") return;
      await Setaxios.getAxios("check?type=" + key + "&query=" + e.target.value)
        .then((res) => {
          setValidation({ ...validation, [key]: true });
        })
        .catch((err) => {
          setValidation({ ...validation, [key]: false });
        });
    };
  return (
    <div>
      <div
        className={styles["screen-wrapper"]}
        onClick={(e) => {
          const screen = document.getElementById("screen");
          e.target === screen ? handleSignupModal() : null;
        }}
      >
        <div id="screen" className={styles["signupmodal-wrapper"]}>
          <div className={styles.signupmodal}>
            <div className={styles.signupmodal__form}>
              <div className={styles["signupmodal__form-upper"]}>
                <div className={styles["form-flexstart"]}>
                  소셜 계정으로 간편하게 회원가입
                </div>
                <div className={styles["form-flexend"]}>
                  <div>이미 회원이신가요?</div>
                  <div
                    onClick={() => {
                      handleSignupModal();
                      handleLoginModal();
                    }}
                  >
                    로그인
                  </div>
                </div>
              </div>
              <div className={styles["oauth-icon"]}>
                <img src="/kakao.png" width="180" height="55" />
                <img src="/google.png" width="180" height="55" />
              </div>
              <div>또는 이메일로 가입하기</div>
              <input
                placeholder="E-mail"
                className={styles.input__text}
                onChange={handleInputValue("email")}
                onBlur={validationCheck("email")}