import { useState } from "react";
import styles from "../../styles/components/boardInfos/cast.module.scss";
export default function Cast({ cast, onFocus }: any) {
  const [component, setComponent] = useState<boolean>(false);
  let count = 0;
  function Positioner(num: Number) {
    switch (num) {
      case 1:
        return <div>감독</div>;
      case 2:
        return <div>주연</div>;
      case 3:
        return <div>조연</div>;
    }
  }
  function Emptyimg(num: Number) {
    switch (num) {
      case 1:
        return <img src="/Director.jpg" />;
      case 2:
        return <img src="/Lead.jpg" />;
      case 3:
        return <img src="/supporting.jpg" />;
    }
  }

  return (
    <div className={styles["cast"]}>
      <div className={styles.head}>
        <div>출연진</div>
        {onFocus ? null : (
          <button
            className={style