import styles from "../styles/mypage.module.scss";
export default function Management() {
  return (
    <div className={styles.mypage}>
      <div className={styles.mapageblock}>
        <div className={styles.header__blank__div} />
        <div className={styles["myinfo-wrapper"]}>
          <div className={styles.myinfo}>
            <div className={styles["info-header"]}>승인 대기중 보드 리스트</div>
            <div className={styles.dividingline} />
            <div className={styles["information"]}>
              <div className={styles.blankarea} />
              <div className={styles.blankedinfos}>
                <div>
                  <div className={styles.password}>
                    <div className={styles.text}>
                