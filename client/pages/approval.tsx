import { useEffect, useState } from "react";
import { useRouter } from "next/router";
import Setaxios from "../fetching/Setaxios";
import styles from "../styles/approval.module.scss";
import Cookies from "js-cookie";

export default function Approval() {
  const router = useRouter();
  const [timer, setTimer] = useState(0);
  useEffect(() => {
    const timeout = setTimeout(() => setTimer(timer + 1), 1000);
    if (!router.isReady) return () => clearTimeout(timeout);

    Setaxios.postAxios("pay/approve", {
      pg_token: router.query.pg_token,
      boardId: Cookies.get("bo