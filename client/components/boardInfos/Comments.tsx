import Setaxios from "../../fetching/Setaxios";
import styles from "../../styles/components/boardInfos/comments.module.scss";

export default function Comments({ comments }: { comments: Array<string> }) {
  if (comments === null || comments.length === 0) {
    return (
      <div className={styles.head}>
        코멘트
        <div className={styles.nocomments}>
          <div className={styles.message}>등록된 코멘트가 없습니다</div>
        </div>
      </div>
    );
  }
  function sendLike(commentid: number) {
    Setaxios.postAxios("rating", { commentId: Number(commentid) })
      .then((res) => location.reload())
      .catch((err) => {
        if (err.response.data.code === 4000) {
          alert("로그인이 필요합니다");
        }
      });
  }
  return (
    <div className={styles["comments-wrapper"]}>
      <div className={styles.head}>코멘트</div>
      {comments.map((comment: any) => {
        return (
          <div key={comment.userNickname}>
            <div className={styles["comment-block"]}>
              <div className={styles["comment"]}>
                <div className={styles["comment-header"]}>
                  <div className={styles["fl-st"]}>
                    <div className={styles["image-mask"]}>
                      {comment.profilePicture ? (
                        <img src={comment.profilePicture} />
                      ) : (
                        <img src="/defaultprofile.png" />
                      )}
                    </div>
                    <div className={styles.username}>
                      {comment.userNickname}
                    </div>
                  </div>
                  <div className={styles["fl-ed"]}>
                    <div className={styles["rating-container"]}>
                      <img src="/star.png" />
                      <div className={styles.rating}>{comment.rating / 2}</div>
                    </div>
     