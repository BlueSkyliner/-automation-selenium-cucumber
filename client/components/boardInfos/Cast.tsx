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
        re