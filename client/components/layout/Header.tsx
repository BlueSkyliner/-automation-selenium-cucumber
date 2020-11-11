import Link from "next/link";
import styles from "../../styles/components/layout/header.module.scss";
import Login from "../Login";
import Signup from "../Signup";
import { useEffect, useState } from "react";
import Setaxios from "../../fetching/Setaxios";
import { useRouter } from "next/router";
import axios from "axios";
import Cookies from "js-cookie";
