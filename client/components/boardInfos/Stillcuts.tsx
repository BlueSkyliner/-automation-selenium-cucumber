import { useState } from "react";
import styles from "../../styles/components/boardInfos/stills.module.scss";

export default function Stillcuts({ stills, onFocus }: any) {
  let counter = 0;
  const [pirctureModalOpen, setPictureModalOpen] = useState<boolean>(false);
  const [selectedImage, setSelectedImage] = useState<any>();
  const pictureModal = () => {
    return (
      <div key="picmodal">
        <div
          className={styles["screen-wrapper"]}
          onClick={(e) => 