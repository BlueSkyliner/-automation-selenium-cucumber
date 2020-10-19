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
          onClick={(e) => {
            const screen = document.getElementById("screen");
            e.target === screen ? setPictureModalOpen(false) : null;
          }}
        >
          <div id="screen" className={styles["picturemodal-wrapper"]}>
            <div className={styles.picturemodal}>
              {selectedImage?.src ? (
                <img
                  draggable="false"
                  onClick={() => setPictureModalOpen(false)}
     