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
 