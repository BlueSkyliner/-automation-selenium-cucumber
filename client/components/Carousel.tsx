import { Swiper, SwiperSlide } from "swiper/react";
import SwiperCore, { Autoplay, Pagination, Navigation } from "swiper";
import styles from "../styles/components/carousel.module.scss";
import Link from "next/link";

SwiperCore.use([Autoplay, Pagination, Navigation]);
export default function Carousel() {
  return (
    <div className={styles["swiper-div"]}>
      <Swiper
        slidesPerView={2}
        spaceBetween={22}
        slidesPerGroup={1}
        centeredSlides={true}
        autoplay={{
          delay: 10000,
          disableOnInteraction: false,
        }}
        loop={true}
        loopFillGroupWithBlank={true}
        pagination={{
          clickable: true,
        }}
        navigation={true}
        className="mySwiper"
      >
        <SwiperSlide>
          <Link href="/board/view/33">
            <img
              className={styles.image}
              loading="lazy"
      