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
    const e